# Adjust for moved config locations.

# can i haz?

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
alias ll="ls -lh"

# git
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gco="git config"

# wrapper scripts
alias t="tmux_wrapper.sh"

# randoms
alias rs="(redshift -l 3:101 -b0.7 -t 5500:4700&)"
