#!/usr/bin/env bash

apt-get update
dpkg --set-selections < /etc/installed_packages && sudo apt-get dselect-upgrade
