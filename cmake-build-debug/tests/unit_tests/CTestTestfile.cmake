# CMake generated Testfile for 
# Source directory: /Users/antonaf/cpp_bindgen/tests/unit_tests
# Build directory: /Users/antonaf/cpp_bindgen/cmake-build-debug/tests/unit_tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(test_export "/Users/antonaf/cpp_bindgen/cmake-build-debug/tests/unit_tests/test_export")
set_tests_properties(test_export PROPERTIES  _BACKTRACE_TRIPLES "/Users/antonaf/cpp_bindgen/tests/CMakeLists.txt;26;add_test;/Users/antonaf/cpp_bindgen/tests/unit_tests/CMakeLists.txt;11;compile_test;/Users/antonaf/cpp_bindgen/tests/unit_tests/CMakeLists.txt;0;")
add_test(test_fortran_array_view "/Users/antonaf/cpp_bindgen/cmake-build-debug/tests/unit_tests/test_fortran_array_view")
set_tests_properties(test_fortran_array_view PROPERTIES  _BACKTRACE_TRIPLES "/Users/antonaf/cpp_bindgen/tests/CMakeLists.txt;26;add_test;/Users/antonaf/cpp_bindgen/tests/unit_tests/CMakeLists.txt;11;compile_test;/Users/antonaf/cpp_bindgen/tests/unit_tests/CMakeLists.txt;0;")
add_test(test_function_wrapper "/Users/antonaf/cpp_bindgen/cmake-build-debug/tests/unit_tests/test_function_wrapper")
set_tests_properties(test_function_wrapper PROPERTIES  _BACKTRACE_TRIPLES "/Users/antonaf/cpp_bindgen/tests/CMakeLists.txt;26;add_test;/Users/antonaf/cpp_bindgen/tests/unit_tests/CMakeLists.txt;11;compile_test;/Users/antonaf/cpp_bindgen/tests/unit_tests/CMakeLists.txt;0;")
add_test(test_generator "/Users/antonaf/cpp_bindgen/cmake-build-debug/tests/unit_tests/test_generator")
set_tests_properties(test_generator PROPERTIES  _BACKTRACE_TRIPLES "/Users/antonaf/cpp_bindgen/tests/CMakeLists.txt;26;add_test;/Users/antonaf/cpp_bindgen/tests/unit_tests/CMakeLists.txt;11;compile_test;/Users/antonaf/cpp_bindgen/tests/unit_tests/CMakeLists.txt;0;")
add_test(test_function_traits "/Users/antonaf/cpp_bindgen/cmake-build-debug/tests/unit_tests/test_function_traits")
set_tests_properties(test_function_traits PROPERTIES  _BACKTRACE_TRIPLES "/Users/antonaf/cpp_bindgen/tests/CMakeLists.txt;26;add_test;/Users/antonaf/cpp_bindgen/tests/unit_tests/CMakeLists.txt;11;compile_test;/Users/antonaf/cpp_bindgen/tests/unit_tests/CMakeLists.txt;0;")
subdirs("common")
