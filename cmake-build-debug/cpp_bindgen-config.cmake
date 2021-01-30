
####### Expanded from @PACKAGE_INIT@ by configure_package_config_file() #######
####### Any changes to this file will be overwritten by the next CMake run ####
####### The input file was cpp_bindgen-config.cmake.in                            ########

get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../../../../usr/local" ABSOLUTE)

macro(set_and_check _var _file)
  set(${_var} "${_file}")
  if(NOT EXISTS "${_file}")
    message(FATAL_ERROR "File or directory ${_file} referenced by variable ${_var} does not exist !")
  endif()
endmacro()

macro(check_required_components _NAME)
  foreach(comp ${${_NAME}_FIND_COMPONENTS})
    if(NOT ${_NAME}_${comp}_FOUND)
      if(${_NAME}_FIND_REQUIRED_${comp})
        set(${_NAME}_FOUND FALSE)
      endif()
    endif()
  endforeach()
endmacro()

####################################################################################

get_filename_component(cpp_bindgen_CONFIG_CMAKE_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)

message(STATUS "GridTools cpp_bindgen version 1.1.0 found at ${cpp_bindgen_CONFIG_CMAKE_DIR}")

include(CMakeFindDependencyMacro)
find_dependency(Boost 1.58)

set_and_check(cpp_bindgen_CMAKE_DIR /Users/antonaf/cpp_bindgen/cmake-build-debug/CMakeFiles/build-install/lib/cmake)
set_and_check(cpp_bindgen_SOURCE_DIR /Users/antonaf/cpp_bindgen/src)
set_and_check(cpp_bindgen_INCLUDE_DIR /Users/antonaf/cpp_bindgen/include)

include(${cpp_bindgen_CMAKE_DIR}/cpp_bindgen.cmake)
