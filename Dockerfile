FROM alpine:latest

RUN apk update && \
    apk add --update --no-cache openssh

COPY LICENSE README.md /

COPY entrypoint.sh /entrypoint.sh

RUN chmod 755 entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
