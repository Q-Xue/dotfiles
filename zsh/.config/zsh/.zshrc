# get rid of the login message for Mac system
# ref[] https://stackoverflow.com/questions/15769615/remove-last-login-message-for-new-tabs-in-terminal
if [ "$(uname)" = "Darwin" ]; then
    printf '\33c\e[3J'
fi

#---------------------- packager manager -------------------#
# Created by Zap installer
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
# plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"


#---------------------- basic settings ---------------------#
# options
plug "$ZDOTDIR/core/zsh-options"

# environment virables
plug "$ZDOTDIR/core/zsh-exports"

# prompt
plug "$ZDOTDIR/core/zsh-prompt-greg"

# hooks
plug "$ZDOTDIR/core/zsh-hooks"

# alias
plug "$ZDOTDIR/core/zsh-aliases"

# completion
plug "$ZDOTDIR/core/zsh-completion"

# maps
plug "$ZDOTDIR/core/zsh-bindkey"


#---------------------- utility settings --------------------#
#--- idea is similar to nvim plugin config

# fzf
plug "$ZDOTDIR/utils/zsh-fzf"

# nvim
plug "$ZDOTDIR/utils/zsh-nvim"

# rust
plug "$ZDOTDIR/utils/zsh-rust"

# conda
plug "$ZDOTDIR/utils/zsh-conda"
