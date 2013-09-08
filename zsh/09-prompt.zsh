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

local PS_USER="%(#.%F{1}.%F{3})%n%f"
local PS_MACH="%F{1}%M%f"
local PS_PWD="%F{5}%~%f"
local PS_TTY="%F{4}%y%f"
local PS_EXIT="%(?..%F{202}%?%f )"

precmd() {
	# Enable VCS display
	vcs_info
	RPROMPT=${vcs_info_msg_0_}
	
	# check if virtualenv activated and get the name
	# Yes, I really am too cool to use $(basename)
	[ $VIRTUAL_ENV ] && local PS_VENV="%F{10}(venv:%f%B${VIRTUAL_ENV##*/}%b%F{10})%f %B$(python -V 2>&1 | cut -d ' ' -f 2)%b"

	# Set prompt
	PS1="${PS_EXIT}${PS_VENV} ${PS_PWD} %F{11}»%f "
}
	

