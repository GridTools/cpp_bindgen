#TODO enable CUDA tests

compile_test(test_export test_export.cpp)
compile_test(test_fortran_array_view test_fortran_array_view.cpp)
compile_test(test_function_wrapper test_function_wrapper.cpp)
compile_test(test_generator test_generator.cpp)

# moved from GT
compile_test(test_is_there_in_sequence_if test_is_there_in_sequence_if.cpp)
compile_test(test_copy_into_variadic test_copy_into_variadic.cpp)
compile_test(test_any_moveable test_any_moveable.cpp)
compile_test(test_make_indices test_make_indices.cpp)
