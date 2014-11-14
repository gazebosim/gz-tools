# Ignition tools

** Ignition entry point for using all the suite of ignition tools.**

Ignition tools provide the `ign` tool that accepts multiple subcommands. Each
subcommand is implemented in a plugin that belongs to a specific inition
project. For example, all the commands that start with `ign topic ...` will be
implemented by the ignition transport library.

  [http://ignitionrobotics.org](http://ignitionrobotics.org)

## Continuous integration

Please refer to the [drone.io
job](https://drone.io/bitbucket.org/ignitionrobotics/ign-tools).

[![Build Status](https://drone.io/bitbucket.org/ignitionrobotics/ign-tools/status.png)](https://drone.io/bitbucket.org/ignitionrobotics/ign-tools/latest)


## Dependencies

The following dependencies are required to compile ignition-tools from
source:

 - cmake
 - libtclap-dev
 - mercurial
 - ruby-ronn
 - C++ compiler with c++11 support (eg. GCC>=4.8).

## Installation

Standard installation can be performed in UNIX systems using the following
steps:

 - mkdir build/
 - cd build/
 - cmake .. -DCMAKE_INSTALL_PREFIX=/usr
 - sudo make install

## Uninstallation

To uninstall the software installed with the previous steps:

 - cd build/
 - sudo make uninstall
