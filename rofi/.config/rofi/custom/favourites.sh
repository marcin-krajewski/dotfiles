#!/bin/bash

echo "rofi $@" >> /tmp/rofii
echo "rofi first $1" >> /tmp/rofii

if [ -n "$@" ]
then
    if [[ "$@" == "IntelliJ IDEA" ]]; then
	nohup "/opt/Work/Development/intellij/idea" >/dev/null 2>&1 &
	exit 0;
    elif [[ "$@" == "Teams" ]]; then
	nohup "teams-for-linux" >/dev/null 2>&1 &
	exit 0;
    elif [[ "$@" == "Firefox" ]]; then
	nohup "firefox" >/dev/null 2>&1 &
	exit 0;
    elif [[ "$@" == "Power Off" ]]; then
	systemctl poweroff
	exit 0;
    elif [[ "$@" == "Reboot" ]]; then
	systemctl reboot
	exit 0;
    elif [[ "$@" == "Logout" ]]; then
	nohup awesome-client command "awesome.quit()" >/dev/null 2>&1 &
	exit 0;
    fi
fi

echo "IntelliJ IDEA"
echo "Firefox"
echo "Teams"
echo "hello I'm your teacher"
echo "-----"
echo "Power Off"
echo "Reboot"
echo "Logout"
echo "-----"
echo "/usr/share/applications/firefox.desktop"
