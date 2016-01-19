FROM debian:jessie-backports

MAINTAINER voobscout <voobscout@gmail.com>

ENV DEBIAN_FRONTEND noninteractive \
    GIT_SSL_NO_VERIFY 1 \
    container docker

RUN apt-get update && \
    apt-get -y -q dist-upgrade && \
    apt-get install -y -q curl build-essential flex bison nfs-client && \
    apt-get clean all && \
    rm /var/log/apt/* /var/log/alternatives.log /var/log/bootstrap.log /var/log/dpkg.log

ADD http://iweb.dl.sourceforge.net/project/unfs3/unfs3/0.9.22/unfs3-0.9.22.tar.gz /

RUN tar zxf /unfs3-0.9.22.tar.gz && \
    cd /unfs3-0.9.22 && \
    ./configure && make && make install

ADD exports.dist /etc/exports
ADD start.sh /start.sh

RUN chmod +x /start.sh

EXPOSE 111/udp 111/tcp 2049/tcp 2049/udp

CMD /start.sh
