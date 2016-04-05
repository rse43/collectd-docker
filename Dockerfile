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

ADD collectd.conf.tpl /etc/collectd/collectd.conf.tpl
ADD collectd.d /etc/collectd/collectd.d
CMD for template in /etc/collectd/collectd.conf.tpl; do envtpl $template ; done && exec collectd -f
