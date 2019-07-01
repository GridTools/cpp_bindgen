cmake_minimum_required(VERSION 3.12.4)

file(STRINGS "version.txt" __CPP_BINDGEN_VERSION)
project(cpp_bindgen VERSION ${__CPP_BINDGEN_VERSION} LANGUAGES CXX)
unset(__CPP_BINDGEN_VERSION)

# Switch default of NO_PACKAGE_REGISTRY. TODO: Can be removed after CMake 3.15
set(CMAKE_EXPORT_NO_PACKAGE_REGISTRY ON CACHE INTERNAL "")

include(CTest)

set(REQUIRED_BOOST_VERSION 1.58)
find_package(Boost ${REQUIRED_BOOST_VERSION} REQUIRED)

if(NOT CPP_BINDGEN_GT_LEGACY)
    set(CPP_BINDGEN_GT_LEGACY OFF)
endif()

# if used via FetchContent/add_subdirectory() we need to make the add_bindings_library() available here
include(${CMAKE_CURRENT_LIST_DIR}/cmake/bindings.cmake)

if (BUILD_TESTING)
    add_subdirectory(tests)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmake/export.cmake)
