enable_language(Fortran) #TODO conditionally
enable_language(C) #TODO conditionally

add_subdirectory(array)
if(CPP_BINDGEN_GT_LEGACY)
    add_subdirectory(array_gt_legacy)
endif()

add_subdirectory(simple)
