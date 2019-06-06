include(FetchContent)
option(INSTALL_GTEST OFF)
mark_as_advanced(INSTALL_GTEST)
find_package(Threads)
FetchContent_Declare(
  googletest
  GIT_REPOSITORY https://github.com/google/googletest.git
  GIT_TAG        release-1.8.1
)
FetchContent_GetProperties(googletest)
if(NOT googletest_POPULATED)
  FetchContent_Populate(googletest)
  add_subdirectory(${googletest_SOURCE_DIR} ${googletest_BINARY_DIR})
endif()

include(${PROJECT_SOURCE_DIR}/cmake/detect_features.cmake)
detect_cuda()

include(${PROJECT_SOURCE_DIR}/cmake/workaround_thread.cmake)
_fix_threads_flags()

function(compile_test name)
    add_executable(${name} ${name}.cpp)
    target_link_libraries(${name} PRIVATE gtest_main)
    target_link_libraries(${name} PRIVATE c_bindings_handle)
    target_link_libraries(${name} PRIVATE cpp_bindgen_generator)
    add_test(NAME ${name} COMMAND $<TARGET_FILE:${name}>)

    if (CUDA_AVAILABLE)
        add_executable(${name}_cu ${name}.cu)
        target_link_libraries(${name}_cu PRIVATE gtest_main)
        target_link_libraries(${name}_cu PRIVATE c_bindings_handle)
        target_link_libraries(${name}_cu PRIVATE cpp_bindgen_generator)
        add_test(NAME ${name}_cu COMMAND $<TARGET_FILE:${name}_cu>)
    endif()
endfunction()

enable_testing()

add_subdirectory(unit_tests)
add_subdirectory(regression)
