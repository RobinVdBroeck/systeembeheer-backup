#!/usr/bin/env bash
ln -s /etc/scripts/backup.sh /root/git/hooks/post-receive
ln -s /etc/scripts/dump-packages.sh /etc/.git/hooks/pre-commit
