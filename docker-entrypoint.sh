#!/bin/bash

set -e

OC_PATH='/var/www/owncloud'
HTTP_USER='www-data'

find ${OC_PATH}/ -type f -print0 | xargs -0 chmod 0640
find ${OC_PATH}/ -type d -print0 | xargs -0 chmod 0750

chown -R root:${HTTP_USER} ${OC_PATH}/
chown -R ${HTTP_USER}:${HTTP_USER} ${OC_PATH}/apps/
chown -R ${HTTP_USER}:${HTTP_USER} ${OC_PATH}/config/
chown -R ${HTTP_USER}:${HTTP_USER} ${OC_PATH}/data/
chown -R ${HTTP_USER}:${HTTP_USER} ${OC_PATH}/themes/

chown -R root:${HTTP_USER} ${OC_PATH}/.htaccess
#chown -R root:${HTTP_USER} ${OC_PATH}/data/.htaccess

chmod 0644 ${OC_PATH}/.htaccess
#chmod 0644 ${OC_PATH}/data/.htaccess

apache2ctl -DFOREGROUND
