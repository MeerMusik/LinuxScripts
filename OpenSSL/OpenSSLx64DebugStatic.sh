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
if [ -d $HOME/Dev/Builds/OpenSSLx64DebugStatic/ ]; then rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/OpenSSLx64DebugStatic/*.* $HOME/Dev/Builds/OpenSSLx64DebugStatic/* $HOME/Dev/Builds/OpenSSLx64DebugStatic/
fi
if [ ! -d $HOME/Dev/Builds/OpenSSLx64DebugStatic/ ]; then cp --force --recursive --verbose $HOME/Dev/GitRepos/OpenSSL/ $HOME/Dev/Builds/OpenSSLx64DebugStatic/
fi
cd $HOME/Dev/Builds/OpenSSLx64DebugStatic/
perl Configure CFLAGS='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fcf-protection=branch -fexceptions -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fPIE -fstack-protector-all -fstack-clash-protection -ftrapv -frecord-gcc-switches -grecord-gcc-switches -m64 -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -pthread -Og -ggdb3 -pie -pipe -std=gnu2x -Wall -Walloc-zero -Wcast-align -Wconversion -Wdeprecated-declarations -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnull-dereference -Wpedantic -Wpointer-arith -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-overflow -Wtrampolines -Wunused -Wvla -Wl,-Og -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,-g -Wl,--hash-style=gnu -Wl,-melf_x86_64 -Wl,--pie -Wl,-z,defs -Wl,-z,relro -Wl,-z,now -Wl,-z,noexecstack -Wl,-rpath=\$\$\$$ORIGIN/../lib' no-shared no-idea no-mdc2 no-rc5 no-comp no-deprecated no-engine no-static-engine no-weak-ssl-ciphers no-shared no-ssl3 no-ssl3-method no-tls1 no-tls1-method no-tls1_1 no-tls1_1-method no-dtls1 no-dtls1-method debug-linux-x86_64 --prefix=$HOME/Dev/Binaries/OpenSSLx64DebugStatic/ --openssldir=$HOME/Dev/Binaries/OpenSSLx64DebugStatic/
make --jobs=$(nproc) V=1
# Normal less Verbose Output:
make --jobs=$(nproc) test
# If a Test fails, disable the above less Verbose Variant and use the below one to get a huge amount of Details:
# make --jobs=$(nproc) V=1 test
echo Script paused for 10 Seconds to be able to read the Build or Test Results! Please wait a Moment...
sleep 10s
if [ ! -d $HOME/Dev/Binaries/ ]; then mkdir $HOME/Dev/Binaries/
fi
# I do not want the Documentation. So I use 'install_sw' instead of 'install'
make --jobs=1 V=1 install_sw
rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/OpenSSLx64DebugStatic/*.* $HOME/Dev/Builds/OpenSSLx64DebugStatic/* $HOME/Dev/Builds/OpenSSLx64DebugStatic/
exit
