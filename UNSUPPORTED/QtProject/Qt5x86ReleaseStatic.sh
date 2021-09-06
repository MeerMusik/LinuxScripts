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
export LD_LIBRARY_PATH='$HOME/Dev/Binaries/OpenSSLx86ReleaseStatic/lib/:$LD_LIBRARY_PATH'
#Placeholder for if you have a self built Version of LLVM. Otherwise let the Maketools find llvm-config on their own.
#export LLVM_INSTALL_DIR='$HOME/Dev/Binaries/LLVMx86Release/'
export MAKEFLAGS+='-j$(nproc)'
export OPENSSL_LIBS='-lpthread -ldl -L$HOME/Dev/Binaries/OpenSSLx86ReleaseStatic/lib/ -lssl -lcrypto'
export QMAKE_CXXFLAGS+='-fPIE -pipe -Wl,-pie'
if [ ! -d $HOME/Dev/ ]; then mkdir $HOME/Dev/
fi
if [ ! -d $HOME/Dev/Builds/ ]; then mkdir $HOME/Dev/Builds/
fi
if [ -d $HOME/Dev/Builds/Qtx86ReleaseStatic/ ]; then rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/Qtx86ReleaseStatic/*.* $HOME/Dev/Builds/Qtx86ReleaseStatic/* $HOME/Dev/Builds/Qtx86ReleaseStatic/
fi
if [ ! -d $HOME/Dev/Builds/Qtx86ReleaseStatic/ ]; then mkdir $HOME/Dev/Builds/Qtx86ReleaseStatic/
fi
cd $HOME/Dev/Builds/Qtx86ReleaseStatic/
$HOME/Dev/GitRepos/Qt5IFW/qt5/configure -optimize-size -opensource -confirm-license -prefix $HOME/Dev/Binaries/Qtx86ReleaseStatic/ -platform linux-g++-32 -release -static -accessibility -qt-zlib -qt-libpng -qt-libjpeg -qt-xcb -qt-pcre -no-glib -no-cups -no-sql-sqlite -no-qml-debug -no-opengl -no-egl -no-sm -no-icu -nomake examples -nomake tests -no-libudev -no-vulkan -openssl-linked -I$HOME/Dev/Binaries/OpenSSLx86ReleaseStatic/include/ -L$HOME/Dev/Binaries/OpenSSLx86ReleaseStatic/lib/ OPENSSL_LIBS='-lpthread -ldl -L$HOME/Dev/Binaries/OpenSSLx86ReleaseStatic/lib/ -lssl -lcrypto'
make -j$(nproc) module-qtbase module-qtdeclarative module-qttools module-qttranslations
if [ ! -d $HOME/Dev/Binaries/ ]; then mkdir $HOME/Dev/Binaries/
fi
make -j1 install
#Already created with the X86_64 Release build. Therefore Disabled by Default
#make -j$(nproc) docs
#make -j1 install_docs
rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/Qtx86ReleaseStatic/*.* $HOME/Dev/Builds/Qtx86ReleaseStatic/* $HOME/Dev/Builds/Qtx86ReleaseStatic/
exit
