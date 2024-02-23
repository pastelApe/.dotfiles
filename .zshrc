# pastelApe
# Created 2/8/24

# Options
setopt autocd

# Alias
## LSD - The next gen ls command
alias ls='lsd'
alias l='ls -l'
alias la='ls -A'
alias lla='ls -la'
alias lt='ls --tree --depth 2'
## Interact directly with configuration repository
alias config='/usr/bin/git --git-dir=/Users/xavier/.dotfiles/.git --work-tree=/Users/xavier'
# Use homebrew installed ruby instead of system provided version
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
