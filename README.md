# Ignition tools: Ignition entry point for using all the suite of ignition tools

**Maintainer:** caguero AT openrobotics DOT org

[![GitHub open issues](https://img.shields.io/github/issues-raw/gazebosim/gz-tools.svg)](https://github.com/gazebosim/gz-tools/issues)
[![GitHub open pull requests](https://img.shields.io/github/issues-pr-raw/gazebosim/gz-tools.svg)](https://github.com/gazebosim/gz-tools/pulls)
[![Discourse topics](https://img.shields.io/discourse/https/community.gazebosim.org/topics.svg)](https://community.gazebosim.org)
[![Hex.pm](https://img.shields.io/hexpm/l/plug.svg)](https://www.apache.org/licenses/LICENSE-2.0)

Build | Status
-- | --
Test coverage | [![codecov](https://codecov.io/gh/gazebosim/gz-tools/branch/ign-tools2/graph/badge.svg)](https://codecov.io/gh/gazebosim/gz-tools)
Ubuntu Bionic | [![Build Status](https://build.osrfoundation.org/buildStatus/icon?job=ignition_tools-ci-ign-tools2-bionic-amd64)](https://build.osrfoundation.org/job/ignition_tools-ci-ign-tools2-bionic-amd64)
Homebrew      | [![Build Status](https://build.osrfoundation.org/buildStatus/icon?job=ignition_tools-ci-ign-tools2-homebrew-amd64)](https://build.osrfoundation.org/job/ignition_tools-ci-ign-tools2-homebrew-amd64)
Windows       | [![Build Status](https://build.osrfoundation.org/buildStatus/icon?job=ign_tools-ign-1-win)](https://build.osrfoundation.org/job/ign_tools-ign-1-win)

Ignition tools provide the `ign` command line tool that accepts multiple
subcommands. Each subcommand is implemented in a plugin that belongs to a
specific Ignition project. For example, all the commands that start with
`ign topic ...` will be implemented by the Gazebo Transport library.

[http://gazebosim.org](http://gazebosim.org)

**Note** While `ign-tools` is currently building on Windows 10, the command line utilities are not yet supported.

# Installation

These instructions are for installing only Gazebo Tools.
If you're interested in using all the Ignition libraries, check out this [Ignition installation](https://gazebosim.org/docs/latest/install).

We recommend following the Binary Installation instructions to get up and running as quickly and painlessly as possible.

The Source Installation instructions should be used if you need the very latest software improvements, you need to modify the code, or you plan to make a contribution.

Windows support: Currently, the library builds on Windows, but the `ign` command-line tool is not readily functional. We are investigating this.

## Binary Installation

### Ubuntu

On Ubuntu systems, `apt-get` can be used to install `ignition-tools`:
```
sudo apt install libignition-tools<#>-dev
```

Be sure to replace `<#>` with a number value, such as 2 or 3, depending on
which version you need, or leave it empty for version 1.

### Windows

Install [Conda package management system](https://docs.conda.io/projects/conda/en/latest/user-guide/install/download.html).
Miniconda suffices.

Create if necessary, and activate a Conda environment:
```
conda create -n ign-ws
conda activate ign-ws
```

Install `ignition-tools`:
```
conda install libignition-tools<#> --channel conda-forge
```

Be sure to replace `<#>` with a number value, such as 2 or 3, depending on
which version you need, or leave it empty for version 1.

## Source Installation

## UNIX

### Prerequisites

The following dependencies are required to compile ignition-tools from
source:

 - cmake
 - git

### Build from Source

Standard installation can be performed in UNIX systems using the following
steps:
```
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/usr
sudo make install
```

### Bash auto-completion

Source the [etc/ign.bash_completion.sh](etc/ign.bash_completion.sh) script in your bash terminal window to enable auto-complete:
~~~
. etc/ign.bash_completion.sh
~~~

### Uninstallation

To uninstall the software installed with the previous steps:
```
cd build
sudo make uninstall
```

## Windows

### Prerequisites

Install [Conda package management system](https://docs.conda.io/projects/conda/en/latest/user-guide/install/download.html).
Miniconda suffices.

Create if necessary, and activate a Conda environment:
```
conda create -n ign-ws
conda activate ign-ws
```

Install prerequisites:
```
conda install ruby git cmake --channel conda-forge
```

### Build from Source

This assumes you have created and activated a Conda environment while installing the Prerequisites.

1. Configure and build
  ```
  mkdir build
  cd build
  cmake .. -DBUILD_TESTING=OFF  # Optionally, -DCMAKE_INSTALL_PREFIX=path\to\install
  cmake --build . --config Release
  ```

2. Optionally, install
  ```
  cmake --install . --config Release
  ```

# Contributing

Please see the [contribution guide](https://gazebosim.org/docs/all/contributing).

# Code of Conduct

Please see
[CODE_OF_CONDUCT.md](https://github.com/gazebosim/gz-sim/blob/main/CODE_OF_CONDUCT.md).

# Versioning

This library uses [Semantic Versioning](https://semver.org/). Additionally, this library is part of the [Gazebo project](https://gazebosim.org) which periodically releases a versioned set of compatible and complimentary libraries. See the [Gazebo website](https://gazebosim.org) for version and release information.

# License

This library is licensed under [Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0). See also the [LICENSE](https://github.com/gazebosim/gz-sim/blob/main/LICENSE) file.
