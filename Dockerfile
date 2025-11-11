# start with Alpine Linux
FROM alpine:latest
MAINTAINER Christian Becker <mail@christianbecker.name>

# system setup with all requirements
RUN apk add --no-cache \
        build-base \
        c-ares-dev \
        curl \
        curl-dev \
        freeradius-client-dev \
        libretls-dev \
        linux-pam-dev \
        openssl-dev \
        pcre2-dev \
        perl \
        perl-authen-radius \
        perl-ldap \
        perl-net-ip \
        perl-sys-syslog \
    && echo "! installation is finished !"

# download and install MarcJHuber event-driven-servers / tac_plus-ng repository
RUN wget https://github.com/MarcJHuber/event-driven-servers/archive/refs/heads/master.zip -O event-driven-servers-master.zip && \
    unzip event-driven-servers-master.zip && \
    cd event-driven-servers-master && \
    ./configure && \
    make && \
    make install && \
    # copy sample configuration file
    cp /event-driven-servers-master/tac_plus-ng/sample/tac_plus-ng.cfg /usr/local/etc/tac_plus-ng.cfg && \
    # cleanup
    rm -rf /event-driven-servers-master* && \
    echo "! service setup successful !"

# expose port
Expose 49

# run tac_plus-ng
CMD ["/usr/local/sbin/tac_plus-ng", "/usr/local/etc/tac_plus-ng.cfg"]
