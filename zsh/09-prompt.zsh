autoload -U vcs_info && vcs_info

local FMT_BRANCH="%F{9}(%s:%F{7}%{$IT%}%r%{$ST%}%F{9}) %F{11}%B%b %K{235}%{$IT%}%u%c%{$ST%}%k"
local FMT_ACTION="(%F{3}%a%f)"
local FMT_PATH="%F{1}%R%F{2}/%S%f"

zstyle ':vcs_info:*' enable git hg svn
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr   "%F{62}D%F{237}IRTY%f"
zstyle ':vcs_info:*' stagedstr     "%F{62}S%F{237}TAGED"
zstyle ':vcs_info:*' actionformats "${FMT_BRANCH}${FMT_ACTION}" "${FMT_PATH}"
zstyle ':vcs_info:*' formats       "${FMT_BRANCH}"              "${FMT_PATH}"
zstyle ':vcs_info:*' nvcsformats   ""                           "%~"

precmd() {
	
	vcs_info
	
	# check if virtualenv activated and get the name
	[ $VIRTUAL_ENV ] && local venv="%F{10}(venv:%f${VIRTUAL_ENV##*/}%F{10})%f "
	
	typeset -A items
	items=(
		user    '%(#.%F{1}.%F{3})%n'
		machine '%F{1}%M'
		pwd     '%F{5}%~'
		tty     '%F{4}%y'
		exit    '%(?..%F{202}%?%f)'
		vcs     "${vcs_info_msg_0_}"
		venv    "$venv"
	)

	show=(venv pwd)

	PS1=' '
	for item in $show; do
		PS1+="${items[${item}]}%f"
	done
	PS1+=" %F{11}»%f "
	RPROMPT=${vcs_info_msg_0_}
}
