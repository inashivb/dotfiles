#!/bin/bash

# Basic setup on Ubuntu

# Install all necessary packages
sudo apt install vim gcc traceroute curl nmap mlocate wget git \
    xclip ffmpeg libtool libpcre2-dev python3 python3-pip \
    libyaml-dev libjansson-dev libpcap-dev libcap-ng-dev \
    libmagic-dev liblz4-dev cmake clang-format

# Vundle for Vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Post steps: PluginInstall

# Download and source git scripts
curl -o ~/.git-prompt.sh\
    https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
source .git-prompt.sh
wget  https://github.com/inashivb/dotfiles/raw/master/.gitconfig
wget https://www.github.com/git/git/raw/master/contrib/completion/git-completion.bash

# Move to Download
cd Downloads/
# Zoom installation
sudo apt install libgl1-mesa-glx libegl1-mesa libxcb-xtest0 libxcb-xinerama0
wget https://zoom.us/client/latest/zoom_amd64.deb
sudo dpkg -i zoom_amd64.deb
rm zoom_amd64.deb

# Get back Home
cd

# Download and source dotfiles
wget  https://github.com/inashivb/dotfiles/raw/master/.bashrc
wget  https://github.com/inashivb/dotfiles/raw/master/.vimrc
source .bashrc

# Download and install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install --force cbindgen
