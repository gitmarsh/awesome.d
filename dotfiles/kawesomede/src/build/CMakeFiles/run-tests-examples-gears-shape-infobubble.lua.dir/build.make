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

# Utility rule file for run-tests-examples-gears-shape-infobubble.lua.

# Include any custom commands dependencies for this target.
include CMakeFiles/run-tests-examples-gears-shape-infobubble.lua.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/run-tests-examples-gears-shape-infobubble.lua.dir/progress.make

CMakeFiles/run-tests-examples-gears-shape-infobubble.lua:
	/home/marhearn/.config/awesome/src/awesome-git/tests/examples/runner.sh /dev/null env -u LUA_PATH_5_1 -u LUA_PATH_5_2 -u LUA_PATH_5_3 "LUA_PATH=/home/marhearn/.config/awesome/src/awesome-git/tests/examples/shims/?.lua;/home/marhearn/.config/awesome/src/awesome-git/tests/examples/shims/?/init.lua;/home/marhearn/.config/awesome/src/awesome-git/tests/examples/shims/?;/home/marhearn/.config/awesome/src/awesome-git/lib/?.lua;/home/marhearn/.config/awesome/src/awesome-git/lib/?/init.lua;/home/marhearn/.config/awesome/src/awesome-git/lib/?;/home/marhearn/.config/awesome/src/awesome-git/themes/?.lua;/home/marhearn/.config/awesome/src/awesome-git/themes/?;/usr/share/lua/5.3/?.lua;/usr/share/lua/5.3/?/init.lua;/usr/lib/lua/5.3/?.lua;/usr/lib/lua/5.3/?/init.lua;./?.lua;./?/init.lua" AWESOME_THEMES_PATH=/home/marhearn/.config/awesome/src/awesome-git/themes/ SOURCE_DIRECTORY=/home/marhearn/.config/awesome/src/awesome-git /usr/bin/lua5.3 /home/marhearn/.config/awesome/src/awesome-git/tests/examples/gears/shape/template.lua /home/marhearn/.config/awesome/src/awesome-git/tests/examples/gears/shape/infobubble.lua /home/marhearn/.config/awesome/src/build/doc/images/AUTOGEN_gears_shape_infobubble

run-tests-examples-gears-shape-infobubble.lua: CMakeFiles/run-tests-examples-gears-shape-infobubble.lua
run-tests-examples-gears-shape-infobubble.lua: CMakeFiles/run-tests-examples-gears-shape-infobubble.lua.dir/build.make
.PHONY : run-tests-examples-gears-shape-infobubble.lua

# Rule to build all files generated by this target.
CMakeFiles/run-tests-examples-gears-shape-infobubble.lua.dir/build: run-tests-examples-gears-shape-infobubble.lua
.PHONY : CMakeFiles/run-tests-examples-gears-shape-infobubble.lua.dir/build

CMakeFiles/run-tests-examples-gears-shape-infobubble.lua.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/run-tests-examples-gears-shape-infobubble.lua.dir/cmake_clean.cmake
.PHONY : CMakeFiles/run-tests-examples-gears-shape-infobubble.lua.dir/clean

CMakeFiles/run-tests-examples-gears-shape-infobubble.lua.dir/depend:
	cd /home/marhearn/.config/awesome/src/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/marhearn/.config/awesome/src/awesome-git /home/marhearn/.config/awesome/src/awesome-git /home/marhearn/.config/awesome/src/build /home/marhearn/.config/awesome/src/build /home/marhearn/.config/awesome/src/build/CMakeFiles/run-tests-examples-gears-shape-infobubble.lua.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/run-tests-examples-gears-shape-infobubble.lua.dir/depend

