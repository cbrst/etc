export WORKON_HOME=$XDG_DATA_HOME/virtualenvs
if [[ -f /usr/bin/virtualenvwrapper.sh ]]; then
		source /usr/bin/virtualenvwrapper.sh
fi

# Load external modules if they exist
MODDIR=$ZDOTDIR/modules/
function ifload {
	for f in "$@"; do
		# Standard naming for zsh-users modules: <module>/<module>.zsh
		_file=$MODDIR/$f/$f.zsh

		# Check and source, else error
		if [ -f $_file ]; then
			debug "sourcing $f"
			source $_file
		else
			error "module $f doesn't exist"
		fi
	done
}

ifload zaw zsh-history-substring-search zsh-syntax-highlighting
