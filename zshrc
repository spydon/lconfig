# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="sorin"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode rebar3 aws)

### User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/spydon/.cabal/bin:/home/spydon/bin:/home/spydon/scripts"

source $ZSH/oh-my-zsh.sh

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
alias ssh='TERM=linux ssh'
#alias less='nvim -R'
alias irc='ssh -t lukas.fyi "screen -r"'
alias tok="source /home/spydon/repos/pgw-pci-aws/bin/aws-assume-role-bf.sh && aws-assume-role basefarm kla-pgwstage-admin"$1
alias tun="sudo openconnect https://secvpn.basefarm.com -ullingsbo -p582527"$1
export EDITOR="nvim"
. /home/spydon/bin/kerl/19.3/activate
kerl active
cd
