#!/bin/bash

# Basic setup on Ubuntu

# Install all necessary packages
sudo apt install vim gcc traceroute curl nmap wget git \
    xclip ffmpeg python3 python3-pip \
    cmake clang-format flameshot g++ wireshark

# Vundle for Vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#Post steps: PluginInstall
# Backup dirs for Vim
mkdir -p $HOME/.vim/swp
mkdir $HOME/.vim/backup
mkdir $HOME/.vim/undodir
mkdir $HOME/.vim/ctags

# Download and source git scripts
curl -o ~/.git-prompt.sh\
    https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
source ~/.git-prompt.sh
curl -o ~/.git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash


# Download and source dotfiles
cp .* ~
source ~/.bashrc

# Download and install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install --force cbindgen

# Install zoxide and starship
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
curl -sS https://starship.rs/install.sh | sh

# Install i3
sudo apt install i3 polybar rofi alacritty fonts-font-awesome
cp -r .config ~/
