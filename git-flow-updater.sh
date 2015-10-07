#!/bin/bash
# Pull-Request git-flow for Tower updater

killall Tower

# Change App back to user
REALUSER=$(whoami)
sudo chown -R $REALUSER:staff /Applications/Tower.app
sudo chown -R $REALUSER:staff /Applications/Tower.app/Contents/Resources

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
# if [[ $? -eq 0 ]]; then
# 	ls .git;
# 	if [[ $? -ne 0 ]]; then
# 		git init;
# 		git remote add origin https://github.com/brandon-reeves/tower-git-flow-github-pull-requests.git;
# 	fi
# 	git fetch origin;
# 	git stash save;
# 	git checkout -b master --track origin/master;
# 	git reset origin/master;
# fi
