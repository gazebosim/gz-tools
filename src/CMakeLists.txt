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

cmake_policy(PUSH)
cmake_policy(SET CMP0042 NEW)
add_library(backward SHARED backward.cc)
target_link_libraries(backward PUBLIC Backward::Backward)
set_target_properties(backward PROPERTIES OUTPUT_NAME ${PROJECT_NAME}-backward)
set_target_properties(backward PROPERTIES CXX_STANDARD 14)
cmake_policy(POP)

if(WIN32)
  # Suppress warning from vendored package
  target_compile_options(backward PUBLIC /wd4267)
  target_compile_options(backward PUBLIC /wd4996)
endif()
install (TARGETS backward DESTINATION ${LIB_INSTALL_DIR})

# Two steps to create `ign`, First using `configure_file`, to interpolate cmake variables. Then
# use `file(GENERATE ...)` to use generator expressions
configure_file(ign.in ${PROJECT_BINARY_DIR}/${executable_name}_before_gen)
file(GENERATE OUTPUT ${PROJECT_BINARY_DIR}/$<CONFIG>/${executable_name} INPUT ${PROJECT_BINARY_DIR}/${executable_name}_before_gen )
install (PROGRAMS ${PROJECT_BINARY_DIR}/$<CONFIG>/${executable_name} DESTINATION ${BIN_INSTALL_DIR})
