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
include CMakeFiles/test-systray.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/test-systray.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/test-systray.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/test-systray.dir/flags.make

CMakeFiles/test-systray.dir/tests/test-systray.c.o: CMakeFiles/test-systray.dir/flags.make
CMakeFiles/test-systray.dir/tests/test-systray.c.o: /home/marhearn/.config/awesome/src/awesome-git/tests/test-systray.c
CMakeFiles/test-systray.dir/tests/test-systray.c.o: CMakeFiles/test-systray.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/marhearn/.config/awesome/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/test-systray.dir/tests/test-systray.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/test-systray.dir/tests/test-systray.c.o -MF CMakeFiles/test-systray.dir/tests/test-systray.c.o.d -o CMakeFiles/test-systray.dir/tests/test-systray.c.o -c /home/marhearn/.config/awesome/src/awesome-git/tests/test-systray.c

CMakeFiles/test-systray.dir/tests/test-systray.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test-systray.dir/tests/test-systray.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/marhearn/.config/awesome/src/awesome-git/tests/test-systray.c > CMakeFiles/test-systray.dir/tests/test-systray.c.i

CMakeFiles/test-systray.dir/tests/test-systray.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test-systray.dir/tests/test-systray.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/marhearn/.config/awesome/src/awesome-git/tests/test-systray.c -o CMakeFiles/test-systray.dir/tests/test-systray.c.s

# Object files for target test-systray
test__systray_OBJECTS = \
"CMakeFiles/test-systray.dir/tests/test-systray.c.o"

# External object files for target test-systray
test__systray_EXTERNAL_OBJECTS =

test-systray: CMakeFiles/test-systray.dir/tests/test-systray.c.o
test-systray: CMakeFiles/test-systray.dir/build.make
test-systray: /usr/lib/liblua.so.5.3
test-systray: /usr/lib/libm.so
test-systray: /usr/lib/liblua.so.5.3
test-systray: /usr/lib/libm.so
test-systray: CMakeFiles/test-systray.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/marhearn/.config/awesome/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable test-systray"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test-systray.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/test-systray.dir/build: test-systray
.PHONY : CMakeFiles/test-systray.dir/build

CMakeFiles/test-systray.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/test-systray.dir/cmake_clean.cmake
.PHONY : CMakeFiles/test-systray.dir/clean

CMakeFiles/test-systray.dir/depend:
	cd /home/marhearn/.config/awesome/src/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/marhearn/.config/awesome/src/awesome-git /home/marhearn/.config/awesome/src/awesome-git /home/marhearn/.config/awesome/src/build /home/marhearn/.config/awesome/src/build /home/marhearn/.config/awesome/src/build/CMakeFiles/test-systray.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/test-systray.dir/depend

