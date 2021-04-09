include (${project_cmake_dir}/Utils.cmake)

# Set delimiter for environment variables with multiple path values based on OS
if (WIN32)
  set(ENV_PATH_DELIMITER ";")
else()
  set(ENV_PATH_DELIMITER ":")
endif()

configure_file(ign.in ${PROJECT_BINARY_DIR}/ign)
install (PROGRAMS ${PROJECT_BINARY_DIR}/ign DESTINATION ${BIN_INSTALL_DIR})
