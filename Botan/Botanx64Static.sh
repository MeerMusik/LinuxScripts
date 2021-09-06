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
if [ -d $HOME/Dev/Builds/Botanx64Static/ ]; then rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/Botanx64Static/*.* $HOME/Dev/Builds/Botanx64Static/* $HOME/Dev/Builds/Botanx64Static/
fi
if [ ! -d $HOME/Dev/Builds/Botanx64Static/ ]; then cp --force --recursive --verbose $HOME/Dev/GitRepos/botan/ $HOME/Dev/Builds/Botanx64Static/
fi
cd $HOME/Dev/Builds/Botanx64Static/
# --- Section to build Debug Libraries ---
python configure.py --prefix=$HOME/Dev/Binaries/Botanx64Debug/ --verbose --cxxflags='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fexceptions -fcf-protection=branch -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fPIE -pie -grecord-gcc-switches -ftrapv -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -Og -g3 -ggdb -static-libgcc -static-libstdc++ -static-pie -pipe -pthread -std=c++17 -Wall -Walloc-zero -Wcast-align -Wclass-memaccess -Wconversion -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnon-virtual-dtor -Wnull-dereference -Wold-style-cast -Woverloaded-virtual -Wpedantic -Wpointer-arith -Wreorder -Wshadow -Wsign-conversion -Wstrict-overflow -Wtrampolines -Wunused -Wuseless-cast -Wvla -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,-Og -Wl,--pic-executable -Wl,-Bstatic -Wl,-static -Wl,-z,relro -Wl,-z,now' --ldflags='-static -Wl,-rpath=\$$ORIGIN/' --disable-shared-library --link-method=hardlink --amalgamation --with-pkg-config --debug-mode --cc=gcc --cpu=x86_64 --os=linux
make --jobs=$(nproc) V=1
make check V=1
echo Script paused for 10 Seconds to be able to read the Test Results! Please wait a moment...
sleep 10s
make install V=1
make --jobs=1 V=1 distclean
# --- Section to build Release Libraries ---
python configure.py --prefix=$HOME/Dev/Binaries/Botanx64Release/ --verbose --cxxflags='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fexceptions -fcf-protection=branch -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fPIE -pie -grecord-gcc-switches -ftrapv -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -Og -g1 -static-libgcc -static-libstdc++ -static-pie -pipe -pthread -std=c++17 -Wall -Walloc-zero -Wcast-align -Wclass-memaccess -Wconversion -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnon-virtual-dtor -Wnull-dereference -Wold-style-cast -Woverloaded-virtual -Wpedantic -Wpointer-arith -Wreorder -Wshadow -Wsign-conversion -Wstrict-overflow -Wtrampolines -Wunused -Wuseless-cast -Wvla -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,-Og -Wl,--pic-executable -Wl,-Bstatic -Wl,-static -Wl,-z,relro -Wl,-z,now' --ldflags='-static -Wl,-rpath=\$$ORIGIN/' --disable-shared-library --link-method=hardlink --amalgamation --with-pkg-config --cc=gcc --cpu=x86_64 --os=linux
make --jobs=$(nproc) V=1
make check V=1
echo Script paused for 10 Seconds to be able to read the Test Results! Please wait a moment...
sleep 10s
make install V=1
rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/Botanx64Static/*.* $HOME/Dev/Builds/Botanx64Static/* $HOME/Dev/Builds/Botanx64Static/
echo DONE!
echo DISABLED: sleep 10s
exit
