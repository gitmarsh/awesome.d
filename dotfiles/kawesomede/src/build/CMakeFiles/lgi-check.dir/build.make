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
include CMakeFiles/lgi-check.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/lgi-check.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/lgi-check.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/lgi-check.dir/flags.make

CMakeFiles/lgi-check.dir/build-utils/lgi-check.c.o: CMakeFiles/lgi-check.dir/flags.make
CMakeFiles/lgi-check.dir/build-utils/lgi-check.c.o: /home/marhearn/.config/awesome/src/awesome-git/build-utils/lgi-check.c
CMakeFiles/lgi-check.dir/build-utils/lgi-check.c.o: CMakeFiles/lgi-check.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/marhearn/.config/awesome/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/lgi-check.dir/build-utils/lgi-check.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/lgi-check.dir/build-utils/lgi-check.c.o -MF CMakeFiles/lgi-check.dir/build-utils/lgi-check.c.o.d -o CMakeFiles/lgi-check.dir/build-utils/lgi-check.c.o -c /home/marhearn/.config/awesome/src/awesome-git/build-utils/lgi-check.c

CMakeFiles/lgi-check.dir/build-utils/lgi-check.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lgi-check.dir/build-utils/lgi-check.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/marhearn/.config/awesome/src/awesome-git/build-utils/lgi-check.c > CMakeFiles/lgi-check.dir/build-utils/lgi-check.c.i

CMakeFiles/lgi-check.dir/build-utils/lgi-check.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lgi-check.dir/build-utils/lgi-check.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/marhearn/.config/awesome/src/awesome-git/build-utils/lgi-check.c -o CMakeFiles/lgi-check.dir/build-utils/lgi-check.c.s

# Object files for target lgi-check
lgi__check_OBJECTS = \
"CMakeFiles/lgi-check.dir/build-utils/lgi-check.c.o"

# External object files for target lgi-check
lgi__check_EXTERNAL_OBJECTS =

lgi-check: CMakeFiles/lgi-check.dir/build-utils/lgi-check.c.o
lgi-check: CMakeFiles/lgi-check.dir/build.make
lgi-check: /usr/lib/liblua.so.5.3
lgi-check: /usr/lib/libm.so
lgi-check: CMakeFiles/lgi-check.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/marhearn/.config/awesome/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable lgi-check"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lgi-check.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/lgi-check.dir/build: lgi-check
.PHONY : CMakeFiles/lgi-check.dir/build

CMakeFiles/lgi-check.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/lgi-check.dir/cmake_clean.cmake
.PHONY : CMakeFiles/lgi-check.dir/clean

CMakeFiles/lgi-check.dir/depend:
	cd /home/marhearn/.config/awesome/src/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/marhearn/.config/awesome/src/awesome-git /home/marhearn/.config/awesome/src/awesome-git /home/marhearn/.config/awesome/src/build /home/marhearn/.config/awesome/src/build /home/marhearn/.config/awesome/src/build/CMakeFiles/lgi-check.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/lgi-check.dir/depend

