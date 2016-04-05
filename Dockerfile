FROM alpine:latest

MAINTAINER Shuo Ran <me@rse43.com>

RUN apk add --update \
		collectd \
		collectd-curl \
		collectd-network \
		py-pip \
		&& rm -rf /var/cache/apk/*

RUN pip install --upgrade pip \
		envtpl

RUN pip install speedtest-cli
