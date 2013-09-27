export XDG_CONFIG_HOME=$HOME/etc
export XDG_DATA_HOME=$HOME/var

export BIN_HOME=$HOME/bin

path_dirs=(
	${BIN_HOME}
	${BIN_HOME}/scripts
	${XDG_DATA_HOME}/node/bin
	/usr/local/bin
	/usr/bin
	/bin
	/opt/bin
	/usr/x86_64-pc-linux-gnu/gcc-bin/4.6.4
	/usr/games/bin
)
export PATH=${(j_:_)path_dirs}

# adjust for $XDG_CONFIG_HOME

export VIMPERATOR_RUNTIME=$XDG_CONFIG_HOME/vimperator
export MY_VIMPERATORRC=$VIMPERATOR_RUNTIME/vimperator.rc
export VIMPERATOR_INIT=":source $MY_VIMPERATORRC"

export XINITRC=$XDG_CONFIG_HOME/X11/xinitrc

export ZSHDIR=$XDG_CONFIG_HOME/zsh
