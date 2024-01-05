FROM alpine:latest

ENV GMVAULT_DIR /data
ENV GMVAULT_EMAIL_ADDR test@example.com
 
RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk add --update \
	bash \
        ca-certificates \
        tzdata \
        python \
        py-pip \
        shadow@testing \
    && pip install --upgrade pip \
    && pip install gmvault \
    && rm -rf /var/cache/apk/* \
    && addgroup abc \
    && adduser -s /bin/bash -G abc -H -D abc

VOLUME /data
