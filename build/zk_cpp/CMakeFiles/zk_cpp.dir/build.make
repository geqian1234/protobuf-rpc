# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/feng/CLionProjects/git-tinglei/protobuf-rpc

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/feng/CLionProjects/git-tinglei/protobuf-rpc/build

# Include any dependencies generated for this target.
include zk_cpp/CMakeFiles/zk_cpp.dir/depend.make

# Include the progress variables for this target.
include zk_cpp/CMakeFiles/zk_cpp.dir/progress.make

# Include the compile flags for this target's objects.
include zk_cpp/CMakeFiles/zk_cpp.dir/flags.make

zk_cpp/CMakeFiles/zk_cpp.dir/zk_cpp.cpp.o: zk_cpp/CMakeFiles/zk_cpp.dir/flags.make
zk_cpp/CMakeFiles/zk_cpp.dir/zk_cpp.cpp.o: ../zk_cpp/zk_cpp.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/feng/CLionProjects/git-tinglei/protobuf-rpc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object zk_cpp/CMakeFiles/zk_cpp.dir/zk_cpp.cpp.o"
	cd /home/feng/CLionProjects/git-tinglei/protobuf-rpc/build/zk_cpp && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/zk_cpp.dir/zk_cpp.cpp.o -c /home/feng/CLionProjects/git-tinglei/protobuf-rpc/zk_cpp/zk_cpp.cpp

zk_cpp/CMakeFiles/zk_cpp.dir/zk_cpp.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/zk_cpp.dir/zk_cpp.cpp.i"
	cd /home/feng/CLionProjects/git-tinglei/protobuf-rpc/build/zk_cpp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/feng/CLionProjects/git-tinglei/protobuf-rpc/zk_cpp/zk_cpp.cpp > CMakeFiles/zk_cpp.dir/zk_cpp.cpp.i

zk_cpp/CMakeFiles/zk_cpp.dir/zk_cpp.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/zk_cpp.dir/zk_cpp.cpp.s"
	cd /home/feng/CLionProjects/git-tinglei/protobuf-rpc/build/zk_cpp && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/feng/CLionProjects/git-tinglei/protobuf-rpc/zk_cpp/zk_cpp.cpp -o CMakeFiles/zk_cpp.dir/zk_cpp.cpp.s

# Object files for target zk_cpp
zk_cpp_OBJECTS = \
"CMakeFiles/zk_cpp.dir/zk_cpp.cpp.o"

# External object files for target zk_cpp
zk_cpp_EXTERNAL_OBJECTS =

../lib/libzk_cpp.a: zk_cpp/CMakeFiles/zk_cpp.dir/zk_cpp.cpp.o
../lib/libzk_cpp.a: zk_cpp/CMakeFiles/zk_cpp.dir/build.make
../lib/libzk_cpp.a: zk_cpp/CMakeFiles/zk_cpp.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/feng/CLionProjects/git-tinglei/protobuf-rpc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library ../../lib/libzk_cpp.a"
	cd /home/feng/CLionProjects/git-tinglei/protobuf-rpc/build/zk_cpp && $(CMAKE_COMMAND) -P CMakeFiles/zk_cpp.dir/cmake_clean_target.cmake
	cd /home/feng/CLionProjects/git-tinglei/protobuf-rpc/build/zk_cpp && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/zk_cpp.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
zk_cpp/CMakeFiles/zk_cpp.dir/build: ../lib/libzk_cpp.a

.PHONY : zk_cpp/CMakeFiles/zk_cpp.dir/build

zk_cpp/CMakeFiles/zk_cpp.dir/clean:
	cd /home/feng/CLionProjects/git-tinglei/protobuf-rpc/build/zk_cpp && $(CMAKE_COMMAND) -P CMakeFiles/zk_cpp.dir/cmake_clean.cmake
.PHONY : zk_cpp/CMakeFiles/zk_cpp.dir/clean

zk_cpp/CMakeFiles/zk_cpp.dir/depend:
	cd /home/feng/CLionProjects/git-tinglei/protobuf-rpc/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/feng/CLionProjects/git-tinglei/protobuf-rpc /home/feng/CLionProjects/git-tinglei/protobuf-rpc/zk_cpp /home/feng/CLionProjects/git-tinglei/protobuf-rpc/build /home/feng/CLionProjects/git-tinglei/protobuf-rpc/build/zk_cpp /home/feng/CLionProjects/git-tinglei/protobuf-rpc/build/zk_cpp/CMakeFiles/zk_cpp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : zk_cpp/CMakeFiles/zk_cpp.dir/depend

