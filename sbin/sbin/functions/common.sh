#!/bin/bash

function _copy_command_result_to_cliboard_quietly() {
  result=$($@)
  echo "> $@"
  echo "$result"
  _copy_to_clipboard "$result" "-q"
}

function _copy_command_result() {
  _copy_to_clipboard $($1)
}

function _copy_to_clipboard() {
  quiet="false"
  if [ "$2" = "-q" ]; then
    quiet="true"
  fi
  
  printf "%s" $1 | xclip -selection clipboard
  if [ "$quiet" = "false" ]; then
    frame.sh -c \- -s "String >$1< copied to clipboard"
  fi
}

function _ask_for_copy_string() {
  # unfortunately `read` for zsh and bash work differently
  user_input=$(bash -c "read -n1 -p 'Copy? y/n ' c; echo \$c")
  if [ "$user_input" = "y" ]; then
    echo ""
    _copy_to_clipboard $1
  fi
}