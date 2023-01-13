apk --no-cache update
echo apk --no-cache add neovim ripgrep python3 py3-pip
apk --no-cache add neovim ripgrep python3 py3-pip

pip3 install --user pynvim

mkdir -p ~/.config/nvim
ln -s ~/dotfiles/init.vim ~/.config/nvim/init.vim
ln -s ~/dotfiles/bash/bashrc ~/.bashrc

nvim +PlugInstall +qall
nvim +UpdateRemotePlugins +qall
