#!/usr/bin/bash
# SPDX-License-Identifier: Unlicense OR CC0-1.0
# Copyright © 2013-2021 Oliver Niebuhr, https://github.com/MeerMusik/LinuxScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
# - CC0 1.0 Universal License Text Start -
# LinuxScripts
# Written in 2013-2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
# - CC0 1.0 Universal License Text End -
# Hint: CXXFLAGS+= IS NOT A BUG! I add my Flags to the existing List.
export CXXFLAGS+='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fcf-protection=branch -fdata-sections -fno-exceptions -ffunction-sections -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fPIE -fstack-protector-all -fstack-clash-protection -ftrapv -frecord-gcc-switches -grecord-gcc-switches -m64 -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -pthread -O3 -ggdb1 -pie -pipe -std=c++20 -pie -Wall -Walloc-zero -Wcast-align -Wclass-memaccess -Wconversion -Wdeprecated-declarations -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnon-virtual-dtor -Wnull-dereference -Wold-style-cast -Woverloaded-virtual -Wpedantic -Wpointer-arith -Wreorder -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-overflow -Wtrampolines -Wunused -Wuseless-cast -Wvla -Wl,-O3 -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,-g -Wl,--hash-style=gnu -Wl,--gc-sections -Wl,-melf_x86_64 -Wl,--pie -Wl,-z,defs -Wl,-z,relro -Wl,-z,now -Wl,-z,noexecstack -Wl,-rpath=$$ORIGIN'
export PATH="${PATH}:$HOME/Dev/Binaries/CMakex64Release/:$HOME/Dev/Binaries/Ninjax64Release/"
if [ ! -d $HOME/Dev/ ]; then mkdir $HOME/Dev/
fi
if [ ! -d $HOME/Dev/Builds/ ]; then mkdir $HOME/Dev/Builds/
fi
if [ -d $HOME/Dev/Builds/Ninjax64Release/ ]; then rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/Ninjax64Release/*.* $HOME/Dev/Builds/Ninjax64Release/* $HOME/Dev/Builds/Ninjax64Release/
fi
if [ ! -d $HOME/Dev/Builds/Ninjax64Release/ ]; then mkdir $HOME/Dev/Builds/Ninjax64Release/
fi
cp --force --verbose --recursive $HOME/Dev/GitRepos/ninja/ $HOME/Dev/Builds/Ninjax64Release/
cd $HOME/Dev/Builds/Ninjax64Release/ninja/
./configure.py --host=linux --platform=linux --verbose --bootstrap
./ninja ninja_test
./ninja_test
echo Script paused for 10 Seconds to be able to read the Build or Test Results! Please wait a Moment...
sleep 10s
if [ ! -d $HOME/Dev/Binaries/Ninjax64Release/ ]; then mkdir $HOME/Dev/Binaries/Ninjax64Release/
fi
cp --force --verbose $HOME/Dev/Builds/Ninjax64Release/ninja/ninja $HOME/Dev/Binaries/Ninjax64Release/
rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/Ninjax64Release/*.* $HOME/Dev/Builds/Ninjax64Release/* $HOME/Dev/Builds/Ninjax64Release/
exit
