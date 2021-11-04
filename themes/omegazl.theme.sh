#
# Omegazl theme
#
# PS1='\n \[\e[1;37m\]┌─ \[\033[1;34m\]\w/ \[\033[1;32m\]$(getCurrentBranch)  \n\[\e[1;37m\] └─\[\033[1;35m\] > \[\033[00m\] '

# Colors
# https://www.shellhacks.com/bash-colors/
groundColor=(
  [fg]=3
  [bg]=4
)

colorsList=(
  [balck]=0
  [red]=1
  [green]=2
  [yellow]=3
  [blue]=4
  [magenta]=5
  [cyan]=6
  [white]=7
)

txTranformation=(
  [normal]=0
  [bold]=1
  [underline]=4
  [blink]=5
  [highligh]=7
)

resetColor() {
  echo -ne '\[\e[00m\]'
}
setColor() {
  echo -ne '\[\e['txTranformation[$1]';'groundColor[$2]colorsList[$3]'m\]'
}

singleColor() {
  echo -ne '\[\e['$1'm\]'
}

promptStart() {
  $PRT="${setColor bold fg white}┌─"
}

promptDir() {
  $PRT="$PRT ${setColor bold fg blue}\w/"
}

promptGit() {
  $PRT="$PRT ${setColor normal fg green}$(getCurrentBranch)${resetColor}"
}

promptEnd() {
  $PRT="$PRT \n${setColor bold fg white} └─${setColor bold fg magenta}>${resetColor}"
}

buildPrompt() {
  promptStart
  promptDir
  [[ $(getCurrentBranch) 1>/dev/null ]] && promptGit
  promptEnd
}
setBashPrompt() {
  PRT=""
  buildPrompt
  PS1=$PRT
}

PROMPT_COMMAND=setBashPrompt
