# Adjust for moved config locations.
# aka.: y u no conform to XDG?
alias mplayer="$(command -v mplayer2 || echo "mplayer") -noconfig user -include $XDG_CONFIG_HOME/mplayer/mplayer.conf"
alias rtorrent="rtorrent -n -o import=$XDG_CONFIG_HOME/rtorrent/rtorrent.rc"
alias ncmpcpp="ncmpcpp -c $XDG_CONFIG_HOME/ncmpcpp/ncmpcpp.conf"
alias irssi="irssi --home=$XDG_CONFIG_HOME/irssi --config=$XDG_CONFIG_HOME/irssi/config"

# Recurse, goddamnit!
alias cp="cp -r"
alias mkdir="mkdir -p"
alias rm="rm -r"

# Coreutils stuff
[[ $OSTYPE =~ ^darwin.* ]] || alias ls="ls --color=auto --group-directories-first"
alias l="ls"
alias la="ls -a"
alias ll="ls -lh"
alias lla="ls -lah"
alias df="df -h"

# zmc
alias mmv="noglob zmv -W"
alias ccp="noglob zmv -W -C"

# Why doesn't autocd do this?
alias -- -="cd -"
alias ...="cd ../.."
alias ....="cd ../../.."

# git
alias ga="git add"
alias gc="git commit"
alias gco="git config"
alias gd="git diff"
alias gp="git push"
alias gs="git status"

# wrapper scripts
alias whine="wine_wrapper.sh"

# droid stuffs
alias -g sd0="/storage/sdcard0"
alias fastboot="sudo fastboot"

# randoms
alias _="sudo"
alias rs="(redshift -l 3:101 -b0.7 -t 5500:4700&)"
alias aria2="aria2c -s 4 --max-connection-per-server=4"
alias hc="herbstclient"
alias checkarchive="diff --suppress-common-lines -y <(cd ~/Music; gls --ignore='*OGG'|sort) ,(cd /Volumes/Untitled/christian/Music/; gls --ignore='*FLAC'|sort)"

# overwrite shell builtins
alias time="/usr/bin/time"
