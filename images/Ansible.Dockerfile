FROM alpine:3.10.2

RUN apk add --no-cache \
    ansible \
    sshpass \
    openssh-client

WORKDIR /app

CMD ["/bin/sh"]