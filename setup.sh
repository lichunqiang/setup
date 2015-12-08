#!/bin/bash
#####################
#
# setup bash, based on https://github.com/oscm/shell
#
# zsh will auto installed
#
# 1. mysql
# 2. nginx
# 3. php
# 4. redis
#
#####################

# zsh
curl -s https://raw.githubusercontent.com/oscm/shell/master/shell/zsh.sh  | bash

# depends
curl -s https://raw.githubusercontent.com/mythteam/shell/master/nginx-mysql/0-init.sh | bash
# mysql
curl -s https://raw.githubusercontent.com/mythteam/shell/master/nginx-mysql/1-mysql.sh | bash
# nginx
curl -s https://raw.githubusercontent.com/mythteam/shell/master/nginx-mysql/2-nginx.sh | bash
# php
curl -s https://raw.githubusercontent.com/mythteam/shell/master/nginx-mysql/3-php.sh | bash
curl -s https://raw.githubusercontent.com/mythteam/shell/master/nginx-mysql/3-1-imagick.sh | bash
curl -s https://raw.githubusercontent.com/mythteam/shell/master/nginx-mysql/3-2-intl.sh | bash
curl -s https://raw.githubusercontent.com/mythteam/shell/master/nginx-mysql/3-3-composer.sh | bash
curl -s https://raw.githubusercontent.com/mythteam/shell/master/nginx-mysql/3-4-yii2.sh | bash
# redis
curl -s https://raw.githubusercontent.com/mythteam/shell/master/nginx-mysql/4-redis.sh | bash
