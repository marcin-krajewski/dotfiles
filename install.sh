#!/bin/bash

./install_software.sh

function _stow() {
  target=$1
  package=$2
  echo " > Stowing $package into $target ... "
  stow -R --target $target $package
}

_stow ~ mc
_stow ~ termite
_stow ~ vim
#_stow ~ git
_stow ~ vifm

_stow ~/.local sbin
