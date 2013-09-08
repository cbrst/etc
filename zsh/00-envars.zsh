export XDG_CONFIG_HOME=$HOME/etc
export XDG_DATA_HOME=$HOME/var

export BIN_HOME=$HOME/bin

export PATH=$BIN_HOME:$BIN_HOME/scripts:$HOME/node/bin:/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/x86_64-pc-linux-gnu/gcc-bin/4.6.4:/usr/games/bin

# adjust for $XDG_CONFIG_HOME
export MY_VIMPERATORRC=${XDG_CONFIG_HOME}/vimperator/vimperator.rc
export VIMPERATOR_INIT=":source $MY_VIMPERATORRC"
export VIMPERATOR_RUNTIME=${XDG_CONFIG_HOME}/vimperator
