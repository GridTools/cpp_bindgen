# this registers the build-tree with a global CMake-registry
export(PACKAGE cpp_bindgen)

include(CMakePackageConfigHelpers)

# for build tree
set(cpp_bindgen_MODULE_PATH ${PROJECT_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/build-install/lib/cmake)
set(cpp_bindgen_SOURCES_PATH ${PROJECT_SOURCE_DIR}/src)
set(cpp_bindgen_INCLUDE_PATH ${PROJECT_SOURCE_DIR}/include)
configure_package_config_file(
    cmake/cpp_bindgen-config.cmake.in
    ${PROJECT_BINARY_DIR}/cpp_bindgen-config.cmake
    PATH_VARS cpp_bindgen_MODULE_PATH cpp_bindgen_SOURCES_PATH cpp_bindgen_INCLUDE_PATH
    INSTALL_DESTINATION ${PROJECT_BINARY_DIR}
    )
write_basic_package_version_file(
    ${PROJECT_BINARY_DIR}/cpp_bindgen-config-version.cmake
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY SameMajorVersion
    )

# for install tree
set(cpp_bindgen_MODULE_PATH lib/cmake)
set(cpp_bindgen_SOURCES_PATH src)
set(cpp_bindgen_INCLUDE_PATH include)
configure_package_config_file(
    cmake/cpp_bindgen-config.cmake.in
    ${PROJECT_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/install/cpp_bindgen-config.cmake
    PATH_VARS cpp_bindgen_MODULE_PATH cpp_bindgen_SOURCES_PATH cpp_bindgen_INCLUDE_PATH
    INSTALL_DESTINATION lib/cmake
    )
write_basic_package_version_file(
    ${PROJECT_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/install/cpp_bindgen-config-version.cmake
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY SameMajorVersion
    )

install(
    FILES
    ${PROJECT_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/install/cpp_bindgen-config.cmake
    ${PROJECT_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/install/cpp_bindgen-config-version.cmake
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

file(COPY ${CMAKE_SOURCES} DESTINATION "${PROJECT_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/build-install/lib/cmake")
