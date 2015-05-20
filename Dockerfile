# VERSION 0.0.1

FROM ubuntu:14.04.2
MAINTAINER Ken Lee <kenmlee@163.com>

ENV REFRESHED_AT 2015-05-20

# The original link in Owncloud installation guide has been premanently removed.
# Original link: http://download.opensuse.org/repositories/isv:ownCloud:community/xUbuntu_14.04/Release.key
# New link: http://download.opensuse.org/repositories/isv:/ownCloud:/community/xUbuntu_14.04/Release.key
RUN apt-get install -y wget && wget http://download.opensuse.org/repositories/isv:/ownCloud:/community/xUbuntu_14.04/Release.key && apt-key add - < Release.key

RUN apt-get -qq update \
    && echo "deb http://download.opensuse.org/repositories/isv:/ownCloud:/community/xUbuntu_14.04/ /" \
        >> /etc/apt/sources.list.d/owncloud.list \
    && apt-get -qq update \
    && apt-get -y upgrade \
    && apt-get install -y owncloud

ENTRYPOINT ["apache2ctl", "-DFOREGROUND"]
