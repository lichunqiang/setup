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
echo "
autoload -Uz vcs_info

zstyle ':vcs_info:*' stagedstr '%F{green}●'
zstyle ':vcs_info:*' unstagedstr '%F{yellow}●'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git svn
theme_precmd () {
    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
        zstyle ':vcs_info:*' formats ' [%b%c%u%B%F{green}]'
    } else {
        zstyle ':vcs_info:*' formats ' [%b%c%u%B%F{red}●%F{green}]'
    }

    vcs_info
}

setopt prompt_subst
PROMPT='%B%F{blue}%c%B%F{green}${vcs_info_msg_0_}%B%F{magenta} %{$reset_color%}% '

autoload -U add-zsh-hook
add-zsh-hook precmd  theme_precmd
" >> ~/.zsh_aliases

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

#nodejs
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
nvm install v4.2.3
npm i bower -g --allow-root
