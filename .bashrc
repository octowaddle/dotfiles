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

# Source other environments
source "$HOME/.cargo/env"

# User specific aliases and functions
alias ls="exa --group-directories-first"
alias l="exa --group-directories-first --git --long --all"
alias tree="exa --group-directories-first --tree"
alias t="exa --group-directories-first --tree --all --ignore-glob '.git|.svn'"
alias batl="bat --theme ansi-light"
alias bat="bat --theme gruvbox"
alias vim="nvim"
alias sudo="sudo "
alias doas="doas "
alias open="xdg-open "

. "$HOME/.cargo/env"
