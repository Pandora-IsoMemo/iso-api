FROM inwt/r-batch:3.5.1

ADD . .

RUN installPackage

EXPOSE 8001

# Command runs when the container launches
# https://docs.docker.com/engine/reference/builder/#cmd
CMD ["Rscript", "-e", "MpiIsoApi::serveAPI()"]


## local testing:
# docker build --pull -t tmp . && docker run tmp check
# docker build --pull -t tmp . && docker run --rm --network host tmp
