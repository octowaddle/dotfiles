# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then . /etc/bashrc; fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Make the autocompletion case-insensitive
if [ ! -a ~/.inputrc ]; then echo '$include /etc/inputrc' >~/.inputrc; fi
echo 'set completion-ignore-case On' >>~/.inputrc

# User specific prompt
export PS1="[\W]$ "

# Language setting
export LANG=en_US.UTF-8
export LANGUAGE=en:de

# User specific aliases and functions
source "$HOME/.cargo/env"
alias ls="exa --group-directories-first"
alias l="exa --group-directories-first --git --long --all"
alias tree="exa --group-directoreies-first --tree"
alias bat="bat --theme ansi-light"
