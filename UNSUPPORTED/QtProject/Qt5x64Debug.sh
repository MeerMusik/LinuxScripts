#!/usr/bin/bash
# SPDX-License-Identifier: Unlicense OR CC0-1.0
# Copyright © 2013-2021 Oliver Niebuhr, https://github.com/MeerMusik/LinuxScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
# - CC0 1.0 Universal License Text Start -
# LinuxScripts
# Written in 2013-2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
# - CC0 1.0 Universal License Text End -
export CXXFLAGS='-fPIC -pipe -Wl,-pic'
export LD_LIBRARY_PATH='$HOME/Dev/Binaries/OpenSSLx64Debug/lib/:$LD_LIBRARY_PATH'
#export LD_LIBRARY_PATH='$HOME/Dev/Binaries/ICUx64Debug/lib/:$HOME/Dev/Binaries/OpenSSLx64Debug/lib/:$LD_LIBRARY_PATH'
#Placeholder for if you have a self built Version of LLVM. Otherwise let the Maketools find llvm-config on their own.
#export LLVM_INSTALL_DIR='$HOME/Dev/Binaries/LLVMx64Debug/'
# - Because of a Bug: Linking with non-system ICU fails: https://bugreports.qt.io/browse/QTBUG-52501
# - You can not easily use your own ICU builds. Feel free to waste your energy if you want to and copy the below Line back right after '-icu':
# -I$HOME/Dev/Binaries/ICUx86Debug/include/ -L$HOME/Dev/Binaries/ICUx64Debug/lib/ 
# - Well, put it wherever you want. I just prefer to put everything closely together when possible.
export MAKEFLAGS+='-j$(nproc)'
export OPENSSL_LIBS='-L$HOME/Dev/Binaries/OpenSSLx64Debug/lib/ -lssl -lcrypto'
export QMAKE_CXXFLAGS+='-fPIC -pipe -Wl,-pic'
if [ ! -d $HOME/Dev/ ]; then mkdir $HOME/Dev/
fi
if [ ! -d $HOME/Dev/Builds/ ]; then mkdir $HOME/Dev/Builds/
fi
if [ -d $HOME/Dev/Builds/Qtx64Debug/ ]; then rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/Qtx64Debug/*.* $HOME/Dev/Builds/Qtx64Debug/* $HOME/Dev/Builds/Qtx64Debug/
fi
if [ ! -d $HOME/Dev/Builds/Qtx64Debug/ ]; then mkdir $HOME/Dev/Builds/Qtx64Debug/
fi
cd $HOME/Dev/Builds/Qtx64Debug/
$HOME/Dev/GitRepos/Qt5/qt5/configure -opensource -confirm-license -prefix $HOME/Dev/Binaries/Qtx64Debug/ -platform linux-g++-64 -opengl desktop -debug -nomake tests -nomake examples -no-rpath -no-warnings-are-errors -system-sqlite -dbus-linked -icu -openssl-linked -I$HOME/Dev/Binaries/OpenSSLx64Debug/include/ -L$HOME/Dev/Binaries/OpenSSLx64Debug/lib/ OPENSSL_LIBS='-L$HOME/Dev/Binaries/OpenSSLx64Debug/lib/ -lssl -lcrypto' -system-harfbuzz -silent -skip qtwebengine
make -j$(nproc)
if [ ! -d $HOME/Dev/Binaries/ ]; then mkdir $HOME/Dev/Binaries/
fi
make -j1 install
#Already created with the X86_64 Release build. Therefore Disabled by Default
#make -j$(nproc) docs
#make -j1 install_docs
rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/Qtx64Debug/*.* $HOME/Dev/Builds/Qtx64Debug/* $HOME/Dev/Builds/Qtx64Debug/
exit
