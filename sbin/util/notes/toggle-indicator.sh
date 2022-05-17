#!/bin/bash

function set_help {
	rm ~/.config/indicator-stickynotes
	ln -fs ~/.config/indicator-stickynotes-config/indicator-stickynotes-help ~/.config/indicator-stickynotes
}

function set_intellij {
	rm ~/.config/indicator-stickynotes
	ln -fs ~/.config/indicator-stickynotes-config/indicator-stickynotes-intellij-idea ~/.config/indicator-stickynotes
}

function set_notes {
	rm ~/.config/indicator-stickynotes
	ln -fs ~/.config/indicator-stickynotes-config/indicator-stickynotes-notes ~/.config/indicator-stickynotes
}

function set_commands {
	rm ~/.config/indicator-stickynotes
	ln -fs ~/.config/indicator-stickynotes-config/indicator-stickynotes-commands ~/.config/indicator-stickynotes
}

function toggle_indicator_stickynotes {
	kill -9 `pidof -x indicator-stickynotes`

	if [ $? -ne 0 ]; then
		indicator-stickynotes &
	fi
}

function toggle_todo {
	kill -9 `pidof -x gnome-todo`

	if [ $? -ne 0 ]; then
		gnome-todo &
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
	set_help && toggle_indicator_stickynotes
fi;

if [ -n "${INTELLIJ}" ]; then 
	set_intellij && toggle_indicator_stickynotes
fi;

if [ -n "${NOTES}" ]; then 
	set_notes && toggle_indicator_stickynotes 
fi;

if [ -n "${COMMANDS}" ]; then 
	set_commands && toggle_indicator_stickynotes
fi;
