#    _               _
#   | |__   __ _ ___| |__  _ __ ___
#   | '_ \ / _` / __| '_ \| '__/ __|
#  _| |_) | (_| \__ \ | | | | | (__
# (_)_.__/ \__,_|___/_| |_|_|  \___|
#

# Make the autocompletion case-insensitive
if [ ! -a ~/.inputrc ]; then
    echo '$include /etc/inputrc' >~/.inputrc
fi
echo 'set completion-ignore-case On' >>~/.inputrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc;
fi

# Source other environments
if [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# User specific prompt
export PS1="[\W]$ "

# User specific aliases and functions
alias ls="exa --long --group-directories-first"
alias tree="exa --group-directories-first --tree --ignore-glob '.git|.svn|target|out|build'"
alias bat="bat --theme gruvbox"
alias vim="nvim"
alias sudo="sudo "
alias doas="doas "
alias open="xdg-open "
