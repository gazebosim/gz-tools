include (${project_cmake_dir}/Utils.cmake)

# Set delimiter for environment variables with multiple path values based on OS
if (WIN32)
  set(ENV_PATH_DELIMITER ";")
else()
  set(ENV_PATH_DELIMITER ":")
endif()

set(executable_name "ign")

if(WIN32)
  set(executable_name "ign.rb")
endif()

configure_file(ign.in ${PROJECT_BINARY_DIR}/${executable_name})
install (PROGRAMS ${PROJECT_BINARY_DIR}/${executable_name} DESTINATION ${BIN_INSTALL_DIR})
