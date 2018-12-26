#!/bin/bash

#set -x #outputs commands as they run
set -e #exit from script if any command returns non-zero code

if [ "$1" != "" ]; then
	echo $1
	cd "$1"
else
	echo "First argument not provided, assuming the current directory as directory of repo"
fi

#add files in the staging area
git add .

#commit the changes, a text editor will open for commit message
if [ "$2" != "" ]; then
	git commit -m "$2"
else
	echo "Second argument not provided, opening text editor for commit message"
	git commit
fi

#push the changes in the repo
if [ "$3" != "" ]; then
	git push origin $3
else
	echo "Pushing the current branch since third argument was not provided"	
	#push the current branch in remote
	git push origin $(git branch | grep "* " | cut -d ' ' -f2)
fi
