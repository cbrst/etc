autoload -Uz compinit
compinit

autoload -Uz colors

autoload -U zmc

zmodload zsh/complist
zmodload zsh/terminfo

HISTFILE=${XDG_DATA_HOME}/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000

# SETOPTS
# History
setopt appendhistory inc_append_history share_history

# Globbing
setopt extendedglob ksh_glob

# Other
setopt autocd complete_in_word correct


# ZLE use Vi
bindkey -v

# This is already in zshenv, why doesn't it work?
path_dirs=(
	${BIN_HOME}
	${BIN_HOME}/tools
	${XDG_DATA_HOME}/node/bin
	$(cope_path.pl)
	/usr/local/bin
	/usr/bin
	/bin
	/opt/bin
	/usr/x86_64-pc-linux-gnu/gcc-bin/4.6.4
	/usr/games/bin
)

# If we're running OS X, add /usr/pkg/bin to the path for pkgsrc
[[ $OSTYPE =~ ^darwin.* ]] && path_dirs+=(
	/Applications
	/usr/pkg/bin
	${HOME}/Applications
)

# Make a string out of the array and assing it to $PATH
export PATH=${(j_:_)path_dirs}

# Debug mode
DEBUG=0
function debug {
	[[ $DEBUG > 0 ]] && echo "\033[1;33mDEBUG:\033[0m zsh: $1"
}
function error {
	echo "\033[1;31mERROR:\033[0m zsh: $1"
}

# Load modularized config
for r in $HOME/etc/zsh/*.zsh; do
	debug "sourcing $r"
	source $r
done

if [ -f $HOME/etc/dircolors/dircolors ]; then
	eval $(dircolors -b $HOME/etc/dircolors/dircolors)
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
