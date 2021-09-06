#!/usr/bin/bash
# SPDX-License-Identifier: Unlicense OR CC0-1.0
# Copyright © 2013-2021 Oliver Niebuhr, https://github.com/MeerMusik/LinuxScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
# - CC0 1.0 Universal License Text Start -
# LinuxScripts
# Written in 2013-2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
# - CC0 1.0 Universal License Text End -
export PATH=$PATH:$HOME/Dev/Binaries/Qtx64Debug/:$HOME/Dev/Binaries/Qtx64Debug/bin/
if [ ! -d $HOME/Dev/ ]; then mkdir $HOME/Dev/
fi
if [ ! -d $HOME/Dev/Builds/ ]; then mkdir $HOME/Dev/Builds/
fi
if [ -d $HOME/Dev/Builds/GammaRayx64/ ]; then rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/GammaRayx64/*.* $HOME/Dev/Builds/GammaRayx64/* $HOME/Dev/Builds/GammaRayx64/
fi
if [ ! -d $HOME/Dev/Builds/GammaRayx64/ ]; then mkdir $HOME/Dev/Builds/GammaRayx64/
fi
cp --force --verbose --recursive $HOME/Dev/GitRepos/GammaRay/ $HOME/Dev/Builds/GammaRayx64/
cd $HOME/Dev/Builds/GammaRayx64/GammaRay/
cmake $HOME/Dev/Builds/GammaRayx64/GammaRay/ -G"Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$HOME/Dev/Binaries/GammaRayx64/"
make -j$(nproc)
if [ ! -d $HOME/Dev/Binaries/ ]; then mkdir $HOME/Dev/Binaries/
fi
make -j1 install
rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/GammaRayx64/*.* $HOME/Dev/Builds/GammaRayx64/* $HOME/Dev/Builds/GammaRayx64/
exit
