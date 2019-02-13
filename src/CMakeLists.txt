configure_file(ign.in ${PROJECT_BINARY_DIR}/ign)
install (PROGRAMS ${PROJECT_BINARY_DIR}/ign DESTINATION ${IGN_BIN_INSTALL_DIR})

add_subdirectory(launch)
