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

if(MSVC)

  # We always want this flag to be specified so we get standard-compliant
  # exception handling.
  # EHsc: Use standard-compliant exception handling
  add_compile_options("/EHsc")
endif()

cmake_policy(PUSH)
cmake_policy(SET CMP0042 NEW)
add_library(backward SHARED backward.cc)
target_link_libraries(backward PUBLIC Backward::Backward)
set_target_properties(backward PROPERTIES OUTPUT_NAME ${PROJECT_NAME}-backward)
set_target_properties(backward PROPERTIES CXX_STANDARD 14)
cmake_policy(POP)

if(MSVC)
  # Suppress warning from vendored package
  target_compile_options(backward PUBLIC /wd4267)
  target_compile_options(backward PUBLIC /wd4996)
endif()
install (TARGETS backward 
         LIBRARY DESTINATION ${LIB_INSTALL_DIR}
         ARCHIVE DESTINATION ${LIB_INSTALL_DIR} 
         RUNTIME DESTINATION ${BIN_INSTALL_DIR})

#===============================================================================
# Used for the installed version.
if(APPLE)
  # On macOS, the full path to the library since DYLD_LIBRARY_PATH may not work.
  set(backward_library_name ${CMAKE_INSTALL_FULL_LIBDIR}/$<TARGET_FILE_NAME:backward>)
else()
  set(backward_library_name $<TARGET_FILE_NAME:backward>)
endif()

# Two steps to create `ign`, First using `configure_file`, to interpolate cmake variables. Then
# use `file(GENERATE ...)` to use generator expressions
set(ign_script_configured ${PROJECT_BINARY_DIR}/${executable_name}_before_gen)
set(ign_script_generated ${PROJECT_BINARY_DIR}/$<CONFIG>/${executable_name})

configure_file(ign.in ${ign_script_configured})
file(GENERATE OUTPUT ${ign_script_generated} INPUT ${ign_script_configured})
install (PROGRAMS ${ign_script_generated} DESTINATION ${BIN_INSTALL_DIR})

if(WIN32)
  # On Windows also install the executable as ign 
  # to permit to invoke ign via Git Bash 
  # see https://github.com/ignitionrobotics/ign-tools/issues/70
  install (PROGRAMS ${ign_script_generated} DESTINATION ${BIN_INSTALL_DIR} RENAME ign)
  
  # On Windows also install the ign.bat wrapper script to permit to
  # invoke ign via Command Prompt or Powershell
  install (PROGRAMS ign.bat DESTINATION ${BIN_INSTALL_DIR})
endif()

#===============================================================================
# BEGIN TEST ign command
# Generate the ruby script for internal testing.
if(BUILD_TESTING)
  set(backward_library_name $<TARGET_FILE:backward>)
  set(ign_script_configured_test ${PROJECT_BINARY_DIR}/test/bin/${executable_name}_before_gen)
  set(ign_script_generated_test ${PROJECT_BINARY_DIR}/$<CONFIG>/test/bin/${executable_name})

  # Two steps to create `ign`, First using `configure_file`, to interpolate cmake variables. Then
  # use `file(GENERATE ...)` to use generator expressions
  configure_file(ign.in ${ign_script_configured_test})
  file(GENERATE OUTPUT ${ign_script_generated_test} INPUT ${ign_script_configured_test})

  set(TEST_NAME UNIT_ign_TEST)

  set(ign_library_path  "${PROJECT_SOURCE_DIR}/src/cmd${TEST_NAME}.rb")

  set(yaml_output_dir "${PROJECT_BINARY_DIR}/test/conf" )
  set(yaml_output_configured_test "${yaml_output_dir}/${TEST_NAME}.yaml.configured")
  set(yaml_output_generated_test "${yaml_output_dir}/$<CONFIG>/${TEST_NAME}.yaml")
  configure_file(
    "${TEST_NAME}.yaml.in"
    "${yaml_output_configured_test}" @ONLY)

  file(GENERATE
    OUTPUT "${yaml_output_generated_test}"
    INPUT "${yaml_output_configured_test}")

  configure_file(
    "${PROJECT_SOURCE_DIR}/tools/junit_pass.xml.in"
    "${CMAKE_CURRENT_BINARY_DIR}/${TEST_NAME}_pass.xml"
    @ONLY)

  configure_file(
    "${PROJECT_SOURCE_DIR}/tools/junit_fail.xml.in"
    "${CMAKE_CURRENT_BINARY_DIR}/${TEST_NAME}_fail.xml"
    @ONLY)

  # This simply executes ign. The output will be tested in the check_* test
  add_test(
    NAME ${TEST_NAME}
    COMMAND ${CMAKE_COMMAND}
    -DTEST_NAME=${TEST_NAME}
    -DIGN_SCRIPT=${ign_script_generated_test} 
    -P ${PROJECT_SOURCE_DIR}/cmake/run_test.cmake
  )

  set_tests_properties(
    ${TEST_NAME}
    PROPERTIES
    ENVIRONMENT "GZ_CONFIG_PATH=${yaml_output_dir}/$<CONFIG>"
  )
endif()
# END TEST
#==============================
