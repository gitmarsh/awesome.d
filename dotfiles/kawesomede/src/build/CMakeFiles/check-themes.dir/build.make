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

# Utility rule file for check-themes.

# Include any custom commands dependencies for this target.
include CMakeFiles/check-themes.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/check-themes.dir/progress.make

CMakeFiles/check-themes: awesome
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/marhearn/.config/awesome/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Testing themes"
	cd /home/marhearn/.config/awesome/src/awesome-git && /usr/bin/cmake -E env CMAKE_BINARY_DIR='/home/marhearn/.config/awesome/src/build' LUA='/usr/bin/lua5.3' ./tests/themes/run.sh

check-themes: CMakeFiles/check-themes
check-themes: CMakeFiles/check-themes.dir/build.make
.PHONY : check-themes

# Rule to build all files generated by this target.
CMakeFiles/check-themes.dir/build: check-themes
.PHONY : CMakeFiles/check-themes.dir/build

CMakeFiles/check-themes.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/check-themes.dir/cmake_clean.cmake
.PHONY : CMakeFiles/check-themes.dir/clean

CMakeFiles/check-themes.dir/depend:
	cd /home/marhearn/.config/awesome/src/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/marhearn/.config/awesome/src/awesome-git /home/marhearn/.config/awesome/src/awesome-git /home/marhearn/.config/awesome/src/build /home/marhearn/.config/awesome/src/build /home/marhearn/.config/awesome/src/build/CMakeFiles/check-themes.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/check-themes.dir/depend

