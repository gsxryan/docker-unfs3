FROM alpine:edge
MAINTAINER Mitchell Hewes <me@mitcdh.com>

ADD exports.dist /etc/exports
ADD start.sh /start.sh

RUN apk --update add \
    unfs3 \
    rpcbind \
 && rm -rf /var/cache/apk/* \
 && chmod +x /start.sh

EXPOSE 111/udp 111/tcp 2049/tcp 2049/udp

VOLUME /export

CMD ["/start.sh"]
