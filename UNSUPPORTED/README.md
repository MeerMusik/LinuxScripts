[[_TOC_]]
# !!! UNSUPPORTED SCRIPTS !!!
The Scripts in this Directory are currently unused and are therefore unsupported! They are not getting updated as long as they are in the "UNSUPPORTED" state! All Scripts were tested to be functional at the time of publishing.

## About LinuxScripts
(C) Copyright 2013-2021 Oliver Niebuhr

Very basic Scripts to
1. Clone (Download) the Source Code of Libraries and Frameworks like ICU, LLVM, OpenSSL and Qt from their Git Repositories
2. Build these Libraries and Frameworks

May they be useful to you in one way or another.

All Scripts are written to compliment each other. Example: Locally cloned Repositories will be found under

$HOME/Dev/GitRepos/[Name-Of-The-Repository]

which equates to '/home/[User Name]/Dev/GitRepos/[Name-Of-The-Repository]'

The Build Scripts will search for the Libraries in this Directory.

Also, this Repository serves as some sort of Transparency List. Until the "Pirateparty-Helper-Tool" (WIP Name...) Repository is ready to be published, it will only be updated when necessary.

## All !!! UNSUPPORTED SCRIPTS !!! are basically functional. Read the dedicated Sections for Details
All Scripts were created and successfully tested under the following Linux and Compiler Versions:
1. Manjaro (Arch Linux based), KDE 5, Stable Repository, x86_64
2. GNU GCC/G++ Compiler, 10.2 or newer, x86, x86_64

Other Linux Distributions are currently untested by me.

Newer GNU GCC/G++ Versions should be compatible too.

Older Versions should work if they are not too old. What too old means, has not been fully tested.

You probably need to remove or modify some Compiler Flags for newer and older Versions.

Other Compiler Variants like Clang-GCC are untested and therefore not supported by me!

All Scripts are heavily personalized and have a lot of Compiler Flags to fit my personal needs.

Please look at the different Sections about the Build Scripts for Version Numbers - if mentioned.

## LICENSE
The Content in this Repository is Dual-Licensed under "The Unlicense" (Public Domain) OR under the "CC0-1.0 Universal License" (Public Domain with Fallback Mechanism).

If you live in a Jurisdiction like Germany or anywhere else outside the USA which
1. does not acknowledge Public Domain at all OR
2. does only acknowledge some Parts of Public Domain

and therefore The Unlicense is deemed illegal or invalid, choose the CC0-1.0 Universal License with the Fallback Mechanism.

Simplified Explanation: Both Licenses allow you to do with these Scripts whatever you want without mentioning my Name ('without giving me Credit' also known as 'No Attribution').

The Fallback Mechanism is made for Jurisdictions like Germany etc., to allow me (the 'Licensor') to give away all my Rights as far as the local Laws allow me to do so. So that you (the 'Licensee') can do whatever you want with whatever I have published under these License(s).

The huge Amount of different Jurisdictions and Copyright Laws are a horrible Mess and need these specific Statements unfortunately.

Also: Repositories got removed or hidden if they do not contain a License Document.

And as always the usual necessary Disclaimer: I AM NOT A LAWYER AND THIS IS NOT LEGAL ADVICE. IF YOU NEED LEGAL ADVICE, CONSULT A LICENSED ATTORNEY.

Here you can find the different License Texts: The Unlicense (Public Domain):
1. THE_UNLICENSE.txt: [In this Repository](THE_UNLICENSE.txt)
2. The Unlicense: Original at the Authors Website: https://unlicense.org/
3. The Unlicense: At SPDX.org: https://spdx.org/licenses/Unlicense.html

CC0-1.0 Universal (Public Domain with Fallback Mechanism):
1. CC0-1.0.txt: [In this Repository](CC0-1.0.txt)
2. CC0-1.0: Full Text at CreativeCommons.org: https://creativecommons.org/publicdomain/zero/1.0/legalcode.txt
3. CC0-1.0: Human-Readable Summary - English at CreativeCommons.org: https://creativecommons.org/publicdomain/zero/1.0/
4. CC0-1.0: Human-Readable Summary - German Translation at CreativeCommons.org: https://creativecommons.org/publicdomain/zero/1.0/deed.de
5. CC0-1.0: At SDPX.org: https://spdx.org/licenses/CC0-1.0.html

## Questions?
Send me a Message. I will try to reply within 96 hours. Sometimes sooner, sometimes later.
1. Click on the Button "New Issue" and use the "Question" Form to create a new Issue marked as Question: https://github.com/MeerMusik/LinuxScripts/issues/
2. Contact Form on my personal Website (German): https://oliverniebuhr.de/kontakt
3. eMail: MailTo Link: [Opens your eMail Program](mailto:gitrepos@oliverniebuhr.de?subject=LinuxScripts-Unsupported-Scripts)
4. Contact me on Twitter: https://twitter.com/MeerMusik

Remember that Tweets are always public! Everyone can read what you write! If you need to send Personal Infos, send me a Direct Message!

## Contributing
The full Contribution Rules can be found in the
1. CONTRIBUTING.md: [In this Repository](CONTRIBUTING.md)

## Bug Reports, Merge Requests etc.
Found a Bug? Infos are outdated? Please take a look at the Issue List first! If your Topic is not listed, feel free to create a new one:
1. LinuxScripts - Issue List: https://github.com/MeerMusik/LinuxScripts/issues/

Alternatively: Use one of the Options under "Questions?" (2 Sections above).

## List of Scripts

### AKKomPolTool / Pirates-Little-Helper - (WIP NAME. PLACEHOLDER)
The Links to the Files have been removed while the Tool will be rewritten from Scratch with another Framework.

The old Source Code based on the Qt Framework will not be published: It is discontinued and in 'Recycle Mode'.

Info:
1. My personal Website (German): https://oliverniebuhr.de
2. FAQ on my Website (German): https://oliverniebuhr.de/

Get the Source Code:
1. [I AM AN EMPTY PLACEHOLDER! IGNORE ME!](I AM AN EMPTY PLACEHOLDER! IGNORE ME!)
2. [I AM AN EMPTY PLACEHOLDER! IGNORE ME!](I AM AN EMPTY PLACEHOLDER! IGNORE ME!)

Build it: The real Build Scripts will be added when they are ready...
1. [I AM AN EMPTY PLACEHOLDER! IGNORE ME!](I AM AN EMPTY PLACEHOLDER! IGNORE ME!)
2. [I AM AN EMPTY PLACEHOLDER! IGNORE ME!](I AM AN EMPTY PLACEHOLDER! IGNORE ME!)

### Botan - Crypto and TLS for Modern C++
Status: Unused. Kept just in case.<br>
Version: Master Branch

Infos:
1. Documentation: https://botan.randombit.net/handbook/building.html
2. Download Source Code directly: https://github.com/randombit/botan/releases

Get the Source Code:
1. Clone Git Repository to local Drive: [NewBotanGit.sh](Botan/NewBotanGit.sh)
2. Update local Git Repository: [UpdateBotanGit.sh](Botan/UpdateBotanGit.sh)

Build it:
1. X86_64, Dynamic, Release: [Botanx64Release.sh](Botan/Botanx64Release.sh)
2. X86, Dynamic, Release: [Botanx86Release.sh](Botan/Botanx86Release.sh)

### CMake - Build Management Tool. Used to build GammaRay, Qt 6.x and other
Status: Used when a Tool or Library supports it or has it set as a fixed Dependency.<br>
Version: Master Branch

I build only from Source, when I need to test specific fixes or a new Feature.

I usually use the latest prebuilt x86_64 Binaries (ZIP Archive) from https://cmake.org/download/<br>
If you are unsure: Download the ZIP Archive: No hassle with Installation and Uninstallation. Also very simple to overwrite all the Files with a newer Version that way

Infos:
1. Official Documentation: https://cmake.org/cmake/help/latest/
2. Community Wiki: https://gitlab.kitware.com/cmake/community/-/wikis/home

Get the Source Code:
1. Clone Git Repository to local Drive: [NewCMakeGit.sh](CMake/NewCMakeGit.sh)
2. Update local Git Repository: [UpdateCMakeGit.sh](CMake/UpdateCMakeGit.sh)

Build it:
1. X86_64, Static, Release: [CMakex64ReleaseStatic.sh](CMake/CMakex64ReleaseStatic.sh)

### GammaRay - Introspection Tool for the Qt Framework
Status: No longer used<br>
Version: Master Branch

Infos:
1. About GammaRay: https://www.kdab.com/development-resources/qt-tools/gammaray/
2. Documentation: https://docs.kdab.com/gammaray-manual/latest/
3. Download Source: https://github.com/KDAB/GammaRay/releases

Get the Source Code:
1. Clone Git Repository to local Drive: [NewGammaRayGit.sh](GammaRay/NewGammaRayGit.sh)
2. Update local Git Repository: [UpdateGammaRayGit.sh](GammaRay/UpdateGammaRayGit.sh)

Build it:
1. Qt5, X86_64: [GammaRayx64.sh](GammaRay/GammaRayx64.sh)

Other Scripts:
1. Script to start GammaRay: [StartGammaRayx64.sh](GammaRay/StartGammaRayx64.sh)

### ICU - International Components for Unicode
Status: Currently unused. If it is still needed, has to be determined.<br>
Version: maint/maint-69

Activated in the Qt 5 + 6 Build Scripts. But often optional depending on the local Language of the Host and / or Target Operating System. Simply disable it if you have no use for it.

Infos:
1. Documentation: http://site.icu-project.org/docs
2. Download Source Archive or prebuilt Binaries directly: http://site.icu-project.org/download

Get the Source Code:
1. Clone Git Repository to local Drive: [NewICUGit.sh](ICU/NewICUGit.sh)
2. Update local Git Repository: [UpdateICUGit.sh](ICU/UpdateICUGit.sh)

You also need [Git Large File Storage Extension](https://git-lfs.github.com/)<br>
Need help setting up Git LFS? [Follow the Section "Detailed Instructions" -> "Prerequisites: Git and Git LFS" at the ICU Project Site](http://site.ICU-project.org/repository)

Build it:
1. X86_64, Debug: [ICUx64Debug.sh](ICU/ICUx64Debug.sh)
2. X86_64, Release: [ICUx64Release.sh](ICU/ICUx64Release.sh)
3. X86, Debug: [ICUx86Debug.sh](ICU/ICUx86Debug.sh)
4. X86, Release: [ICUx86Release.sh](ICU/ICUx86Release.sh)

### Ninja - The Ninja Build System
Status: Heavily recommended! I use it whenever possible. Not used with Ultimate++

Infos:
1. Documentation: https://ninja-build.org/manual.html
2. Download Source Archive or prebuilt Binaries directly: https://github.com/ninja-build/ninja/releases

Get the Source Code:
1. Clone Git Repository to local Drive: [NewNinjaGit.sh](Ninja/NewNinjaGit.sh)
2. Update local Git Repository: [UpdateNinjaGit.sh](Ninja/UpdateNinjaGit.sh)

Build it:
* [X86_64, Static, Release: Ninjax64Release.sh](Ninjax64Release.sh)

Attention: You need Python for the Bootstrapping Script!

### OpenSSL - Cryptography and SSL/TLS Toolkit
Status: Qt Build it: Explicitly linked against the specific Version created by the below OpenSSL Scripts.

1. Qt: Dynamic Builds: x86_64 (64-bit) in the QtWebEngine Module (The internal "Browser" in the originally planned Tool) to enable secure Communication
2. Qt: Static Builds: x86 (32-Bit) and x86_64 (64-bit) to create static builds of the QtIFW (Qt Installer Framework). Needed for secure Communication through TLS 
3. You can disable it or just switch from "-openssl-linked" to "-openssl" and remove all References to the OpenSSL Includes and Libs in the Scripts. Then, Qt will use the first Version it will find on the OS
4. Disabling explicitly linking also makes it easier to switch out the OpenSSL Libraries without the need of recompiling Qt for you and the Enduser
5. If it is illegal in your Jurisdiction to use secure Communication: Get rid of these crooks which acting as your Government. Alternatively: Switch "-openssl-linked" with "-no-openssl" to disable OpenSSL completely

Additional Infos:
1. The Scripts build a Version which only supports DTLS 1.2 and TLS 1.2 and 1.3
2. A lot of the Protocols, which I never intended to use, are disabled as well. Everything that is disabled by Default, is less pressure, to keep up with possible Security holes in OpenSSL. Simple as that.

Status Rust: Some planned Functionality in the Tool will require TLS. If Rust bindings exist, I will use this. Or Botan. Or something else with an easy Syntax :)

Version: 1.1.1 Branch

Infos:
1. Documentation: https://www.openssl.org/docs/
2. Download Source Archive or prebuilt Binaries directly: https://www.openssl.org/source/

Get the Source Code:
1. Clone Git Repository to local Drive: [NewOpenSSLGit.sh](OpenSSL/NewOpenSSLGit.sh)
2. Update local Git Repository: [UpdateOpenSSLGit.sh](OpenSSL/UpdateOpenSSLGit.sh)

Build it:
1. X86_64, Dynamic, Debug: [OpenSSLx64Debug.sh](OpenSSL/OpenSSLx64Debug.sh)
2. X86_64, Dynamic, Release: [OpenSSLx64Release.sh](OpenSSL/OpenSSLx64Release.sh)
3. X86_64, Static, Release: [OpenSSLx64ReleaseStatic.sh](OpenSSL/OpenSSLx64ReleaseStatic.sh)
4. X86, Dynamic, Debug: [OpenSSLx86Debug.sh](OpenSSL/OpenSSLx86Debug.sh)
5. X86, Dynamic, Release: [OpenSSLx86Release.sh](OpenSSL/OpenSSLx86Release.sh)
6. X86, Release, Static: [OpenSSLx86ReleaseStatic.sh](OpenSSL/OpenSSLx86ReleaseStatic.sh)

### Qt Framework - Cross-Platform Application Development Framework
Status: No longer used

Version:
1. Qt 5: 5.15 Branch
2. Exception: Static builds to create the QtIFW: 5.12 Branch
3. The QtIFW is always a bit behind when it comes to supporting the latest Version of Qt. Reason: Older Qt Versions are usually more stable ("bug free").
4. Qt 6: DEV Branch. All future Qt 6 Versions are created from this Branch

Infos:
1. Documentation: https://wiki.qt.io/Main
2. Download Source Archive or prebuilt Binaries directly: https://download.qt.io/official_releases/qt/

Get the Source Code:
1. Get Source from 5.12 Branch - older Version for QtIFW: [NewQt5QtIFWCompatibleGit.sh](QtProject/NewQt5QtIFWCompatibleGit.sh)
2. Get Source from 5.15 Branch: [NewQt5Git.sh](QtProject/NewQt5Git.sh)
3. Get Source from DEV Branch (Qt 6): [NewQt6Git.sh](QtProject/NewQt6Git.sh)
4. Update Source from 5.12 Branch - older Version for QtIFW: [UpdateQt5QtIFWCompatibleGit.sh](QtProject/UpdateQt5QtIFWCompatibleGit.sh)
5. Update Source from 5.15 Branch: [UpdateQt5Git.sh](QtProject/UpdateQt5Git.sh)
6. Update Source from DEV Branch (Qt 6): [UpdateQt6Git.sh](QtProject/UpdateQt6Git.sh)

Build it:
1. 5.15 Branch: Build for X86_64, Debug only: [Qt5x64Debug.sh](QtProject/Qt5x64Debug.sh)
2. 5.15 Branch: Build for X86_64, Release only: [Qt5x64Release.sh](QtProject/Qt5x64Release.sh)
3. 5.12 Branch: Build for X86_64, Static, Release: [Qt5x64ReleaseStatic.sh](QtProject/Qt5x64ReleaseStatic.sh)
4. 5.15 Branch: Build for X86, Debug only: [Qt5x86Debug.sh](QtProject/Qt5x86Debug.sh)
5. 5.15 Branch: Build for X86, Release only: [Qt5x86Release.sh](QtProject/Qt5x86Release.sh)
6. 5.12 Branch: Build for X86, Release, Static: [Qt5x86ReleaseStatic.sh](QtProject/Qt5x86ReleaseStatic.sh)
7. DEV Branch (Qt 6): Build for X86_64, Debug and Release: [Qt6x64DebugRelease.sh](QtProject/Qt6x64DebugRelease.sh)
8. DEV Branch (Qt 6): Build for X86, Debug and Release: [Qt6x86DebugRelease.sh](QtProject/Qt6x86DebugRelease.sh)

#### Qt 5 and selfbuilt ICU and OpenSSL Libraries
Because of multiple Bugs, which are open since at least 2014 and 2016, Qt Configure ignores everything you set as the Library Paths for ICU and OpenSSL. It always link against the System Libraries. If you prefer to use those anyway: Have Fun

Also, Qt 5.15.3 and newer Patch Releases are only available for Commercial Customers. Open Source Users are stuck with a very buggy 5.15.2 Version.

Qt 5 Static Builds without OpenSSL are building fine. But as the same Bug exist as in the newer Qt 5 Versions, detecting the provided static OpenSSL Libraries fails. Which makes it useless for an Online Installer for my planned use case.

For als Build Variants:
1. To completely disable ICU: Change the configure Flag '-icu' to '-no-icu'
2. To completely disable OpenSSL: Change the configure Flag '-openssl-linked' to '-no-openssl'

#### Qt 5.15 has LTS Status but is also the last 5.x Version
If you really want to use Qt and you do not have any specific reason to use Qt 5: Switch to Qt 6.x

Qt 5.15 is the last Version for Qt 5. Qt 6 is under active Development.

#### Qt 6 and the CMake Build System
As of April 2021: Even after the switch to the CMake Build System, the Qt MKSPECS are adding the GCC Flag "-m64" to all x86 builds. Result: The Linker wants to link x86_64 Libraries against the x86 Variant. Which obviously does not work.

I tried a couple of different things like adding Flags and Parameters like "-m32" but gave up after a couple hours: As I moved on from Qt, I do not want to waste any more time trying to fix their mess. 32-Bit is not fully supported on all Linux Platforms anyway.

#### The Qt Scripts are getting no more updates!
This means:
1. The Qt Scripts are unused now
2. The Qt 5 Scripts are cloning the 5.15 LTS Branch
3. The latest Version available for Open Source Users is 5.15.2
4. Even as the Open Source Branch says 5.15.3 (or newer in the Future), it does only contain Bug Fixes for upto Version 5.15.2
5. The only updates Open Source Users will get for the Lifetime of 5.15 LTS, are Chromium Security Updates for the QtWebEngine Module
6. The Qt 6 Scripts are based on the DEV Branch. As of April 2021: The Qt 6.x Development happens in this Branch

#### QtWebEngine and 32-Bit
I have never used a 32-Bit Linux Installation. I dont know if you can compile QtWebEngine 32-Bit on a 32-Bit Linux. The official Notes at least dont list any such Limitations.
1. [See the Notes for the different Platforms](https://doc.qt.io/qt-5/qtwebengine-platform-notes.html)

#### QtWebEngine and Python 3
As of May 2021: Chromium still does not fully support building with Python 3! That means QtWebEngine can only be build with Python 2! The Chromium Project is working on the [Switch to Python 3](https://bugs.chromium.org/p/chromium/issues/detail?id=942720#c78)

Make sure the Path Settings are pointing to the Python 2 Directory. Either change the Environment Variable or modify any used Scripts accordingly.
* Not necessary when you are following the Directory Structure used in the provided Build Scripts

1. Python 2.7.0 is the minimum Version required to build the Qt Framework
2. Python 2.7.5 is the minimum Version required to build the QtWebEngine Module with Qt 5 (The Qt 6 Status is unknown)
3. Python 2 is End-Of-Life. The latest Version is 2.7.18
4. For more Details read the "Other Tools" Section above

#### Example: For Manjaro (Arch Linux based) with KDE 5 Desktop
If you have not already done so:
1. Install the latest, official Python 2.7.x Version available to you
  * Python 2.7.0 is the minimum Version required to build the Qt Framework
  * Python 2.7.5 is the minimum Version required to build the QtWebEngine Module with Qt 5 (The Qt 6 Status is unknown)
  * Python 2 is End-Of-Life. The latest Version is 2.7.18
2. For more Details read the "Other Tools" Section above
3. Create a workaround to detect Python 2, when it is invoked from specific Directories

For convenience, you can copy the Script
* [QtProject/python](python)

from this Repository to
'/usr/local/bin/'

For example:
If 'python' does not yet exist:
sudo cp --verbose $HOME/Dev/GitRepos/LinuxScripts/QtProject/python /usr/local/bin/

If 'cp' fails to overwrite the already existing 'python' Script, try:
sudo cp --force --remove-destination --verbose $HOME/Dev/GitRepos/LinuxScripts/QtProject/python /usr/local/bin/

Yes, sometimes the combination of '--force' and '--remove-destination' can be necessary. Happened to me in very rare cases.

The Target Folder can vary on other Linux Distributions.

Open and modify the Script with a Text Editor of your choice. The Directories in this Script are the ones used by me. Make sure to change them, so they contain the Directories, in which you build the Qt Framework.

3. The File 'python' must be executable
  * Run: sudo chmod u+x /usr/local/bin/python
  * Or use a File Manager of your choice. Select "Administrator Actions" from the Context Menu (Right Mouse Button) for "Copy" and "Paste"

Positive Side Effect: You can have Python3 and Python2 installed at the same time.

#### Origin:
The Script was copied from an Example on the Internet and modified for my use case. It was definitely made available for public use. Unfortunately, I forgot where I found it though - probably on
1. [stackoverflow.com](https://stackoverflow.com)

### QtIFW - Qt Installer Framework
Status: Currently unused. I dont know if I will still use the QtIFW for the Rust Version of the Tool.

Version: Master Branch

Infos:
1. Documentation: https://doc.qt.io/qtinstallerframework/index.html
2. Download Source Archive or prebuilt Binaries directly: https://download.qt.io/official_releases/qt-installer-framework/

Get the Source Code:
1. Get Source from code.qt.io: [NewQtIFWGit.sh](QtIFW/NewQtIFWGit.sh)
2. Update Source from code.qt.io: [UpdateQtIFWGit.sh](QtIFW/UpdateQtIFWGit.sh)

Build it:
1. Build X86_64, Static: [QtIFWx64ReleaseStatic.sh](QtIFW/QtIFWx64ReleaseStatic.sh)
2. Build X86, Static: [QtIFWx86ReleaseStatic.sh](QtIFW/QtIFWx86ReleaseStatic.sh)

## Other Tools
1. NASM - Netwide Assembler. Optional for OpenSSL but highly recommended
* [Download the latest prebuilt Binaries](https://www.nasm.us/pub/nasm/releasebuilds/)

2. Perl
* Required as an Interpreter to build the Qt Framework
* Minimum supported Version by Qt: 5.14

Perl comes preinstalled on many Linux Distributions. Open a Console / Shell and type

perl --version

to see which Version is installed on your Distribution.

If Perl is not found, install the prebuilt Binaries provided by your Distribution. Check your Distribution specific Installer on how to do that.

3. Python
* Required as an Interpreter to build the Qt Framework
* Minimum supported Version by Qt: 2.7.0
* Version 2.7.5 or later is required to build QtWebEngine
* Chromium (and therefore QtWebEngine) still do not Support Python 3!
* Build Qt with QtWebEngine: Install the latest 2.7 Version available for your Operating System
* Build Qt without QtWebEngine: Use the latest Python Version available for your Operating System

Python comes preinstalled on many Linux Distributions. Open a Console / Shell and type

python --version

to see which Version is installed on your Distribution.

If Python is not found, install the prebuilt Binaries provided by your Distribution. Check your Distribution specific Installer on how to do that.

## WindowsScripts
I also published my Windows Scripts Dual-Licensed under "The Unlicense" (Public Domain) OR under the "CC0-1.0 Universal License" (Public Domain with Fallback Mechanism):
1. WindowsScripts: [Repository at GitHub](https://github.com/MeerMusik/WindowsScripts)
