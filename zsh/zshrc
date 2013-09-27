autoload -Uz compinit
compinit

autoload -Uz colors

zmodload zsh/complist
zmodload zsh/terminfo

HISTFILE=~/var/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000

setopt appendhistory autocd ksh_glob extendedglob inc_append_history

# ZLE use Vi
bindkey -v

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
