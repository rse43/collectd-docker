FROM ubuntu:latest

MAINTAINER Shuo Ran <me@rse43.com>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y curl supervisor collectd collectd-utils

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

# configure
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD collectd.conf /etc/collectd/collectd.conf

CMD supervisord -n