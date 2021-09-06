#!/usr/bin/bash
# SPDX-License-Identifier: Unlicense OR CC0-1.0
# Copyright © 2013-2021 Oliver Niebuhr, https://github.com/MeerMusik/LinuxScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
# - CC0 1.0 Universal License Text Start -
# LinuxScripts
# Written in 2013-2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
# - CC0 1.0 Universal License Text End -
cd $HOME/Dev/GitRepos/Qt6/qt5
git pull --verbose
perl init-repository --force
# qtwebengine <<-- This Module is over 1GB in Size alone. Therefore disabled by Default!
#perl init-repository --force --module-subset=qtbase,qtdeclarative,qtdoc,qtgraphicaleffects,qtimageformats,qtmultimedia,qtquickcontrols,qtquickcontrols2,qttools,qttranslations,qtwayland,qtwebchannel,qtwebsockets,qtwebview,qtx11extras,qtxmlpatterns
exit
