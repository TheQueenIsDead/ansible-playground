FROM alpine:3.10.2

RUN apk add --no-cache \
    ansible \
    sshpass

WORKDIR /app

CMD ["/bin/sh"]