#!/usr/bin/bash
# SPDX-License-Identifier: Unlicense OR CC0-1.0
# Copyright © 2021 Oliver Niebuhr, https://github.com/MeerMusik/LinuxScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
# - CC0 1.0 Universal License Text Start -
# LinuxScripts
# Written in 2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
# - CC0 1.0 Universal License Text End -
# If there is an additional Compiler than GCC/G++ in the Path, tell CMake that we definitely want to use GCC and that it should ignore everything else
# Hint: 1: -Wl,-z,defs AKA -Wl,--no-undefined does not work with Clang / LLVM. 2: Do not set -Wl,-melf_x86_64 or similar: The built Compiler is able to compile in X86 and X86_64 mode. Therefore it needs to link to Libraries from multiple Architectures.
# Hint: 3: I minimized the type of Warnings to fix potential Issues with RAM usage and overflowing Output Buffers in Terminals / Consoles. 4: I am not setting a C or C++ Standard - it will get overwritten anyway.
# Hint: 5: If your Terminal / Console Buffer runs full, add the following Option to the Ninja Command at Line 30: 1>/dev/null 2>&1 - Or alternatively route the Output into a File.
export CC=gcc
export CXX=g++
echo How to build Clang/LLVM: Basic starting Guide: https://clang.llvm.org/get_started.html
echo Additional Dependency for LLDB: SWIG: http://www.swig.org/
if [ ! -d $HOME/Dev/ ]; then mkdir $HOME/Dev/
fi
if [ ! -d $HOME/Dev/Builds/ ]; then mkdir $HOME/Dev/Builds/
fi
if [ -d $HOME/Dev/Builds/LLVMx64Release/ ]; then rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/LLVMx64Release/*.* $HOME/Dev/Builds/LLVMx64Release/* $HOME/Dev/Builds/LLVMx64Release/
fi
if [ ! -d $HOME/Dev/Builds/LLVMx64Release/ ]; then mkdir $HOME/Dev/Builds/LLVMx64Release/
fi
cd $HOME/Dev/Builds/LLVMx64Release/
cmake $HOME/Dev/GitRepos/llvm-project/llvm/ $HOME/Dev/Builds/LLVMx64Release/ -G'Ninja' -DCMAKE_VERBOSE_MAKEFILE=ON -DCMAKE_C_FLAGS_RELEASE='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fcf-protection=branch -fdata-sections -fexceptions -ffunction-sections -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fPIC -fstack-protector-all -fstack-clash-protection -ftrapv -frecord-gcc-switches -grecord-gcc-switches -m64 -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -pthread -O3 -ggdb1 -pie -pipe -Wall -Wextra -Wstack-protector -Wl,-O3 -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,-g -Wl,--hash-style=gnu -Wl,--gc-sections -Wl,-z,relro -Wl,-z,now -Wl,-z,noexecstack -Wl,-rpath=$$ORIGIN/../lib' -DCMAKE_CXX_FLAGS_RELEASE='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fcf-protection=branch -fdata-sections -fexceptions -ffunction-sections -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fPIC -fstack-protector-all -fstack-clash-protection -ftrapv -frecord-gcc-switches -grecord-gcc-switches -m64 -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -pthread -O3 -ggdb1 -pie -pipe -Wall -Wextra -Wstack-protector -Wl,-O3 -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,-g -Wl,--hash-style=gnu -Wl,--gc-sections -Wl,-z,relro -Wl,-z,now -Wl,-z,noexecstack -Wl,-rpath=$$ORIGIN/../lib' -DCMAKE_VERBOSE_MAKEFILE=ON -DLLVM_ENABLE_PROJECTS='clang;clang-tools-extra;compiler-rt;debuginfo-tests;lld;lldb;llvm' -DCMAKE_BUILD_TYPE='Release' -DLLVM_ENABLE_PROJECTS='clang;clang-tools-extra;compiler-rt;debuginfo-tests;lld;lldb;llvm' -DCMAKE_INSTALL_PREFIX=$HOME/Dev/Binaries/LLVMx64Release/ -DLLVM_TARGETS_TO_BUILD='X86' -DLLVM_ENABLE_EH='ON' -DLLVM_ENABLE_RTTI='ON' -DLLVM_ENABLE_TERMINFO='OFF' -DLLVM_BUILD_TESTS='ON' -DLLVM_INCLUDE_DOCS='OFF' -DLLVM_INCLUDE_EXAMPLES='OFF' -DLLVM_INCLUDE_TESTS='ON' -DLLVM_PARALLEL_COMPILE_JOBS=$(nproc) -DLLVM_PARALLEL_LINK_JOBS=$(nproc)
# The Output is huge because of all the Warnings and can lead to slower build times. Therefore I am routing everything to /dev/null. I usually only want to see the Output, when I need to investigate, if there is an Issue with the Compiler and or Linker.
# For Logging into a File (File Size is circa 16 Megabyte as of CLANG 13): 1>~/Dev/LLVMx64ReleaseLog.log 2>&1
ninja --verbose -j$(nproc) -l$(nproc)
echo Script paused for 10 Seconds to be able to read the Build or Test Results! Please wait a Moment...
sleep 10s
# Run LLVM Tests:
echo !!! Tests are not correctly implemented right now and will fail! Feel free to fix the Test Implementation and create a Pull Request !!!
ninja --verbose -j$(nproc) -l$(nproc) check-llvm
echo Script paused for 10 Seconds to be able to read the Build or Test Results! Please wait a Moment...
sleep 10s
# Run Clang Tests:
echo !!! Tests are not correctly implemented right now and will fail! Feel free to fix the Test Implementation and create a Pull Request !!!
ninja --verbose -j$(nproc) -l$(nproc) check-clang
echo Script paused for 10 Seconds to be able to read the Build or Test Results! Please wait a Moment...
sleep 10s
ninja --verbose -j$(nproc) install
rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/LLVMx64Release/*.* $HOME/Dev/Builds/LLVMx64Release/* $HOME/Dev/Builds/LLVMx64Release/
exit
