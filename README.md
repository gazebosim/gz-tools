# Ignition tools

**Ignition entry point for using all the suite of ignition tools.**

Ignition tools provide the `ign` command line tool that accepts multiple
subcommands. Each subcommand is implemented in a plugin that belongs to a
specific Ignition project. For example, all the commands that start with
`ign topic ...` will be implemented by the Ignition Transport library.

[http://ignitionrobotics.org](http://ignitionrobotics.org)

# Install

These instructions are for installing only Ignition Tools.
If you're interested in using all the Ignition libraries, check out this [Ignition installation](https://ignitionrobotics.org/docs/latest/install).

We recommend following the Binary Install instructions to get up and running as quickly and painlessly as possible.

The Source Install instructions should be used if you need the very latest software improvements, you need to modify the code, or you plan to make a contribution.

Windows support: Currently, the library builds on Windows, but the `ign` command-line tool is not readily functional. We are investigating this.

## Binary Install

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

## Source Install

## UNIX

### Prerequisites

The following dependencies are required to compile ignition-tools from
source:

 - cmake
 - git
 - ruby-ronn
 - ruby-dev

### Building from source

Standard installation can be performed in UNIX systems using the following
steps:

```
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/usr
sudo make install
```

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

### Building from source

This assumes you have created and activated a Conda environment while installing the Dependencies.

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
