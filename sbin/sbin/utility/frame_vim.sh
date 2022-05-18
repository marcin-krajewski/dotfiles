#!/bin/bash

mode="bash"
if [ "$1" != "" ]; then
    mode=$1
fi
STRING=`cat /dev/stdin`
~/.local/sbin/utility/frame.sh -m $mode -s "$STRING"
