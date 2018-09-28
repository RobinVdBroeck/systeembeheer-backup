#!/usr/bin/env bash
dpkg --get-selections > /etc/installed_packages

if [ -a .commit ] 
then
	rm .commit
	git add installed_packages
	git commit --amend -C HEAD --no-verify
fi

