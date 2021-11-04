[[ type "youtube-dl" &> /dev/null; ]] && return

alias yta="youtube-dl --extract-audio"
alias ytaopus="youtube-dl --extract-audio --audio-format=opus"
alias ytaogg="youtube-dl --extract-audio --audio-format=vorbis"
