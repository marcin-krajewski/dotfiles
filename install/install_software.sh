#!/usr/bin/env bash

# paci         - install one or more packages
# pacu         - upgrade all packages to their newest version

cd ~

packages=(vim vifm git termite zsh mc)

function _update() {
  echo "Update software repositories"
  if [ -e "/usr/bin/apt-get" ]; then # Apt-based distros (Debian, Ubuntu, etc.)
    apt-get update
  elif [ -e "/usr/bin/yay" ]; then # Arch Linux
    yay -Syy --noconfirm
  elif [ -e "/usr/bin/pacman" ]; then # Arch Linux
    pacman -Syy --noconfirm
  elif [ -e "/usr/bin/yum" ]; then # RPM-based distros
    yum update
  elif [ -e "/usr/local/bin/brew" ]; then # homebrew
    brew update
  fi
}

function _install() {
  package=$1
  echo " > Installing package $package"
  if [ -e "/usr/bin/apt-get" ]; then # Apt-based distros (Debian, Ubuntu, etc.)
    apt-get install $package
  elif [ -e "/usr/bin/yay" ]; then # Arch Linux
    yay -S $package --noconfirm
  elif [ -e "/usr/bin/pacman" ]; then # Arch Linux
    pacman -S $package --noconfirm
  elif [ -e "/usr/bin/yum" ]; then # RPM-based distros
    yum install $package
  elif [ -e "/usr/local/bin/brew" ]; then # homebrew
    brew install $package
  fi
}

_update

mkdir -p .aur && cd .aur
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si

cd ~

_install stow
_install vim
_install vifm
_install git
_install termite
_install zsh
_install mc
_install mc
_install rofi

