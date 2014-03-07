if [[! $OSTYPE =~ ^darwin.* ]]; then
	[[ -z ${DISPLAY} ]] && xinit &> ${XDG_DATA_HOME}/log/Xorg.log
fi

