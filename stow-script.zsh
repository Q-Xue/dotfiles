ref[1] https://www.youtube.com/watch?v=CFzEuBGPPPg&t=1183s

# ------------------ stow basic flags-------------------#
# stow -nvt
# stow --adopted
# stow -D


# link git config files
stow -vt ~ git
# link zsh config files
stow -vt ~ zsh
# link nvim config files
stow -vt ~ nvim
