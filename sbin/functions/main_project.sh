#!/usr/bin/env bash

source ~/.local/sbin/functions/common.sh

function mp() {
  exec_options=("MAIN_PROJECT" "$@")
  function_suffix=$(printf "_%s" "${exec_options[@]}" | sed -e 's/^_//' | sed -e 's/_$//' | sed -e 's/.*/\U&/g' | sed -e 's/[-.]/_/g')
  eval function_suffix=\$$function_suffix
  cd "${function_suffix}"
}

function lsp() {

  #  check whether path is absolute or not
  if [[ "$1" == /* ]]; then
    directory="$1"
  else
    directory="$(pwd)/$1"
  fi

  echo "$directory"
  _ask_for_copy_string "$directory"
}

function lsd() {
  cd $1 && pwd && cd -
}
