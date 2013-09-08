autoload -U vcs_info && vcs_info

# I really have no idea why there isn't a zstyle for this
local FMT_ACTION="(%F{3}%a%f)"

# I would have liked to use branchformat, but not all backends support that.
local FMT_BRANCH="%F{11}%B%b%%b%f"

# Again - why is there no zstyle?
local FMT_REPO="%s:%F{7}%B%r%%b%f"

zstyle ':vcs_info:*' enable git hg svn
zstyle ':vcs_info:*' check-for-changes true

zstyle ':vcs_info:*' unstagedstr         "%K{235}%F{62}D%F{237}IRTY%f%k"
zstyle ':vcs_info:*' stagedstr           "%K{235}%F{62}S%F{237}TAGED%f%k"

zstyle ':vcs_info:git:*' formats         "%F{9}(${FMT_REPO}%F{9}) ${FMT_BRANCH} %u%c"
zstyle ':vcs_info:hg:*'  formats         "%F{13}(${FMT_REPO}%F{13}) ${FMT_BRANCH} %u%c"
zstyle ':vcs_info:svn:*' formats         "%F{14}(${FMT_REPO}%F{14}) ${FMT_BRANCH} %u%c"

zstyle ':vcs_info:git:*' actionformats   "%F{9}(${FMT_REPO}%F{9}) ${FMT_BRANCH} %u%c ${FMT_ACTION}"
zstyle ':vcs_info:hg:*'  actionformats   "%F{13}(${FMT_REPO}%F{13}) ${FMT_BRANCH} %u%c ${FMT_ACTION}"
zstyle ':vcs_info:svn:*' actionformats   "%F{14}(${FMT_REPO}%F{14}) ${FMT_BRANCH} %u%c ${FMT_ACTION}"

precmd() {
	
	vcs_info
	
	# check if virtualenv activated and get the name
	# Yes, I really am too cool to use $(basename)
	[ $VIRTUAL_ENV ] && local venv="%F{10}(venv:%f%B${VIRTUAL_ENV##*/}%b%F{10})%f %B$(python -V 2>&1 | cut -d ' ' -f 2)%b "
	
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
