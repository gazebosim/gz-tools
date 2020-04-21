# Ignition tools

** Ignition entry point for using all the suite of ignition tools.**

Ignition tools provide the `ign` command line tool that accepts multiple
subcommands. Each subcommand is implemented in a plugin that belongs to a
specific Ignition project. For example, all the commands that start with
`ign topic ...` will be implemented by the Ignition Transport library.

  [http://ignitionrobotics.org](http://ignitionrobotics.org)

## Dependencies

The following dependencies are required to compile ignition-tools from
source:

 - cmake
 - git
 - ruby-ronn
 - ruby-dev

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
