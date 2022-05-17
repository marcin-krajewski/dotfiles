#!/bin/bash

./install_software.sh

stow -R --target ~ mc
stow -R --target ~ termite
stow -R --target ~ vim
#stow -R --target ~ git
stow -R --target ~ vifm

stow -R --target ~/.local sbin
