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

# Utility rule file for generated_sources.

# Include any custom commands dependencies for this target.
include CMakeFiles/generated_sources.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/generated_sources.dir/progress.make

CMakeFiles/generated_sources: common/atoms-intern.h
CMakeFiles/generated_sources: common/atoms-extern.h

common/atoms-extern.h: /home/marhearn/.config/awesome/src/awesome-git/common/atoms.list
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/marhearn/.config/awesome/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating atoms-extern.h"
	cd /home/marhearn/.config/awesome/src/awesome-git && /home/marhearn/.config/awesome/src/awesome-git/build-utils/atoms-ext.sh /home/marhearn/.config/awesome/src/awesome-git/common/atoms.list > /home/marhearn/.config/awesome/src/build/common/atoms-extern.h

common/atoms-intern.h: /home/marhearn/.config/awesome/src/awesome-git/common/atoms.list
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/marhearn/.config/awesome/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating atoms-intern.h"
	cd /home/marhearn/.config/awesome/src/awesome-git && /home/marhearn/.config/awesome/src/awesome-git/build-utils/atoms-int.sh /home/marhearn/.config/awesome/src/awesome-git/common/atoms.list > /home/marhearn/.config/awesome/src/build/common/atoms-intern.h

generated_sources: CMakeFiles/generated_sources
generated_sources: common/atoms-extern.h
generated_sources: common/atoms-intern.h
generated_sources: CMakeFiles/generated_sources.dir/build.make
.PHONY : generated_sources

# Rule to build all files generated by this target.
CMakeFiles/generated_sources.dir/build: generated_sources
.PHONY : CMakeFiles/generated_sources.dir/build

CMakeFiles/generated_sources.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/generated_sources.dir/cmake_clean.cmake
.PHONY : CMakeFiles/generated_sources.dir/clean

CMakeFiles/generated_sources.dir/depend:
	cd /home/marhearn/.config/awesome/src/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/marhearn/.config/awesome/src/awesome-git /home/marhearn/.config/awesome/src/awesome-git /home/marhearn/.config/awesome/src/build /home/marhearn/.config/awesome/src/build /home/marhearn/.config/awesome/src/build/CMakeFiles/generated_sources.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/generated_sources.dir/depend

