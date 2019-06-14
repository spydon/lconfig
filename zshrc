source ~/.config/lconfig/remote/antigen.zsh


# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle autojump
antigen bundle aws
antigen bundle command-not-found
antigen bundle git
antigen bundle vi-mode

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
export TERM=xterm-256color

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

alias ssh='TERM=linux ssh -oStrictHostKeyChecking=no'
alias yg=yaourt
alias f='find . -name $1 2> /dev/null'
alias fa='find / -name $1 2> /dev/null'
alias s='grep -rnI '$1' 2> /dev/null'
alias bat='echo "Use acpi you lazy"'
alias rmlogs='sudo truncate -s 0 /var/lib/docker/containers/*/*-json.log'
alias poweroff='sudo poweroff'
alias irc='ssh -t lukas.fyi "screen -r"'
alias drofi='rofi -show run -modi run -location 1 -width 100 -lines 2 -line-margin 0 -line-padding 1 -separator-style none -font "mono 10" -columns 9 -bw 0 -color-window "#222222, #222222, #b1b4b3" -color-normal "#222222, #b1b4b3, #222222, #005577, #b1b4b3" -color-active "#222222, #b1b4b3, #222222, #007763, #b1b4b3" -color-urgent "#222222, #b1b4b3, #222222, #77003d, #b1b4b3"'

export EDITOR="vim"
export VISUAL="vim"

source .zshrc-local 2> /dev/null
