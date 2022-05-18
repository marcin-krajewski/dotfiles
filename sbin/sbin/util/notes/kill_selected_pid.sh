#!/bin/bash

echo "" >> /tmp/log-kill_selected_pid
echo "----------------------------------------------------------------------" >> /tmp/log-kill_selected_pid
PID_TO_KILL=`xclip -selection primary -o`
echo "Trying to kill: $PID_TO_KILL" >> /tmp/log-kill_selected_pid
kill -9 $PID_TO_KILL 2>> /tmp/log-kill_selected_pid

if [ $? -eq 0 ]; then
  echo "Successfully killed process: $PID_TO_KILL" >> /tmp/log-kill_selected_pid
fi
