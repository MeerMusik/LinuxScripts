#!/usr/bin/bash
# SPDX-License-Identifier: Unlicense OR CC0-1.0
# Copyright © 2013-2022 Oliver Niebuhr, https://github.com/MeerMusik/LinuxScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
# - CC0 1.0 Universal License Text Start -
# LinuxScripts
# Written in 2013-2022 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
# - CC0 1.0 Universal License Text End -
# WARNING: 1: '-fvisibility=hidden' lead to 'Undefined Reference' Errors
export CC=x86_64-w64-mingw32-gcc
export CXX=x86_64-w64-mingw32-g++
if [ ! -d $HOME/Dev/ ]; then mkdir $HOME/Dev/
fi
if [ ! -d $HOME/Dev/Builds/ ]; then mkdir $HOME/Dev/Builds/
fi
if [ ! -d $HOME/Dev/Builds/LinWin/ ]; then mkdir $HOME/Dev/Builds/LinWin/
fi
if [ -d $HOME/Dev/Builds/LinWin/OpenSSLx64/ ]; then rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/LinWin/OpenSSLx64/*.* $HOME/Dev/Builds/LinWin/OpenSSLx64/* $HOME/Dev/Builds/LinWin/OpenSSLx64/
fi
if [ ! -d $HOME/Dev/Builds/LinWin/OpenSSLx64/ ]; then cp --force --recursive --verbose $HOME/Dev/GitRepos/openssl/ $HOME/Dev/Builds/LinWin/OpenSSLx64/
fi
cd $HOME/Dev/Builds/LinWin/OpenSSLx64/
# --- Section to build Debug Libraries ---
perl Configure CFLAGS='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fcf-protection=branch -fexceptions -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fno-plt -fPIC -fno-semantic-interposition -fstack-protector-all -fstack-clash-protection -ftrapv -frecord-gcc-switches -grecord-gcc-switches -m64 -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -mshstk -pthread -Og -ggdb3 -pie -pipe -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -pthread -Og -g3 -ggdb -pipe -std=gnu2x -Wall -Walloc-zero -Wcast-align -Wconversion -Wdeprecated-declarations -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnull-dereference -Wpedantic -Wpointer-arith -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-aliasing=2 -Wstrict-overflow -Wtrampolines -Wunused -Wvla -Wl,-Og -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--default-image-base-high -Wl,--discard-locals -Wl,--dynamicbase -Wl,--enable-auto-image-base -Wl,-fno-lto -Wl,-g -Wl,-mi386pep -Wl,--high-entropy-va -Wl,--nxcompat -Wl,-Bdynamic' shared --debug no-idea no-mdc2 no-rc5 no-comp no-deprecated no-weak-ssl-ciphers no-ssl3 no-ssl3-method no-tls1 no-tls1-method no-tls1_1 no-tls1_1-method no-dtls1 no-dtls1-method mingw64 --prefix=$HOME/Dev/Binaries/LinWin/OpenSSLx64Debug/ --openssldir=$HOME/Dev/Binaries/LinWin/OpenSSLx64Debug/
echo Routing Output to /dev/null as the Terminal / Console is very slow to display the Output and refresh the Screen. Which will massively increase the build time. Please wait a Moment...
# To write the Output into a Log File: 1>~/Dev/OpenSSLx64DebugWinLog.txt 2>&1 1>/dev/null 2>&1
make --jobs=$(nproc) V=1
make --jobs=$(nproc) test
echo Script paused for 10 Seconds to be able to read the Test Results! Please wait a Moment...
sleep 10s
echo I do not want the Documentation. So I use 'install_sw' instead of 'install'
make --jobs=$(nproc) V=1 install_sw
make --jobs=$(nproc) V=1 clean
make --jobs=$(nproc) V=1 distclean
# --- Section to build Release Libraries ---
perl Configure CFLAGS='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fcf-protection=branch -fdata-sections -fexceptions -ffunction-sections -finput-charset=utf-8 -flto -fno-omit-frame-pointer -fno-plt -fPIC -fno-semantic-interposition -fstack-protector-all -fstack-clash-protection -ftrapv -frecord-gcc-switches -grecord-gcc-switches -m64 -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -mshstk -pthread -O3 -g0 -pie -pipe -std=gnu2x -Wall -Walloc-zero -Wcast-align -Wconversion -Wdeprecated-declarations -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnull-dereference -Wpedantic -Wpointer-arith -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-aliasing=2 -Wstrict-overflow -Wtrampolines -Wunused -Wvla -Wl,-O3 -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--default-image-base-high -Wl,--discard-locals -Wl,--dynamicbase -Wl,--enable-auto-image-base -Wl,-flto -Wl,--gc-sections -Wl,-s -Wl,-mi386pep -Wl,--high-entropy-va -Wl,--nxcompat -Wl,-Bdynamic' shared --release no-idea no-mdc2 no-rc5 no-comp no-deprecated no-weak-ssl-ciphers no-ssl3 no-ssl3-method no-tls1 no-tls1-method no-tls1_1 no-tls1_1-method no-dtls1 no-dtls1-method mingw64 --prefix=$HOME/Dev/Binaries/LinWin/OpenSSLx64Release/ --openssldir=$HOME/Dev/Binaries/LinWin/OpenSSLx64Release/
echo Routing Output to /dev/null as the Terminal / Console is very slow to display the Output and refresh the Screen. Which will massively increase the build time. Please wait a Moment...
# To write the Output into a Log File: 1>~/Dev/OpenSSLx64ReleaseWinLog.txt 2>&1 1>/dev/null 2>&1
make --jobs=$(nproc) V=1
make --jobs=$(nproc) test
echo Script paused for 10 Seconds to be able to read the Test Results! Please wait a Moment...
sleep 10s
echo I do not want the Documentation. So I use 'install_sw' instead of 'install'
make --jobs=$(nproc) V=1 install_sw
echo Script paused for 10 Seconds to be able to read the Build or Test Results! Please wait a Moment...
sleep 10s
rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/LinWin/OpenSSLx64/*.* $HOME/Dev/Builds/LinWin/OpenSSLx64/* $HOME/Dev/Builds/LinWin/OpenSSLx64/
echo DONE!
exit