include (${project_cmake_dir}/Utils.cmake)
include (CheckCXXSourceCompiles)

include (${project_cmake_dir}/FindOS.cmake)
include (FindPkgConfig)

# It is know that raring compiler 4.7.3 is not able to compile the software
# Check for a fully valid c++11 compiler
if (CMAKE_COMPILER_IS_GNUCC)
  execute_process(COMMAND ${CMAKE_CXX_COMPILER} -dumpversion
                OUTPUT_VARIABLE GCC_VERSION)
    if (GCC_VERSION LESS 4.8)
      message(STATUS "Not found a compatible c++11 gcc compiler")
      BUILD_ERROR("GCC version is lower than 4.8. Need a compatible c++11 compiler")
  endif()
endif()

#################################################
# Find libtclap.
pkg_check_modules(tclap tclap)

if (NOT tclap_FOUND)
  message (STATUS "Looking for libtclap pkgconfig file - not found")
  BUILD_ERROR ("libtclap not found, Please install libtclap-dev")
else ()
  message (STATUS "Looking for libtclap pkgconfig file - found")
  include_directories(${tclap_INCLUDE_DIRS})
  link_directories(${tclap_LIBRARY_DIRS})
endif ()

########################################
# Include man pages stuff
include (${project_cmake_dir}/Ronn2Man.cmake)
add_manpage_target()

#################################################
# Macro to check for visibility capability in compiler
# Original idea from: https://gitorious.org/ferric-cmake-stuff/
macro (check_gcc_visibility)
  include (CheckCXXCompilerFlag)
  check_cxx_compiler_flag(-fvisibility=hidden GCC_SUPPORTS_VISIBILITY)
endmacro()
