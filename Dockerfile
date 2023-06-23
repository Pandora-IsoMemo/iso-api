FROM inwt/r-batch:4.2.1

ADD . .

RUN installPackage

EXPOSE 8000

# Command runs when the container launches
# https://docs.docker.com/engine/reference/builder/#cmd
CMD ["Rscript", "-e", "MpiIsoApi::serveAPI()"]


## local testing:
# docker build --pull -t tmp . && docker run tmp check
# docker build --pull -t tmp . && docker run --rm --network host tmp
