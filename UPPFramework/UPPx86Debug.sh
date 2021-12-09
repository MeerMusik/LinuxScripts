#!/usr/bin/bash
# SPDX-License-Identifier: Unlicense OR CC0-1.0
# Copyright © 2013-2021 Oliver Niebuhr, https://github.com/MeerMusik/LinuxScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
# - CC0 1.0 Universal License Text Start -
# LinuxScripts
# Written in 2013-2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
# - CC0 1.0 Universal License Text End -
# --- Section to build Debug Libraries ---
export PKG_CONFIG_PATH="/usr/lib32/pkgconfig/"
export LD_LIBRARY_PATH="/usr/lib32/"
export CPPFLAGS="-L/usr/lib32/"
if [ ! -d $HOME/Dev/ ]; then mkdir $HOME/Dev/
fi
if [ ! -d $HOME/Dev/Builds/ ]; then mkdir $HOME/Dev/Builds/
fi
if [ -d $HOME/Dev/Builds/UPPx86Debug/ ]; then rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/UPPx86Debug/*.* $HOME/Dev/Builds/UPPx86Debug/* $HOME/Dev/Builds/UPPx86Debug/
fi
if [ ! -d $HOME/Dev/Builds/UPPx86Debug/ ]; then mkdir $HOME/Dev/Builds/UPPx86Debug/
fi
cd $HOME/Dev/Builds/UPPx86Debug/
cp --force --verbose --recursive $HOME/Dev/GitRepos/ultimatepp/* $HOME/Dev/Builds/UPPx86Debug/
# -- Build ide
make -j$(nproc) V=1 -f Makefile CC="cc -m32" CXX="c++ -m32" CFLAGS="-DPIE -D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fexceptions -fcf-protection=branch -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fPIE -grecord-gcc-switches -m32 -mindirect-branch=thunk -mindirect-branch-register -pthread -Og -g3 -ggdb -pipe -std=c2x -Wall -Walloc-zero -Wcast-align -Wconversion -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnull-dereference -Wpedantic -Wpointer-arith -Wshadow -Wsign-conversion -Wstrict-overflow -Wtrampolines -Wunused -Wvla -Wl,-melf_i386 -Wl,-Og -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,-Bdynamic -Wl,-z,relro -Wl,-z,now" CXXFLAGS="-DPIE -D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fexceptions -fcf-protection=branch -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fPIE -grecord-gcc-switches -m32 -mindirect-branch=thunk -mindirect-branch-register -pthread -Og -g3 -ggdb -pipe -std=c++20 -Wall -Walloc-zero -Wcast-align -Wclass-memaccess -Wconversion -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnon-virtual-dtor -Wnull-dereference -Wold-style-cast -Woverloaded-virtual -Wpedantic -Wpointer-arith -Wreorder -Wshadow -Wsign-conversion -Wstrict-overflow -Wtrampolines -Wunused -Wuseless-cast -Wvla -Wl,-melf_i386 -Wl,-Og -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,-Bdynamic -Wl,-z,relro -Wl,-z,now" 1>/dev/null 2>&1
# For Logging into a File: 1>~/Dev/UppIDE86DebugBuild.log 2>&1
make clean --jobs=1 V=1
# -- Build umk
make -j$(nproc) V=1 -f umkMakefile CC="cc -m32" CXX="c++ -m32" CFLAGS="-DPIE -D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fexceptions -fcf-protection=branch -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fPIE -grecord-gcc-switches -m32 -mindirect-branch=thunk -mindirect-branch-register -pthread -Og -g3 -ggdb -pipe -std=c2x -Wall -Walloc-zero -Wcast-align -Wconversion -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnull-dereference -Wpedantic -Wpointer-arith -Wshadow -Wsign-conversion -Wstrict-overflow -Wtrampolines -Wunused -Wvla -Wl,-melf_i386 -Wl,-Og -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,-Bdynamic -Wl,-z,relro -Wl,-z,now" CXXFLAGS="-DPIE -D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fexceptions -fcf-protection=branch -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fPIE -grecord-gcc-switches -m32 -mindirect-branch=thunk -mindirect-branch-register -pthread -Og -g3 -ggdb -pipe -std=c++20 -Wall -Walloc-zero -Wcast-align -Wclass-memaccess -Wconversion -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnon-virtual-dtor -Wnull-dereference -Wold-style-cast -Woverloaded-virtual -Wpedantic -Wpointer-arith -Wreorder -Wshadow -Wsign-conversion -Wstrict-overflow -Wtrampolines -Wunused -Wuseless-cast -Wvla -Wl,-melf_i386 -Wl,-Og -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,-Bdynamic -Wl,-z,relro -Wl,-z,now" 1>/dev/null 2>&1
# For Logging into a File: 1>~/Dev/UppUMK86DebugBuild.log 2>&1
make clean --jobs=1 V=1
echo Script paused for 10 Seconds to be able to read the Test Results! Please wait a moment...
sleep 10s
if [ ! -d $HOME/Dev/Binaries/ ]; then mkdir $HOME/Dev/Binaries/
fi
cp --force --verbose --recursive $HOME/Dev/Builds/UPPx86Debug/ $HOME/Dev/Binaries/
rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/UPPx86Debug/*.* $HOME/Dev/Builds/UPPx86Debug/* $HOME/Dev/Builds/UPPx86Debug/
exit
