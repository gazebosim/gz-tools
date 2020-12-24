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

### Windows

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

## Installation

### UNIX

Standard installation can be performed in UNIX systems using the following
steps:

```
mkdir build/
cd build/
cmake .. -DCMAKE_INSTALL_PREFIX=/usr
sudo make install
```

### Windows

This assumes you have created and activated a Conda environment while installing the Dependencies.

1. Configure and build

    ```
    mkdir build
    cd build
    cmake .. -DBUILD_TESTING=OFF  # Optionally, -DCMAKE_INSTALL_PREFIX=path\to\install
    cmake --build . --config Release
    ```

1. Optionally, install

    ```
    cmake --install . --config Release
    ```

## Uninstallation

### UNIX

To uninstall the software installed with the previous steps:

```
cd build/
sudo make uninstall
```
