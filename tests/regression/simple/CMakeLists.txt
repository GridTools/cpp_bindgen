cpp_bindgen_add_library(gen_regression_simple SOURCES simple.cpp)

if(CMAKE_Fortran_COMPILER_LOADED)
    add_executable(gen_regression_simple_driver_fortran driver.f90)
    target_link_libraries(gen_regression_simple_driver_fortran gen_regression_simple_fortran)
    add_test(NAME gen_regression_simple_driver_fortran
        COMMAND $<TARGET_FILE:gen_regression_simple_driver_fortran>)
    set_target_properties(gen_regression_simple_driver_fortran PROPERTIES LINKER_LANGUAGE Fortran)
endif()

if(CMAKE_C_COMPILER_LOADED)
    add_executable(gen_regression_simple_driver_c driver.c)
    target_link_libraries(gen_regression_simple_driver_c gen_regression_simple_c)
    add_test(NAME gen_regression_simple_driver_c
        COMMAND $<TARGET_FILE:gen_regression_simple_driver_c>)
endif()
