#!/usr/bin/bash
# SPDX-License-Identifier: Unlicense OR CC0-1.0
# Copyright © 2013-2024 Oliver Niebuhr, https://github.com/MeerMusik/LinuxScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
# - CC0 1.0 Universal License Text Start -
# LinuxScripts
# Written in 2013-2024 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
# - CC0 1.0 Universal License Text End -
# WARNING: 1: ICU including Version 70.x does not work correctly with '-ftrapv': The cintltest will fail! 2: C++20 / C2x does not work correctly with ICU 70.x and GCC 11.1. 3: Do not force '-Wl,--pic': ICU builds PIE Binaries and Shared Libraries which are static-pie linked!
# Exporting CC and CXX Flags: I have Clang/LLVM and MinGW-w64 installed in parallel. Problem: The runConfigureICU Script wants to use both Compiler at the same time. I have to explicitly tell it which Compiler to use. Modify as you need or ignore it if MinGW-w64 is the only Compiler you have installed on your System.

# 1: We need to compile ICU natively on Linux - Debug
# --- Section to build native Debug Libraries for Linux - Start ---
if [ ! -d $HOME/Dev/ ]; then mkdir $HOME/Dev/
fi
if [ ! -d $HOME/Dev/Builds/ ]; then mkdir $HOME/Dev/Builds/
fi
if [ ! -d $HOME/Dev/Builds/LinWin/ ]; then mkdir $HOME/Dev/Builds/LinWin/
fi
if [ -d $HOME/Dev/Builds/LinWin/ICUx64DebugNative/ ]; then rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/LinWin/ICUx64DebugNative/*.* $HOME/Dev/Builds/LinWin/ICUx64DebugNative/* $HOME/Dev/Builds/LinWin/ICUx64DebugNative/
fi
if [ ! -d $HOME/Dev/Builds/LinWin/ICUx64DebugNative/ ]; then cp --force --recursive --verbose $HOME/Dev/GitRepos/icu/icu4c/ $HOME/Dev/Builds/LinWin/ICUx64DebugNative/
fi
export CFLAGS='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fcf-protection=branch -fexceptions -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fno-plt -fPIC -fno-semantic-interposition -fstack-protector-all -fstack-clash-protection -fvisibility=hidden -frecord-gcc-switches -grecord-gcc-switches -m64 -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -mshstk -pthread -Og -ggdb3 -pie -pipe -std=c17 -Wall -Walloc-zero -Wcast-align -Wconversion -Wdeprecated-declarations -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnull-dereference -Wpedantic -Wpointer-arith -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-aliasing=2 -Wstrict-overflow -Wtrampolines -Wunused -Wvla -Wl,-Og -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,-g -Wl,--hash-style=gnu -Wl,-melf_x86_64 -Wl,-z,combreloc -Wl,-z,defs -Wl,-z,noexecstack -Wl,-z,now -Wl,-z,relro -Wl,-z,separate-code -Wl,-z,text -Wl,-rpath=\$\$\$$ORIGIN/../lib'
export CXXFLAGS='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fcf-protection=branch -fexceptions -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fno-plt -fPIC -fno-semantic-interposition -fstack-protector-all -fstack-clash-protection -fvisibility=hidden -fvisibility-inlines-hidden -frecord-gcc-switches -grecord-gcc-switches -m64 -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -mshstk -pthread -Og -ggdb3 -pie -pipe -std=c++17 -Wall -Walloc-zero -Wcast-align -Wclass-memaccess -Wconversion -Wdeprecated-declarations -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnon-virtual-dtor -Wnull-dereference -Wold-style-cast -Woverloaded-virtual -Wpedantic -Wpointer-arith -Wreorder -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-aliasing=2 -Wstrict-overflow -Wtrampolines -Wunused -Wuseless-cast -Wvla -Wl,-Og -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,-g -Wl,--hash-style=gnu -Wl,-melf_x86_64 -Wl,-z,combreloc -Wl,-z,defs -Wl,-z,noexecstack -Wl,-z,now -Wl,-z,relro -Wl,-z,separate-code -Wl,-z,text -Wl,-rpath=\$\$\$$ORIGIN/../lib'
cd $HOME/Dev/Builds/LinWin/ICUx64DebugNative/source/
echo SLEEP WIP TEST!
#sleep 10s
./runConfigureICU Linux/gcc --build=x86_64-pc-linux-gnu --host=x86_64-pc-linux-gnu --target=x86_64-pc-linux-gnu --enable-debug --disable-release --enable-shared --with-library-bits=64 --prefix=$HOME/Dev/Binaries/LinWin/ICUx64DebugNative/
echo Routing Output to /dev/null as the Terminal / Console is very slow to display the Output and refresh the Screen. Which will massively increase the build time. Please wait a Moment...
# To write the Output into a Log File: 1>~/Dev/ICUx64DebugNativeLog.txt 2>&1
make --jobs=$(nproc) V=1 1>/dev/null 2>&1
#make --jobs=$(nproc) V=1 check
#echo Script paused for 10 Seconds to be able to read the Build or Test Results! Please wait a Moment...
#sleep 10s
# --- Section to build native Debug Libraries for Linux - End ---

# 2: We need to compile ICU natively on Linux - Release
# --- Section to build native Release Libraries for Linux - Start ---
if [ ! -d $HOME/Dev/ ]; then mkdir $HOME/Dev/
fi
if [ ! -d $HOME/Dev/Builds/ ]; then mkdir $HOME/Dev/Builds/
fi
if [ ! -d $HOME/Dev/Builds/LinWin/ ]; then mkdir $HOME/Dev/Builds/LinWin/
fi
if [ -d $HOME/Dev/Builds/LinWin/ICUx64ReleaseNative/ ]; then rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/LinWin/ICUx64ReleaseNative/*.* $HOME/Dev/Builds/LinWin/ICUx64ReleaseNative/* $HOME/Dev/Builds/LinWin/ICUx64ReleaseNative/
fi
if [ ! -d $HOME/Dev/Builds/LinWin/ICUx64ReleaseNative/ ]; then cp --force --recursive --verbose $HOME/Dev/GitRepos/icu/icu4c/ $HOME/Dev/Builds/LinWin/ICUx64ReleaseNative/
fi
cd $HOME/Dev/Builds/LinWin/ICUx64ReleaseNative/source/
export CFLAGS='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fcf-protection=branch -fdata-sections -fexceptions -ffunction-sections -finput-charset=utf-8 -flto -fno-omit-frame-pointer -fno-plt -fPIC -fno-semantic-interposition -fstack-protector-all -fstack-clash-protection -fvisibility=hidden -frecord-gcc-switches -grecord-gcc-switches -m64 -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -mshstk -pthread -O3 -g0 -pie -pipe -std=c17 -Wall -Walloc-zero -Wcast-align -Wconversion -Wdeprecated-declarations -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnull-dereference -Wpedantic -Wpointer-arith -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-aliasing=2 -Wstrict-overflow -Wtrampolines -Wunused -Wvla -Wl,-O3 -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-flto -Wl,--hash-style=gnu -Wl,--gc-sections -Wl,-s -Wl,-melf_x86_64 -Wl,-z,combreloc -Wl,-z,defs -Wl,-z,noexecstack -Wl,-z,now -Wl,-z,relro -Wl,-z,separate-code -Wl,-z,text -Wl,-rpath=\$\$\$$ORIGIN/../lib'
export CXXFLAGS='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fcf-protection=branch -fdata-sections -fexceptions -ffunction-sections -finput-charset=utf-8 -flto -fno-omit-frame-pointer -fno-plt -fPIC -fno-semantic-interposition -fstack-protector-all -fstack-clash-protection -fvisibility=hidden -fvisibility-inlines-hidden -frecord-gcc-switches -grecord-gcc-switches -m64 -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -mshstk -pthread -O3 -g0 -pie -pipe -std=c++17 -Wall -Walloc-zero -Wcast-align -Wclass-memaccess -Wconversion -Wdeprecated-declarations -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnon-virtual-dtor -Wnull-dereference -Wold-style-cast -Woverloaded-virtual -Wpedantic -Wpointer-arith -Wreorder -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-aliasing=2 -Wstrict-overflow -Wtrampolines -Wunused -Wuseless-cast -Wvla -Wl,-O3 -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-flto -Wl,--hash-style=gnu -Wl,--gc-sections -Wl,-s -Wl,-melf_x86_64 -Wl,-z,combreloc -Wl,-z,defs -Wl,-z,noexecstack -Wl,-z,now -Wl,-z,relro -Wl,-z,separate-code -Wl,-z,text -Wl,-rpath=\$\$\$$ORIGIN/../lib'
./runConfigureICU Linux/gcc --build=x86_64-pc-linux-gnu --host=x86_64-pc-linux-gnu --target=x86_64-pc-linux-gnu --disable-debug --enable-release --enable-shared --with-library-bits=64 --prefix=$HOME/Dev/Binaries/LinWin/ICUx64ReleaseNative/
echo Routing Output to /dev/null as the Terminal / Console is very slow to display the Output and refresh the Screen. Which will massively increase the build time. Please wait a Moment...
# To write the Output into a Log File: 1>~/Dev/ICUx64ReleaseNativeLog.txt 2>&1
make --jobs=$(nproc) V=1 1>/dev/null 2>&1
#make --jobs=$(nproc) V=1 check
echo Script paused for 10 Seconds to be able to read the Build or Test Results! Please wait a Moment...
sleep 10s
# --- Section to build native Release Libraries for Linux - End ---

# 3: Cross Compile from Linux to Windows - Debug
# --- Section to build native Debug Libraries for Windows - Start ---
if [ ! -d $HOME/Dev/ ]; then mkdir $HOME/Dev/
fi
if [ ! -d $HOME/Dev/Builds/ ]; then mkdir $HOME/Dev/Builds/
fi
if [ ! -d $HOME/Dev/Builds/LinWin/ ]; then mkdir $HOME/Dev/Builds/LinWin/
fi
if [ -d $HOME/Dev/Builds/LinWin/ICUx64DebugWin/ ]; then rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/LinWin/ICUx64DebugWin/*.* $HOME/Dev/Builds/LinWin/ICUx64DebugWin/* $HOME/Dev/Builds/LinWin/ICUx64DebugWin/
fi
if [ ! -d $HOME/Dev/Builds/LinWin/ICUx64DebugWin/ ]; then mkdir $HOME/Dev/Builds/LinWin/ICUx64DebugWin/
fi
# --- FIXME REMOVE LATER IF NOT NECESSARY - START ---
#CPPFLAGS="-I/usr/x86_64-w64-mingw32/include"
#LDFLAGS="-L/usr/x86_64-w64-mingw32/lib/"
#PKG_CONFIG_LIBDIR=/usr/lib/pkgconfig/
# --- FIXME REMOVE LATER IF NOT NECESSARY - END ---
export CFLAGS='-DPIC -D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fexceptions -fcf-protection=branch -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fPIC -fstack-protector-all -grecord-gcc-switches -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -pthread -Og -g3 -ggdb -pie -pipe -std=c17 -Wall -Walloc-zero -Wcast-align -Wconversion -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnull-dereference -Wpedantic -Wpointer-arith -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-overflow -Wtrampolines -Wunused -Wvla -Wl,-Og -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,-mi386pep -Wl,--discard-locals -Wl,--dynamicbase -Wl,--enable-auto-image-base -Wl,-fno-lto -Wl,--high-entropy-va -Wl,--nxcompat -Wl,-Bdynamic -Wl,-rpath=\$\$\$$ORIGIN/../lib'
export CXXFLAGS='-DPIC -D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fexceptions -fcf-protection=branch -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fPIC -fstack-protector-all -grecord-gcc-switches -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -pthread -Og -g3 -ggdb -pie -pipe -std=c++17 -Wall -Walloc-zero -Wcast-align -Wclass-memaccess -Wconversion -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnon-virtual-dtor -Wnull-dereference -Wold-style-cast -Woverloaded-virtual -Wpedantic -Wpointer-arith -Wreorder -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-overflow -Wtrampolines -Wunused -Wuseless-cast -Wvla -Wl,-Og -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,-mi386pep -Wl,--discard-locals -Wl,--dynamicbase -Wl,--enable-auto-image-base -Wl,-fno-lto -Wl,--high-entropy-va -Wl,--nxcompat -Wl,-Bdynamic -Wl,-rpath=\$\$\$$ORIGIN/../lib'
cd $HOME/Dev/Builds/LinWin/ICUx64DebugWin/
$HOME/Dev/GitRepos/icu/icu4c/source/configure --host=x86_64-w64-mingw32 --with-cross-build=$HOME/Dev/Builds/LinWin/ICUx64DebugNative/source/ --enable-icu-config --disable-release --enable-debug --enable-shared --enable-static --enable-extras --enable-icuio --enable-layoutex --enable-tools --enable-tests --disable-samples --prefix=$HOME/Dev/Binaries/LinWin/ICUx64DebugWin/
echo Routing Output to /dev/null as the Terminal / Console is very slow to display the Output and refresh the Screen. Which will massively increase the build time. Please wait a Moment...
# To write the Output into a Log File: 1>~/Dev/ICUx64DebugWinLog.txt 2>&1 1>/dev/null 2>&1
make --jobs=$(nproc) V=1 1>~/Dev/ICUx64DebugWinLog.txt 2>&1
#make --jobs=$(nproc) V=1 check
echo Script paused for 10 Seconds to be able to read the Test Results! Please wait a Moment...
sleep 10s
make --jobs=$(nproc) V=1 install
# --- Section to build native Debug Libraries for Windows - End ---

# 4: Cross Compile from Linux to Windows - Release
# --- Section to build native Release Libraries for Windows - Start ---
if [ -d $HOME/Dev/Builds/LinWin/ICUx64ReleaseWin/ ]; then rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/LinWin/ICUx64ReleaseWin/*.* $HOME/Dev/Builds/LinWin/ICUx64ReleaseWin/* $HOME/Dev/Builds/LinWin/ICUx64ReleaseWin/
fi
if [ ! -d $HOME/Dev/Builds/LinWin/ICUx64ReleaseWin/ ]; then mkdir $HOME/Dev/Builds/LinWin/ICUx64ReleaseWin/
fi
cd $HOME/Dev/Builds/LinWin/ICUx64ReleaseWin/
export CFLAGS='-DPIC -D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fexceptions -fcf-protection=branch -finput-charset=utf-8 -flto -fno-omit-frame-pointer -fPIC -fstack-protector-all -grecord-gcc-switches -m64 -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -pthread -O3 -g0 -pie -pipe -std=c17 -Wall -Walloc-zero -Wcast-align -Wconversion -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnull-dereference -Wpedantic -Wpointer-arith -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-overflow -Wtrampolines -Wunused -Wvla -Wl,-Os -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,-mi386pep -Wl,-s -Wl,--discard-locals -Wl,--dynamicbase -Wl,--enable-auto-image-base -Wl,-flto -Wl,--high-entropy-va -Wl,--nxcompat -Wl,-rpath=\$\$\$$ORIGIN/../lib'
export CXXFLAGS='-DPIC -D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fexceptions -fcf-protection=branch -finput-charset=utf-8 -flto -fno-omit-frame-pointer -fPIC -fstack-protector-all -grecord-gcc-switches -m64 -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -pthread -O3 -g0 -pie -pipe -std=c++17 -Wall -Walloc-zero -Wcast-align -Wclass-memaccess -Wconversion -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnon-virtual-dtor -Wnull-dereference -Wold-style-cast -Woverloaded-virtual -Wpedantic -Wpointer-arith -Wreorder -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-overflow -Wtrampolines -Wunused -Wuseless-cast -Wvla -Wl,-Os -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,-mi386pep -Wl,-s -Wl,--discard-locals -Wl,--dynamicbase -Wl,--enable-auto-image-base -Wl,-flto -Wl,--high-entropy-va -Wl,--nxcompat -Wl,-rpath=\$\$\$$ORIGIN/../lib'
$HOME/Dev/GitRepos/icu/icu4c/source/configure --host=x86_64-w64-mingw32 --with-cross-build=$HOME/Dev/Builds/LinWin/ICUx64ReleaseNative/source/ --enable-icu-config --disable-debug --enable-release --enable-shared --enable-static --enable-extras --enable-icuio --enable-layoutex --enable-tools --enable-tests --disable-samples --prefix=$HOME/Dev/Binaries/LinWin/ICUx64ReleaseWin/
#echo Routing Output to /dev/null as the Terminal / Console is very slow to display the Output and refresh the Screen. Which will massively increase the build time. Please wait a Moment...
# To write the Output into a Log File: 1>~/Dev/ICUx64ReleaseWinLog.txt 2>&1
make --jobs=$(nproc) V=1 1>~/Dev/ICUx64ReleaseWinLog.txt 2>&1
#make --jobs=$(nproc) V=1 check
#echo Script paused for 10 Seconds to be able to read the Build or Test Results! Please wait a Moment...
#sleep 10s
make --jobs=$(nproc) V=1 install

#rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/LinWin/ICUx64DebugNative/*.* $HOME/Dev/Builds/LinWin/ICUx64DebugNative/* $HOME/Dev/Builds/LinWin/ICUx64DebugNative/
#rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/LinWin/ICUx64ReleaseNative/*.* $HOME/Dev/Builds/LinWin/ICUx64ReleaseNative/* $HOME/Dev/Builds/LinWin/ICUx64ReleaseNative/
#rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/LinWin/ICUx64DebugWin/*.* $HOME/Dev/Builds/LinWin/ICUx64DebugWin/* $HOME/Dev/Builds/LinWin/ICUx64DebugWin/
#rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/LinWin/ICUx64ReleaseWin/*.* $HOME/Dev/Builds/LinWin/ICUx64ReleaseWin/* $HOME/Dev/Builds/LinWin/ICUx64ReleaseWin/
# --- Section to build native Release Libraries for Windows - End ---
echo DONE!
exit
