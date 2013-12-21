autoload -U vcs_info && vcs_info

# I really have no idea why there isn't a zstyle for this
local FMT_ACTION="(%F{3}%a%f)"

# I would have liked to use branchformat, but not all backends support that.
local FMT_BRANCH="%K{11}%B %b %%b%k"

# Again - why is there no zstyle?
local FMT_REPO="%s:%F{7}%B%r%%b%f"

zstyle ':vcs_info:*' enable git hg svn
zstyle ':vcs_info:*' check-for-changes true

zstyle ':vcs_info:*' unstagedstr         "%B%K{235}%F{62} D%F{240}IRTY %f%k%b"
zstyle ':vcs_info:*' stagedstr           "%B%K{235}%F{62} S%F{240}TAGED %f%k%b"

zstyle ':vcs_info:git:*' formats          "%F{7}%K{9} %s %K{1} %r %k ${FMT_BRANCH} %u%c"
zstyle ':vcs_info:hg:*'  formats         "%F{7}%K{13} %s %K{5} %r %k ${FMT_BRANCH} %u%c"
zstyle ':vcs_info:svn:*' formats         "%F{7}%K{14} %s %K{4} %r %k ${FMT_BRANCH} %u%c"

zstyle ':vcs_info:git:*' actionformats   "%F{9}(${FMT_REPO}%F{9}) ${FMT_BRANCH} %u%c ${FMT_ACTION}"
zstyle ':vcs_info:hg:*'  actionformats   "%F{13}(${FMT_REPO}%F{13}) ${FMT_BRANCH} %u%c ${FMT_ACTION}"
zstyle ':vcs_info:svn:*' actionformats   "%F{14}(${FMT_REPO}%F{14}) ${FMT_BRANCH} %u%c ${FMT_ACTION}"

local PS_USER="%(#.%F{1}.%F{6})%n%f"
local PS_MACH="%F{4}%M%f"
local PS_PWD="[%B%F{7}%c%f%b]"
local PS_TTY="%F{4}%y%f"
local PS_EXIT="%(?..%K{9}%F{7} ! %K{1} %? %f%k )"
local PS_PRIV="%B%F{0}%(#.%K{9} %K{1} # .%K{10} %K{2} %% )%k%f%b"

precmd() {
	# Enable VCS display
	vcs_info
	
	# check if virtualenv activated and get the name
	# Yes, I really am too cool to use $(basename)
	[ $VIRTUAL_ENV ] && local PS_VENV="%B%F{8}%K{10} $(python -V 2>&1 | cut -d ' ' -f 2) %K{2} ${VIRTUAL_ENV##*/} %k%b"
	
	# do the same thing for virtual perl envs
	[ $PENV_ENV ] && local PS_PENV="%B%F{8}%K{11} $(perl -v | sed -e '2!d' -e 's/.*v\([5-6]\.[0-9]\{2\}\.[0-9]*\).*/\1/') %K{3} ${PENV_ENV##*/} %k%b"

	# Set prompt
	LINE_0="${vcs_info_msg_0_}"
	# LINE_1="%B${PS_EXIT}${PS_USER}@${PS_MACH}%b${PS_PWD}+ "
	LINE_1="${PS_EXIT}${PS_PRIV} "
	PROMPT=${LINE_0}${LINE_0:+$'\n'}${LINE_1}
	RPROMPT="${PS_VENV}${PS_PENV}"
	

	# If you feel crazy, uncomment this
	# PS1="+-> $PS_MACH"$'\n'"| +-> $(uname -m)"$'\n'"| | \`-> $(uname -o)"$'\n'"| |   \`-> $(uname -r)"$'\n'"| \`-> $PS_USER"$'\n'"|   +-> $PS_PWD"$'\n'"|   +-> $PS_VENV$PS_PENV"$'\n'"|   \`-> $vcs_info_msg_0_"$'\n'"\`-> "
	
	# This *would* make more sense in chpwd(), but that causes the old title to
	# stick around after being set by an application
	case ${TERM} in
		xterm* | rxvt* | screen* )
			print -Pn "\e]0;%n@%m: %2c\a" ;;
	esac
}

export SPROMPT="Correct %B%F{1}%R%f%b to %B%F{2}%r%f%b? (Yes, No, Abort, Edit) "
	

