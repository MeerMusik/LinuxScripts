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
if [ -d $HOME/Dev/Builds/Boostx86Static/ ]; then rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/Boostx86Static/*.* $HOME/Dev/Builds/Boostx86Static/* $HOME/Dev/Builds/Boostx86Static/
fi
if [ ! -d $HOME/Dev/Builds/Boostx86Static/ ]; then cp --force --recursive --verbose $HOME/Dev/GitRepos/boost/ $HOME/Dev/Builds/Boostx86Static/
fi
cd $HOME/Dev/Builds/Boostx86Static/
./bootstrap.sh --with-toolset=gcc --without-icu --prefix=$HOME/Dev/Binaries/Boostx86StaticDebug/
./b2 -d2 --debug-configuration --jobs$(nproc) -sNO_BZIP2=1 -sNO_ZLIB=1 --without-python --layout=tagged --build-type=complete toolset=gcc architecture=x86 address-model=32 link=static debug-symbols=on variant=debug threading=multi hardcode-dll-paths=true dll-path="'\$ORIGIN/../lib'" cxxflags='D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fcf-protection=branch -fexceptions -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fPIE -fstack-protector-all -fstack-clash-protection -ftrapv -frecord-gcc-switches -grecord-gcc-switches -m32 -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -pthread -Og -ggdb3 -pipe -std=c++20 -static-libgcc -static-libstdc++ -static-pie -Wall -Walloc-zero -Wcast-align -Wclass-memaccess -Wconversion -Wdeprecated-declarations -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnon-virtual-dtor -Wnull-dereference -Wold-style-cast -Woverloaded-virtual -Wpedantic -Wpointer-arith -Wreorder -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-overflow -Wtrampolines -Wunused -Wuseless-cast -Wvla' linkflags='-Wl,-Og -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,-g -Wl,--hash-style=gnu -Wl,-melf_i386 -Wl,--pie -Wl,-z,defs -Wl,-z,relro -Wl,-z,now -Wl,-z,noexecstack' --prefix=$HOME/Dev/Binaries/Boostx86StaticDebug/ install
rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/Boostx86Static/bin.v2
rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/Boostx86Static/b2.exe
./bootstrap.sh --with-toolset=gcc --without-icu --prefix=$HOME/Dev/Binaries/Boostx86StaticRelease/
./b2 -d2 --debug-configuration --jobs$(nproc) -sNO_BZIP2=1 -sNO_ZLIB=1 --without-python --layout=tagged --build-type=complete toolset=gcc architecture=x86 address-model=32 link=static debug-symbols=off variant=release threading=multi hardcode-dll-paths=true dll-path="'\$ORIGIN/../lib'" cxxflags='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fcf-protection=branch -fdata-sections -fexceptions -ffunction-sections -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fPIE -fstack-protector-all -fstack-clash-protection -ftrapv -frecord-gcc-switches -grecord-gcc-switches -m32 -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -pthread -O3 -ggdb1 -pipe -std=c++20 -static-libgcc -static-libstdc++ -static-pie -Wall -Walloc-zero -Wcast-align -Wclass-memaccess -Wconversion -Wdeprecated-declarations -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnon-virtual-dtor -Wnull-dereference -Wold-style-cast -Woverloaded-virtual -Wpedantic -Wpointer-arith -Wreorder -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-overflow -Wtrampolines -Wunused -Wuseless-cast -Wvla' linkflags='-Wl,-O3 -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,-g -Wl,--hash-style=gnu -Wl,--gc-sections -Wl,-melf_i386 -Wl,--pie -Wl,-z,defs -Wl,-z,defs -Wl,-z,relro -Wl,-z,now -Wl,-z,noexecstack' --prefix=$HOME/Dev/Binaries/Boostx86StaticRelease/ install
echo Script paused for 10 Seconds to be able to read the Test Results! Please wait a moment...
sleep 10s
rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/Boostx86Static/*.* $HOME/Dev/Builds/Boostx86Static/* $HOME/Dev/Builds/Boostx86Static/
echo DONE!
exit
