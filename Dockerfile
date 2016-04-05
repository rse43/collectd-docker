FROM alpine:latest

MAINTAINER Shuo Ran <me@rse43.com>

RUN apk add --update \
		collectd \
		collectd-curl \
		collectd-network \
		py-pip \
		&& rm -rf /var/cache/apk/*

RUN pip install --upgrade pip \
		envtpl \
		speedtest-cli

ADD collectd.conf /etc/collectd/collectd.conf
ADD collectd.d /etc/collectd/collectd.d
ADD speedtest.sh /usr/local/bin/speedtest.sh
CMD chmod a+x /usr/local/bin/speedtest.sh && exec collectd -f
