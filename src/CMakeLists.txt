include (${project_cmake_dir}/Utils.cmake)

set (sources
  ign
)

set (gtest_sources
)

#ign_build_tests(${gtest_sources})
#ign_install_executable(ign)

install (PROGRAMS ign DESTINATION ${BIN_INSTALL_DIR})
