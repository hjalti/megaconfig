#!/bin/bash
USER=hjalti
HOME=/home/$USER
INSTALLER=sudo pacman --noconfirm -S
DESTDIR=.setup

############################################
# Install essential packages, X, zsh, etc. #
############################################

$INSTALLER xorg-server
$INSTALLER i3-wm i3lock i3status
$INSTALLER make cmake
$INSTALLER man-pages
$INSTALLER openssh
$INSTALLER pulseaudio
$INSTALLER python
$INSTALLER python2
$INSTALLER zsh

################################
# Install very useful packages #
################################

$INSTALLER vim gvim
$INSTALLER firefox
$INSTALLER rxvt-unicode
$INSTALLER rxvt-unicode-terminfo
$INSTALLER dunst
$INSTALLER feh
$INSTALLER autojump
$INSTALLER gcc
$INSTALLER htop
$INSTALLER iputils
$INSTALLER ranger
$INSTALLER tree
$INSTALLER zathura zathura-djvu zathura-pdf-poppler zathura-ps
$INSTALLER rsync
$INSTALLER tar p7zip unzip unrar zip
$INSTALLER wget




# Dotfiles
ln -s dotfiles/zshrc $HOME/.zshrc
ln -s dotfiles/vimrc $HOME/.vimrc
ln -s dotfiles/aliases $HOME/.aliases
ln -s dotfiles/xinitrc $HOME/.xinitrc

# Make directories for persistent undo/swapfiles in vim
mkdir $HOME/.vimtmp
mkdir $HOME/.vimtmp/vimswaps
mkdir $HOME/.vimtmp/undo
mkdir $HOME/.vimtmp/view

# install plugged for vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# Change default shell

chsh -s zsh $USER


# Install aurget

cd /tmp
curl -L -O https://github.com/pbrisbin/aurget/archive/v4.7.2.tar.gz
cd aurget
makepkg -si
cd ..
rm -rfv aurget

# Aurget packages

aurget -S urxvt-font-size-git
aurget -S spotify

# Install extra packages

$INSTALLER ack
$INSTALLER bsd-games
$INSTALLER chromium
$INSTALLER mpv
$INSTALLER youtube-dl


# Install vim plugins

vim -c ":PlugInstall"
