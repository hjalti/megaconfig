#!/bin/bash
INSTALLER="sudo pacman --noconfirm -S"

if ! [ -x "$(command -v sudo)" ]; then
    echo "Sudo must be installed"
    exit 1
fi

############################################
# Install essential packages, X, zsh, etc. #
############################################

$INSTALLER xorg-server xorg-xinit xorg-xrandr xorg-apps
$INSTALLER ttf-freefont ttf-ubuntu-font-family
$INSTALLER i3-wm i3lock i3status dmenu perl-anyevent-i3
$INSTALLER make cmake
$INSTALLER man-pages
$INSTALLER openssh
$INSTALLER pulseaudio
$INSTALLER python
$INSTALLER python2
$INSTALLER zsh zsh-syntax-highlighting
$INSTALLER pkgfile
$INSTALLER mlocate

################################
# Install very useful packages #
################################

$INSTALLER vim gvim
$INSTALLER firefox
$INSTALLER rxvt-unicode
$INSTALLER rxvt-unicode-terminfo
$INSTALLER dunst
$INSTALLER feh
$INSTALLER fasd
$INSTALLER gcc
$INSTALLER htop
$INSTALLER iputils
$INSTALLER ranger
$INSTALLER tree
$INSTALLER zathura zathura-djvu zathura-pdf-poppler zathura-ps
$INSTALLER rsync
$INSTALLER tar p7zip unzip unrar zip
$INSTALLER wget
$INSTALLER fakeroot

##########################
# Install extra packages #
##########################

$INSTALLER ack
$INSTALLER bsd-games
$INSTALLER chromium
$INSTALLER mpv
$INSTALLER youtube-dl
$INSTALLER xclip
$INSTALLER ctags
$INSTALLER python-virtualenvwrapper
$INSTALLER python-pip
$INSTALLER net-tools


# Link all dotfiles
for f in dotfiles/*; do
    ln $f $HOME/.$(basename $f)
done

ln config/dunst/dunstrc $HOME/.config/dunst/dunstrc

# Make home bin directory
mkdir $HOME/bin

# Link to all bin files
for f in bin/*; do
    ln $f $HOME/bin/$(basename $f)
done

# Setup i3
mkdir $HOME/.i3
ln -f i3/config $HOME/.i3/config


###########
#   zsh   #
###########


# Install oh-my-zsh
echo "####################################"
echo "About to install oh-my-zsh. The"
echo "installation process will open a new"
echo "shell. To complete installation,"
echo "exit the shell (crtl+D) after it"
echo "has been changed"
echo "####################################"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Link my favourite theme to themes

ln zsh/helgi.zsh-theme $HOME/.oh-my-zsh/themes

# oh-my-zsh installation overwrites .zshrc

ln -f dotfiles/zshrc $HOME/.zshrc


##################
#     aurget     #
##################


# Install aurget
cd /tmp
curl -L -O https://aur.archlinux.org/cgit/aur.git/snapshot/aurget.tar.gz
tar -xvf aurget.tar.gz
cd aurget
makepkg -si
cd ..
rm -rfv aurget

# Aurget packages

cd /tmp

aurget -S urxvt-font-size-git
aurget -S spotify

###############
#     VIM     #
###############


# Make directories for persistent undo/swapfiles in vim
mkdir $HOME/.vimtmp
mkdir $HOME/.vimtmp/vimswaps
mkdir $HOME/.vimtmp/undo
mkdir $HOME/.vimtmp/view


# install plugged for vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install vim plugins

vim -c ":PlugInstall"

git -C $HOME/.vim/plugged/YouCompleteMe/ submodule update --init --recursive
python $HOME/.vim/plugged/YouCompleteMe/install.py
