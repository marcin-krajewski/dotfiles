#!/bin/bash

source ~/.local/sbin/functions/common.sh

function tf() {

  local TEXT=""
  local FILE=""
  local EXTENSION=""
  local IGNORE_CASE="false"
  local PARAMS=()

  while [ "$1" != "" ]; do
    case $1 in
      --ignore-case | -ic)
        PARAMS+="-i"
        ;;
      --text | -t)
        TEXT="$2"
        shift
        ;;
      --extension | -e)
        EXTENSION="$2"
        shift
        ;;
      --filename | -f)
        FILE="$2"
        shift
        ;;
      *)
        echo "Incorrect argument passed $1"
        echo ""
        echo "<operation>"
        echo "  --filename,-f <value> - set file name to search"
        echo "  --extension,-e <value> - set file extension to search"
        echo "  --text,-t <value> - set text to search"
        echo "  --ignore-case,-ic - set this param to ignore case in search results"
        return
        ;;
    esac
    shift
  done

  if [ "${TEXT}" = "" ]; then
    echo "TEXT must be set"
    return
  fi

  name="*"
  if [ "$EXTENSION" != "" ]; then
    name="*.$EXTENSION"
  elif [ "$FILE" != "" ]; then
    name="$FILE"
  fi

  find -type f -name "$name" \! -ipath "*.svn*" \! -ipath "*.git*" -exec grep -E --with-filename --color=auto --line-number ${PARAMS[@]} "$TEXT" {} \;
}

function fjar() {
  CLASS_NAME=""
  while [ "$1" != "" ]; do
    case $1 in
      --class-name | -n)
        CLASS_NAME="$2"
        shift
        ;;
      *)
        echo "Incorrect argument passed $1"
        echo "  --class-name,-n <value> - Set class name to find in all jar files under current directory" display_help
        exit 1
        ;;
    esac
    shift
  done
  if [ "${CLASS_NAME}" = "" ]; then
    echo "Class name to search needs to be set!"
    echo "Incorrect argument passed $1"
    echo "  --class-name,-n <value> - Set class name to find in all jar files under current directory" display_help
    return
  fi
  find_for_extension $CLASS_NAME jar
}

function fwar() {
  find_for_extension $1 war
}

function find_for_extension() {
  EXT=$2
  DIR=.
  TMP_DIR=$(date)
  TMP_DIR="/home/mkrajewski/tmp/${EXT}_$(date +%Y%m%d_%H%M%S)"

  mkdir -p "$TMP_DIR"
  echo "$TMP_DIR"

  find -name "*.$EXT" -exec mkdir -p "$TMP_DIR/{}" \; -exec unzip -q {} -d "$TMP_DIR/{}" \;

  # ls -la "$TMP_DIR"

  find "$TMP_DIR" -iname "$1*"

  rm -rf $TMP_DIR
}

function __sql_frame() {
  STRING=$(xclip -o -selection clipboard)
  echo "S: $STRING" >>/tmp/sql.log
  frame.sh -m sql -s "$STRING" | xclip -selection clipboard
}

function bkp() {
  file=$1
  new_file="${file}_$(date +%Y%m%d_%H%M%S).bkp"
  if [ "$2" = "-k" ]; then
    cp -r "$file" "$new_file"
  else
    mv "$file" "$new_file"
  fi
  echo "File backuped: $file ---> $new_file"
  _ask_for_copy_string $new_file
}

####################################################################################################
#                    this function creates directory and cd's to this directory                    #
####################################################################################################
function mcd() {
  DIR="$1"
  if [ "$DIR" = "" ]; then
    echo "This creates directory and goes into it"
    echo "  Usage: mcd \$dirname (\$dirname can be a path)"
    return 1
  fi
  mkdir -p "$DIR" && cd "$DIR"
}
