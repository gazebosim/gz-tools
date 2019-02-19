cmake_minimum_required(VERSION 3.5.1 FATAL_ERROR)

#============================================================================
# Initialize the project
#============================================================================
project(ignition-tools VERSION 0.2.0)

#============================================================================
# Find ignition-cmake
#============================================================================
find_package(ignition-cmake2 REQUIRED)
set(IGN_CMAKE_VER ${ignition-cmake2_VERSION_MAJOR})

#============================================================================
# Configure the project
#============================================================================
ign_configure_project()

#============================================================================
# Set project-specific options
#============================================================================

#============================================================================
# Search for project-specific dependencies
#============================================================================
message(STATUS "\n\n-- ====== Finding Dependencies ======")

########################################
# Include ruby
find_package(Ruby 1.9 QUIET)
if (NOT RUBY_FOUND)
  IGN_BUILD_WARNING("Ruby is missing: Install ruby-dev to enable ruby interface to ignition math.")
  message (STATUS "Searching for Ruby - not found.")
else()
  message (STATUS "Searching for Ruby - found.")
endif()

#--------------------------------------
# Find libyaml
ign_find_package(YAML REQUIRED PRIVATE)

#============================================================================
# Configure the build
#============================================================================
ign_configure_build(QUIT_IF_BUILD_ERRORS)

#============================================================================
# Create package information
#============================================================================
ign_create_packages()

#============================================================================
# Configure documentation
#============================================================================
ign_create_docs()
