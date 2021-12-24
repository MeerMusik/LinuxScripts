#!/usr/bin/bash
# SPDX-License-Identifier: Unlicense OR CC0-1.0
# Copyright © 2013-2021 Oliver Niebuhr, https://github.com/MeerMusik/WindowsScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
# - CC0 1.0 Universal License Text Start -
# WindowsScripts
# Written in 2013-2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
# - CC0 1.0 Universal License Text End -
#If there is an additional Compiler than GCC/G++ in the Path, tell CMake that we definitely want to use GCC and that it should ignore everything else
export CC=gcc
export CXX=g++
# --- Section to build Debug Libraries ---
export CFLAGS='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fexceptions -fcf-protection=branch -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fPIE -pie -fstack-protector-all -ftrapv -grecord-gcc-switches -mindirect-branch=thunk -mindirect-branch-register -pthread -Os -g1 -static-libgcc -static-libstdc++ -static-pie -pipe -std=c17 -Wall -Walloc-zero -Wcast-align -Wconversion -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnull-dereference -Wpedantic -Wpointer-arith -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-overflow -Wtrampolines -Wunused -Wvla -Wl,--pic-executable -Wl,-Os -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,--dynamicbase -Wl,--enable-auto-image-base -Wl,-fno-lto -Wl,--nxcompat -Wl,--large-address-aware -Wl,-Bstatic -Wl,-static'
export CXXFLAGS='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fexceptions -fcf-protection=branch -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fPIE -pie -fstack-protector-all -ftrapv -grecord-gcc-switches -mindirect-branch=thunk -mindirect-branch-register -pthread -Os -g1 -static-libgcc -static-libstdc++ -static-pie -pipe -std=c++17 -Wall -Walloc-zero -Wcast-align -Wclass-memaccess -Wconversion -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnon-virtual-dtor -Wnull-dereference -Wold-style-cast -Woverloaded-virtual -Wpedantic -Wpointer-arith -Wreorder -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-overflow -Wtrampolines -Wunused -Wuseless-cast -Wvla -Wl,--pic-executable -Wl,-Os -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,--dynamicbase -Wl,--enable-auto-image-base -Wl,-fno-lto -Wl,--nxcompat -Wl,--large-address-aware -Wl,-Bstatic -Wl,-static'
if [ ! -d ${SYSTEMDRIVE}/Dev/ ]; then mkdir ${SYSTEMDRIVE}/Dev/
fi
if [ ! -d ${SYSTEMDRIVE}/Dev/Builds/ ]; then mkdir ${SYSTEMDRIVE}/Dev/Builds/
fi
if [ -d ${SYSTEMDRIVE}/Dev/Builds/ICUx86Static/ ]; then rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/Builds/ICUx86Static/*.* ${SYSTEMDRIVE}/Dev/Builds/ICUx86Static/* ${SYSTEMDRIVE}/Dev/Builds/ICUx86Static/
fi
if [ ! -d ${SYSTEMDRIVE}/Dev/Builds/ICUx86Static/ ]; then cp --force --recursive --verbose ${SYSTEMDRIVE}/Dev/GitRepos/icu/icu4c/ ${SYSTEMDRIVE}/Dev/Builds/ICUx86Static/
fi
cd ${SYSTEMDRIVE}/Dev/Builds/ICUx86Static/source/
perl runConfigureICU  --prefix=${SYSTEMDRIVE}/Dev/Binaries/ICUx86Static/ --build=x86_64-w64-mingw32 --host=x86_64-w64-mingw32 --enable-icu-config --enable-release --disable-shared --enable-extras --enable-icuio --enable-layoutex --enable-tools --enable-tests --disable-samples --with-library-bits=32 --with-data-packaging=static
make --jobs=$(nproc) V=1
make --jobs=$(nproc) V=1 check
echo Script paused for 10 Seconds to be able to read the Test Results! Please wait a Moment...
sleep 10s
make install
cd ${TMP}
echo Wait 8 Seconds for Windows to release the Directory handle, then delete the Directory:
sleep 8s
rm --interactive=never --dir --recursive --force --verbose ${SYSTEMDRIVE}/Dev/Builds/ICUx86Static/*.* ${SYSTEMDRIVE}/Dev/Builds/ICUx86Static/* ${SYSTEMDRIVE}/Dev/Builds/ICUx86Static/
echo DONE!
exit
