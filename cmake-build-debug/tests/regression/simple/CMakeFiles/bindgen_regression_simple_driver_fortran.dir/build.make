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
include tests/regression/simple/CMakeFiles/bindgen_regression_simple_driver_fortran.dir/depend.make

# Include the progress variables for this target.
include tests/regression/simple/CMakeFiles/bindgen_regression_simple_driver_fortran.dir/progress.make

# Include the compile flags for this target's objects.
include tests/regression/simple/CMakeFiles/bindgen_regression_simple_driver_fortran.dir/flags.make

tests/regression/simple/CMakeFiles/bindgen_regression_simple_driver_fortran.dir/driver.f90.o: tests/regression/simple/CMakeFiles/bindgen_regression_simple_driver_fortran.dir/flags.make
tests/regression/simple/CMakeFiles/bindgen_regression_simple_driver_fortran.dir/driver.f90.o: ../tests/regression/simple/driver.f90
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/antonaf/cpp_bindgen/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building Fortran object tests/regression/simple/CMakeFiles/bindgen_regression_simple_driver_fortran.dir/driver.f90.o"
	cd /Users/antonaf/cpp_bindgen/cmake-build-debug/tests/regression/simple && /usr/local/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -c /Users/antonaf/cpp_bindgen/tests/regression/simple/driver.f90 -o CMakeFiles/bindgen_regression_simple_driver_fortran.dir/driver.f90.o

tests/regression/simple/CMakeFiles/bindgen_regression_simple_driver_fortran.dir/driver.f90.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing Fortran source to CMakeFiles/bindgen_regression_simple_driver_fortran.dir/driver.f90.i"
	cd /Users/antonaf/cpp_bindgen/cmake-build-debug/tests/regression/simple && /usr/local/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -E /Users/antonaf/cpp_bindgen/tests/regression/simple/driver.f90 > CMakeFiles/bindgen_regression_simple_driver_fortran.dir/driver.f90.i

tests/regression/simple/CMakeFiles/bindgen_regression_simple_driver_fortran.dir/driver.f90.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling Fortran source to assembly CMakeFiles/bindgen_regression_simple_driver_fortran.dir/driver.f90.s"
	cd /Users/antonaf/cpp_bindgen/cmake-build-debug/tests/regression/simple && /usr/local/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -S /Users/antonaf/cpp_bindgen/tests/regression/simple/driver.f90 -o CMakeFiles/bindgen_regression_simple_driver_fortran.dir/driver.f90.s

# Object files for target bindgen_regression_simple_driver_fortran
bindgen_regression_simple_driver_fortran_OBJECTS = \
"CMakeFiles/bindgen_regression_simple_driver_fortran.dir/driver.f90.o"

# External object files for target bindgen_regression_simple_driver_fortran
bindgen_regression_simple_driver_fortran_EXTERNAL_OBJECTS =

tests/regression/simple/bindgen_regression_simple_driver_fortran: tests/regression/simple/CMakeFiles/bindgen_regression_simple_driver_fortran.dir/driver.f90.o
tests/regression/simple/bindgen_regression_simple_driver_fortran: tests/regression/simple/CMakeFiles/bindgen_regression_simple_driver_fortran.dir/build.make
tests/regression/simple/bindgen_regression_simple_driver_fortran: tests/regression/simple/libbindgen_regression_simple_fortran.a
tests/regression/simple/bindgen_regression_simple_driver_fortran: tests/regression/simple/libbindgen_regression_simple.a
tests/regression/simple/bindgen_regression_simple_driver_fortran: libcpp_bindgen_generator.a
tests/regression/simple/bindgen_regression_simple_driver_fortran: tests/regression/simple/libcpp_bindgen_fortran_handle.a
tests/regression/simple/bindgen_regression_simple_driver_fortran: libcpp_bindgen_handle.a
tests/regression/simple/bindgen_regression_simple_driver_fortran: tests/regression/simple/CMakeFiles/bindgen_regression_simple_driver_fortran.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/antonaf/cpp_bindgen/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable bindgen_regression_simple_driver_fortran"
	cd /Users/antonaf/cpp_bindgen/cmake-build-debug/tests/regression/simple && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/bindgen_regression_simple_driver_fortran.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/regression/simple/CMakeFiles/bindgen_regression_simple_driver_fortran.dir/build: tests/regression/simple/bindgen_regression_simple_driver_fortran

.PHONY : tests/regression/simple/CMakeFiles/bindgen_regression_simple_driver_fortran.dir/build

tests/regression/simple/CMakeFiles/bindgen_regression_simple_driver_fortran.dir/clean:
	cd /Users/antonaf/cpp_bindgen/cmake-build-debug/tests/regression/simple && $(CMAKE_COMMAND) -P CMakeFiles/bindgen_regression_simple_driver_fortran.dir/cmake_clean.cmake
.PHONY : tests/regression/simple/CMakeFiles/bindgen_regression_simple_driver_fortran.dir/clean

tests/regression/simple/CMakeFiles/bindgen_regression_simple_driver_fortran.dir/depend:
	cd /Users/antonaf/cpp_bindgen/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/antonaf/cpp_bindgen /Users/antonaf/cpp_bindgen/tests/regression/simple /Users/antonaf/cpp_bindgen/cmake-build-debug /Users/antonaf/cpp_bindgen/cmake-build-debug/tests/regression/simple /Users/antonaf/cpp_bindgen/cmake-build-debug/tests/regression/simple/CMakeFiles/bindgen_regression_simple_driver_fortran.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/regression/simple/CMakeFiles/bindgen_regression_simple_driver_fortran.dir/depend
