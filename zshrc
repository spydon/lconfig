source ~/.config/lconfig/remote/antigen.zsh


# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle vi-mode
antigen bundle aws
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Fish-like fast/unobtrusive autosuggestions for zsh.
antigen bundle zsh-users/zsh-autosuggestions

# Fish shell history up and down
antigen bundle zsh-users/zsh-history-substring-search

# Load the theme.
antigen theme sorin

# Tell Antigen that you're done.
antigen apply

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/spydon/.cabal/bin:/home/spydon/bin:/home/spydon/scripts"

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-thing)"
fi

### ALIASES

# Pipe Highlight to less
export LESSOPEN="| $(which highlight) %s --out-format xterm256 --line-numbers --quiet --force"
export LESS=" -R"
alias less='less -m -N -g -i -J --line-numbers --underline-special'
alias more='less'

# Last arg of last command, alt+.
bindkey '\e.' insert-last-word

# Use "ccat" to cat files with highlight
alias c="ccat"

alias yg=yaourt
alias f='find . -name $1 2> /dev/null'
alias fa='find / -name $1 2> /dev/null'
alias s='grep -rn '$1' 2> /dev/null'
alias bat='echo "Use acpi you lazy"'
alias awsn='eval `aws-adfs-tool login -u lukas.klingsbo -r read-only -a klarna-non-production --with-wrapper-for aws` && `aws ecr get-login --no-include-email --profile read-only@klarna-non-production --region eu-west-1`'
alias awsp='eval `aws-adfs-tool login -u lukas.klingsbo -r read-only -a klarna-production --with-wrapper-for` aws && `aws ecr get-login --no-include-email --profile read-only@klarna-production --region eu-west-1`'
alias awsnw='eval `aws-adfs-tool login -u lukas.klingsbo -r pgw -a klarna-non-production --with-wrapper-for aws` && `aws ecr get-login --no-include-email --profile pgw@klarna-non-production --region eu-west-1`'
alias rmlogs='sudo truncate -s 0 /var/lib/docker/containers/*/*-json.log'
alias vim=nvim
alias poweroff='sudo poweroff'
alias ssh='TERM=linux ssh -oStrictHostKeyChecking=no'
#alias less='nvim -R'
alias irc='ssh -t lukas.fyi "screen -r"'
alias tok="source /home/spydon/repos/pgw-pci-aws/bin/aws-assume-role-bf.sh && aws-assume-role basefarm kla-pgwstage-admin"$1
alias tun="sudo openconnect https://secvpn.basefarm.com -ullingsbo -p582527"$1
export EDITOR="nvim"
source /usr/share/autojump/autojump.zsh
