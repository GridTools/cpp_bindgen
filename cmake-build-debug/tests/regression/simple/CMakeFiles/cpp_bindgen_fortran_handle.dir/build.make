# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/antonaf/cpp_bindgen

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/antonaf/cpp_bindgen/cmake-build-debug

# Include any dependencies generated for this target.
include tests/regression/simple/CMakeFiles/cpp_bindgen_fortran_handle.dir/depend.make

# Include the progress variables for this target.
include tests/regression/simple/CMakeFiles/cpp_bindgen_fortran_handle.dir/progress.make

# Include the compile flags for this target's objects.
include tests/regression/simple/CMakeFiles/cpp_bindgen_fortran_handle.dir/flags.make

tests/regression/simple/CMakeFiles/cpp_bindgen_fortran_handle.dir/__/__/__/src/cpp_bindgen/array_descriptor.f90.o: tests/regression/simple/CMakeFiles/cpp_bindgen_fortran_handle.dir/flags.make
tests/regression/simple/CMakeFiles/cpp_bindgen_fortran_handle.dir/__/__/__/src/cpp_bindgen/array_descriptor.f90.o: ../src/cpp_bindgen/array_descriptor.f90
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/antonaf/cpp_bindgen/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building Fortran object tests/regression/simple/CMakeFiles/cpp_bindgen_fortran_handle.dir/__/__/__/src/cpp_bindgen/array_descriptor.f90.o"
	cd /Users/antonaf/cpp_bindgen/cmake-build-debug/tests/regression/simple && /usr/local/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -c /Users/antonaf/cpp_bindgen/src/cpp_bindgen/array_descriptor.f90 -o CMakeFiles/cpp_bindgen_fortran_handle.dir/__/__/__/src/cpp_bindgen/array_descriptor.f90.o

tests/regression/simple/CMakeFiles/cpp_bindgen_fortran_handle.dir/__/__/__/src/cpp_bindgen/array_descriptor.f90.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing Fortran source to CMakeFiles/cpp_bindgen_fortran_handle.dir/__/__/__/src/cpp_bindgen/array_descriptor.f90.i"
	cd /Users/antonaf/cpp_bindgen/cmake-build-debug/tests/regression/simple && /usr/local/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -E /Users/antonaf/cpp_bindgen/src/cpp_bindgen/array_descriptor.f90 > CMakeFiles/cpp_bindgen_fortran_handle.dir/__/__/__/src/cpp_bindgen/array_descriptor.f90.i

tests/regression/simple/CMakeFiles/cpp_bindgen_fortran_handle.dir/__/__/__/src/cpp_bindgen/array_descriptor.f90.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling Fortran source to assembly CMakeFiles/cpp_bindgen_fortran_handle.dir/__/__/__/src/cpp_bindgen/array_descriptor.f90.s"
	cd /Users/antonaf/cpp_bindgen/cmake-build-debug/tests/regression/simple && /usr/local/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -S /Users/antonaf/cpp_bindgen/src/cpp_bindgen/array_descriptor.f90 -o CMakeFiles/cpp_bindgen_fortran_handle.dir/__/__/__/src/cpp_bindgen/array_descriptor.f90.s

tests/regression/simple/CMakeFiles/cpp_bindgen_fortran_handle.dir/__/__/__/src/cpp_bindgen/string_descriptor.f90.o: tests/regression/simple/CMakeFiles/cpp_bindgen_fortran_handle.dir/flags.make
tests/regression/simple/CMakeFiles/cpp_bindgen_fortran_handle.dir/__/__/__/src/cpp_bindgen/string_descriptor.f90.o: ../src/cpp_bindgen/string_descriptor.f90
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/antonaf/cpp_bindgen/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building Fortran object tests/regression/simple/CMakeFiles/cpp_bindgen_fortran_handle.dir/__/__/__/src/cpp_bindgen/string_descriptor.f90.o"
	cd /Users/antonaf/cpp_bindgen/cmake-build-debug/tests/regression/simple && /usr/local/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -c /Users/antonaf/cpp_bindgen/src/cpp_bindgen/string_descriptor.f90 -o CMakeFiles/cpp_bindgen_fortran_handle.dir/__/__/__/src/cpp_bindgen/string_descriptor.f90.o

tests/regression/simple/CMakeFiles/cpp_bindgen_fortran_handle.dir/__/__/__/src/cpp_bindgen/string_descriptor.f90.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing Fortran source to CMakeFiles/cpp_bindgen_fortran_handle.dir/__/__/__/src/cpp_bindgen/string_descriptor.f90.i"
	cd /Users/antonaf/cpp_bindgen/cmake-build-debug/tests/regression/simple && /usr/local/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -E /Users/antonaf/cpp_bindgen/src/cpp_bindgen/string_descriptor.f90 > CMakeFiles/cpp_bindgen_fortran_handle.dir/__/__/__/src/cpp_bindgen/string_descriptor.f90.i

tests/regression/simple/CMakeFiles/cpp_bindgen_fortran_handle.dir/__/__/__/src/cpp_bindgen/string_descriptor.f90.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling Fortran source to assembly CMakeFiles/cpp_bindgen_fortran_handle.dir/__/__/__/src/cpp_bindgen/string_descriptor.f90.s"
	cd /Users/antonaf/cpp_bindgen/cmake-build-debug/tests/regression/simple && /usr/local/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -S /Users/antonaf/cpp_bindgen/src/cpp_bindgen/string_descriptor.f90 -o CMakeFiles/cpp_bindgen_fortran_handle.dir/__/__/__/src/cpp_bindgen/string_descriptor.f90.s

tests/regression/simple/CMakeFiles/cpp_bindgen_fortran_handle.dir/__/__/__/src/cpp_bindgen/handle.f90.o: tests/regression/simple/CMakeFiles/cpp_bindgen_fortran_handle.dir/flags.make
tests/regression/simple/CMakeFiles/cpp_bindgen_fortran_handle.dir/__/__/__/src/cpp_bindgen/handle.f90.o: ../src/cpp_bindgen/handle.f90
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/antonaf/cpp_bindgen/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building Fortran object tests/regression/simple/CMakeFiles/cpp_bindgen_fortran_handle.dir/__/__/__/src/cpp_bindgen/handle.f90.o"
	cd /Users/antonaf/cpp_bindgen/cmake-build-debug/tests/regression/simple && /usr/local/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -c /Users/antonaf/cpp_bindgen/src/cpp_bindgen/handle.f90 -o CMakeFiles/cpp_bindgen_fortran_handle.dir/__/__/__/src/cpp_bindgen/handle.f90.o

tests/regression/simple/CMakeFiles/cpp_bindgen_fortran_handle.dir/__/__/__/src/cpp_bindgen/handle.f90.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing Fortran source to CMakeFiles/cpp_bindgen_fortran_handle.dir/__/__/__/src/cpp_bindgen/handle.f90.i"
	cd /Users/antonaf/cpp_bindgen/cmake-build-debug/tests/regression/simple && /usr/local/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -E /Users/antonaf/cpp_bindgen/src/cpp_bindgen/handle.f90 > CMakeFiles/cpp_bindgen_fortran_handle.dir/__/__/__/src/cpp_bindgen/handle.f90.i

tests/regression/simple/CMakeFiles/cpp_bindgen_fortran_handle.dir/__/__/__/src/cpp_bindgen/handle.f90.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling Fortran source to assembly CMakeFiles/cpp_bindgen_fortran_handle.dir/__/__/__/src/cpp_bindgen/handle.f90.s"
	cd /Users/antonaf/cpp_bindgen/cmake-build-debug/tests/regression/simple && /usr/local/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -S /Users/antonaf/cpp_bindgen/src/cpp_bindgen/handle.f90 -o CMakeFiles/cpp_bindgen_fortran_handle.dir/__/__/__/src/cpp_bindgen/handle.f90.s

# Object files for target cpp_bindgen_fortran_handle
cpp_bindgen_fortran_handle_OBJECTS = \
"CMakeFiles/cpp_bindgen_fortran_handle.dir/__/__/__/src/cpp_bindgen/array_descriptor.f90.o" \
"CMakeFiles/cpp_bindgen_fortran_handle.dir/__/__/__/src/cpp_bindgen/string_descriptor.f90.o" \
"CMakeFiles/cpp_bindgen_fortran_handle.dir/__/__/__/src/cpp_bindgen/handle.f90.o"

# External object files for target cpp_bindgen_fortran_handle
cpp_bindgen_fortran_handle_EXTERNAL_OBJECTS =

tests/regression/simple/libcpp_bindgen_fortran_handle.a: tests/regression/simple/CMakeFiles/cpp_bindgen_fortran_handle.dir/__/__/__/src/cpp_bindgen/array_descriptor.f90.o
tests/regression/simple/libcpp_bindgen_fortran_handle.a: tests/regression/simple/CMakeFiles/cpp_bindgen_fortran_handle.dir/__/__/__/src/cpp_bindgen/string_descriptor.f90.o
tests/regression/simple/libcpp_bindgen_fortran_handle.a: tests/regression/simple/CMakeFiles/cpp_bindgen_fortran_handle.dir/__/__/__/src/cpp_bindgen/handle.f90.o
tests/regression/simple/libcpp_bindgen_fortran_handle.a: tests/regression/simple/CMakeFiles/cpp_bindgen_fortran_handle.dir/build.make
tests/regression/simple/libcpp_bindgen_fortran_handle.a: tests/regression/simple/CMakeFiles/cpp_bindgen_fortran_handle.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/antonaf/cpp_bindgen/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX static library libcpp_bindgen_fortran_handle.a"
	cd /Users/antonaf/cpp_bindgen/cmake-build-debug/tests/regression/simple && $(CMAKE_COMMAND) -P CMakeFiles/cpp_bindgen_fortran_handle.dir/cmake_clean_target.cmake
	cd /Users/antonaf/cpp_bindgen/cmake-build-debug/tests/regression/simple && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cpp_bindgen_fortran_handle.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/regression/simple/CMakeFiles/cpp_bindgen_fortran_handle.dir/build: tests/regression/simple/libcpp_bindgen_fortran_handle.a

.PHONY : tests/regression/simple/CMakeFiles/cpp_bindgen_fortran_handle.dir/build

tests/regression/simple/CMakeFiles/cpp_bindgen_fortran_handle.dir/clean:
	cd /Users/antonaf/cpp_bindgen/cmake-build-debug/tests/regression/simple && $(CMAKE_COMMAND) -P CMakeFiles/cpp_bindgen_fortran_handle.dir/cmake_clean.cmake
.PHONY : tests/regression/simple/CMakeFiles/cpp_bindgen_fortran_handle.dir/clean

tests/regression/simple/CMakeFiles/cpp_bindgen_fortran_handle.dir/depend:
	cd /Users/antonaf/cpp_bindgen/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/antonaf/cpp_bindgen /Users/antonaf/cpp_bindgen/tests/regression/simple /Users/antonaf/cpp_bindgen/cmake-build-debug /Users/antonaf/cpp_bindgen/cmake-build-debug/tests/regression/simple /Users/antonaf/cpp_bindgen/cmake-build-debug/tests/regression/simple/CMakeFiles/cpp_bindgen_fortran_handle.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/regression/simple/CMakeFiles/cpp_bindgen_fortran_handle.dir/depend
