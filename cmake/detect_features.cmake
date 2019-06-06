if(${PROJECT_SOURCE_DIR} STREQUAL ${CMAKE_SOURCE_DIR})
    set(__enable_compiler_detection_default ON)
else()
    set(__enable_compiler_detection_default OFF)
endif()

option(CPP_BINDGEN_ENABLE_COMPILER_DETECTION "Try to detect (optional) C/Fortran compilers" ${__enable_compiler_detection_default})
# If turned OFF, it will still use the compilers,
# - if they are available from a super-project, or
# - if compilers are forced to on via other options.
mark_as_advanced(CPP_BINDGEN_ENABLE_COMPILER_DETECTION)

macro(detect_cuda)
    if(CPP_BINDGEN_ENABLE_COMPILER_DETECTION)
        if(NOT DEFINED CPP_BINDGEN_TEST_CUDA)
            # detect CUDA support
            include(CheckLanguage)
            check_language(CUDA)

            if(CMAKE_CUDA_COMPILER)
                enable_language (CUDA)
                message(STATUS "Enable CUDA tests")
                set(CUDA_AVAILABLE ON)
            else()
                message(STATUS "Disable CUDA tests")
                set(CUDA_AVAILABLE OFF)
            endif()
        elseif(CPP_BINDGEN_TEST_CUDA)
            enable_language(CUDA)
            message(STATUS "Enable CUDA tests")
            set(CUDA_AVAILABLE ON)
        else()
            message(STATUS "Disable CUDA tests")
            set(CUDA_AVAILABLE OFF)
        endif()
    endif()
endmacro(detect_cuda)

include (CMakeDependentOption)

macro(detect_fortran_compiler)
    if(CPP_BINDGEN_ENABLE_COMPILER_DETECTION)
        CMAKE_DEPENDENT_OPTION (CPP_BINDGEN_REQUIRE_TEST_Fortran "CMake will abort if no Fortran compiler can be found"
            OFF "BUILD_TESTING" OFF)

        include(CheckLanguage)
        check_language(Fortran)
        if (CMAKE_Fortran_COMPILER OR CPP_BINDGEN_REQUIRE_TEST_Fortran)
            enable_language(Fortran)
        else()
            message(WARNING "Fortran Compiler has not been found. Tests using Fortran will not be built!")
        endif()
    endif()
endmacro(detect_fortran_compiler)

macro(detect_c_compiler)
    if(CPP_BINDGEN_ENABLE_COMPILER_DETECTION)
        CMAKE_DEPENDENT_OPTION (CPP_BINDGEN_REQUIRE_TEST_C "CMake will abort if no C compiler can be found"
            OFF "BUILD_TESTING" OFF)

        include(CheckLanguage)
        check_language(C)
        if (CMAKE_C_COMPILER OR CPP_BINDGEN_REQUIRE_TEST_C)
            enable_language(C)
        else()
            message(WARNING "C Compiler has not been found. Tests using C will not be built!")
        endif()
    endif()
endmacro(detect_c_compiler)
