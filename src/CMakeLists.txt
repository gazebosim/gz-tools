configure_file(ign.in ${PROJECT_BINARY_DIR}/ign)
install (PROGRAMS ${PROJECT_BINARY_DIR}/ign DESTINATION ${IGN_BIN_INSTALL_DIR})

# This target/library doesn't do anything except allow downstream users to call
# find_package(ignition-tools# COMPONENTS launch)
# There isn't an actual compiled C/C++ library to generate for the core of
# ignition-tools.
ign_create_core_library(INTERFACE)
