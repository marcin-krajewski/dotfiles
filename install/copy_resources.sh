#!/usr/bin/env bash

mkdir -p ~/.local/.share
mkdir -p ~/.config

function _stow() {
  target=$1
  package=$2
  echo " > Stowing $package into $target ... "
  stow -R --target $target $package
}

_stow ~ mc
_stow ~ termite
_stow ~ vim
_stow ~ rofi
#_stow ~ git
_stow ~ vifm
_stow ~ font

_stow ~/.local sbin
