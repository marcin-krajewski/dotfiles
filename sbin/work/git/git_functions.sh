#!/bin/bash

function git_main {
	# https://stackoverflow.com/questions/957928/is-there-a-way-to-get-the-git-root-directory-in-one-command
	cd `git rev-parse --show-toplevel`
}

function git_prepare_commit {
	ln -fs /usr/local/sbin/work/git/prepare-commit-msg .git/hooks/prepare-commit-msg
}