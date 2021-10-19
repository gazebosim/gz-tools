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

#===============================================================================
# Used for the installed version.
if(APPLE)
  # On macOS, the full path to the library since DYLD_LIBRARY_PATH may not work.
  set(backward_library_name ${CMAKE_INSTALL_PREFIX}/${LIB_INSTALL_DIR}/$<TARGET_FILE_NAME:backward>)
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

  set(IGN_DESIGNIATION tools)
  set(cmd_script_configured_test "${CMAKE_CURRENT_BINARY_DIR}/cmd${IGN_DESIGNIATION}_TEST.rb.configured")
  set(cmd_script_generated_test "${PROJECT_BINARY_DIR}/test/lib/$<CONFIG>/ruby/ignition/cmd${IGN_DESIGNIATION}_TEST.rb")

  configure_file(
    "cmd${IGN_DESIGNIATION}_TEST.rb.in"
    "${cmd_script_configured_test}"
    @ONLY)

  file(GENERATE
    OUTPUT "${cmd_script_generated_test}"
    INPUT  "${cmd_script_configured_test}")

  set(ign_library_path ${cmd_script_generated_test})

  set(yaml_output_dir "${PROJECT_BINARY_DIR}/test/conf/" )
  set(yaml_output_configured_test "${yaml_output_dir}/${IGN_DESIGNIATION}_TEST.yaml.configured" )
  set(yaml_output_generated_test "${yaml_output_dir}/$<CONFIG>/${IGN_DESIGNIATION}_TEST.yaml" )
  configure_file(
    "${IGN_DESIGNIATION}_TEST.yaml.in"
    ${yaml_output_configured_test} @ONLY)

  file(GENERATE
    OUTPUT "${yaml_output_generated_test}"
    INPUT "${yaml_output_configured_test}")

  add_test(NAME UNIT_ign_TEST COMMAND ruby ${ign_script_generated_test} tools_TEST)

  set_tests_properties(
    UNIT_ign_TEST
    PROPERTIES
    ENVIRONMENT
    "IGN_CONFIG_PATH=${yaml_output_dir}/$<CONFIG>"
  )
  set_tests_properties(UNIT_ign_TEST PROPERTIES
    PASS_REGULAR_EXPRESSION "Test passed"
  )

  set_tests_properties(UNIT_ign_TEST PROPERTIES
    FAIL_REGULAR_EXPRESSION "Library error"
  )
endif()
# END TEST
#==============================
