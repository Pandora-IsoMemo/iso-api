FROM inwt/r-batch:3.5.1

ADD . .

RUN apt-get update && apt-get install -y curl \
    Rscript -e \
    'create_mirror_url <- function(date) { paste0("https://packagemanager.posit.co/cran/", format(date, "%Y-%m-%d")) }; \
    check_if_mirror_is_available <- function(date) { url <- create_mirror_url(date); \
                                                  stat <- system(paste0("curl -s -o /dev/null -w \"%{http_code}\" ", url, "/src/contrib/PACKAGES"), intern=TRUE, ignore.stderr=TRUE, wait = TRUE); \
                                                  ifelse(stat == "200", TRUE, FALSE) }; \
    get_mirror_date <- function() { r_version_date <- as.Date(paste(utils::sessionInfo()[["R.version"]][c("year", "month", "day")], collapse = "-")); \
                                   for (date in as.list(seq(r_version_date, by = -1, length.out = 5))) { \
                                     if (check_if_mirror_is_available(date)) { \
                                       return(date) \
                                     } \
                                   } }; \
    mirror_date <- get_mirror_date(); \
    if (is.null(mirror_date)) { \
      q(status = 1) \
    }; \
    mirror_url <- create_mirror_url(mirror_date); \
    cat(mirror_url); \
    q(status = 0)' > /tmp/mirror_url.txt \
    && url=$(cat /tmp/mirror_url.txt) \
    && sed -i "/MRAN/ c\options(repos = c(CRAN = \"${url}\"))" /usr/local/lib/R/etc/Rprofile.site \
    && rm /tmp/mirror_url.txt
    && installPackage

EXPOSE 8000

# Command runs when the container launches
# https://docs.docker.com/engine/reference/builder/#cmd
CMD ["Rscript", "-e", "MpiIsoApi::serveAPI()"]


## local testing:
# docker build --pull -t tmp . && docker run tmp check
# docker build --pull -t tmp . && docker run --rm --network host tmp
