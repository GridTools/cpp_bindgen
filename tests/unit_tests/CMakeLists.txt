#TODO enable CUDA tests
add_subdirectory(common)

compile_test(test_export test_export.cpp)
compile_test(test_fortran_array_view test_fortran_array_view.cpp)
compile_test(test_function_wrapper test_function_wrapper.cpp)
compile_test(test_generator test_generator.cpp)
compile_test(test_function_traits test_function_traits.cpp)
