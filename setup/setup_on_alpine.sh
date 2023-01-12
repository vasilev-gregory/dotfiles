apk --no-cache update
apk --no-cache add neovim ripgrep

mkdir -p ~/.config/nvim
ln -s ~/dotfiles/init.vim ~/.config/nvim/init.vim
ln -s ~/dotfiles/bash/bashrc ~/.bashrc
