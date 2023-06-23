FROM inwt/r-batch:4.2.1

ADD . .

RUN apt-get update && apt-get install -y \
    libsodium-dev \
    && installPackage

EXPOSE 8000

# Command runs when the container launches
# https://docs.docker.com/engine/reference/builder/#cmd
CMD ["Rscript", "-e", "MpiIsoApi::serveAPI()"]


## local testing:
# docker build --pull -t tmp . && docker run tmp check
# docker build --pull -t tmp . && docker run --rm --network host tmp
