#!/bin/bash

#exit from script if any command returns non-zero code
set -e

#Arguments:
#1: The directory where the git repository exists
#2: Commit message
#3: Name of the remote branch where the repo is to be pushed 


if [ "$1" != "" ]; then
	echo "Directory provided: $1"
	cd "$1"

else
	echo "First argument not provided, assuming the current directory as directory of repo"
fi

#add files in the staging area
git add -A

#commit the changes, a text editor will open for commit message
if [ "$2" != "" ]; then
	git commit -m "$2"
else
	echo "Second argument not provided, opening text editor for commit message"
	git commit
fi

#push the changes in the repo
if [ "$3" != "" ]; then
    echo "Name of branch provided: $3"
	git push origin $3
else
	echo "Pushing in remote branch with same name as current branch since third argument was not provided"	
	#push the current branch in remote
	git push origin $(git branch | grep "* " | cut -d ' ' -f2)
fi
