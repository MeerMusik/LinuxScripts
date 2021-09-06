#!/usr/bin/bash
# SPDX-License-Identifier: Unlicense OR CC0-1.0
# Copyright © 2013-2021 Oliver Niebuhr, https://github.com/MeerMusik/LinuxScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
# - CC0 1.0 Universal License Text Start -
# LinuxScripts
# Written in 2013-2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
# - CC0 1.0 Universal License Text End -
export CXXFLAGS='-fPIE -pipe -Wl,-pie'
export MAKEFLAGS='-j$(nproc)'
export QMAKE_CXXFLAGS+='-fPIE -pipe -Wl,-pie'
export QTDIR='$HOME/Dev/Binaries/Qtx86ReleaseStatic/'
export PATH=$PATH:${QTDIR}/bin/
if [ ! -d $HOME/Dev/ ]; then mkdir $HOME/Dev/
fi
if [ ! -d $HOME/Dev/Binaries/ ]; then mkdir $HOME/Dev/Binaries/
fi
if [ -d $HOME/Dev/Binaries/QtIFWx86ReleaseStatic/ ]; then rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Binaries/QtIFWx86ReleaseStatic/*.* $HOME/Dev/Binaries/QtIFWx86ReleaseStatic/* $HOME/Dev/Binaries/QtIFWx86ReleaseStatic/
fi
if [ ! -d $HOME/Dev/Binaries/QtIFWx86ReleaseStatic/ ]; then mkdir $HOME/Dev/Binaries/QtIFWx86ReleaseStatic/
fi
cd $HOME/Dev/Binaries/QtIFWx86ReleaseStatic/
cp --verbose --recursive --remove-destination $HOME/Dev/GitRepos/installer-framework/* $HOME/Dev/Binaries/QtIFWx86ReleaseStatic/
$HOME/Dev/Binaries/Qtx86ReleaseStatic/bin/qmake QMAKE_CXXFLAGS_RELEASE-='-O2' QMAKE_CXXFLAGS+='-fPIE -pipe -Os' QMAKE_LFLAGS+='-Wl,-pie' QMAKE_MAKEFLAGS+='-j$(nproc)' installerfw.pro
make -j$(nproc)
cp --force --verbose --recursive $HOME/Dev/Binaries/QtIFWx86ReleaseStatic/tools/repocompare/repocompare $HOME/Dev/Binaries/QtIFWx86ReleaseStatic/bin/
make clean
exit
