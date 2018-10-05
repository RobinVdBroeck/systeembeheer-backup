#!/usr/bin/env bash
dpkg --get-selections > /etc/installed_packages
git add installed_packages


