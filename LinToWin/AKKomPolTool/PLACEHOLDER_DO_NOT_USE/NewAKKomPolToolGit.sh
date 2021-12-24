#!/usr/bin/bash
# SPDX-License-Identifier: Unlicense OR CC0-1.0
# Copyright © 2021 Oliver Niebuhr, https://github.com/MeerMusik/WindowsScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
# - CC0 1.0 Universal License Text Start -
# WindowsScripts
# Written in 2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
# - CC0 1.0 Universal License Text End -
if [ ! -d ${SYSTEMDRIVE}/Dev/ ]; then mkdir ${SYSTEMDRIVE}/Dev/
fi
if [ ! -d ${SYSTEMDRIVE}/Dev/GitRepos/ ]; then mkdir ${SYSTEMDRIVE}/Dev/GitRepos/
fi
if [ -d ${SYSTEMDRIVE}/Dev/GitRepos/AKKomPolTool/ ]; then rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/GitRepos/AKKomPolTool/*.* ${SYSTEMDRIVE}/Dev/GitRepos/AKKomPolTool/* ${SYSTEMDRIVE}/Dev/GitRepos/AKKomPolTool/
fi
cd ${SYSTEMDRIVE}/Dev/GitRepos/
git clone https://github.com/MeerMusik/AKKomPolTool.git --verbose --progress
echo DONE!
exit
