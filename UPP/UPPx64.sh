#!/usr/bin/bash
# SPDX-License-Identifier: Unlicense OR CC0-1.0
# Copyright © 2013-2021 Oliver Niebuhr, https://github.com/MeerMusik/LinuxScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
# - CC0 1.0 Universal License Text Start -
# LinuxScripts
# Written in 2013-2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
# - CC0 1.0 Universal License Text End -
# --- Section to build Release Libraries ---
if [ ! -d $HOME/Dev/ ]; then mkdir $HOME/Dev/
fi
if [ ! -d $HOME/Dev/Builds/ ]; then mkdir $HOME/Dev/Builds/
fi
if [ -d $HOME/Dev/Builds/UPPx64/ ]; then rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/UPPx64/*.* $HOME/Dev/Builds/UPPx64/* $HOME/Dev/Builds/UPPx64/
fi
if [ ! -d $HOME/Dev/Builds/UPPx64/ ]; then mkdir $HOME/Dev/Builds/UPPx64/
fi
cd $HOME/Dev/Builds/UPPx64/
cp --force --verbose --recursive $HOME/Dev/GitRepos/ultimatepp/* $HOME/Dev/Builds/UPPx64/
# Remove Hard-Coded '-Wl,-s' from all Makefiles to not strip Debug Symbols
sed -e s/-Wl,-s//g -i Makefile umkMakefile
# -- Build ide
make -j$(nproc) V=1 -f Makefile CFLAGS="-DPIE -D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fcf-protection=branch -fdata-sections -fexceptions -ffunction-sections -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fPIE -fstack-protector-all -fstack-clash-protection -ftrapv -grecord-gcc-switches -m64 -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -pthread -O3 -ggdb1 -pie -pipe -std=c2x -Wall -Walloc-zero -Wcast-align -Wclass-memaccess -Wconversion -Wdeprecated-declarations -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnon-virtual-dtor -Wnull-dereference -Wold-style-cast -Woverloaded-virtual -Wpedantic -Wpointer-arith -Wreorder -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-overflow -Wtrampolines -Wunused -Wuseless-cast -Wvla -Wl,-O3 -Wl,--allow-multiple-definition -Wl,--as-needed -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,--gc-sections -Wl,-Bdynamic -Wl,-melf_x86_64 -Wl,--pie -Wl,-z,defs -Wl,-z,relro -Wl,-z,now -Wl,-z,noexecstack" CXXFLAGS="-DPIE -D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fcf-protection=branch -fdata-sections -fexceptions -ffunction-sections -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fPIE -fstack-protector-all -fstack-clash-protection -ftrapv -grecord-gcc-switches -m64 -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -pthread -O3 -ggdb1 -pie -pipe -std=c++20 -Wall -Walloc-zero -Wcast-align -Wclass-memaccess -Wconversion -Wdeprecated-declarations -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnon-virtual-dtor -Wnull-dereference -Wold-style-cast -Woverloaded-virtual -Wpedantic -Wpointer-arith -Wreorder -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-overflow -Wtrampolines -Wunused -Wuseless-cast -Wvla -Wl,-O3 -Wl,--allow-multiple-definition -Wl,--as-needed -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,--gc-sections -Wl,-Bdynamic -Wl,-melf_x86_64 -Wl,--pie -Wl,-z,defs -Wl,-z,relro -Wl,-z,now -Wl,-z,noexecstack" 1>/dev/null 2>&1
# For Logging into a File: 1>~/Dev/UppIDE64Build.log 2>&1
make clean --jobs=1 V=1
# -- Build umk
make -j$(nproc) V=1 -f umkMakefile CFLAGS="-DPIE -D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fcf-protection=branch -fdata-sections -fexceptions -ffunction-sections -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fPIE -fstack-protector-all -fstack-clash-protection -ftrapv -grecord-gcc-switches -m64 -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -pthread -O3 -ggdb1 -pie -pipe -std=c2x -Wall -Walloc-zero -Wcast-align -Wclass-memaccess -Wconversion -Wdeprecated-declarations -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnon-virtual-dtor -Wnull-dereference -Wold-style-cast -Woverloaded-virtual -Wpedantic -Wpointer-arith -Wreorder -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-overflow -Wtrampolines -Wunused -Wuseless-cast -Wvla -Wl,-O3 -Wl,--allow-multiple-definition -Wl,--as-needed -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,--gc-sections -Wl,-Bdynamic -Wl,-melf_x86_64 -Wl,--pie -Wl,-z,defs -Wl,-z,relro -Wl,-z,now -Wl,-z,noexecstack" CXXFLAGS="-DPIE -D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fcf-protection=branch -fdata-sections -fexceptions -ffunction-sections -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fPIE -fstack-protector-all -fstack-clash-protection -ftrapv -grecord-gcc-switches -m64 -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -pthread -O3 -ggdb1 -pie -pipe -std=c++20 -Wall -Walloc-zero -Wcast-align -Wclass-memaccess -Wconversion -Wdeprecated-declarations -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnon-virtual-dtor -Wnull-dereference -Wold-style-cast -Woverloaded-virtual -Wpedantic -Wpointer-arith -Wreorder -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-overflow -Wtrampolines -Wunused -Wuseless-cast -Wvla -Wl,-O3 -Wl,--allow-multiple-definition -Wl,--as-needed -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,--gc-sections -Wl,-Bdynamic -Wl,-melf_x86_64 -Wl,--pie -Wl,-z,defs -Wl,-z,relro -Wl,-z,now -Wl,-z,noexecstack" 1>/dev/null 2>&1
# For Logging into a File: 1>~/Dev/UppUMK64Build.log 2>&1
make clean --jobs=1 V=1
echo Script paused for 10 Seconds to be able to read the Test Results! Please wait a moment...
sleep 10s
if [ ! -d $HOME/Dev/Binaries/ ]; then mkdir $HOME/Dev/Binaries/
fi
cp --force --verbose --recursive $HOME/Dev/Builds/UPPx64/ $HOME/Dev/Binaries/
rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/UPPx64/*.* $HOME/Dev/Builds/UPPx64/* $HOME/Dev/Builds/UPPx64/
exit
