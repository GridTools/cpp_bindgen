cmake_minimum_required(VERSION 3.12.4)

file(STRINGS "version.txt" __CPP_BINDGEN_VERSION)
project(cpp_bindgen VERSION ${__CPP_BINDGEN_VERSION} LANGUAGES CXX)
unset(__CPP_BINDGEN_VERSION)

include(CTest)

set(REQUIRED_BOOST_VERSION 1.58)
find_package(Boost ${REQUIRED_BOOST_VERSION} REQUIRED)

option(CPP_BINDGEN_GT_LEGACY OFF)
mark_as_advanced(CPP_BINDGEN_GT_LEGACY)

# if used via FetchContent/add_subdirectory() we need to make the add_bindings_library() available here
include(${CMAKE_CURRENT_LIST_DIR}/cmake/bindings.cmake)

if (BUILD_TESTING)
    add_subdirectory(tests)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmake/export.cmake)
