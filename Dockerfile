FROM ubuntu:14.04.2

MAINTAINER Niklas Skoldmark <niklas.skoldmark@gmail.com>

RUN apt-get update && apt-get install -y \
    automake \
    debhelper \
    exim4 \
    expect \
    git \
    liblockfile-simple-perl \
    libperl4-corelibs-perl \
    telnet

RUN git clone git://github.com/dotwaffle/rancid-git /srv/rancid-git && \
    cd /srv/rancid-git && \
    dpkg-buildpackage -uc -us && \
    cd /srv && \
    dpkg -i rancid*.deb && \
    rm -f -R /srv/rancid-git

VOLUME /var/lib/rancid/data /var/lib/rancid/logs /var/lib/rancid/tmp /root/secrets /root/configs

COPY ["setup.sh", "/setup.sh"]

RUN /setup.sh && rm /setup.sh

COPY ["entrypoint.sh", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]