#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );
cd "$DIR";
./install.sh
if [[ $? -eq 0 ]]; then
	echo "INSTALL SUCCESSFUL"
fi