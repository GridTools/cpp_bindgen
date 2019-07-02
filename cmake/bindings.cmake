function(generate_gt_bindings)
    set(__CPP_BINDGEN_SOURCE_DIR ${PROJECT_SOURCE_DIR}/src)
    set(__CPP_BINDGEN_CMAKE_DIR ${PROJECT_SOURCE_DIR}/cmake)
    set(__CPP_BINDGEN_INCLUDE_DIR ${PROJECT_SOURCE_DIR}/include)
    configure_file(${PROJECT_SOURCE_DIR}/cmake/cpp_bindgen.cmake.in
        ${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/bindings_for_build/cpp_bindgen.cmake
        @ONLY)
endfunction()

generate_gt_bindings()
include(${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/bindings_for_build/cpp_bindgen.cmake)
