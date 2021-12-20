#!/usr/bin/bash
# SPDX-License-Identifier: Unlicense OR CC0-1.0
# Copyright © 2013-2021 Oliver Niebuhr, https://github.com/MeerMusik/LinuxScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
# - CC0 1.0 Universal License Text Start -
# LinuxScripts
# Written in 2013-2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
# - CC0 1.0 Universal License Text End -
# Hints: 1: Ninja expect the RPATH set exactly as it is below! If you use the Alternative commands, use: -Wl,-rpath=\$\$\$$ORIGIN 2: Do not set a C Standard Version - somehow it never works for me and the build will fail. Maybe this will get fixed in later Versons of GCC and or CMake.
# Hints: 2: The CMake Build File sets -std=c++17 very late in the List of Flags and overwrites the -std=c++20 Value. I am too lazy to write a 'SED' or similar Function to help with that. Feel free to do so yourself.
export CFLAGS='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fcf-protection=branch -fdata-sections -fexceptions -ffunction-sections -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fno-plt -fPIE -fstack-protector-all -fstack-clash-protection -ftrapv -fvisibility=hidden -fvisibility-inlines-hidden -frecord-gcc-switches -grecord-gcc-switches -m64 -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -mshstk -pthread -O3 -ggdb1 -pie -pipe -Wall -Walloc-zero -Wcast-align -Wconversion -Wdeprecated-declarations -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnull-dereference -Wpedantic -Wpointer-arith -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-aliasing=2 -Wstrict-overflow -Wtrampolines -Wunused -Wvla -Wl,-O3 -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,-g -Wl,--hash-style=gnu -Wl,--gc-sections -Wl,-melf_x86_64 -Wl,--pie -Wl,-z,combreloc -Wl,-z,defs -Wl,-z,noexecstack -Wl,-z,now -Wl,-z,relro -Wl,-z,separate-code -Wl,-z,text -Wl,-rpath=\$$ORIGIN'
export CXXFLAGS='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fcf-protection=branch -fdata-sections -fexceptions -ffunction-sections -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fno-plt -fPIE -fstack-protector-all -fstack-clash-protection -ftrapv -fvisibility=hidden -fvisibility-inlines-hidden -frecord-gcc-switches -grecord-gcc-switches -m64 -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -mshstk -pthread -O3 -ggdb1 -pie -pipe -std=c++20 -Wall -Walloc-zero -Wcast-align -Wclass-memaccess -Wconversion -Wdeprecated-declarations -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnon-virtual-dtor -Wnull-dereference -Wold-style-cast -Woverloaded-virtual -Wpedantic -Wpointer-arith -Wreorder -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-aliasing=2 -Wstrict-overflow -Wtrampolines -Wunused -Wuseless-cast -Wvla -Wl,-O3 -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,-g -Wl,--hash-style=gnu -Wl,--gc-sections -Wl,-melf_x86_64 -Wl,--pie -Wl,-z,combreloc -Wl,-z,defs -Wl,-z,noexecstack -Wl,-z,now -Wl,-z,relro -Wl,-z,separate-code -Wl,-z,text -Wl,-rpath=\$$ORIGIN'
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
# Use this command if you do not have ninja and / or cmake installed: make --jobs=$(nproc) V=1
cmake $HOME/Dev/GitRepos/CMake/ $HOME/Dev/Builds/CMakex64Release/ -G'Ninja' -DCMAKE_BUILD_TYPE='Release' -DCMAKE_INSTALL_PREFIX=$HOME/Dev/Binaries/CMakex64Release/
ninja --verbose -j$(nproc) -l$(nproc) -k1
echo Script paused for 5 Seconds to be able to read the Build or Test Results! Please wait a Moment...
sleep 5s
# Use this command if you do not have ninja and / or cmake installed: make --jobs=1 V=1 install
#ninja --verbose -j$(nproc) -l$(nproc) -k1 install
#rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/CMakex64Release/*.* $HOME/Dev/Builds/CMakex64Release/* $HOME/Dev/Builds/CMakex64Release/
exit
