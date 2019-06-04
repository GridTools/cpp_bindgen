add_subdirectory(common)

foreach(testname
        test_export
        test_fortran_array_view
        test_function_wrapper
        test_generator
        test_function_traits
        )

    compile_test(${testname})
endforeach()
