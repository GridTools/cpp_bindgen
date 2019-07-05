include(FetchContent)
option(INSTALL_GTEST OFF)
mark_as_advanced(INSTALL_GTEST)
find_package(Threads)
FetchContent_Declare(
  googletest
  GIT_REPOSITORY https://github.com/google/googletest.git
  GIT_TAG        release-1.8.1
)
FetchContent_MakeAvailable(googletest)

include(${PROJECT_SOURCE_DIR}/cmake/detect_features.cmake)
detect_cuda()

# If clang+nvcc, we disable the tests, if CUDA < 10.0 because nvcc has problems with C++14 in this combination
if("${CMAKE_CXX_COMPILER_ID}" STREQUAL Clang AND DEFINED CMAKE_CUDA_COMPILER AND "${CMAKE_CUDA_COMPILER_VERSION}" VERSION_LESS "10.0")
  message("NVCC < 10.0 is not supported with Clang as host compiler. Disabling CUDA tests.")
  set(CUDA_AVAILABLE OFF)
endif()

include(${PROJECT_SOURCE_DIR}/cmake/workaround_thread.cmake)
_fix_threads_flags()

function(compile_test name)
    add_executable(${name} ${name}.cpp)
    target_link_libraries(${name} PRIVATE gtest_main)
    target_link_libraries(${name} PRIVATE cpp_bindgen_handle)
    target_link_libraries(${name} PRIVATE cpp_bindgen_generator)
    add_test(NAME ${name} COMMAND $<TARGET_FILE:${name}>)

    if (CUDA_AVAILABLE)
        add_executable(${name}_cu ${name}.cu)
        target_link_libraries(${name}_cu PRIVATE gtest_main)
        target_link_libraries(${name}_cu PRIVATE cpp_bindgen_handle)
        target_link_libraries(${name}_cu PRIVATE cpp_bindgen_generator)
        add_test(NAME ${name}_cu COMMAND $<TARGET_FILE:${name}_cu>)
    endif()
endfunction()

enable_testing()

add_subdirectory(unit_tests)
add_subdirectory(regression)
