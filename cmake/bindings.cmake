function(generate_gt_bindings)
    set(__C_BINDINGS_SOURCE_DIR ${PROJECT_SOURCE_DIR}/src)
    set(__C_BINDINGS_CMAKE_DIR ${PROJECT_SOURCE_DIR}/cmake)
    set(__C_BINDINGS_INCLUDE_DIR ${PROJECT_SOURCE_DIR}/include)
    configure_file(${PROJECT_SOURCE_DIR}/cmake/gt_bindings.cmake.in
        ${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/bindings_for_build/gt_bindings.cmake
        @ONLY)
    unset(__C_BINDINGS_SOURCE_DIR)
    unset(__C_BINDINGS_CMAKE_DIR)
    unset(__C_BINDINGS_INCLUDE_DIR)
endfunction()

generate_gt_bindings()
list(APPEND CMAKE_MODULE_PATH "${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/bindings_for_build")
include(gt_bindings)
