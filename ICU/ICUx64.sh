#!/usr/bin/bash
# SPDX-License-Identifier: Unlicense OR CC0-1.0
# Copyright © 2013-2021 Oliver Niebuhr, https://github.com/MeerMusik/LinuxScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
# - CC0 1.0 Universal License Text Start -
# LinuxScripts
# Written in 2013-2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
# - CC0 1.0 Universal License Text End -
# Hint: 1: ICU including Version 70.x does not work correctly with '-ftrapv': The cintltest will fail! 2: C++20 / C2x does not work correctly with ICU 70.x and GCC 11.1. 3: Do not force '-Wl,--pic': ICU builds PIE Binaries and Shared Libraries which are static-pie linked!
# --- Section to build Debug Libraries ---
export CFLAGS='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fcf-protection=branch -fexceptions -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fno-plt -fPIC -fno-semantic-interposition -fstack-protector-all -fstack-clash-protection -fvisibility=hidden -fvisibility-inlines-hidden -frecord-gcc-switches -grecord-gcc-switches -m64 -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -mshstk -pthread -Og -ggdb3 -pie -pipe -std=c17 -Wall -Walloc-zero -Wcast-align -Wconversion -Wdeprecated-declarations -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnull-dereference -Wpedantic -Wpointer-arith -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-aliasing=2 -Wstrict-overflow -Wtrampolines -Wunused -Wvla -Wl,-Og -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,-g -Wl,--hash-style=gnu -Wl,-melf_x86_64 -Wl,-z,combreloc -Wl,-z,defs -Wl,-z,noexecstack -Wl,-z,now -Wl,-z,relro -Wl,-z,separate-code -Wl,-z,text -Wl,-rpath=\$\$\$$ORIGIN/../lib'
export CXXFLAGS='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fcf-protection=branch -fexceptions -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fno-plt -fPIC -fno-semantic-interposition -fstack-protector-all -fstack-clash-protection -fvisibility=hidden -fvisibility-inlines-hidden -frecord-gcc-switches -grecord-gcc-switches -m64 -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -mshstk -pthread -Og -ggdb3 -pie -pipe -std=c++17 -Wall -Walloc-zero -Wcast-align -Wclass-memaccess -Wconversion -Wdeprecated-declarations -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnon-virtual-dtor -Wnull-dereference -Wold-style-cast -Woverloaded-virtual -Wpedantic -Wpointer-arith -Wreorder -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-aliasing=2 -Wstrict-overflow -Wtrampolines -Wunused -Wuseless-cast -Wvla -Wl,-Og -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,-g -Wl,--hash-style=gnu -Wl,-melf_x86_64 -Wl,-z,combreloc -Wl,-z,defs -Wl,-z,noexecstack -Wl,-z,now -Wl,-z,relro -Wl,-z,separate-code -Wl,-z,text -Wl,-rpath=\$\$\$$ORIGIN/../lib'
if [ ! -d $HOME/Dev/ ]; then mkdir $HOME/Dev/
fi
if [ ! -d $HOME/Dev/Builds/ ]; then mkdir $HOME/Dev/Builds/
fi
if [ -d $HOME/Dev/Builds/ICUx64/ ]; then rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/ICUx64/*.* $HOME/Dev/Builds/ICUx64/* $HOME/Dev/Builds/ICUx64/
fi
if [ ! -d $HOME/Dev/Builds/ICUx64/ ]; then mkdir $HOME/Dev/Builds/ICUx64/
fi
cd $HOME/Dev/Builds/ICUx64/
cp --force --verbose --recursive $HOME/Dev/GitRepos/ICU/icu4c/ $HOME/Dev/Builds/ICUx64/
cd $HOME/Dev/Builds/ICUx64/icu4c/source/
./configure --build=x86_64-pc-linux-gnu --host=x86_64-pc-linux-gnu --target=x86_64-pc-linux-gnu --enable-debug --disable-release --enable-shared --with-library-bits=64 --prefix=$HOME/Dev/Binaries/ICUx64Debug/
make --jobs=$(nproc) V=1
make --jobs=$(nproc) V=1 check
echo Script paused for 10 Seconds to be able to read the Build or Test Results! Please wait a Moment...
sleep 10s
if [ ! -d $HOME/Dev/Binaries/ ]; then mkdir $HOME/Dev/Binaries/
fi
make V=1 install
make --jobs=1 V=1 distclean
# --- Section to build Release Libraries ---
export CFLAGS='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fcf-protection=branch -fdata-sections -fexceptions -ffunction-sections -finput-charset=utf-8 -flto -fno-omit-frame-pointer -fno-plt -fPIC -fno-semantic-interposition -fstack-protector-all -fstack-clash-protection -fvisibility=hidden -fvisibility-inlines-hidden -frecord-gcc-switches -grecord-gcc-switches -m64 -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -mshstk -pthread -O3 -g0 -pie -pipe -std=c17 -Wall -Walloc-zero -Wcast-align -Wconversion -Wdeprecated-declarations -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnull-dereference -Wpedantic -Wpointer-arith -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-aliasing=2 -Wstrict-overflow -Wtrampolines -Wunused -Wvla -Wl,-O3 -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-flto -Wl,--hash-style=gnu -Wl,--gc-sections -Wl,-s -Wl,-melf_x86_64 -Wl,-z,combreloc -Wl,-z,defs -Wl,-z,noexecstack -Wl,-z,now -Wl,-z,relro -Wl,-z,separate-code -Wl,-z,text -Wl,-rpath=\$\$\$$ORIGIN/../lib'
export CXXFLAGS='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fcf-protection=branch -fdata-sections -fexceptions -ffunction-sections -finput-charset=utf-8 -flto -fno-omit-frame-pointer -fno-plt -fPIC -fno-semantic-interposition -fstack-protector-all -fstack-clash-protection -fvisibility=hidden -fvisibility-inlines-hidden -frecord-gcc-switches -grecord-gcc-switches -m64 -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -mshstk -pthread -O3 -g0 -pie -pipe -std=c++17 -Wall -Walloc-zero -Wcast-align -Wclass-memaccess -Wconversion -Wdeprecated-declarations -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnon-virtual-dtor -Wnull-dereference -Wold-style-cast -Woverloaded-virtual -Wpedantic -Wpointer-arith -Wreorder -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-aliasing=2 -Wstrict-overflow -Wtrampolines -Wunused -Wuseless-cast -Wvla -Wl,-O3 -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-flto -Wl,--hash-style=gnu -Wl,--gc-sections -Wl,-s -Wl,-melf_x86_64 -Wl,-z,combreloc -Wl,-z,defs -Wl,-z,noexecstack -Wl,-z,now -Wl,-z,relro -Wl,-z,separate-code -Wl,-z,text -Wl,-rpath=\$\$\$$ORIGIN/../lib'
./configure --build=x86_64-pc-linux-gnu --host=x86_64-pc-linux-gnu --target=x86_64-pc-linux-gnu --disable-debug --enable-release --enable-shared --with-library-bits=64 --prefix=$HOME/Dev/Binaries/ICUx64Release/
make --jobs=$(nproc) V=1
make --jobs=$(nproc) V=1 check
echo Script paused for 10 Seconds to be able to read the Build or Test Results! Please wait a Moment...
sleep 10s
make --jobs=1 V=1 install
rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/ICUx64/*.* $HOME/Dev/Builds/ICUx64/* $HOME/Dev/Builds/ICUx64/
exit
