#!/usr/bin/bash
# SPDX-License-Identifier: Unlicense OR CC0-1.0
# Copyright © 2013-2024 Oliver Niebuhr, https://github.com/MeerMusik/LinuxScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
# - CC0 1.0 Universal License Text Start -
# LinuxScripts
# Written in 2013-2024 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
# - CC0 1.0 Universal License Text End -
if [ ! -d $HOME/Dev/ ]; then mkdir $HOME/Dev/
fi
if [ ! -d $HOME/Dev/GitRepos/ ]; then mkdir $HOME/Dev/GitRepos/
fi
if [ -d $HOME/Dev/GitRepos/ninja/ ]; then rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/GitRepos/ninja/*.* $HOME/Dev/GitRepos/ninja/* $HOME/Dev/GitRepos/ninja/
fi
cd $HOME/Dev/GitRepos/
git clone https://github.com/ninja-build/ninja.git --verbose --progress
echo DONE!
exit
