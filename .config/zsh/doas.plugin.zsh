doas-command-line() {
    [[ -z $BUFFER ]] && LBUFFER="$(fc -ln -1)"
    if [[ $BUFFER == doas\ * ]]; then
        if [[ ${#LBUFFER} -le 4 ]]; then
            RBUFFER="${BUFFER#doas }"
            LBUFFER=""
        else
            LBUFFER="${LBUFFER#doas }"
        fi
    else
        LBUFFER="doas $LBUFFER"
    fi
}
zle -N doas-command-line
# Defined shortcut keys: [Esc] [Esc]
bindkey -M vicmd '\e\e' doas-command-line
