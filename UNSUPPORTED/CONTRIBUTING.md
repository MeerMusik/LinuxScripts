[[_TOC_]]
# !!! UNSUPPORTED SCRIPTS !!!
The Scripts in this Directory are currently unused and are therefore unsupported! They are not getting updated as long as they are in the "UNSUPPORTED" state! All Scripts were tested to be functional at the time of publishing.

I will accept Merge Request / Commits under the additional following Conditions:
1. The Script must be fully working on MSYS2 with MinGW-w64 (x86, x86_64 or both) - so that I am able to test them
2. Other Compiler Variants: Ported Scripts will be accepted after I was able to test them
3. New Variants of Scripts ("Ports") will be accepted after I was able to test them. But:
* A conversion of an existing Script in example from GCC to Clang will not be accepted! The Goal is to keep the original Scripts until I am absolutely sure, that they will not be used again

When in doubt: Contact me :)

## LinuxScripts - Contribution Rules
(C) Copyright 2013-2021 Oliver Niebuhr

## LICENSE
All Submissions will automatically become Dual-Licensed under "The Unlicense" (Public Domain) OR under the "CC0-1.0 Universal License" (Public Domain with Fallback Mechanism)

If you live in a Jurisdiction like Germany or anywhere else outside the USA which
1. does not acknowledge Public Domain at all OR
2. does only acknowledge some Parts of Public Domain

and therefore The Unlicense is deemed illegal or invalid, choose the CC0-1.0 Universal License with the Fallback Mechanism.

The Fallback Mechanism is made for Jurisdictions like Germany etc., to allow me (the 'Licensor') to give away all my Rights as far as the local Laws allow me to do so. So that you (the 'Licensee') can do whatever you want with whatever I have published under these License(s).

The huge Amount of different Jurisdictions and Copyright Laws are a horrible Mess and need these specific Statements unfortunately.

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
2. eMail: MailTo Link: [Opens your eMail Program](mailto:gitrepos@oliverniebuhr.de?subject=LinuxScripts-Unsupported-Scripts-Question-About-Contributing)
3. Contact me on Twitter: https://twitter.com/MeerMusik
4. Contact Form on my personal Website (German): https://oliverniebuhr.de/kontakt

Remember that Tweets are always public! Everyone can read what you write! If you need to send Personal Infos, send me a Direct Message!

## Issue List - Working on Issues - Status of Issues
Status on Issues can be outdated for multiple Reasons. Usually because lack of Time. Or I have simply forgot to update the Status.
1. LinuxScripts - Issue List: https://github.com/MeerMusik/LinuxScripts/issues/

Please keep in Mind:
1. It is always possible, that the Issue has already been fixed or is being worked on but the Status is outdated
2. Post a comment in the specific Issue Thread and let me know that you would like to work on it
3. Alternatively: Contact me through one of the Options mentioned above
4. I will usually Reply within 96 Hours and let you know what the current Status is and / or update the Label when it makes sense

### How to speed up the Merge Request Review
Always base your Merge Request on the latest Main Branch Commit.

If I push a change that interferes with your Commit: Please rebase!
1. I will ask you to do so anyway - otherwise there will be a Merge Conflict
2. File Encoding for all non-Binary Files is UTF-8 WITHOUT Byte-Order-Mark ("BOM")
3. For new Functions or bigger Overhauls: The more Infos you put in the Request, the faster I can check for possible Problems and also give it a more accurate Priority Rating

If I have a Question about your Merge / Pull Request, please answer within 30 Days or the Request will be closed.
1. If you just need more Time to do $something, just post a Comment and let me know
2. You are free to reopen the Issue. But as time moves on, it is most likely that other things got more Priority in the meantime
  * Which simply means: I will take a quick look at it at some point. But depending on the Size of the Change, it can get low Priority
  * Exception: If your Commit is fixing a severe Bug like Crash-To-Desktop (CTD) etc.