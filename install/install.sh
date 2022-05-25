#!/usr/bin/env bash

SCRIPT=$(basename "$0")

##VARIABLES##

CONFIGURE_ZSH="false"
STOW="false"
INSTALL_SOFTWARE="false"
while [ "$1" != "" ]; do
  case $1 in
    ##PARAM##

    --configure-zsh | -z)
      CONFIGURE_ZSH="true"
      ;;
    --stow | -ss)
      STOW="true"
      ;;
    --software | -s)
      INSTALL_SOFTWARE="true"
      ;;
    *)
      echo "Incorrect argument passed $1"
      ##HELP_FUNCTION##

      echo "  --configure-zsh,-z - set this param to configure zsh"
      echo "  --stow,-ss - set this param to stow"
      echo "  --software,-s - set this param to install software"
      exit 1
      ;;
  esac
  shift
done
##CONDITIONS##

if [ "${INSTALL_SOFTWARE}" = "true" ]; then
  ./install_software.sh
fi
if [ "${CONFIGURE_ZSH}" = "true" ]; then
  ./configure_zsh.sh
fi
if [ "${STOW}" = "true" ]; then
  ./stow.sh
  ./copy_resources.sh
fi
