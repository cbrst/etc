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
alias ls="ls --color=auto"
alias l="ls"
alias la="ls -a"
alias ll="ls -lh"
alias lla="ls -lah"

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
alias e="emacs_wrapper.sh"
alias t="tmux_wrapper.sh"
alias whine="wine_wrapper.sh"

# randoms
alias _="sudo"
alias rs="(redshift -l 3:101 -b0.7 -t 5500:4700&)"
