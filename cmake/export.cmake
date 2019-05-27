# TODO export package

#include(GNUInstallDirs)

# install(FILES src/dotprod.h DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/dotprod)

# install(EXPORT dotprod-targets
#     FILE dotprod-targets.cmake
#     NAMESPACE Dotprod::
#     DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake
#     )

include(CMakePackageConfigHelpers)

write_basic_package_version_file(gt_c_bindings-config-version.cmake
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY SameMajorVersion
    )

set(gt_c_bindings_MODULE_PATH lib/cmake)
set(gt_c_bindings_SOURCES_PATH src)
set(gt_c_bindings_INCLUDE_PATH include)

configure_package_config_file(cmake/gt_c_bindings-config.cmake.in
${CMAKE_CURRENT_BINARY_DIR}/gt_c_bindings-config.cmake
PATH_VARS gt_c_bindings_MODULE_PATH gt_c_bindings_SOURCES_PATH gt_c_bindings_INCLUDE_PATH
INSTALL_DESTINATION lib/cmake
)

install(
    FILES
    ${CMAKE_CURRENT_BINARY_DIR}/gt_c_bindings-config.cmake
    ${CMAKE_CURRENT_BINARY_DIR}/gt_c_bindings-config-version.cmake
    DESTINATION lib/cmake
    )
    
set(__C_BINDINGS_CMAKE_DIR "\${gt_c_bindings_MODULE_PATH}")  #TODO refactor the variable names gt_c_bindings_MODULE_PATH, etc.
set(__C_BINDINGS_SOURCE_DIR "\${gt_c_bindings_SOURCES_PATH}")
set(__C_BINDINGS_INCLUDE_DIR "\${gt_c_bindings_INCLUDE_PATH}")
configure_file(cmake/gt_bindings.cmake.in
    ${PROJECT_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/build-install/lib/cmake/gt_bindings.cmake
    @ONLY)
unset(__C_BINDINGS_CMAKE_DIR)
unset(__C_BINDINGS_SOURCE_DIR)
unset(__C_BINDINGS_INCLUDE_DIR)

set(CMAKE_SOURCES
    "${PROJECT_SOURCE_DIR}/cmake/gt_bindings_generate.cmake"
    "${PROJECT_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/build-install/lib/cmake/gt_bindings.cmake"
    )
set(CBINDINGS_SOURCES
    "${PROJECT_SOURCE_DIR}/src/c_bindings/generator.cpp"
    "${PROJECT_SOURCE_DIR}/src/c_bindings/generator_main.cpp"
    "${PROJECT_SOURCE_DIR}/src/c_bindings/array_descriptor.f90"
    "${PROJECT_SOURCE_DIR}/src/c_bindings/handle.f90"
    "${PROJECT_SOURCE_DIR}/src/c_bindings/handle.cpp"
    )

install(DIRECTORY include/ DESTINATION include)
install(FILES ${CMAKE_SOURCES} DESTINATION "lib/cmake")
install(FILES ${CBINDINGS_SOURCES} DESTINATION "src/c_bindings")
