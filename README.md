# IDA Pro plugin for loading .MAP symbol files

Loads a VC/Borland/Dede/GCC/IDA `.map` file into IDA Database.

## What is the MAP file

The `.map` file may be generated during compilation, and contain some of debug info (function names, global variables,
in some cases locals as well).

In the past, it was generated automatically by many compilers. For some programs, it was included in a pre-release
version, or even in final release.

Todays compiles still have ability to enable `.map` file generation, ie:

* Watcom linker has `OPTION MAP[=map_file]` command line switch
* GCC linker has `-Xlinker -Map=output.map` command line switch
* Microsoft VC linker has `/MAP[:filename]` command line switch

## More information

See src/LoadMap.cpp for credits, license and changelog.

## Installation

* Copy loadmap.dll to IDA plugins folder
* Open any PE/LE file project
* Click Load MAP with Shift to see options

## Building

The building requires IDA Pro SDK.

**Windows**

Copy the project to IDA SDK `plugins/loadmap` folder, then open SLN file and build it with Visual Studio.

To rebuild from command line, check how the Github Actions do that. You will need GNU tools including make, and VC compiler from Visual Studio.

**Linux**

* Copy the plugin folder into your idasdk/src/plugins/ directory
* Set the IDA environment variable to point to your idasdk/src/ folder: `export IDA=/path/to/idasdk/src/`
* Run `make` inside the plugin folder
* Copy the built plugin from idasdk/src/bin/plugins/ to ~/.idapro/plugins/ (rename to loadmap64.so for 64-bit IDA)

## Troubleshooting

If the plugin does not show in "Edit" -> "Plugins", then:
* Make sure you have a code project opened
* Check IDA "Output" console, there should be a message either confirming the load or with error
* If the "Output" console shows "Cannot load certain module", you probably lack Visual C++ Redistributable Package
* Check the "Issues" tab of this project on Github for more info

## Known issues

Currently it doesn't understand MAP files with 64-bit offsets - new versions of GCC produce files with such long offsets.
WA for this is to just remove excessive zeros from offsets in MAP file before loading it.
