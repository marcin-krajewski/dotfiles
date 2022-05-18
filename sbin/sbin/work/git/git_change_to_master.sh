#!/bin/bash

COMMAND=$1

if [ "$COMMAND" == "fetch-rebase" ]; then
	COMMAND="git rb"
else
	COMMAND="git pull"
fi;

#finds .git folders and extract first level folder names
GIT_FOLDERS=`find -name ".git" -type d | sed -e 's/\(.*\)\/.*/\1/'`

for FOLDER in $GIT_FOLDERS
do
	echo "going to $FOLDER"
	cd $FOLDER
	echo "Executing: git status"
	git checkout master
	cd ../
	echo ""
done
