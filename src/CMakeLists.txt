include (${project_cmake_dir}/Utils.cmake)

configure_file(ign.in ${PROJECT_BINARY_DIR}/ign)
install (PROGRAMS ${PROJECT_BINARY_DIR}/ign DESTINATION ${BIN_INSTALL_DIR})
