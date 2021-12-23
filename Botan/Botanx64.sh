#!/usr/bin/bash
# SPDX-License-Identifier: Unlicense OR CC0-1.0
# Copyright © 2013-2021 Oliver Niebuhr, https://github.com/MeerMusik/LinuxScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
# - CC0 1.0 Universal License Text Start -
# LinuxScripts
# Written in 2013-2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
# - CC0 1.0 Universal License Text End -
if [ ! -d $HOME/Dev/ ]; then mkdir $HOME/Dev/
fi
if [ ! -d $HOME/Dev/Builds/ ]; then mkdir $HOME/Dev/Builds/
fi
if [ -d $HOME/Dev/Builds/Botanx64/ ]; then rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/Botanx64/*.* $HOME/Dev/Builds/Botanx64/* $HOME/Dev/Builds/Botanx64/
fi
if [ ! -d $HOME/Dev/Builds/Botanx64/ ]; then cp --force --recursive --verbose $HOME/Dev/GitRepos/botan/ $HOME/Dev/Builds/Botanx64/
fi
cd $HOME/Dev/Builds/Botanx64/
# --- Section to build Debug Libraries ---
./configure.py --prefix=$HOME/Dev/Binaries/Botanx64Debug/ --verbose --cxxflags='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fcf-protection=branch -fexceptions -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fno-plt -fPIC -fno-semantic-interposition -fstack-protector-all -fstack-clash-protection -ftrapv -fvisibility=hidden -fvisibility-inlines-hidden -frecord-gcc-switches -grecord-gcc-switches -m64 -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -mshstk -pthread -Og -ggdb3 -pie -pipe -shared -std=c++20 -Wall -Walloc-zero -Wcast-align -Wclass-memaccess -Wconversion -Wdeprecated-declarations -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnon-virtual-dtor -Wnull-dereference -Wold-style-cast -Woverloaded-virtual -Wpedantic -Wpointer-arith -Wreorder -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-aliasing=2 -Wstrict-overflow -Wtrampolines -Wunused -Wuseless-cast -Wvla -Wl,-Og -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,-g -Wl,--hash-style=gnu -Wl,-melf_x86_64 -Wl,-z,combreloc -Wl,-z,defs -Wl,-z,noexecstack -Wl,-z,now -Wl,-z,relro -Wl,-z,separate-code -Wl,-z,text -Wl,-rpath=\$\$\$$ORIGIN/../lib' --ldflags='-Wl,-Og -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,-g -Wl,--hash-style=gnu -Wl,-melf_x86_64 -Wl,-z,combreloc -Wl,-z,defs -Wl,-z,noexecstack -Wl,-z,now -Wl,-z,relro -Wl,-z,separate-code -Wl,-z,text -Wl,-rpath=\$$ORIGIN/../lib' --build-targets=shared,cli,tests --enable-shared-library --disable-static-library --debug-mode --with-pkg-config --cpu=x86_64 --cc=gcc --os=linux
echo Routing Output to /dev/null as the Terminal / Console is very slow to display the Output and refresh the Screen. Which will massively increase the build time. Please wait a Moment...
# To write the Output into a Log File: 1>~/Dev/Botanx64DebugLog.txt 2>&1
make --jobs=$(nproc) V=1 1>/dev/null 2>&1
make check V=1
echo Script paused for 10 Seconds to be able to read the Build or Test Results! Please wait a Moment...
sleep 10s
make --jobs=1 V=1 install
make --jobs=1 V=1 distclean
# --- Section to build Release Libraries ---
./configure.py --prefix=$HOME/Dev/Binaries/Botanx64Release/ --verbose --cxxflags='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fcf-protection=branch -fdata-sections -fexceptions -ffunction-sections -finput-charset=utf-8 -flto -fno-omit-frame-pointer -fno-plt -fPIC -fno-semantic-interposition -fstack-protector-all -fstack-clash-protection -ftrapv -fvisibility=hidden -fvisibility-inlines-hidden -frecord-gcc-switches -grecord-gcc-switches -m64 -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -mshstk -pthread -O3 -g0 -pie -pipe -shared -std=c++20 -Wall -Walloc-zero -Wcast-align -Wclass-memaccess -Wconversion -Wdeprecated-declarations -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnon-virtual-dtor -Wnull-dereference -Wold-style-cast -Woverloaded-virtual -Wpedantic -Wpointer-arith -Wreorder -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-aliasing=2 -Wstrict-overflow -Wtrampolines -Wunused -Wuseless-cast -Wvla -Wl,-O3 -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-flto -Wl,--hash-style=gnu -Wl,--gc-sections -Wl,-s -Wl,-melf_x86_64 -Wl,-z,combreloc -Wl,-z,defs -Wl,-z,noexecstack -Wl,-z,now -Wl,-z,relro -Wl,-z,separate-code -Wl,-z,text -Wl,-rpath=\$\$\$$ORIGIN/../lib' --ldflags='-Wl,-O3 -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-flto -Wl,--hash-style=gnu -Wl,--gc-sections -Wl,-s -Wl,-melf_x86_64 -Wl,-z,combreloc -Wl,-z,defs -Wl,-z,noexecstack -Wl,-z,now -Wl,-z,relro -Wl,-z,separate-code -Wl,-z,text -Wl,-rpath=\$$ORIGIN/../lib' --build-targets=shared,cli,tests --enable-shared-library --disable-static-library --with-pkg-config --cpu=x86_64 --cc=gcc --os=linux
echo Routing Output to /dev/null as the Terminal / Console is very slow to display the Output and refresh the Screen. Which will massively increase the build time. Please wait a Moment...
# To write the Output into a Log File: 1>~/Dev/Botanx64ReleaseLog.txt 2>&1
make --jobs=$(nproc) V=1 1>/dev/null 2>&1
make check V=1
echo Script paused for 10 Seconds to be able to read the Build or Test Results! Please wait a Moment...
sleep 10s
make --jobs=1 V=1 install
rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/Botanx64/*.* $HOME/Dev/Builds/Botanx64/* $HOME/Dev/Builds/Botanx64/
echo DONE!
exit
