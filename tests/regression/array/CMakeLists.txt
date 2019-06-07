cpp_bindgen_add_library(gen_regression_array SOURCES implementation.cpp)

add_executable(gen_regression_array_driver_fortran driver.f90)
target_link_libraries(gen_regression_array_driver_fortran gen_regression_array_fortran)
add_test(NAME gen_regression_array_driver_fortran
    COMMAND $<TARGET_FILE:gen_regression_array_driver_fortran>)

if(CUDA_AVAILABLE)
    cpp_bindgen_add_library(gen_regression_array_cu SOURCES implementation.cu)
    gen_enable_fortran_openacc_on_target(gen_regression_array_cu_fortran)

    add_executable(gen_regression_array_driver_cu_fortran driver_cu.f90)
    target_link_libraries(gen_regression_array_driver_cu_fortran gen_regression_array_cu_fortran)
    gen_enable_fortran_openacc_on_target(gen_regression_array_driver_cu_fortran)
    add_test(NAME gen_regression_array_driver_cu_fortran
        COMMAND $<TARGET_FILE:gen_regression_array_driver_cu_fortran>)
endif()
