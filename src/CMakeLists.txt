include (${project_cmake_dir}/Utils.cmake)

set (sources
  ign
)

set (gtest_sources
)

install (PROGRAMS ${sources} DESTINATION ${BIN_INSTALL_DIR})
