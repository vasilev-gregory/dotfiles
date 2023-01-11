#!/bin/bash

# https://askubuntu.com/a/1118739
sudo apt update -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt clean -y && sudo apt autoclean -y

# for gnome-tweak-tool, which is required for gnome-tweak-tool, which is required for remapping CAPS to CTRL
sudo add-apt-repository universe
sudo apt -y install tmux neovim gnome-tweaks git zsh telegram-desktop gnome-shell-extension-prefs

echo 'Keyboard & Mouse > Keyboard > Additional Layout Options > Caps Lock behavior'
sleep 5
gnome-tweaks

echo setting nvim up
mkdir -p ~/.config/nvim
nvim +PlugInstall +qall

ln -s ~/dotfiles/init.vim ~/.config/nvim/init.vim
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/zsh/zshrc ~/.zshrc

chsh -s $(which zsh) 

echo log out and bach in for zsh to bacome default shell

git clone https://github.com/sindresorhus/pure.git "$HOME/dotfiles/zsh/pure"
git clone https://github.com/jeffreytse/zsh-vi-mode.git $HOME/dotfiles/zsh/zsh-vi-mode
