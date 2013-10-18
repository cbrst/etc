autoload -Uz compinit
compinit

autoload -Uz colors

autoload -U zmc

zmodload zsh/complist
zmodload zsh/terminfo

HISTFILE=~/var/zsh/histfile
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
