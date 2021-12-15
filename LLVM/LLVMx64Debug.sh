#!/usr/bin/bash
# SPDX-License-Identifier: Unlicense OR CC0-1.0
# Copyright © 2021 Oliver Niebuhr, https://github.com/MeerMusik/LinuxScripts / https://oliverniebuhr.de / https://twitter.com/MeerMusik
# - CC0 1.0 Universal License Text Start -
# LinuxScripts
# Written in 2021 by Oliver Niebuhr, email: gitrepos@oliverniebuhr.de / Website: https://oliverniebuhr.de / Twitter: https://twitter.com/MeerMusik
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>
# - CC0 1.0 Universal License Text End -
#If there is an additional Compiler than GCC/G++ in the Path, tell CMake that we definitely want to use GCC and that it should ignore everything else
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
cmake $HOME/Dev/GitRepos/llvm-project/llvm/ $HOME/Dev/Builds/LLVMx64Debug/ -G'Ninja' -DCMAKE_C_FLAGS_DEBUG='-fasynchronous-unwind-tables -fexceptions -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -frecord-gcc-switches -grecord-gcc-switches -m64 -pthread -Og -ggdb3 -pipe -Wall -Wl,-Og -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,-z,relro -Wl,-z,now' -DCMAKE_CXX_FLAGS_DEBUG='-fasynchronous-unwind-tables -fexceptions -finput-charset=utf-8 -fno-lto -fno-omit-frame-pointer -frecord-gcc-switches -grecord-gcc-switches -m64 -pthread -Og -ggdb3 -pipe -Wall -Wl,-Og -Wl,--allow-multiple-definition -Wl,--build-id=sha1 -Wl,--discard-locals -Wl,-fno-lto -Wl,-z,relro -Wl,-z,now' -DCMAKE_VERBOSE_MAKEFILE=ON -DLLVM_ENABLE_PROJECTS='clang;clang-tools-extra;compiler-rt;debuginfo-tests;lld;lldb;llvm' -DCMAKE_INSTALL_PREFIX=$HOME/Dev/Binaries/LLVMx64Debug/ -DCMAKE_BUILD_TYPE='Debug' -DLLVM_TARGETS_TO_BUILD='X86' -DLLVM_INCLUDE_EXAMPLES='OFF' -DLLVM_INCLUDE_TESTS='OFF' -DLLVM_INCLUDE_DOCS='OFF' -DLLVM_PARALLEL_COMPILE_JOBS=$(nproc) -DLLVM_PARALLEL_LINK_JOBS=$(nproc) -DLLVM_ENABLE_EH='ON' -DLLVM_ENABLE_RTTI='ON' -DLLVM_ENABLE_TERMINFO='OFF' -DLLVM_BUILD_TESTS='ON'
ninja
echo !!! Tests are not correctly implemented right now! The call of 'ninja test' does not work as the Target test does not exist! The LLVM Documentation is a horrible mess and a lot of parts are incomplete! I am not wasting more time to get this to work for now! Feel free to fix this and create a Merge Request !!!
#ninja test
#echo Script paused for 10 Seconds to be able to read the Test Results! Please wait a Moment...
#sleep 10s
ninja install
rm --interactive=never --dir --recursive --force --verbose $HOME/Dev/Builds/LLVMx64Debug/*.* $HOME/Dev/Builds/LLVMx64Debug/* $HOME/Dev/Builds/LLVMx64Debug/
exit
