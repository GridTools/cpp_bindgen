# Create a library with c- and Fortran-bindings
#
# Usage of this module:
#
#  bindgen_add_library(<library-name> SOURCES <sources>[...] [FORTRAN_OUTPUT_DIR fortran_dir] [C_OUTPUT_DIR c_dir] [FORTRAN_MODULE_NAME name])
#
#  Arguments:
#   SOURCES: sources of the library
#   FORTRAN_OUTPUT_DIR: destination for generated Fortran files (default: ${CMAKE_CURRENT_LIST_DIR})
#   C_OUTPUT_DIR: destination for generated C files (default: ${CMAKE_CURRENT_LIST_DIR})
#   FORTRAN_MODULE_NAME: name for the Fortran module (default: <library-name>)
#
# Variables used by this module:
#
#  GT_ENABLE_BINDINGS_GENERATION:
#  If GT_ENABLE_BINDINGS_GENERATION=OFF, bindings will not be generated, but expected to be provided,
#  as part of the user source code, e.g. by updating bindings with the bindings generator during development.
#  If GT_ENABLE_BINDINGS_GENERATION is not defined already it will be made available after including this file.
#
# In the default case (GT_ENABLE_BINDINGS_GENERATION=ON), the bindings files are generated in the directory
# where the CMakeLists.txt with the call to bindgen_add_library() is located.
#
# Targets generated by bindgen_add_library(<library-name> ...):
#  - <library_name> library build from <Sources...> without bindings (ususally this target is not used)
#  - <library_name>_declarations will run the generator for this library
#  - <library_name>_c the C-bindings with <library_name> linked to it
#  - <library_name>_fortran the Fortran-bindings with <library_name> linked to it

include_guard(GLOBAL)

option(GT_ENABLE_BINDINGS_GENERATION "If turned off, bindings will not be generated." ON)

# in some conditions the include guard above doesn't work
if( NOT TARGET cpp_bindgen_interface )

# variables are unset after use for scoping, they need to be redefined in the macros
set(__CPP_BINDGEN_SOURCE_DIR /Users/antonaf/cpp_bindgen/src)
set(__CPP_BINDGEN_INCLUDE_DIR /Users/antonaf/cpp_bindgen/include)

add_library(cpp_bindgen_interface INTERFACE)
target_include_directories(cpp_bindgen_interface INTERFACE $<BUILD_INTERFACE:${__CPP_BINDGEN_INCLUDE_DIR}> $<INSTALL_INTERFACE:include>)
target_compile_features(cpp_bindgen_interface INTERFACE cxx_std_11)
target_compile_definitions(cpp_bindgen_interface INTERFACE BOOST_PP_VARIADICS=1)

add_library(cpp_bindgen_generator STATIC ${__CPP_BINDGEN_SOURCE_DIR}/cpp_bindgen/generator.cpp)
# PUBLIC to make export.hpp available in the sources passed to add_bindings_library()
target_link_libraries(cpp_bindgen_generator PUBLIC Boost::boost)
target_link_libraries(cpp_bindgen_generator PUBLIC cpp_bindgen_interface)

add_library(cpp_bindgen_handle STATIC ${__CPP_BINDGEN_SOURCE_DIR}/cpp_bindgen/handle.cpp)
target_link_libraries(cpp_bindgen_handle PUBLIC cpp_bindgen_interface)

unset(__CPP_BINDGEN_SOURCE_DIR)
unset(__CPP_BINDGEN_INCLUDE_DIR)

endif()

# bindgen_enable_fortran_library()
#
# Create a target to compile the generated Fortran module.
# In the default case, when Fortran is enabled on the call to bindgen_add_library(), this target is automatically created.
# In case when the Fortran language was not enabled, we cannot create a library (add_library()) with Fortran files.
# However if the user wants to use the target at a later stage, e.g. in testing (with Fortran enabled), the target can
# be created by a call to bindgen_enable_fortran_library().
function(bindgen_enable_fortran_library target_name)
    set(__CPP_BINDGEN_SOURCE_DIR /Users/antonaf/cpp_bindgen/src)
    set(__CPP_BINDGEN_CMAKE_DIR /Users/antonaf/cpp_bindgen/cmake)

    if(CMAKE_Fortran_COMPILER_LOADED)
        if(NOT TARGET cpp_bindgen_fortran_handle)
            add_library(
                cpp_bindgen_fortran_handle
                ${__CPP_BINDGEN_SOURCE_DIR}/cpp_bindgen/array_descriptor.f90
                ${__CPP_BINDGEN_SOURCE_DIR}/cpp_bindgen/string_descriptor.f90
                ${__CPP_BINDGEN_SOURCE_DIR}/cpp_bindgen/handle.f90)
            # the following variable is used to install the .mod files in install_cpp_bindgen_targets() and
            # therefore needs to be available project-wide
            set(CPP_BINDGEN_Fortran_MODULES_DIRECTORY ${CMAKE_BINARY_DIR}/cpp_bindgen_modules
                CACHE INTERNAL "Directory for Fortran modules of cpp_bindgen")
            set_target_properties(cpp_bindgen_fortran_handle PROPERTIES Fortran_MODULE_DIRECTORY ${CPP_BINDGEN_Fortran_MODULES_DIRECTORY})
            target_link_libraries(cpp_bindgen_fortran_handle PUBLIC cpp_bindgen_handle)
            target_include_directories(cpp_bindgen_fortran_handle INTERFACE $<BUILD_INTERFACE:${CPP_BINDGEN_Fortran_MODULES_DIRECTORY}> $<INSTALL_INTERFACE:include/>)
            include(${__CPP_BINDGEN_CMAKE_DIR}/cpp_bindgen_fortran_helpers.cmake)
            bindgen_enable_fortran_preprocessing_on_target(cpp_bindgen_fortran_handle)
        endif()
        if(NOT TARGET ${target_name}_fortran)
            set_source_files_properties(GT_${${target_name}_fortran_bindings_path} PROPERTIES GENERATED TRUE)
            add_library(${target_name}_fortran EXCLUDE_FROM_ALL ${CPP_BINDGEN_${target_name}_fortran_bindings_path})
            target_link_libraries(${target_name}_fortran PUBLIC ${target_name})
            target_link_libraries(${target_name}_fortran PUBLIC cpp_bindgen_fortran_handle)
            # location of .mod file (we cannot know the INSTALL_INTERFACE directory here)
            target_include_directories(${target_name}_fortran PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}>)
            add_dependencies(${target_name}_fortran ${target_name}_declarations)
        endif()
    elseif(NOT ${ARGN}) # internal: the second (optional) parameter can be used to surpress this fatal error
        message(FATAL_ERROR "Please enable_language(Fortran) to compile the Fortran bindings.")
    endif()
endfunction()

function(bindgen_add_library target_name)
    set(options)
    set(one_value_args FORTRAN_OUTPUT_DIR C_OUTPUT_DIR FORTRAN_MODULE_NAME)
    set(multi_value_args SOURCES)
    cmake_parse_arguments(ARG "${options}" "${one_value_args};" "${multi_value_args}" ${ARGN})

    set(__CPP_BINDGEN_SOURCE_DIR /Users/antonaf/cpp_bindgen/src)
    set(__CPP_BINDGEN_CMAKE_DIR /Users/antonaf/cpp_bindgen/cmake)

    if(NOT DEFINED ARG_FORTRAN_MODULE_NAME)
        set(ARG_FORTRAN_MODULE_NAME ${target_name}) # default value
    endif()

    if(ARG_C_OUTPUT_DIR)
        set(bindings_c_decl_filename ${ARG_C_OUTPUT_DIR}/${target_name}.h)
    else()
        set(bindings_c_decl_filename ${CMAKE_CURRENT_LIST_DIR}/${target_name}.h) # default value
    endif()
    if(ARG_FORTRAN_OUTPUT_DIR)
        set(bindings_fortran_decl_filename ${ARG_FORTRAN_OUTPUT_DIR}/${target_name}.f90)
    else()
        set(bindings_fortran_decl_filename ${CMAKE_CURRENT_LIST_DIR}/${target_name}.f90) # default value
    endif()

    add_library(${target_name} STATIC ${ARG_SOURCES})
    target_link_libraries(${target_name} PRIVATE cpp_bindgen_generator)

    if(GT_ENABLE_BINDINGS_GENERATION)
        # generator
        add_executable(${target_name}_decl_generator
            ${__CPP_BINDGEN_SOURCE_DIR}/cpp_bindgen/generator_main.cpp)
        set_target_properties(${target_name}_decl_generator PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/CMakeFiles/decl_generator")
        target_link_libraries(${target_name}_decl_generator cpp_bindgen_generator)

        if (${APPLE})
            target_link_libraries(${target_name}_decl_generator
                -Wl,-force_load ${target_name})
        else()
            target_link_libraries(${target_name}_decl_generator
                -Xlinker --whole-archive ${target_name}
                -Xlinker --no-whole-archive)
        endif()

        add_custom_target(${target_name}_declarations
            ALL
            COMMAND ${CMAKE_COMMAND}
                -DGENERATOR=${CMAKE_CURRENT_BINARY_DIR}/CMakeFiles/decl_generator/${target_name}_decl_generator
                -DBINDINGS_C_DECL_FILENAME=${bindings_c_decl_filename}
                -DBINDINGS_FORTRAN_DECL_FILENAME=${bindings_fortran_decl_filename}
                -DFORTRAN_MODULE_NAME=${ARG_FORTRAN_MODULE_NAME}
                -P ${__CPP_BINDGEN_CMAKE_DIR}/cpp_bindgen_generate.cmake
            BYPRODUCTS ${bindings_c_decl_filename} ${bindings_fortran_decl_filename}
            DEPENDS $<TARGET_FILE:${target_name}_decl_generator>)
    else()
        if(EXISTS ${bindings_c_decl_filename} AND (EXISTS ${bindings_fortran_decl_filename}))
            add_custom_target(${target_name}_declarations) # noop, the dependencies are satisfied if the files exist
        else()
            message(FATAL_ERROR "Cross-compilation for bindings is enabled: no bindings will be generated, but "
                "${bindings_c_decl_filename} and/or "
                "${bindings_fortran_decl_filename} "
                "are missing. Generate the bindings and consider making them part of your repository.")
        endif()
    endif()

    # bindings c library
    add_library(${target_name}_c INTERFACE)
    target_link_libraries(${target_name}_c INTERFACE ${target_name})
    target_link_libraries(${target_name}_c INTERFACE cpp_bindgen_handle)
    target_link_libraries(${target_name}_c INTERFACE cpp_bindgen_interface)

    add_dependencies(${target_name}_c ${target_name}_declarations)

    # bindings Fortran library
    # Export the name of the generated file. The variable needs to exist in the whole cmake!
    # Reason: see description of bindgen_enable_fortran_library().
    set(CPP_BINDGEN_${target_name}_fortran_bindings_path ${bindings_fortran_decl_filename}
        CACHE INTERNAL "Path to the generated Fortran file for ${target_name}")
    bindgen_enable_fortran_library(${target_name} TRUE)
endfunction()

# install_cpp_bindgen_targets()
#
# cpp_bindgen contains some generic files which are being built on first use of bindgen_add_library().
# These libraries can be installed with this function which takes the same arguments
# as install(TARGETS targets... [other-options]), except
# - you must not specify "TARGETS targets..." but only all [other-options].
# - if Fortran is enabled Fortran_MODULE_DESTINATION needs to be set to the location where Fortran modules
#   should be installed to (e.g. include)
function(install_cpp_bindgen_targets)
    set(options)
    set(oneValueArgs Fortran_MODULE_DESTINATION)
    set(multiValueArgs TARGETS)
    cmake_parse_arguments(ARG "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    if(ARG_TARGETS)
        message(FATAL_ERROR "install_cpp_bindgen_targets() must not be called with TARGETS argument.")
    endif()

    if(TARGET cpp_bindgen_fortran_handle) # Fortran is enabled, we need to install a mod file
        if(ARG_Fortran_MODULE_DESTINATION)
            install(DIRECTORY ${CPP_BINDGEN_Fortran_MODULES_DIRECTORY}/ DESTINATION ${ARG_Fortran_MODULE_DESTINATION})
        else()
            message(WARNING "Fortran_MODULE_DESTINATION was NOT specified, but Fortran was enabled. Modules files for
                             cpp_bindgen won't be installed.")
        endif()
        install(TARGETS cpp_bindgen_fortran_handle ${ARG_UNPARSED_ARGUMENTS})
    else()
        if(ARG_Fortran_MODULE_DESTINATION)
            message(WARNING "Fortran_MODULE_DESTINATION was specified, but Fortran is disabled.")
        endif()
    endif()
    install(TARGETS cpp_bindgen_generator cpp_bindgen_handle cpp_bindgen_interface ${ARG_UNPARSED_ARGUMENTS})
endfunction()
