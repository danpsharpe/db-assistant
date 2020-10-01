FROM debian:buster

RUN apt-get update && apt-get install -y \
    libdbd-mysql-perl \
    libdbi-perl \
    libio-socket-ssl-perl \
    libterm-readkey-perl \
    perl \
    wget \
    curl \
    lsb-release \
    supervisor \
    gnupg2 \
    default-mysql-client
WORKDIR /tmp

RUN wget https://www.percona.com/downloads/percona-toolkit/3.2.1/binary/debian/buster/x86_64/percona-toolkit_3.2.1-1.buster_amd64.deb
RUN dpkg -i percona-toolkit_3.2.1-1.buster_amd64.deb

RUN wget https://repo.percona.com/apt/percona-release_latest.buster_all.deb
RUN dpkg -i percona-release_latest.buster_all.deb

RUN apt-get update && apt-get install -y \
    percona-xtrabackup-80 \
    qpress

RUN rm -rf /usr/share/doc/* && \
    rm -rf /usr/share/info/* && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/* \
    mkdir /mnt/data

COPY supervisord.conf /etc/supervisord.conf

WORKDIR /mnt/data
ENTRYPOINT ["supervisord","-c","/etc/supervisord.conf"]