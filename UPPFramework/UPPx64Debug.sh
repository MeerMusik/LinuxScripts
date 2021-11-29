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
export CFLAGS='-DPIC -D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fcf-protection=branch -fdata-sections -fexceptions -ffunction-sections -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fPIC -grecord-gcc-switches -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -pthread -Og -g3 -ggdb -pipe -std=c2x -Wall -Walloc-zero -Wcast-align -Wconversion -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnull-dereference -Wpedantic -Wpointer-arith -Wshadow -Wsign-conversion -Wstrict-overflow -Wtrampolines -Wunused -Wvla -Wl,-Og -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,-Bdynamic -Wl,-z,relro -Wl,-z,now'
export CXXFLAGS='-DPIC -D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fcf-protection=branch -fdata-sections -fexceptions -ffunction-sections -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fPIC -grecord-gcc-switches -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -pthread -Og -g3 -ggdb -pipe -std=c++20 -Wall -Walloc-zero -Wcast-align -Wclass-memaccess -Wconversion -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnon-virtual-dtor -Wnull-dereference -Wold-style-cast -Woverloaded-virtual -Wpedantic -Wpointer-arith -Wreorder -Wshadow -Wsign-conversion -Wstrict-overflow -Wtrampolines -Wunused -Wuseless-cast -Wvla -Wl,-Og -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,-Bdynamic -Wl,-z,relro -Wl,-z,now'
if [ ! -d $HOME/Dev/ ]; then mkdir $HOME/Dev/
fi
if [ ! -d $HOME/Dev/Binaries/ ]; then mkdir $HOME/Dev/Binaries/
fi
if [ -d $HOME/Dev/Binaries/UPPx64Debug/ ]; then rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Binaries/UPPx64Debug/*.* $HOME/Dev/Binaries/UPPx64Debug/* $HOME/Dev/Binaries/UPPx64Debug/
fi
if [ ! -d $HOME/Dev/Binaries/UPPx64Debug/ ]; then mkdir $HOME/Dev/Binaries/UPPx64Debug/
fi
cd $HOME/Dev/Binaries/UPPx64Debug/
cp --force --verbose --recursive $HOME/Dev/GitRepos/ultimatepp/* $HOME/Dev/Binaries/UPPx64Debug/
cd $HOME/Dev/Binaries/UPPx64Debug/ultimatepp/
# -- Copied from UPP Install Script - Start --
#fi

#-- remove me later!!!! start --
#if [ -x ./theide ]; then
  #echo Install process has been finished, TheIDE is built as ./theide
  #read -p "Do you want to start TheIDE now? (Y/n):" answer
  #if [ "$answer" == "${answer//[nN]/x}" ]; then
     #./theide
  #fi
#else
  #echo Something went wrong.
  #echo Please use 'make' to compile theide and/or notify developers.
#fi
#-- remove me later!!!! end --
# -- Copied from UPP Install Script - Start --
cd $HOME/Dev/Binaries/UPPx64Debug/ultimatepp/
make -j$(nproc) V=1 -f Makefile CFLAGS="-O3 -ffunction-sections -fdata-sections" CXXFLAGS="-pipe -O3 -ffunction-sections -fdata-sections -std=c++20"
#make -f umkMakefile -j$(nproc) V=1

#echo Script paused for 10 Seconds to be able to read the Test Results! Please wait a moment...
#sleep 10s
#if [ ! -d $HOME/Dev/Binaries/ ]; then mkdir $HOME/Dev/Binaries/
#fi
#make V=1 install
#make clean --jobs=1 V=1

# --- Section to build Release Libraries ---
export CFLAGS='-DPIC -D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables --fcf-protection=branch -fdata-sections -fexceptions -ffunction-sections -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fPIC -grecord-gcc-switches -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -pthread -O3 -g1 -pipe -std=c2x -Wall -Walloc-zero -Wcast-align -Wconversion -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnull-dereference -Wpedantic -Wpointer-arith -Wshadow -Wsign-conversion -Wstrict-overflow -Wtrampolines -Wunused -Wvla -Wl,-O3 -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,-Bdynamic -Wl,-z,relro -Wl,-z,now'
export CXXFLAGS='-DPIC -D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fcf-protection=branch -fdata-sections -fexceptions -ffunction-sections -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fPIC -grecord-gcc-switches -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -pthread -O3 -g1 -pipe -std=c++20 -Wall -Walloc-zero -Wcast-align -Wclass-memaccess -Wconversion -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnon-virtual-dtor -Wnull-dereference -Wold-style-cast -Woverloaded-virtual -Wpedantic -Wpointer-arith -Wreorder -Wshadow -Wsign-conversion -Wstrict-overflow -Wtrampolines -Wunused -Wuseless-cast -Wvla -Wl,-O3 -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,-Bdynamic -Wl,-z,relro -Wl,-z,now'
#./runConfigureICU Linux/gcc --with-library-bits=64 --prefix=$HOME/Dev/Binaries/ICUx64Release/  --enable-rpath
#make -j$(nproc) V=1
#make -j$(nproc) V=1 check
#echo Script paused for 10 Seconds to be able to read the Test Results! Please wait a moment...
#sleep 10s
#make install V=1
#rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Binaries/UPPx64/*.* $HOME/Dev/Binaries/UPPx64/* $HOME/Dev/Binaries/UPPx64/
exit

