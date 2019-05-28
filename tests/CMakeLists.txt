include(FetchContent)
option(INSTALL_GTEST OFF)
mark_as_advanced(INSTALL_GTEST)
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

function(compile_test name src)
    add_executable(${name} ${src})
    target_include_directories(${name} PRIVATE ${PROJECT_SOURCE_DIR}/include)
    target_link_libraries(${name} PRIVATE gtest_main)
    target_link_libraries(${name} PRIVATE c_bindings_handle)
    target_link_libraries(${name} PRIVATE cpp_bindgen_generator)
    add_test(NAME ${name} COMMAND ${name})
endfunction()

enable_testing()

add_subdirectory(unit_tests)
add_subdirectory(regression)
