#!/usr/bin/env bash

echo "************************************************************************************************************************"
echo "*                                                                                                                      *"
echo "*               Add your additional config/installation files here, it will be performed on image build                *"
echo "*                                                                                                                      *"
echo "************************************************************************************************************************"

#setopt EXTENDED_GLOB
#for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
#  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
#done

cd ~

if [ ! -d ".zprezto" ]; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

  ln -fs .zprezto/runcoms/zlogin .zlogin
  ln -fs .zprezto/runcoms/zlogout .zlogout
  ln -fs .zprezto/runcoms/zpreztorc .zpreztorc
  ln -fs .zprezto/runcoms/zprofile .zprofile
  ln -fs .zprezto/runcoms/zshenv .zshenv
  ln -fs .zprezto/runcoms/zshrc .zshrc

  chsh -s /bin/zsh

  cp .dotfiles/zprezto/.zsh.local.zsh ~

#  if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
#  fi

  cat .dotfiles/zprezto/.zshrc.modification.zsh >> .zpreztorc

fi

