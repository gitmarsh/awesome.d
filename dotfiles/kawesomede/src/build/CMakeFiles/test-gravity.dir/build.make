# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.23

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

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/marhearn/.config/awesome/src/awesome-git

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/marhearn/.config/awesome/src/build

# Include any dependencies generated for this target.
include CMakeFiles/test-gravity.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/test-gravity.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/test-gravity.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/test-gravity.dir/flags.make

CMakeFiles/test-gravity.dir/tests/test-gravity.c.o: CMakeFiles/test-gravity.dir/flags.make
CMakeFiles/test-gravity.dir/tests/test-gravity.c.o: /home/marhearn/.config/awesome/src/awesome-git/tests/test-gravity.c
CMakeFiles/test-gravity.dir/tests/test-gravity.c.o: CMakeFiles/test-gravity.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/marhearn/.config/awesome/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/test-gravity.dir/tests/test-gravity.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/test-gravity.dir/tests/test-gravity.c.o -MF CMakeFiles/test-gravity.dir/tests/test-gravity.c.o.d -o CMakeFiles/test-gravity.dir/tests/test-gravity.c.o -c /home/marhearn/.config/awesome/src/awesome-git/tests/test-gravity.c

CMakeFiles/test-gravity.dir/tests/test-gravity.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test-gravity.dir/tests/test-gravity.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/marhearn/.config/awesome/src/awesome-git/tests/test-gravity.c > CMakeFiles/test-gravity.dir/tests/test-gravity.c.i

CMakeFiles/test-gravity.dir/tests/test-gravity.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test-gravity.dir/tests/test-gravity.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/marhearn/.config/awesome/src/awesome-git/tests/test-gravity.c -o CMakeFiles/test-gravity.dir/tests/test-gravity.c.s

# Object files for target test-gravity
test__gravity_OBJECTS = \
"CMakeFiles/test-gravity.dir/tests/test-gravity.c.o"

# External object files for target test-gravity
test__gravity_EXTERNAL_OBJECTS =

test-gravity: CMakeFiles/test-gravity.dir/tests/test-gravity.c.o
test-gravity: CMakeFiles/test-gravity.dir/build.make
test-gravity: /usr/lib/liblua.so.5.3
test-gravity: /usr/lib/libm.so
test-gravity: /usr/lib/liblua.so.5.3
test-gravity: /usr/lib/libm.so
test-gravity: CMakeFiles/test-gravity.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/marhearn/.config/awesome/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable test-gravity"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test-gravity.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/test-gravity.dir/build: test-gravity
.PHONY : CMakeFiles/test-gravity.dir/build

CMakeFiles/test-gravity.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/test-gravity.dir/cmake_clean.cmake
.PHONY : CMakeFiles/test-gravity.dir/clean

CMakeFiles/test-gravity.dir/depend:
	cd /home/marhearn/.config/awesome/src/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/marhearn/.config/awesome/src/awesome-git /home/marhearn/.config/awesome/src/awesome-git /home/marhearn/.config/awesome/src/build /home/marhearn/.config/awesome/src/build /home/marhearn/.config/awesome/src/build/CMakeFiles/test-gravity.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/test-gravity.dir/depend
