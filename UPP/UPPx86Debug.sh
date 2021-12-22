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
export CPPFLAGS="-L/usr/lib32/"
export LD_LIBRARY_PATH="/usr/lib32/"
export PKG_CONFIG_PATH="/usr/lib32/pkgconfig/"
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
# Remove Hard-Coded '-Wl,-s' from all Makefiles to not strip Debug Symbols
sed -e s/-Wl,-s//g -i Makefile umkMakefile
# -- Build ide
echo Routing Output to /dev/null as the Terminal / Console is very slow to display the Output and refresh the Screen. Which will massively increase the build time. Please wait a Moment...
# To write the Output into a Log File: 1>~/Dev/UppIDE86DebugBuildLog.txt 2>&1
make --jobs=$(nproc) V=1 -f Makefile CC='cc -m32' CXX='c++ -m32' CFLAGS='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fcf-protection=branch -fexceptions -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fno-plt -fPIE -fstack-protector-all -fstack-clash-protection -ftrapv -fvisibility=hidden -frecord-gcc-switches -grecord-gcc-switches -m32 -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -mshstk -pthread -Og -ggdb3 -pie -pipe -std=c2x -Wall -Walloc-zero -Wcast-align -Wconversion -Wdeprecated-declarations -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnull-dereference -Wpedantic -Wpointer-arith -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-aliasing=2 -Wstrict-overflow -Wtrampolines -Wunused -Wvla -Wl,-Og -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,-g -Wl,--hash-style=gnu -Wl,-melf_i386 -Wl,-z,combreloc -Wl,-z,defs -Wl,-z,noexecstack -Wl,-z,now -Wl,-z,relro -Wl,-z,separate-code -Wl,-z,text -Wl,-rpath=\$\$\$$ORIGIN' CXXFLAGS='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fcf-protection=branch -fexceptions -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fno-plt -fPIE -fstack-protector-all -fstack-clash-protection -ftrapv -fvisibility=hidden -fvisibility-inlines-hidden -frecord-gcc-switches -grecord-gcc-switches -m32 -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -mshstk -pthread -Og -ggdb3 -pie -pipe -std=c++20 -Wall -Walloc-zero -Wcast-align -Wclass-memaccess -Wconversion -Wdeprecated-declarations -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnon-virtual-dtor -Wnull-dereference -Wold-style-cast -Woverloaded-virtual -Wpedantic -Wpointer-arith -Wreorder -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-aliasing=2 -Wstrict-overflow -Wtrampolines -Wunused -Wuseless-cast -Wvla -Wl,-Og -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,-g -Wl,--hash-style=gnu -Wl,-melf_i386 -Wl,-z,combreloc -Wl,-z,defs -Wl,-z,noexecstack -Wl,-z,now -Wl,-z,relro -Wl,-z,separate-code -Wl,-z,text -Wl,-rpath=\$\$\$$ORIGIN' 1>/dev/null 2>&1
# DISABLED: One Call is enough. But if the UPP Devs ever change the Implementation, enable this again: make --jobs=1 V=1 clean
# -- Build umk
echo Routing Output to /dev/null as the Terminal / Console is very slow to display the Output and refresh the Screen. Which will massively increase the build time. Please wait a Moment...
# To write the Output into a Log File: 1>~/Dev/UppUMK86DebugBuildLog.txt 2>&1
make --jobs=$(nproc) V=1 -f umkMakefile CC='cc -m32' CXX='c++ -m32' CFLAGS='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fcf-protection=branch -fexceptions -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fno-plt -fPIE -fstack-protector-all -fstack-clash-protection -ftrapv -fvisibility=hidden -frecord-gcc-switches -grecord-gcc-switches -m32 -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -mshstk -pthread -Og -ggdb3 -pie -pipe -std=c2x -Wall -Walloc-zero -Wcast-align -Wconversion -Wdeprecated-declarations -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnull-dereference -Wpedantic -Wpointer-arith -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-aliasing=2 -Wstrict-overflow -Wtrampolines -Wunused -Wvla -Wl,-Og -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,-g -Wl,--hash-style=gnu -Wl,-melf_i386 -Wl,-z,combreloc -Wl,-z,defs -Wl,-z,noexecstack -Wl,-z,now -Wl,-z,relro -Wl,-z,separate-code -Wl,-z,text -Wl,-rpath=\$\$\$$ORIGIN' CXXFLAGS='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fcf-protection=branch -fexceptions -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fno-plt -fPIE -fstack-protector-all -fstack-clash-protection -ftrapv -fvisibility=hidden -fvisibility-inlines-hidden -frecord-gcc-switches -grecord-gcc-switches -m32 -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -mshstk -pthread -Og -ggdb3 -pie -pipe -std=c++20 -Wall -Walloc-zero -Wcast-align -Wclass-memaccess -Wconversion -Wdeprecated-declarations -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnon-virtual-dtor -Wnull-dereference -Wold-style-cast -Woverloaded-virtual -Wpedantic -Wpointer-arith -Wreorder -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-aliasing=2 -Wstrict-overflow -Wtrampolines -Wunused -Wuseless-cast -Wvla -Wl,-Og -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,-g -Wl,--hash-style=gnu -Wl,-melf_i386 -Wl,-z,combreloc -Wl,-z,defs -Wl,-z,noexecstack -Wl,-z,now -Wl,-z,relro -Wl,-z,separate-code -Wl,-z,text -Wl,-rpath=\$\$\$$ORIGIN' 1>/dev/null 2>&1
make --jobs=1 V=1 clean
echo Script paused for 10 Seconds to be able to read the Build or Test Results! Please wait a Moment...
sleep 10s
if [ ! -d $HOME/Dev/Binaries/ ]; then mkdir $HOME/Dev/Binaries/
fi
cp --force --verbose --recursive $HOME/Dev/Builds/UPPx86Debug/ $HOME/Dev/Binaries/
rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/UPPx86Debug/*.* $HOME/Dev/Builds/UPPx86Debug/* $HOME/Dev/Builds/UPPx86Debug/
exit
