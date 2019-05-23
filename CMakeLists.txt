cmake_minimum_required(VERSION 3.12.4)

file(STRINGS "version.txt" __C_BINDINGS_VERSION)
project(c_bindings VERSION ${__C_BINDINGS_VERSION} LANGUAGES CXX)
unset(__C_BINDINGS_VERSION)

list (APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake")

include(CTest)

include(bindings)

if (BUILD_TESTING)
    add_subdirectory(tests)
endif()

include(export)
