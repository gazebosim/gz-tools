# Gazebo Tools 1.x

### Gazebo Tools 1.5.0 (2022-08-12)

1. Bash completion for subcommand names and flags
    * [Pull request #77](https://github.com/gazebosim/gz-tools/pull/77)
    * [Pull request #86](https://github.com/gazebosim/gz-tools/pull/86)
    * [Pull request #87](https://github.com/gazebosim/gz-tools/pull/87)
    * [Pull request #104](https://github.com/gazebosim/gz-tools/pull/104)
    * [Pull request #106](https://github.com/gazebosim/gz-tools/pull/106)

1. Infrastructure & CI
    * [Pull request #100](https://github.com/gazebosim/gz-tools/pull/100)
    * [Pull request #80](https://github.com/gazebosim/gz-tools/pull/80)
    * [Pull request #75](https://github.com/gazebosim/gz-tools/pull/75)

1. Remove unused config.hh.in
    * [Pull request #91](https://github.com/gazebosim/gz-tools/pull/91)

1. Bump CMake to 2.8.12
    * [Pull request #85](https://github.com/gazebosim/gz-tools/pull/85)

1. Fix `.dll` installation directory on Windows
    * [Pull request #74](https://github.com/gazebosim/gz-tools/pull/74)

1. Permit to invoke `ign` command in Windows
    * [Pull request #73](https://github.com/gazebosim/gz-tools/pull/73)

### Ignition Tools 1.4.1 (2021-10-27)

1. Fix Windows colcon build
    * [Pull request #65](https://github.com/ignitionrobotics/ign-tools/pull/65)

1. Add flag to get standard-compliant exception handling
    * [Pull request #68](https://github.com/ignitionrobotics/ign-tools/pull/68)

1. Fix use of Backward on macOS
    * [Pull request #67](https://github.com/ignitionrobotics/ign-tools/pull/67)

## Ignition Tools 1.4.0 (2021-10-15)

1. Improve backtrace generation using Backward
    * [Pull request #63](https://github.com/ignitionrobotics/ign-tools/pull/63)

## Ignition Tools 1.3.0 (2021-09-27)

1. Remove all death CMake code related to test.
    * [Pull request #54](https://github.com/ignitionrobotics/ign-tools/pull/54)

1. Remove build dependency on ruby (not needed)
    * [Pull request #53](https://github.com/ignitionrobotics/ign-tools/pull/53)

1. Remove unused cmake code related to compilations (CFlags, BUILD_TYPE, etc.)
    * [Pull request #55](https://github.com/ignitionrobotics/ign-tools/pull/55)
    * [Pull request #56](https://github.com/ignitionrobotics/ign-tools/pull/56)

1. Add Windows support
    * [Pull request #57](https://github.com/ignitionrobotics/ign-tools/pull/57)

1. Sort versions correctly.
    * [Pull request #50](https://github.com/ignitionrobotics/ign-tools/pull/50)

1. Infrastructure
    * [Pull request #59](https://github.com/ignitionrobotics/ign-tools/pull/59)
    * [Pull request #58](https://github.com/ignitionrobotics/ign-tools/pull/58)

### Ignition Tools 1.2.0 (2021-04-26)

1. Relax version verification
    * [Pull request #44](https://github.com/ignitionrobotics/ign-tools/pull/44)

### Ignition Tools 1.1.0 (2021-03-30)

1. Use ; as IGN_CONFIG_PATH delimiter on windows
    * [Pull request #45](https://github.com/ignitionrobotics/ign-tools/pull/45)

1. Clean up ignition-tools.pc file
    * [Pull request #40](https://github.com/ignitionrobotics/ign-tools/pull/40)

1. Fix cmake warning and error mesage types
    * [Pull request #41](https://github.com/ignitionrobotics/ign-tools/pull/41)

1. Infrastructure updates
    * [Pull request #42](https://github.com/ignitionrobotics/ign-tools/pull/42)
    * [Pull request #38](https://github.com/ignitionrobotics/ign-tools/pull/38)
    * [Pull request #37](https://github.com/ignitionrobotics/ign-tools/pull/37)
    * [Pull request #29](https://github.com/ignitionrobotics/ign-tools/pull/29)
    * [Pull request #22](https://github.com/ignitionrobotics/ign-tools/pull/22)
    * [Pull request #17](https://github.com/ignitionrobotics/ign-tools/pull/17)
    * [Pull request #11](https://github.com/ignitionrobotics/ign-tools/pull/11)
    * [Pull request #13](https://github.com/ignitionrobotics/ign-tools/pull/13)

1. Do not overwrite default linker flags so that LDFLAGS environment variable is considered
    * [Pull request #35](https://github.com/ignitionrobotics/ign-tools/pull/35)

1. Add Windows installation
    * [Pull request #34](https://github.com/ignitionrobotics/ign-tools/pull/34)

1. Fix: Use PACKAGE_PREFIX_DIR to ensure relocatable CMake install for conan
    * [Pull request #30](https://github.com/ignitionrobotics/ign-tools/pull/30)

1. Add ruby style checker
    * [Pull request #25](https://github.com/ignitionrobotics/ign-tools/pull/25)

1. When using help, append --help to specific command
    * [Pull request #15](https://github.com/ignitionrobotics/ign-tools/pull/15)

1. Added --commands
    * [BitBucket pull request 23](https://osrf-migration.github.io/ignition-gh-pages/#!/ignitionrobotics/ign-tools/pull-requests/23)

1. Set the process title to something nice
    * [BitBucket pull request 22](https://osrf-migration.github.io/ignition-gh-pages/#!/ignitionrobotics/ign-tools/pull-requests/22)

### Ignition Tools 1.0.0 (2019-12-09)

### Ignition Tools 0.2.0

1.  Accepting multiple paths in `IGN_CONFIG_PATH`.
    * [BitBucket pull request 14](https://osrf-migration.github.io/ignition-gh-pages/#!/ignitionrobotics/ign-tools/pull-requests/14)
    * [BitBucket pull request 13](https://osrf-migration.github.io/ignition-gh-pages/#!/ignitionrobotics/ign-tools/pull-requests/13)

1.  Backport changes from default branch (pipeline, Code of Conduct, etc.)
    * [BitBucket pull request 11](https://osrf-migration.github.io/ignition-gh-pages/#!/ignitionrobotics/ign-tools/pull-requests/11)

1.  Link to main contributing guide.
    * [BitBucket pull request 5](https://osrf-migration.github.io/ignition-gh-pages/#!/ignitionrobotics/ign-tools/pull-requests/5)

1.  Exit with success code 0 for help command.
    * [BitBucket pull request 4](https://osrf-migration.github.io/ignition-gh-pages/#!/ignitionrobotics/ign-tools/pull-requests/4)

### Ignition Tools 0.1.0

