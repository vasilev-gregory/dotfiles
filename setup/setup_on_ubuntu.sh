#!/bin/bash

# https://askubuntu.com/a/1118739
sudo apt update -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt clean -y && sudo apt autoclean -y

# for gnome-tweak-tool, which is required for gnome-tweak-tool, which is required for remapping CAPS to CTRL
sudo add-apt-repository universe
sudo apt -y install tmux gnome-tweaks git zsh telegram-desktop gnome-shell-extension-prefs ripgrep fd-find conky-all build-essential python3 python3-pip lua-nvim snapd cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
sudo snap install nvim --classic

git config --global user.email "vasiliev.gregory@gmail.com"
git config --global user.name "Gregory"

echo 'Keyboard & Mouse > Keyboard > Additional Layout Options > Caps Lock behavior'
sleep 5
gnome-tweaks

echo setting nvim up
mkdir -p ~/.config/nvim

ln -s ~/dotfiles/init.vim ~/.config/nvim/init.vim
ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/zsh/zshrc ~/.zshrc
ln -s ~/dotfiles/unishell/conkyrc ~/.conkyrc

nvim +PlugInstall +qall

pip3 install --user wheel 
pip3 install --user pynvim 

chsh -s $(which zsh) 

echo log out and bach in for zsh to bacome default shell

git clone https://github.com/sindresorhus/pure.git "$HOME/dotfiles/zsh/pure"
git clone https://github.com/jeffreytse/zsh-vi-mode.git $HOME/dotfiles/zsh/zsh-vi-mode


# https://docs.docker.com/engine/install/ubuntu/
echo install docker

sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

echo https://docs.docker.com/engine/install/linux-postinstall/
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

docker run hello-world

echo golang should be installed manually
echo https://go.dev/doc/install


# signal : fix black screen 
# https://askubuntu.com/a/1356534
