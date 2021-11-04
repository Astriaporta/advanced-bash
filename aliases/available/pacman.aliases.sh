[[ type "pacman" &> /dev/null; ]] && return

alias paci='sudo pacman --color auto -S'
alias pacr='sudo pacman --color auto -Rs'
alias pacs='sudo pacman --color auto -Ss'
alias pacupd='sudo pacman --color auto -Sy'
alias pacupg='sudo pacman --color auto -Syu'
