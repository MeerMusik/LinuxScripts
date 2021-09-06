#!/usr/bin/bash
# SPDX-License-Identifier: Unlicense OR CC0-1.0
# Copyright © 2013-2021 Oliver Niebuhr, https://github.com/MeerMusik/LinuxScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
# - CC0 1.0 Universal License Text Start -
# LinuxScripts
# Written in 2013-2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
# - CC0 1.0 Universal License Text End -
export CFLAGS='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fexceptions -fcf-protection=branch -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fPIC -ftrapv -grecord-gcc-switches -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -pthread -O3 -g0 -pipe -std=c2x -Wall -Walloc-zero -Wcast-align -Wconversion -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnull-dereference -Wpedantic -Wpointer-arith -Wshadow -Wsign-conversion -Wstrict-overflow -Wtrampolines -Wunused -Wvla -Wl,-O3 -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,-z,relro -Wl,-z,now'
export CXXFLAGS='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fexceptions -fcf-protection=branch -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fPIC -ftrapv -grecord-gcc-switches -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -pthread -O3 -g0 -pipe -std=c++20 -Wall -Walloc-zero -Wcast-align -Wclass-memaccess -Wconversion -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnon-virtual-dtor -Wnull-dereference -Wold-style-cast -Woverloaded-virtual -Wpedantic -Wpointer-arith -Wreorder -Wshadow -Wsign-conversion -Wstrict-overflow -Wtrampolines -Wunused -Wuseless-cast -Wvla -Wl,-O3 -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,-z,relro -Wl,-z,now'
export PATH="${PATH}:$HOME/Dev/Binaries/CMakex64Release/:$HOME/Dev/Binaries/Ninjax64Release/"
if [ ! -d $HOME/Dev/ ]; then mkdir $HOME/Dev/
fi
if [ ! -d $HOME/Dev/Builds/ ]; then mkdir $HOME/Dev/Builds/
fi
if [ -d $HOME/Dev/Builds/CMakex64Release/ ]; then rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/CMakex64Release/*.* $HOME/Dev/Builds/CMakex64Release/* $HOME/Dev/Builds/CMakex64Release/
fi
if [ ! -d $HOME/Dev/Builds/CMakex64Release/ ]; then mkdir $HOME/Dev/Builds/CMakex64Release/
fi
cd $HOME/Dev/Builds/CMakex64Release/
# Use this command if you do not have ninja and / or cmake installed: ./bootstrap --version --verbose --parallel=$(nproc) -- -DCMAKE_BUILD_TYPE="Release" -DCMAKE_INSTALL_PREFIX=$HOME/Dev/Binaries/CMakex64Release/
# Use this command if you do not have ninja and / or cmake installed: make -j$(nproc)
cmake $HOME/Dev/GitRepos/CMake/ $HOME/Dev/Builds/CMakex64Release/ -G'Ninja' -DCMAKE_BUILD_TYPE='Release' -DCMAKE_INSTALL_PREFIX=$HOME/Dev/Binaries/CMakex64Release/
ninja --verbose
# Use this command if you do not have ninja and / or cmake installed: make install
ninja --verbose install
rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/CMakex64Release/*.* $HOME/Dev/Builds/CMakex64Release/* $HOME/Dev/Builds/CMakex64Release/
exit
