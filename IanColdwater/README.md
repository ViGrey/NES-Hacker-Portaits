# Hacker Portrait for NES - Ian Coldwater

An NES ROM portrait of Ian Coldwater

**_"NES Hacker Portrait - Ian Coldwater" was created by Vi Grey and is licensed under the BSD 2-Clause License._**

### Description:
An NES ROM in the Hacker Portrait for NES series.  This portrait is of Ian Coldwater.

------
## **RUNNING THE NES ROM ON AN EMULATOR**

This NES ROM will run on essentially any NES emulator that can run Super Mario Bros., as this ROM uses the same ROM Mapper type as Super Mario Bros.  


------
## **BUILDING THE NES ROM SOURCE CODE**

### Build Platforms:
- \*BSD
- Linux
- macOS

### NES ROM Build Dependencies:
- **asm6** (You'll probably have to build asm6 from source.  **Make sure the asm6 binary is named `asm` and that the binary is executable and accessible in your PATH**. The source code can be found at http://3dscapture.com/NES/asm6.zip)
- **gmake** (make)
- **zip**

### Build NES ROM:
From a terminal, go to the the main directory of this project (the directory this README.md file exists in).  You can then build the NES ROM with the following command.

```sh
make
```

The resulting NES ROM will be located at **bin/build/IanColdwater.nes**

### Clean Build Environment:
If you used `make` to build the NES ROM, you can run the following command to clean up the build environment.
```sh
make clean
```
------
## **EXTRAS**
#### Unzipping the ROM:
The NES ROM file at **bin/IanColdwater.nes** (or you built the NES ROM yourself, **bin/build/IanColdwater.nes**) will also be a functioning ZIP file that contains its own source code when unzipped.

#### Modify Hair/Shirt/Lip color
Press **LEFT** or **RIGHT** on Controller 1 or Controller 2 to cycle through hair colors.  Press **DOWN** or **UP** on Controller 1 or 2 to cycle through shirt colors.  Press **B** or **A** on Controller 1 or 2 to cycle through lip colors.  Press **START** or **SELECT** to set hair/shirt/lip colors back to the default palette values.

------
## **LICENSE**
```
Copyright (C) 2020, Vi Grey
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:

    1. Redistributions of source code must retain the above copyright
       notice, this list of conditions and the following disclaimer.
    2. Redistributions in binary form must reproduce the above copyright
       notice, this list of conditions and the following disclaimer in the
       documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY AUTHOR AND CONTRIBUTORS \`\`AS IS'' AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL AUTHOR OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
SUCH DAMAGE.
```
