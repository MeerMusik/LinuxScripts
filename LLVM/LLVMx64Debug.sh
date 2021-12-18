#!/usr/bin/bash
# SPDX-License-Identifier: Unlicense OR CC0-1.0
# Copyright © 2021 Oliver Niebuhr, https://github.com/MeerMusik/LinuxScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
# - CC0 1.0 Universal License Text Start -
# LinuxScripts
# Written in 2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
# - CC0 1.0 Universal License Text End -
# Hint: 1: -Wl,-z,defs AKA -Wl,--no-undefined does not work with Clang / LLVM. 2: Do not set -Wl,-melf_x86_64 or similar: The Compiler is able to build X86 and X86_64 Architectures. Therefore it needs to link to Libraries from multiple Architectures.
# Hint: 3: I minimized the type of Warnings to fix potential Issues with RAM usage and overflowing Output Buffers in Terminals / Consoles. 4: I am not setting a C or C++ Standard - it will get overwritten anyway.
# If there is an additional Compiler than GCC/G++ in the Path, tell CMake that we definitely want to use GCC and that it should ignore everything else
export CC=gcc
export CXX=g++
echo How to build Clang/LLVM: Basic starting Guide: https://clang.llvm.org/get_started.html
echo Additional Dependency for LLDB: SWIG: http://www.swig.org/
if [ ! -d $HOME/Dev/ ]; then mkdir $HOME/Dev/
fi
if [ ! -d $HOME/Dev/Builds/ ]; then mkdir $HOME/Dev/Builds/
fi
if [ -d $HOME/Dev/Builds/LLVMx64Debug/ ]; then rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/LLVMx64Debug/*.* $HOME/Dev/Builds/LLVMx64Debug/* $HOME/Dev/Builds/LLVMx64Debug/
fi
if [ ! -d $HOME/Dev/Builds/LLVMx64Debug/ ]; then mkdir $HOME/Dev/Builds/LLVMx64Debug/
fi
cd $HOME/Dev/Builds/LLVMx64Debug/
cmake $HOME/Dev/GitRepos/llvm-project/llvm/ $HOME/Dev/Builds/LLVMx64Debug/ -G'Ninja' -DCMAKE_VERBOSE_MAKEFILE=ON -DCMAKE_C_FLAGS_DEBUG='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fcf-protection=branch -fexceptions -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fno-plt -fPIC -fstack-protector-all -fstack-clash-protection -ftrapv -frecord-gcc-switches -grecord-gcc-switches -m64 -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -pthread -Og -ggdb3 -pie -pipe -Wall -Wextra -Wstack-protector -Wl,-Og -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,-g -Wl,--hash-style=gnu -Wl,-z,relro -Wl,-z,now -Wl,-z,noexecstack -Wl,-rpath=\$$ORIGIN/../lib' -DCMAKE_CXX_FLAGS_DEBUG='-D_FORTIFY_SOURCE=2 -D_GLIBCXX_ASSERTIONS -fasynchronous-unwind-tables -fcf-protection=branch -fexceptions -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -fno-plt -fPIC -fstack-protector-all -fstack-clash-protection -ftrapv -frecord-gcc-switches -grecord-gcc-switches -m64 -mfunction-return=thunk -mindirect-branch=thunk -mindirect-branch-register -pthread -Og -ggdb3 -pie -pipe -Wall -Wextra -Wstack-protector -Wl,-Og -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,-g -Wl,--hash-style=gnu -Wl,-z,relro -Wl,-z,now -Wl,-z,noexecstack -Wl,-rpath=\$$ORIGIN/../lib' -DCMAKE_BUILD_TYPE='Debug' -DLLVM_ENABLE_PROJECTS='clang;clang-tools-extra;compiler-rt;debuginfo-tests;lld;lldb;llvm' -DCMAKE_INSTALL_PREFIX=$HOME/Dev/Binaries/LLVMx64Debug/ -DLLVM_TARGETS_TO_BUILD='X86' -DLLVM_ENABLE_EH='ON' -DLLVM_ENABLE_RTTI='ON' -DLLVM_ENABLE_TERMINFO='OFF' -DLLVM_BUILD_TESTS='ON' -DLLVM_INCLUDE_DOCS='OFF' -DLLVM_INCLUDE_EXAMPLES='OFF' -DLLVM_INCLUDE_TESTS='ON' -DLLVM_PARALLEL_COMPILE_JOBS=$(nproc) -DLLVM_PARALLEL_LINK_JOBS=$(nproc)
# The Text Output is big and usually leads to slower build times because the Terminal Buffers are slow to display the Text and refresh the Screen. Therefore I am routing everything to /dev/null. I usually only want to see the Output, when I need to know, if the Compiler and or Linker has a Bug.
# To write the Output into a Log File (File Size is circa 15 Megabyte as of CLANG 13): 1>~/Dev/LLVMx64DebugLog.log 2>&1
echo Routing Output to /dev/null as displaying on Terminal / Console will massively increase build time. Please wait a Moment...
ninja --verbose -j$(nproc) -l$(nproc) 1>/dev/null 2>&1
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
rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/LLVMx64Debug/*.* $HOME/Dev/Builds/LLVMx64Debug/* $HOME/Dev/Builds/LLVMx64Debug/
exit
