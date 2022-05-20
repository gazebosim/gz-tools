# Install script to source all bash completion scripts, of all library versions.
install(FILES gz.completion DESTINATION share/gz)

# Tack version onto and install the bash completion script
configure_file(
  "ign.bash_completion.sh"
    "${CMAKE_CURRENT_BINARY_DIR}/ign${PROJECT_MAJOR_VERSION}.bash_completion.sh" @ONLY)
install(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/ign${PROJECT_MAJOR_VERSION}.bash_completion.sh
  DESTINATION
    ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_DATAROOTDIR}/gz/gz${PROJECT_MAJOR_VERSION}.completion.d)
