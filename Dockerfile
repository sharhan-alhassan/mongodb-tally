# Container image that runs your code
FROM alpine:edge

RUN apk update && apk add --no-cache bash
RUN apk add --no-cache mongodb-tools 

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]