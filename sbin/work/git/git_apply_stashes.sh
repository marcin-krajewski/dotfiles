#!/bin/bash

git stash apply `git stash list | grep "SSI external url to SST value" | awk '{print $1}' | sed 's/\://'`
git stash apply `git stash list | grep "import.sql content replacer class" | awk '{print $1}' | sed 's/\://'`
git stash apply `git stash list | grep "TemplateInstance values create from JSON file" | awk '{print $1}' | sed 's/\://'`
git stash apply `git stash list | grep "Template AT XML written to temporary file and to console" | awk '{print $1}' | sed 's/\://'`
