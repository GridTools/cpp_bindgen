include(${PROJECT_SOURCE_DIR}/cmake/detect_features.cmake)
detect_fortran_compiler()
detect_c_compiler()

add_subdirectory(simple)

if(CMAKE_Fortran_COMPILER_LOADED)
    add_subdirectory(array)
endif()
