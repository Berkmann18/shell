if [ $# -eq 0 ]; then
    eval set -- "\\u@\\h: \\w"
fi

case $TERM in
    xterm*) ptitle="\[\033]0;$@\007\]";;
    *) ptitle=''
esac
prompt=$(echo "$PS1" | sed -e 's/\\\[\\033\]0;.*\\007\\\]//')
PS1="${ptitle}${prompt}"
