FROM alpine:edge
MAINTAINER Mitchell Hewes <me@mitcdh.com>

RUN apk --update add \
    unfs3 \
    rpcbind \
 && rm -rf /var/cache/apk/*

ADD exports /etc/exports
ADD docker-entrypoint.sh /usr/local/bin/

EXPOSE 111/udp 111/tcp 2049/tcp 2049/udp
#Docker-Compose manual mapping doesn't require volume
#VOLUME /export

CMD ["docker-entrypoint.sh"]
