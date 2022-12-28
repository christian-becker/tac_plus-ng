# start with Alpine Linux
FROM alpine:latest
MAINTAINER Christian Becker <mail@christianbecker.name>

# system setup with all requirements
RUN apk add --no-cache \
        build-base \
        c-ares-dev \
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

# download MarcJHuber event-driven-servers / tac_plus-ng repository
ADD https://github.com/MarcJHuber/event-driven-servers/archive/refs/heads/master.zip event-driven-servers-master.zip

# install event-driven-servers / tac_plus-ng
RUN unzip event-driven-servers-master.zip && \
    cd event-driven-servers-master && \
    ./configure && \
    make && \
    make install

# copy AD sample configuration file
COPY event-driven-servers-master/tac_plus-ng/extra/tac_plus-ng.cfg-ads /usr/local/etc/tac_plus-ng.cfg

# expose port
Expose 49

# run tac_plus-ng
CMD ["/usr/local/sbin/tac_plus-ng", "/usr/local/etc/tac_plus-ng.cfg"]
