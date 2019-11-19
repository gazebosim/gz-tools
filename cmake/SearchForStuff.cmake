include (${project_cmake_dir}/Utils.cmake)
include (CheckCXXSourceCompiles)

include (${project_cmake_dir}/FindOS.cmake)
include (FindPkgConfig)

########################################
# The ruby Interpreter.
find_program(RUBY ruby)
if (NOT RUBY)
  BUILD_ERROR ("Missing: ruby (ruby)")
endif()

########################################
# Include man pages stuff
include (${project_cmake_dir}/Ronn2Man.cmake)
add_manpage_target()
