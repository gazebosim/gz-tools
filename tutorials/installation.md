\page installation Installation

## Overview

This tutorial describes how to install Ignition Tools on Linux, Mac OS X and
Windows via either a binary distribution or from source.

## Ubuntu Linux

Setup your computer to accept software from
*packages.osrfoundation.org*:

```{.sh}
sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
```

Setup keys:

```{.sh}
wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -
```

Install Ignition Tools:

```
sudo apt-get update
sudo apt-get install libignition-tools1-dev
```

## Mac OS X

Ignition Tools and several of its dependencies can be compiled on OS
X with [Homebrew](http://brew.sh/) using the [osrf/simulation
tap](https://github.com/osrf/homebrew-simulation). Ignition Tools is
straightforward to install on Mac OS X 10.9 (Mavericks) or higher.
Installation on older versions requires changing the default standard
library and rebuilding dependencies due to the use of c++11. For
purposes of this documentation, I will assume OS X 10.9 or greater is in
use. Here are the instructions:

Install homebrew, which should also prompt you to install the XCode
command-line tools:

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Run the following commands:

```
brew tap osrf/simulation
brew install ignition-tools1
```

## Install from sources (Ubuntu Linux)

For compiling the latest version of Ignition Tools you will need an
Ubuntu distribution equal to 18.04 (Bionic) or newer.

Make sure you have removed the Ubuntu pre-compiled binaries before
installing from source:

```
sudo apt-get remove libignition-tools1-dev
```

Install prerequisites. A clean Ubuntu system will need:

```
sudo apt-get install mercurial cmake pkg-config python ruby-ronn libignition-cmake2-dev
```

Clone the repository into a directory and go into it:

```
hg clone https://bitbucket.org/ignitionrobotics/ign-tools /tmp/ign-tools
cd /tmp/ign-tools
```

Create a build directory and go there:

```
mkdir build
cd build
```

Configure Ignition Tools (choose either method a or b below):

```
cmake ../
```

The output from `cmake ../` may generate a number of errors and warnings
about missing packages. You must install the missing packages that have
errors and re-run `cmake ../`. Make sure all the build errors are
resolved before continuing (they should be there from the earlier step
in which you installed prerequisites).

Make note of your install path, which is output from cmake and should
look something like:

```
-- Install path: /home/$USER/local
```

Build Ignition Tools:

```
make -j4
```

Install Ignition Tools:

```
sudo make install
```

If you decide to install Ignition Tools in a local directory you'll need to
modify your `LD_LIBRARY_PATH`:

```
echo "export LD_LIBRARY_PATH=<install_path>/local/lib:$LD_LIBRARY_PATH" >> ~/.bashrc
```

### Uninstalling Source-based Install

If you need to uninstall Ignition Tools or switch back to a
debian-based install when you currently have installed the library from
source, navigate to your source code directory's build folders and run
`make uninstall`:

\code
cd /tmp/ign-tools/build
sudo make uninstall
\endcode
