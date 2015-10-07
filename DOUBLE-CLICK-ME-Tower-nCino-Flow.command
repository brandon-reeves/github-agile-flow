#!/bin/bash
# Pull-Request git-flow for Tower updater

killall Tower

# Update git
ls /Applications/Tower.app/Contents/Resources/git-flow/.git;
if [[ $? -ne 0 ]]; then
	rm -R /Applications/Tower.app/Contents/Resources/git-flow/
	git clone https://github.com/brandon-reeves/tower-git-flow-github-pull-requests.git /Applications/Tower.app/Contents/Resources/git-flow/
else
	cd /Applications/Tower.app/Contents/Resources/git-flow;
	git stash save;
	git pull origin master;
	git checkout master;
fi