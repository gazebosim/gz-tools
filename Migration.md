# Note on deprecations
A tick-tock release cycle allows easy migration to new software versions.
Obsolete code is marked as deprecated for one major release.
Deprecated code produces compile-time warnings. These warning serve as
notification to users that their code should be upgraded. The next major
release will remove the deprecated code.

## Gazebo Tools 1.X to 2.X

* This package now depends on gz-cmake
* The environment variable `IGN_CONFIG_PATH` is deprecated. Use `GZ_CONFIG_PATH` instead.
* The `ign` command line executable is deprecated. Use `gz` instead.
