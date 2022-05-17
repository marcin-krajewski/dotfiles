#!/bin/bash

function set_xpad {
	# echo "set help" >> /tmp/aaa
	directory_name=$1
	rm -rf ~/.config/xpad
	ln -fs ~/.config/xpad-configs/${directory_name} ~/.config/xpad
}

function set_help {
	set_xpad xpad-help
}

function set_intellij {
	set_xpad xpad-idea
}

function set_notes {
	set_xpad xpad-notes
}

function set_commands {
	set_xpad xpad-commands
}

function set_docker {
	set_xpad xpad-docker
}

function set_tmux {
	set_xpad xpad-tmux
}

function toggle_indicator_stickynotes {
	pid=`pidof -x xpad`
	if [[ -z "$pid" ]]; then
		$1
		xpad -s
	else
		xpad -q
	fi
}

for i in "$@"
do
    case "$1" in
		-ij|--intellij-idea)
			INTELLIJ="true"
            shift
            ;;
		-n|--notes)
			NOTES="true"
            shift
            ;;
		-c|--commands)
			COMMANDS="true"
            shift
            ;;
		-d|--docker)
			DOCKER="true"
            shift
            ;;
		-t|--tmux)
			TMUX="true"
            shift
            ;;
        -h|--output)
            HELP="TRUE"
			;;
        *)
            echo "Programming error"
            exit 3
            ;;
    esac
done

if [ -n "${HELP}" ]; then 
	toggle_indicator_stickynotes set_help
fi;

if [ -n "${INTELLIJ}" ]; then 
	toggle_indicator_stickynotes set_intellij
fi;

if [ -n "${NOTES}" ]; then 
	toggle_indicator_stickynotes set_notes
fi;

if [ -n "${COMMANDS}" ]; then 
	toggle_indicator_stickynotes set_commands
fi;

if [ -n "${DOCKER}" ]; then 
	toggle_indicator_stickynotes set_docker
fi;

if [ -n "${TMUX}" ]; then 
	toggle_indicator_stickynotes set_tmux
fi;
