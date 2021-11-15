[[ type "git" &> /dev/null; ]] && return

#Pushing
alias gphup='git push --set-upstream origin $(git branch --show-current)'
alias gph='git push'
alias gphf='git push -f'

# Pulling
alias gpl='git pull'
alias gplr='git pull --rebase'

# Rebase
alias grb='git rebase'
alias grbd='git rebase develop'
alias grbm='git rebase master'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'
alias grbs='git rebase --skip'
alias grbi='git rebase -i'
alias grbh='git rebase -i HEAD~'

# Remote
alias grm='git remote'
alias grma='git remote add'
alias grmv='git remote rename'
alias grmrm='git remote remove'
alias grmset='git remote set-url'
alias grmup='git remote update'
alias grmv='git remote -v'

# Branch
alias gbnew='git checkout -b'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbnm='git branch --no-merged'
alias gbr='git branch --remote'
alias gbsc='git branch --show-current'
alias gct='git checkout'

# Merge
alias gmr='git merge'
alias gmrom='git merge origin/master'
alias gmrt='git mergetool --no-prompt'
alias gmrum='git merge upstream/master'
