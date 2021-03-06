bindgen_add_library(bindgen_regression_array SOURCES implementation.cpp)

add_executable(bindgen_regression_array_driver_fortran driver.f90)
target_link_libraries(bindgen_regression_array_driver_fortran bindgen_regression_array_fortran)
if(CMAKE_Fortran_COMPILER_ID STREQUAL "Intel")
    set_target_properties(bindgen_regression_array_driver_fortran PROPERTIES LINKER_LANGUAGE Fortran)
endif()

add_test(NAME bindgen_regression_array_driver_fortran
    COMMAND $<TARGET_FILE:bindgen_regression_array_driver_fortran>)

if( CUDA_AVAILABLE
    AND "${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU" # -fopenacc will be passed to the c++ linker
    AND "${CMAKE_CXX_COMPILER_VERSION}" VERSION_GREATER_EQUAL "6"
    AND "${CMAKE_Fortran_COMPILER_ID}" STREQUAL "GNU"
    AND "${CMAKE_Fortran_COMPILER_VERSION}" VERSION_GREATER_EQUAL "6"
    )

    bindgen_add_library(bindgen_regression_array_cu SOURCES implementation.cu)
    bindgen_enable_fortran_openacc_on_target(bindgen_regression_array_cu_fortran)

    add_executable(bindgen_regression_array_driver_cu_fortran driver_cu.f90)
    target_link_libraries(bindgen_regression_array_driver_cu_fortran bindgen_regression_array_cu_fortran)
    bindgen_enable_fortran_openacc_on_target(bindgen_regression_array_driver_cu_fortran)

    # TODO
    # we don't add this test on purpose for now, because it is likely that this test does not work
    # out of the box. The Fortran code would need to be compiled separately with a different
    # compiler than the C++ code with a compiler that has proper OpenACC support.
endif()
