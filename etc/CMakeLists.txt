# Tack version onto and install the bash completion scripts

# Install script to source all bash completion scripts, of all library versions.
configure_file(
  "gz.completion"
    "${CMAKE_CURRENT_BINARY_DIR}/gz${PROJECT_MAJOR_VERSION}.completion" @ONLY)
install(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/gz${PROJECT_MAJOR_VERSION}.completion
  DESTINATION
    ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_DATAROOTDIR}/gz)

configure_file(
  "ign.bash_completion.sh"
    "${CMAKE_CURRENT_BINARY_DIR}/ign${PROJECT_MAJOR_VERSION}.bash_completion.sh" @ONLY)
install(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/ign${PROJECT_MAJOR_VERSION}.bash_completion.sh
  RENAME ign
  DESTINATION
    ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_DATAROOTDIR}/bash-completion/completions)
