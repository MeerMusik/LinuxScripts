#!/usr/bin/bash
# SPDX-License-Identifier: Unlicense OR CC0-1.0
# Copyright © 2013-2021 Oliver Niebuhr, https://github.com/MeerMusik/LinuxScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
# - CC0 1.0 Universal License Text Start -
# LinuxScripts
# Written in 2013-2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
# - CC0 1.0 Universal License Text End -
if [ ! -d $HOME/Dev/Builds/ ]; then mkdir $HOME/Dev/Builds/
fi
if [ -d $HOME/Dev/Builds/Qt6x64DebugRelease/ ]; then rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/Qt6x64DebugRelease/*.* $HOME/Dev/Builds/Qt6x64DebugRelease/* $HOME/Dev/Builds/Qt6x64DebugRelease/
fi
if [ ! -d $HOME/Dev/Builds/Qt6x64DebugRelease/ ]; then mkdir $HOME/Dev/Builds/Qt6x64DebugRelease/
fi
cd $HOME/Dev/Builds/Qt6x64DebugRelease/
cmake $HOME/Dev/GitRepos/Qt6/qt5/ -G"Ninja Multi-Config" -DCMAKE_CONFIGURATION_TYPES="Release;Debug" -DCMAKE_DEFAULT_CONFIGS="all" -DQT_QMAKE_TARGET_MKSPEC="linux-g++-64" -DCMAKE_CXX_FLAGS="-m64" -DBUILD_WITH_PCH=ON -DBUILD_qt5compat=OFF -DWARNINGS_ARE_ERRORS=OFF -DFEATURE_ltcg=OFF -DFEATURE_optimize_full=OFF -DFEATURE_optimize_size=OFF -DFEATURE_optimize_debug=OFF -DFEATURE_relocatable=ON -DFEATURE_clangcpp=ON -DFEATURE_doubleconversion=ON -DFEATURE_system_doubleconversion=OFF -DFEATURE_freetype=ON -DFEATURE_system_freetype=OFF -DFEATURE_harfbuzz=ON -DFEATURE_system_harfbuzz=OFF -DFEATURE_pcre2=ON -DFEATURE_system_pcre2=OFF -DFEATURE_system_zlib=OFF -DFEATURE_icu=ON -DICU_ROOT="$HOME/Dev/Binaries/ICUx64Release/" -DICU_INCLUDE_DIRS="$HOME/Dev/Binaries/ICUx64Release/include/" -DICU_LIBRARIES="$HOME/Dev/Binaries/ICUx64Release/lib/" -DFEATURE_openssl=ON -DFEATURE_openssl_linked=ON -DOPENSSL_ROOT_DIR="$HOME/Dev/Binaries/OpenSSLx64Release/" -DOPENSSL_INCLUDE_DIR="$HOME/Dev/Binaries/OpenSSLx64Release/include/" -DOPENSSL_LIBRARIES="$HOME/Dev/Binaries/OpenSSLx64Release/lib/" -DCMAKE_INSTALL_PREFIX="$HOME/Dev/Binaries/Qt6x64/"
ninja --verbose -j$(nproc)
if [ ! -d $HOME/Dev/Binaries/ ]; then mkdir $HOME/Dev/Binaries/
fi
if [ ! -d $HOME/Dev/Binaries/Qt6x64/ ]; then mkdir $HOME/Dev/Binaries/Qt6x64/
fi
cd $HOME/Dev/Builds/Qt6x64DebugRelease/
ninja --verbose install
cp --force --verbose $HOME/Dev/Binaries/ICUx64Release/lib/libicui18n.so.69.1 $HOME/Dev/Binaries/Qt6x64/bin/
cp --force --verbose $HOME/Dev/Binaries/ICUx64Release/lib/libicudata.so.69.1 $HOME/Dev/Binaries/Qt6x64/bin/
cp --force --verbose $HOME/Dev/Binaries/ICUx64Release/lib/libicuuc.so.69.1 $HOME/Dev/Binaries/Qt6x64/bin/
cp --force --verbose $HOME/Dev/Binaries/OpenSSLx64Release/lib/libssl.so.1.1 $HOME/Dev/Binaries/Qt6x64/bin/
cp --force --verbose $HOME/Dev/Binaries/OpenSSLx64Release/lib/libcrypto.so.1.1 $HOME/Dev/Binaries/Qt6x64/bin/
cd $HOME/Dev/Builds/Qt6x64DebugRelease/
ninja --verbose docs
ninja --verbose install_docs
rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/Qt6x64DebugRelease/*.* $HOME/Dev/Builds/Qt6x64DebugRelease/* $HOME/Dev/Builds/Qt6x64DebugRelease/
exit
