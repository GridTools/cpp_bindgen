# TODO export package

#include(GNUInstallDirs)

# install(FILES src/dotprod.h DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/dotprod)

# install(EXPORT dotprod-targets
#     FILE dotprod-targets.cmake
#     NAMESPACE Dotprod::
#     DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake
#     )

include(CMakePackageConfigHelpers)

write_basic_package_version_file(cpp_bindgen-config-version.cmake
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY SameMajorVersion
    )

set(cpp_bindgen_MODULE_PATH lib/cmake)
set(cpp_bindgen_SOURCES_PATH src)
set(cpp_bindgen_INCLUDE_PATH include)

configure_package_config_file(cmake/cpp_bindgen-config.cmake.in
${CMAKE_CURRENT_BINARY_DIR}/cpp_bindgen-config.cmake
PATH_VARS cpp_bindgen_MODULE_PATH cpp_bindgen_SOURCES_PATH cpp_bindgen_INCLUDE_PATH
INSTALL_DESTINATION lib/cmake
)

install(
    FILES
    ${CMAKE_CURRENT_BINARY_DIR}/cpp_bindgen-config.cmake
    ${CMAKE_CURRENT_BINARY_DIR}/cpp_bindgen-config-version.cmake
    DESTINATION lib/cmake
    )

set(__C_BINDINGS_CMAKE_DIR "\${cpp_bindgen_MODULE_PATH}")  #TODO refactor the variable names cpp_bindgen_MODULE_PATH, etc.
set(__C_BINDINGS_SOURCE_DIR "\${cpp_bindgen_SOURCES_PATH}")
set(__C_BINDINGS_INCLUDE_DIR "\${cpp_bindgen_INCLUDE_PATH}")
configure_file(cmake/cpp_bindgen.cmake.in
    ${PROJECT_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/build-install/lib/cmake/cpp_bindgen.cmake
    @ONLY)
unset(__C_BINDINGS_CMAKE_DIR)
unset(__C_BINDINGS_SOURCE_DIR)
unset(__C_BINDINGS_INCLUDE_DIR)

set(CMAKE_SOURCES
    "${PROJECT_SOURCE_DIR}/cmake/cpp_bindgen_generate.cmake"
    "${PROJECT_SOURCE_DIR}/cmake/fortran_helpers.cmake"
    "${PROJECT_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/build-install/lib/cmake/cpp_bindgen.cmake"
    )
set(CBINDINGS_SOURCES
    "${PROJECT_SOURCE_DIR}/src/cpp_bindgen/generator.cpp"
    "${PROJECT_SOURCE_DIR}/src/cpp_bindgen/generator_main.cpp"
    "${PROJECT_SOURCE_DIR}/src/cpp_bindgen/array_descriptor.f90"
    "${PROJECT_SOURCE_DIR}/src/cpp_bindgen/handle.f90"
    "${PROJECT_SOURCE_DIR}/src/cpp_bindgen/handle.cpp"
    )

install(DIRECTORY include/ DESTINATION include)
install(FILES ${CMAKE_SOURCES} DESTINATION "lib/cmake")
install(FILES ${CBINDINGS_SOURCES} DESTINATION "src/cpp_bindgen")
