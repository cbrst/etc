# Adjust for moved config locations.

# can i haz?

# aka.: y u no conform to XDG?
alias mplayer="$(command -v mplayer2 || echo "mplayer") -noconfig user -include $XDG_CONFIG_HOME/mplayer/mplayer.conf"
alias rtorrent="rtorrent -n -o import=$XDG_CONFIG_HOME/rtorrent/rtorrent.rc"

# Recurse, goddamnit!
alias cp="cp -r"
alias mkdir="mkdir -p"
alias rm="rm -r"

# Coreutils stuff
alias ls="ls --color=auto"
alias l="ls"
alias ll="ls -lh"

# wrapper scripts
alias tmux="tmux_wrapper.sh"

# randoms
alias rs="(redshift -l 3:101 -b0.7 -t 5500:4700&)"

# Office
alias word="WINEPREFIX=$XDG_DATA_HOME/wine/32 wine ~/var/wine/32/drive_c/Program\ Files/Microsoft\ Office/Office12/WINWORD.EXE"
