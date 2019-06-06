include(${PROJECT_SOURCE_DIR}/cmake/detect_features.cmake)
detect_fortran_compiler()
detect_c_compiler()

add_subdirectory(array)
if(CPP_BINDGEN_GT_LEGACY)
    add_subdirectory(array_gt_legacy)
endif()

add_subdirectory(simple)
