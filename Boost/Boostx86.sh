#!/usr/bin/bash
# SPDX-License-Identifier: Unlicense OR CC0-1.0
# Copyright © 2021 Oliver Niebuhr, https://github.com/MeerMusik/LinuxScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
# - CC0 1.0 Universal License Text Start -
# LinuxScripts
# Written in 2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
# - CC0 1.0 Universal License Text End -
if [ ! -d $HOME/Dev/ ]; then mkdir $HOME/Dev/
fi
if [ ! -d $HOME/Dev/Builds/ ]; then mkdir $HOME/Dev/Builds/
fi
if [ -d $HOME/Dev/Builds/Boostx86/ ]; then rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/Boostx86/*.* $HOME/Dev/Builds/Boostx86/* $HOME/Dev/Builds/Boostx86/
fi
if [ ! -d $HOME/Dev/Builds/Boostx86/ ]; then cp --force --recursive --verbose $HOME/Dev/GitRepos/boost/ $HOME/Dev/Builds/Boostx86/
fi
cd $HOME/Dev/Builds/Boostx86/
./bootstrap.sh --with-toolset=gcc --without-icu --prefix=$HOME/Dev/Binaries/Boostx86Debug/
./b2 -d2 --debug-configuration --jobs$(nproc) -sNO_BZIP2=1 -sNO_ZLIB=1 --without-python --layout=tagged --build-type=complete toolset=gcc architecture=x86 address-model=32 link=shared debug-symbols=on variant=debug threading=multi cxxflags='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fexceptions -fcf-protection=branch -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fPIC -fstack-protector-all -grecord-gcc-switches -mindirect-branch=thunk -mindirect-branch-register -pthread -Og -ggdb -g3 -std=c++20 -pipe -Wall -Walloc-zero -Wcast-align -Wconversion -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnull-dereference -Wpedantic -Wpointer-arith -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-overflow -Wtrampolines -Wunused -Wvla -Wl,-Og -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,--dynamicbase -Wl,--enable-auto-image-base -Wl,-fno-lto' linkflags='-lssp' --prefix=$HOME/Dev/Binaries/Boostx86Debug/ install
rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/Boostx86/bin.v2
rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/Boostx86/b2.exe
./bootstrap.sh --with-toolset=gcc --without-icu --prefix=$HOME/Dev/Binaries/Boostx86Release/
./b2 -d2 --debug-configuration --jobs$(nproc) -sNO_BZIP2=1 -sNO_ZLIB=1 --without-python --layout=tagged --build-type=complete toolset=gcc architecture=x86 address-model=32 link=shared debug-symbols=off variant=release threading=multi cxxflags='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fexceptions -fcf-protection=branch -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fPIC -fstack-protector-all -grecord-gcc-switches -mindirect-branch=thunk -mindirect-branch-register -pthread -Os -g0 -std=c++20 -pipe -Wall -Walloc-zero -Wcast-align -Wconversion -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnull-dereference -Wpedantic -Wpointer-arith -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-overflow -Wtrampolines -Wunused -Wvla -Wl,-Os -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,--dynamicbase -Wl,--enable-auto-image-base -Wl,-fno-lto' linkflags='-lssp' --prefix=$HOME/Dev/Binaries/Boostx86Release/ install
cd ${TMP}
echo Wait 8 Seconds for Windows to release the Directory handle, then delete the Directory:
sleep 8s
rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/Boostx86/*.* $HOME/Dev/Builds/Boostx86/* $HOME/Dev/Builds/Boostx86/
echo DONE!
exit
