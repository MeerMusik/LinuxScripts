[[_TOC_]]
# About LinuxScripts
(C) Copyright 2013-2024 Oliver Niebuhr

Very basic Scripts to
1. Clone (Download) the Source Code of Libraries and Frameworks like ICU, LLVM, OpenSSL and wxWidgets from their Git Repositories
2. Build these Libraries and Frameworks

May they be useful to you in one way or another.

The Scripts are written to compliment each other. Example: Locally cloned Repositories will be found under

/home/[User Name]/Dev/GitRepos/[Name-Of-The-Repository]

The Build Scripts will search for the Source Code of these Libraries in this Directory.

These Scripts will only get updated if I run into Issues myself! Bug Reports to fix or update a specific Compiler Flag will be ignored, if it interferes with my use case or it is not compatible with the Version of a Library and or Compiler I am using!

As I am currently using Rust and Go, these Scripts are currently unused and Bug Reports will probably stay open for many months.

The best options to get something fixed are:
1. Clone the Repository -> Fix the Bug -> Create a Pull Request -> Wait for me to Merge your PR / MR OR
2. Fork the Repository -> Fix the Bug -> Enjoy the Error Free Script

## General Infos
All Scripts were created and successfully tested under the following Linux and Compiler Versions:
1. openSUSE Tumbleweed, KDE Plasma 6, Stable Repository, x86_64
2. GNU GCC/G++ Compiler, 11.1 or later, x86, x86_64

Other Linux Distributions are untested by me.

Other Compiler Variants like Clang-GCC are untested and therefore not supported by me!

Older Versions should work, if they are not too old. What too old means, has not been fully tested. The oldest GCC Version I tested to build some of the older Versions of Libraries like ICU and OpenSSL with, was GCC 8.1.0 back in 2019.

You usually need to remove or modify some Compiler Flags for newer and older Kernel, Compiler, Linker and Library Versions.

## LICENSE
The Content in this Repository is Dual-Licensed under "The Unlicense" (Public Domain) OR under the "CC0-1.0 Universal License" (Public Domain with Fallback Mechanism).

If you live in a Jurisdiction like Germany or anywhere else outside the USA which
1. does not acknowledge Public Domain at all OR
2. does only acknowledge some Parts of Public Domain

and therefore "The Unlicense" is deemed illegal or invalid, choose the CC0-1.0 Universal License with the Fallback Mechanism.

Simplified Explanation: Both Licenses allow you to do with these Scripts whatever you want without mentioning my Name ('without giving me Credit' also known as 'No Attribution').

The Fallback Mechanism is made for Jurisdictions like Germany etc., to allow me (the 'Licensor') to give away all my Rights as far as the local Laws allow me to do so. So that you (the 'Licensee') can do whatever you want with whatever I have published under these License(s).

The huge Amount of different Jurisdictions and Copyright Laws are a horrible Mess and need these specific Statements unfortunately.

Also: Repositories got removed or hidden if they do not contain a License Document.

And as always the usual necessary Disclaimer: I AM NOT A LAWYER AND THIS IS NOT LEGAL ADVICE. IF YOU NEED LEGAL ADVICE, CONSULT A LICENSED ATTORNEY.

Here you can find the different License Texts: The Unlicense (Public Domain):
1. THE_UNLICENSE.txt - In this Repo: [THE_UNLICENSE.txt](THE_UNLICENSE.txt)
2. The Unlicense: Original at the Authors Website: https://unlicense.org/
3. The Unlicense: At SPDX.org: https://spdx.org/licenses/Unlicense.html

CC0-1.0 Universal (Public Domain with Fallback Mechanism):
1. CC0-1.0.txt - In this Repo: [CC0-1.0.txt](CC0-1.0.txt)
2. CC0-1.0: Full Text at CreativeCommons.org: https://creativecommons.org/publicdomain/zero/1.0/legalcode.txt
3. CC0-1.0: Human-Readable Summary - English at CreativeCommons.org: https://creativecommons.org/publicdomain/zero/1.0/
4. CC0-1.0: Human-Readable Summary - German Translation at CreativeCommons.org: https://creativecommons.org/publicdomain/zero/1.0/deed.de
5. CC0-1.0: At SDPX.org: https://spdx.org/licenses/CC0-1.0.html

## Contributing
The full Contribution Rules can be found in the
1. [CONTRIBUTING.md](CONTRIBUTING.md)

## Questions? Need to report a Bug?
Send me a Message. I will try to reply within 96 hours. Sometimes sooner, sometimes later.
1. For Bug Reports: Click on the Button "New Issue" and use the "Bug Report" Form to create a new Issue marked as Bug Report: https://github.com/MeerMusik/LinuxScripts/issues/
2. For Questions: Click on the Button "New Issue" and use the "Question" Form to create a new Issue marked as Question: https://github.com/MeerMusik/LinuxScripts/issues/
3. eMail: Bug Report. MailTo Link: [Opens your eMail Program](mailto:gitrepos@oliverniebuhr.de?subject=LinuxScripts-Bug-Report)
4. eMail: Question. MailTo Link: [Opens your eMail Program](mailto:gitrepos@oliverniebuhr.de?subject=LinuxScripts-Question)
5. Contact me on Twitter: https://twitter.com/MeerMusik
6. Contact Form on my personal Website (German): https://oliverniebuhr.de/kontakt

Remember that Tweets are always public! Everyone can read what you write! If you need to send Personal Infos, send me a Direct Message!

## List of Scripts
Where necessary, I added a Section called 'WARNING:' at the upper Part of the Build Scripts, which list in example Flags which are not compatible or not fully supported. It also contains other Hints about removed or disabled Features where necessary.

Some Security = Hardening Flags forced whenever possible:
1. Fortify Source
2. Position-Independent-Code or Position-Independent-Executable
3. Stack Protector
4. Stack-Clash Protector
5. Read-Only Relocation
6. Immediate Binding
7. No Executable Stack
8. Spectre and Meltdown Mitigation
    1. As I use AMD, some Mitigations will lead to link Errors. Therefore I have to lower the Level of Security for some Mitigations. Blame Intel. And AMD.
    2. Feel free to raise the Flags for those Mitigations to a higher Value, if they work on your System

Hash-Style=GNU is set by all Scripts:
1. I have added '-Wl,--hash-style=gnu' - this leads to shorter build and link times. If your App or Library does not run on Linux Versions using a too old Binutils Version, set the Value to:
    1. -Wl,--hash-style=both - this is the Default Value, which will write the old slow SYSV Sections and the newer GNU Sections into the Header of the File. Alternatively set it to write only the old Value: -Wl,--hash-style=sysv
    2. It seems this was introduced in Binutils 2.17.50.0.2 Beta. It became usable after some Bugs were fixed. Probably any Version from Binutils 2.17.50.0.6 Beta and later should work. Take this with a huge Container of Salt! Do your own testing to be on the relatively safe side!
    3. I guess anything released beginning from January 2007 should be safe. But again: Do your homework to be on the safe side.
    4. You also need the correct GLIBC Version. Probably at least Version 2.5 but I have not researched this Topic thoroughly. You are once more on your own with this!
    5. Link to the [Binutils Changelog on the spinics.net Mailing List](https://www.spinics.net/lists/linux-gcc/msg00007.html)

Static Builds: For Compatibility Reasons, Static Builds are the usual weird Linux Mix:

1. Executables are: ELF 32-Bit or 64-Bit LSB PIE executables, dynamically linked
2. Static Libraries are Static Libraries

Should the GLIBC Library at some point step forward in to the year 2000 and embrace the future, I will change the Compiler and Linker Flags to turn Static Binaries into real Static Binaries. But only if I will be still alive in the year 6666.

### Boost - C++ Libraries
Status: Currently not used <br>

Infos:
1. Documentation: https://www.boost.org/doc/
2. Download Source Code directly: https://boostorg.jfrog.io/artifactory/main/release/

Get the Source Code:
1. Clone Git Repository to local Drive: [NewBoostGit.sh](Boost/NewBoostGit.sh)
2. Update local Git Repository: [UpdateBoostGit.sh](Boost/UpdateBoostGit.sh)

Build it:
1. X86_64, Shared, Debug and Release: [Boostx64.sh](Boost/Boostx64.sh)
2. X86_64, Static, Debug and Release: [Boostx64Static.sh](Boost/Boostx64Static.sh)
3. X86, Shared, Debug and Release: [Boostx86.sh](Boost/Boostx86.sh)
4. X86, Static, Debug and Release: [Boostx86Static.sh](Boost/Boostx86Static.sh)

### Botan - Crypto and TLS for Modern C++
Status: Unused. Kept in case it turned out to be a Alternative to OpenSSL. <br>

Infos:
1. Documentation: https://botan.randombit.net/handbook/building.html
2. Download Source Code directly: https://github.com/randombit/botan/releases

Get the Source Code:
1. Clone Git Repository to local Drive: [NewBotanGit.sh](Botan/NewBotanGit.sh)
2. Update local Git Repository: [UpdateBotanGit.sh](Botan/UpdateBotanGit.sh)

Build it:
1. X86_64, Dynamic, Debug and Release: [Botanx64.sh](Botan/Botanx64.sh)
2. X86_64, Static, Debug and Release: [Botanx64Static.sh](Botan/Botanx64Static.sh)
3. X86, Dynamic, Debug and Release: [Botanx86.sh](Botan/Botanx86.sh)
4. X86, Static, Debug and Release: [Botanx86Static.sh](Botan/Botanx86Static.sh)

### CLANG / LLVM - The LLVM Compiler Infrastructure
Status: Currently not used <br>

Building from Source is optional. I have only used Clang as a Parser for Qt Framework specific Parts. I have not yet built any Library with Clang directly.

LLDB has 'swig' as an additional Dependency. Make sure to install 'swig' or disable the LLDB Project if you dont want or need the LLVM Debugger.
1. swig Website: http://www.swig.org/

Infos:
1. If you do not have a specific use case to build a customized Compiler, you should use the prebuilt Binaries provided by your Distribution. It is much less hassle, you will save a lot of time and keep your frustation Level to a minimum.
2. If there are no prebuilt Binaries for your Distribution: Try your Luck at the official LLVM Download Website: https://releases.llvm.org/
3. General Documentation: https://llvm.org/docs/
4. How to build Clang / LLVM: Basic starting Guide: https://clang.llvm.org/get_started.html

Disabled Functionality:
1. Colored Output: -DLLVM_ENABLE_TERMINFO='OFF'

Colored Output requires ncurses. As different Distributions deploy different Versions of ncurses, it often leads to linking errors. If you want colored output, enable that Flag and install or download ncurses. Make sure to install the correct Version! I have never used ncurses, therefore I can not tell you which Version you need!

Get the Source Code:
1. Clone Git Repository to local Drive: [NewLLVMGit.sh](LLVM/NewLLVMGit.sh)
2. Update local Git Repository: [UpdateLLVMGit.sh](LLVM/UpdateLLVMGit.sh)

Build it:
1. X86_64, Debug: [LLVMx64Debug.sh](LLVM/LLVMx64Debug.sh)
2. X86_64, Release: [LLVMx64Release.sh](LLVM/LLVMx64Release.sh)

Required Free Space during build time - based on Clang & LLVM 13:
1. Debug Build with Unit Tests: Circa 204.0 Gigabyte
2. Release Build with Unit Tests: Circa 9.1 Gigabyte

Required Free Space for Installation - based on Clang & LLVM 13:
1. Debug Build: Circa 73.3 Gigabyte
2. Release Build: Circa 3.5 Gigabyte

Build time: 16 Cores 32 Threads, 64 GB RAM, 32 GB fixed SWAPFILE (SATA SSD):
1. Debug Build: Limited to 16 Parallel Link Jobs = Circa 34 Minutes plus running Unit Tests plus installing = Circa 41 Minutes total
2. Release Build: Circa 21 Minutes plus running Unit Tests plus installing = circa 25 Minutes total

No X86 = 32-Bit only Scripts:
1. I do not want to install 32-Bit Python from an unofficial Repository
2. I could build the old 'lib32-python' from the AUR, but the Version is usually outdated and the Package Script has some Issues
    1. Also the Build and Config Script for Packages will break, if they do not keep getting updated. This is unavoidable
3. The X86_64 Compiler is able to build 32-Bit Binaries for the X86 Architecture anyway

### CMake - Build Management Tool
Status: Used when a Tool or Library supports it or has it set as a fixed Dependency. <br>

I usually use the latest CMake Version provided by my Linux Distribution.

I Build only from Source, when I need to test specific fixes or a new Feature.

Attention: By Default, You need an existing CMake and Ninja Installation to build CMake from Source! You can uncomment the Lines in the Script to use 'Make'. Do not forget to comment the CMake specific Parts - otherwise you will break the Scripts!

Infos:
1. Official Documentation: https://cmake.org/cmake/help/latest/
2. Community Wiki: https://gitlab.kitware.com/cmake/community/-/wikis/home

Get the Source Code:
1. Clone Git Repository to local Drive: [NewCMakeGit.sh](CMake/NewCMakeGit.sh)
2. Update local Git Repository: [UpdateCMakeGit.sh](CMake/UpdateCMakeGit.sh)

Build it:
1. X86_64, Dynamic, Release: [CMakex64Release.sh](CMake/CMakex64Release.sh)

### ICU - International Components for Unicode
Status: Currently unused. If it is still needed, needs to be determined. <br>

Infos:
1. Documentation: http://site.icu-project.org/docs
2. Download Source Archive or prebuilt Binaries directly: https://icu.unicode.org/download

Get the Source Code:
1. Clone Git Repository to local Drive: [NewICUGit.sh](ICU/NewICUGit.sh)
2. Update local Git Repository: [UpdateICUGit.sh](ICU/UpdateICUGit.sh)

You also need [Git Large File Storage Extension](https://git-lfs.github.com/) <br>
Need help setting up Git LFS? [Follow the Section 'Detailed Instructions' -> 'Prerequisites: Git and Git LFS' at the ICU Project Site](https://icu.unicode.org/repository)

Build it:
1. X86_64, Debug and Release: [ICUx64.sh](ICU/ICUx64.sh)
2. X86, Debug and Release: [ICUx86.sh](ICU/ICUx86.sh)

Build it - Cross-Compile Linux to Windows:
1. X86_64, Debug and Release: [ICUx64LinWin.sh](LinWin/ICU/ICUx64LinWin.sh)
2. X86, Debug and Release: [ICUx86LinWin.sh](LinWin/ICU/ICUx86LinWin.sh)

Cross-Compile Limitations: <br>
Tests are disabled as WINE can not find the necessary Runtime Libraries. Maybe I can I find some Settings to make the tests work - long-term.

### Ninja - The Ninja Build System
Status: Heavily recommended. I use it whenever possible <br>

Infos:
1. Documentation: https://ninja-build.org/manual.html
2. Download Source Archive or prebuilt Binaries directly: https://github.com/ninja-build/ninja/releases

Get the Source Code:
1. Clone Git Repository to local Drive: [NewNinjaGit.sh](Ninja/NewNinjaGit.sh)
2. Update local Git Repository: [UpdateNinjaGit.sh](Ninja/UpdateNinjaGit.sh)

Build it:
1. X86_64, Static, Release: [Ninjax64Release.sh](Ninja/Ninjax64Release.sh)

Attention: You need Python installed for the Bootstrapping Script!

### OpenSSL - Cryptography and SSL/TLS Toolkit
Status: Currently unused <br>

Additional Infos:
1. The Scripts build a Version which only supports DTLS 1.2 and TLS 1.2 and 1.3
2. A lot of the Protocols, which I never intended to use, are disabled as well. Everything that is disabled by Default, is less pressure, to keep up with possible Security holes in OpenSSL. Simple as that.

Infos:
1. Documentation: https://www.openssl.org/docs/
2. Download Source Archive or prebuilt Binaries directly: https://www.openssl.org/source/

Get the Source Code:
1. Clone Git Repository to local Drive: [NewOpenSSLGit.sh](OpenSSL/NewOpenSSLGit.sh)
2. Update local Git Repository: [UpdateOpenSSLGit.sh](OpenSSL/UpdateOpenSSLGit.sh)

Build it:
1. X86_64, Dynamic, Debug and Release: [OpenSSLx64.sh](OpenSSL/OpenSSLx64.sh)
2. X86_64, Static, Debug and Release: [OpenSSLx64Static.sh](OpenSSL/OpenSSLx64Static.sh)
3. X86, Dynamic, Debug and Release: [OpenSSLx86.sh](OpenSSL/OpenSSLx86.sh)
4. X86, Static, Debug and Release: [OpenSSLx86Static.sh](OpenSSL/OpenSSLx86Static.sh)

Build it - Cross-Compile Linux to Windows:
1. X86_64, Dynamic, Debug and Release: [OpenSSLx64LinWin.sh](LinWin/OpenSSL/OpenSSLx64LinWin.sh)
2. X86_64, Static, Debug and Release: [OpenSSLx64StaticLinWin.sh](LinWin/OpenSSL/OpenSSLx64StaticLinWin.sh)
3. X86, Dynamic, Debug and Release: [OpenSSLx86LinWin.sh](LinWin/OpenSSL/OpenSSLx86LinWin.sh)
4. X86, Static, Debug and Release: [OpenSSLx86StaticLinWin.sh](LinWin/OpenSSL/OpenSSLx86StaticLinWin.sh)

Cross-Compile Limitations: <br>
Tests are disabled as WINE can not find the necessary Runtime Libraries. Maybe I can I find some Settings to make the tests work - long-term.

### Pirates-Little-Helper - (WIP NAME. PLACEHOLDER)
Status: Delayed indefinitely. Project will potentially be killed off. <br>

The Links to the Files have been removed while the Tool will be rewritten from Scratch in another Framework.

Info:
1. My personal Website (German): https://oliverniebuhr.de
2. FAQ on my Website (German): https://oliverniebuhr.de/

Get the Source Code:
1. Clone Git Repository to local Drive: [NewPiratesLittleHelper.sh](PiratesLittleHelper/NewPiratesLittleHelper.sh)
2. Update local Git Repository: [UpdatePiratesLittleHelper.sh](PiratesLittleHelper/UpdatePiratesLittleHelper.sh)

Build it: The real Build Scripts will be added when they are ready...

Build it: Cross-Compile Linux to Windows: The real Build Scripts will be added when they are ready...

Cross-Compile Limitations: <br>
Unknown yet

## Other Tools
Hard Dependencies or recommended Libraries.

1. NASM - Netwide Assembler. For OpenSSL. Optional but highly recommended
    1. Preferable way to get it: Install nasm through your trusty Package Manager
    2. Alternatively: Download the latest prebuilt Binaries: https://www.nasm.us/pub/nasm/releasebuilds/
    3. Version: Always the latest

2. Perl Programming Language
    1. Required as an Interpreter for all Projects using Perl Scripts
    2. Version: Always the latest. Unless I need an older Version because of in example Compatibility Issues

Perl comes preinstalled on many Linux Distributions. Open a Console or Shell and type

perl --version

to see which Version is installed on your Distribution.

If Perl is not found, install the prebuilt Binaries provided by your Distribution. Read the Instructions for the Package Manager of your Distribution on how to do that.

3. Python 3.x Programming Language
    1. Required as an Interpreter for all Projects using Python Scripts
    2. Version: Always the latest. Unless I need an older Version because of in example Compatibility Issues

Python comes preinstalled on many Linux Distributions. Open a Console / Shell and type

python --version

to see which Version is installed on your Distribution.

If Python is not found, install the prebuilt Binaries provided by your Distribution. Read the Instructions for the Package Manager of your Distribution on how to do that.

## WindowsScripts
I also published my Windows Scripts Dual-Licensed under "The Unlicense" (Public Domain) OR under the "CC0-1.0 Universal License" (Public Domain with Fallback Mechanism):
1. WindowsScripts: [Repository at GitHub](https://github.com/MeerMusik/WindowsScripts)
