# common
alias h='history'
alias ll='ls -latr'
alias mkdir='mkdir -pv'
alias untar='tar -zxvf'
alias myaliases='cat $HOME/.zshrc | grep alias'

# docker
alias dokcer='docker'
alias dockerclean='docker system prune -f && docker image prune -a --filter "until=168h" -f'
alias dfimage="docker run -v /var/run/docker.sock:/var/run/docker.sock --rm alpine/dfimage"

# kubernetes
alias k='kubectl'
alias ks='kubens'
alias wk='watch kubectl'
alias kx='kubectx'
alias kgpo='kubectl get pod'

# git
alias gf='git fetch'
alias gs='git status'
alias gpl='git pull'
alias ga='git add'
alias gaa='git add --all'
alias gcm='git commit -m'
alias gph='git push'
alias gr='git reset --soft HEAD~1'

# ENVs
export GODEBUG=x509sha1=1
