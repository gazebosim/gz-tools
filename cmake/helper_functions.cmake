# ign_generate_conf()
# Generate conf/*.yaml files for projects
macro(ign_generate_conf)
    # Used only for internal testing.
    set(ign_library_path "${CMAKE_BINARY_DIR}/test/lib/$<CONFIG>/ruby/ignition/cmd${IGN_DESIGNATION}${PROJECT_VERSION_MAJOR}")

    # Generate a configuration file for internal testing.
    # Note that the major version of the library is included in the name.
    configure_file(
      "${IGN_DESIGNATION}.yaml.in"
      "${CMAKE_CURRENT_BINARY_DIR}/${IGN_DESIGNATION}${PROJECT_VERSION_MAJOR}.yaml.configured" @ONLY)

    file(GENERATE
      OUTPUT "${CMAKE_BINARY_DIR}/test/conf/$<CONFIG>/${IGN_DESIGNATION}${PROJECT_VERSION_MAJOR}.yaml"
      INPUT "${CMAKE_CURRENT_BINARY_DIR}/${IGN_DESIGNATION}${PROJECT_VERSION_MAJOR}.yaml.configured")

    # Used for the installed version.
    set(ign_library_path "${CMAKE_INSTALL_PREFIX}/lib/ruby/ignition/cmd${IGN_DESIGNATION}${PROJECT_VERSION_MAJOR}")

    # Generate the configuration file that is installed.
    # Note that the major version of the library is included in the name.
    configure_file(
      "${IGN_DESIGNATION}.yaml.in"
      "${CMAKE_CURRENT_BINARY_DIR}/${IGN_DESIGNATION}${PROJECT_VERSION_MAJOR}.yaml" @ONLY)
    # Install the yaml configuration files in an unversioned location.

    install(FILES ${CMAKE_CURRENT_BINARY_DIR}/${IGN_DESIGNATION}${PROJECT_VERSION_MAJOR}.yaml
      DESTINATION ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_DATAROOTDIR}/ignition/)

endmacro()

#################################################
# ign_generate_cmd()
# Generate cmd*.rb files for projects
macro(ign_generate_cmd)
    # Generate the ruby script for internal testing.
    # Note that the major version of the library is included in the name.
    set(cmd_script_generated_test "${CMAKE_BINARY_DIR}/test/lib/$<CONFIG>/ruby/ignition/cmd${IGN_DESIGNATION}${PROJECT_VERSION_MAJOR}.rb")
    set(cmd_script_configured_test "${CMAKE_CURRENT_BINARY_DIR}/test_cmd${IGN_DESIGNATION}${PROJECT_VERSION_MAJOR}.rb.configured")

    configure_file(
      "cmd${IGN_DESIGNATION}.rb.in"
      "${cmd_script_configured_test}"
      @ONLY)

    file(GENERATE
      OUTPUT "${cmd_script_generated_test}"
      INPUT  "${cmd_script_configured_test}")


    #===============================================================================
    # Used for the installed version.
    # Generate the ruby script that gets installed.
    # Note that the major version of the library is included in the name.
    set(cmd_script_generated "${CMAKE_CURRENT_BINARY_DIR}/cmd${IGN_DESIGNATION}${PROJECT_VERSION_MAJOR}.rb")
    set(cmd_script_configured "${cmd_script_generated}.configured")


    configure_file(
      "cmd${IGN_DESIGNATION}.rb.in"
      "${cmd_script_configured}"
      @ONLY)

    file(GENERATE
      OUTPUT "${cmd_script_generated}"
      INPUT  "${cmd_script_configured}")

    # Install the ruby command line library in an unversioned location.
    install(FILES ${cmd_script_generated} DESTINATION lib/ruby/ignition)
endmacro()