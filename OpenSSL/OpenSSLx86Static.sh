#!/usr/bin/bash
# SPDX-License-Identifier: Unlicense OR CC0-1.0
# Copyright © 2021-2024 Oliver Niebuhr, https://github.com/MeerMusik/LinuxScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
# - CC0 1.0 Universal License Text Start -
# LinuxScripts
# Written in 2021-2024 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
# - CC0 1.0 Universal License Text End -
# WARNING: 1: '-ftrapv' does not work with X86 Builds of OpenSSL. The Fuzzing Test 99 will fail. 2: '-fvisibility=hidden' lead to 'Undefined Reference' Errors
if [ ! -d $HOME/Dev/ ]; then mkdir $HOME/Dev/
fi
if [ ! -d $HOME/Dev/Builds/ ]; then mkdir $HOME/Dev/Builds/
fi
if [ -d $HOME/Dev/Builds/OpenSSLx86Static/ ]; then rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/OpenSSLx86Static/*.* $HOME/Dev/Builds/OpenSSLx86Static/* $HOME/Dev/Builds/OpenSSLx86Static/
fi
if [ ! -d $HOME/Dev/Builds/OpenSSLx86Static/ ]; then cp --force --recursive --verbose $HOME/Dev/GitRepos/openssl/ $HOME/Dev/Builds/OpenSSLx86Static/
fi
cd $HOME/Dev/Builds/OpenSSLx86Static/
# --- Section to build Debug Libraries ---
perl Configure CFLAGS='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fcf-protection=branch -fexceptions -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fno-plt -fPIE -fstack-protector-all -fstack-clash-protection -frecord-gcc-switches -grecord-gcc-switches -m32 -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -mshstk -pthread -Og -ggdb3 -pie -pipe -std=gnu2x -Wall -Walloc-zero -Wcast-align -Wconversion -Wdeprecated-declarations -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnull-dereference -Wpedantic -Wpointer-arith -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-aliasing=2 -Wstrict-overflow -Wtrampolines -Wunused -Wvla -Wl,-Og -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,-g -Wl,--hash-style=gnu -Wl,-melf_i386 -Wl,--pie -Wl,-z,combreloc -Wl,-z,defs -Wl,-z,noexecstack -Wl,-z,now -Wl,-z,relro -Wl,-z,separate-code -Wl,-z,text -Wl,-rpath=\$\$\$$ORIGIN/../lib' no-shared no-idea no-mdc2 no-rc5 no-comp no-deprecated no-engine no-static-engine no-weak-ssl-ciphers no-ssl3 no-ssl3-method no-tls1 no-tls1-method no-tls1_1 no-tls1_1-method no-dtls1 no-dtls1-method debug-linux-generic32 --prefix=$HOME/Dev/Binaries/OpenSSLx86DebugStatic/ --openssldir=$HOME/Dev/Binaries/OpenSSLx86DebugStatic/
echo Routing Output to /dev/null as the Terminal / Console is very slow to display the Output and refresh the Screen. Which will massively increase the build time. Please wait a Moment...
# To write the Output into a Log File: 1>~/Dev/OpenSSLx86DebugStaticLog.txt 2>&1
make --jobs=$(nproc) V=1 1>/dev/null 2>&1
# Normal less Verbose Output:
make --jobs=$(nproc) test
# If a Test fails, disable the above less Verbose Variant and use the below one to get a huge amount of Details. Routed to a Log File:
# make --jobs=$(nproc) V=1 test 1>~/Dev/OpenSSLx86DebugStaticTestLog.txt 2>&1
echo Script paused for 10 Seconds to be able to read the Build or Test Results! Please wait a Moment...
sleep 10s
make --jobs=1 V=1 install_sw
make --jobs=1 V=1 distclean
# --- Section to build Release Libraries ---
perl Configure CFLAGS='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fcf-protection=branch -fdata-sections -fexceptions -ffunction-sections -finput-charset=utf-8 -flto -fno-omit-frame-pointer -fno-plt -fPIE -fstack-protector-all -fstack-clash-protection -frecord-gcc-switches -grecord-gcc-switches -m32 -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -mshstk -pthread -O3 -g0 -pie -pipe -std=gnu2x -Wall -Walloc-zero -Wcast-align -Wconversion -Wdeprecated-declarations -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond -Wextra -Wformat=2 -Wformat-nonliteral -Wformat-overflow=2 -Wformat-security -Wformat-truncation -Wimplicit-fallthrough -Wlogical-op -Wmisleading-indentation -Wmissing-declarations -Wnonnull -Wnull-dereference -Wpedantic -Wpointer-arith -Wshadow -Wsign-conversion -Wstack-protector -Wstrict-aliasing=2 -Wstrict-overflow -Wtrampolines -Wunused -Wvla -Wl,-O3 -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-flto -Wl,--hash-style=gnu -Wl,--gc-sections -Wl,-s -Wl,-melf_i386 -Wl,--pie -Wl,-z,defs -Wl,-z,combreloc -Wl,-z,defs -Wl,-z,noexecstack -Wl,-z,now -Wl,-z,relro -Wl,-z,separate-code -Wl,-z,text -Wl,-rpath=\$\$\$$ORIGIN/../lib' linux-generic32 no-shared no-idea no-mdc2 no-rc5 no-comp no-deprecated no-weak-ssl-ciphers no-ssl3 no-ssl3-method no-tls1 no-tls1-method no-tls1_1 no-tls1_1-method no-dtls1 no-dtls1-method --prefix=$HOME/Dev/Binaries/OpenSSLx86ReleaseStatic/ --openssldir=$HOME/Dev/Binaries/OpenSSLx86ReleaseStatic/
echo Routing Output to /dev/null as the Terminal / Console is very slow to display the Output and refresh the Screen. Which will massively increase the build time. Please wait a Moment...
# To write the Output into a Log File: 1>~/Dev/OpenSSLx86ReleaseStaticLog.txt 2>&1
make --jobs=$(nproc) V=1 1>/dev/null 2>&1
# Normal less Verbose Output:
make --jobs=$(nproc) test
# If a Test fails, disable the above less Verbose Variant and use the below one to get a huge amount of Details. Routed to a Log File:
# make --jobs=$(nproc) V=1 test 1>~/Dev/OpenSSLx86ReleaseStaticTestLog.txt 2>&1
echo Script paused for 10 Seconds to be able to read the Build or Test Results! Please wait a Moment...
sleep 10s
if [ ! -d $HOME/Dev/Binaries/ ]; then mkdir $HOME/Dev/Binaries/
fi
# I do not want the Documentation. So I use 'install_sw' instead of 'install'
make --jobs=1 V=1 install_sw
rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/OpenSSLx86Static/*.* $HOME/Dev/Builds/OpenSSLx86Static/* $HOME/Dev/Builds/OpenSSLx86Static/
echo DONE!
exit
