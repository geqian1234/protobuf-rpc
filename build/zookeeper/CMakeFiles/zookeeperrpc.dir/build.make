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
include zookeeper/CMakeFiles/zookeeperrpc.dir/depend.make

# Include the progress variables for this target.
include zookeeper/CMakeFiles/zookeeperrpc.dir/progress.make

# Include the compile flags for this target's objects.
include zookeeper/CMakeFiles/zookeeperrpc.dir/flags.make

zookeeper/CMakeFiles/zookeeperrpc.dir/zookeeperclient.cpp.o: zookeeper/CMakeFiles/zookeeperrpc.dir/flags.make
zookeeper/CMakeFiles/zookeeperrpc.dir/zookeeperclient.cpp.o: ../zookeeper/zookeeperclient.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/feng/CLionProjects/git-tinglei/protobuf-rpc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object zookeeper/CMakeFiles/zookeeperrpc.dir/zookeeperclient.cpp.o"
	cd /home/feng/CLionProjects/git-tinglei/protobuf-rpc/build/zookeeper && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/zookeeperrpc.dir/zookeeperclient.cpp.o -c /home/feng/CLionProjects/git-tinglei/protobuf-rpc/zookeeper/zookeeperclient.cpp

zookeeper/CMakeFiles/zookeeperrpc.dir/zookeeperclient.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/zookeeperrpc.dir/zookeeperclient.cpp.i"
	cd /home/feng/CLionProjects/git-tinglei/protobuf-rpc/build/zookeeper && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/feng/CLionProjects/git-tinglei/protobuf-rpc/zookeeper/zookeeperclient.cpp > CMakeFiles/zookeeperrpc.dir/zookeeperclient.cpp.i

zookeeper/CMakeFiles/zookeeperrpc.dir/zookeeperclient.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/zookeeperrpc.dir/zookeeperclient.cpp.s"
	cd /home/feng/CLionProjects/git-tinglei/protobuf-rpc/build/zookeeper && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/feng/CLionProjects/git-tinglei/protobuf-rpc/zookeeper/zookeeperclient.cpp -o CMakeFiles/zookeeperrpc.dir/zookeeperclient.cpp.s

zookeeper/CMakeFiles/zookeeperrpc.dir/zookeepercenter.cpp.o: zookeeper/CMakeFiles/zookeeperrpc.dir/flags.make
zookeeper/CMakeFiles/zookeeperrpc.dir/zookeepercenter.cpp.o: ../zookeeper/zookeepercenter.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/feng/CLionProjects/git-tinglei/protobuf-rpc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object zookeeper/CMakeFiles/zookeeperrpc.dir/zookeepercenter.cpp.o"
	cd /home/feng/CLionProjects/git-tinglei/protobuf-rpc/build/zookeeper && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/zookeeperrpc.dir/zookeepercenter.cpp.o -c /home/feng/CLionProjects/git-tinglei/protobuf-rpc/zookeeper/zookeepercenter.cpp

zookeeper/CMakeFiles/zookeeperrpc.dir/zookeepercenter.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/zookeeperrpc.dir/zookeepercenter.cpp.i"
	cd /home/feng/CLionProjects/git-tinglei/protobuf-rpc/build/zookeeper && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/feng/CLionProjects/git-tinglei/protobuf-rpc/zookeeper/zookeepercenter.cpp > CMakeFiles/zookeeperrpc.dir/zookeepercenter.cpp.i

zookeeper/CMakeFiles/zookeeperrpc.dir/zookeepercenter.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/zookeeperrpc.dir/zookeepercenter.cpp.s"
	cd /home/feng/CLionProjects/git-tinglei/protobuf-rpc/build/zookeeper && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/feng/CLionProjects/git-tinglei/protobuf-rpc/zookeeper/zookeepercenter.cpp -o CMakeFiles/zookeeperrpc.dir/zookeepercenter.cpp.s

# Object files for target zookeeperrpc
zookeeperrpc_OBJECTS = \
"CMakeFiles/zookeeperrpc.dir/zookeeperclient.cpp.o" \
"CMakeFiles/zookeeperrpc.dir/zookeepercenter.cpp.o"

# External object files for target zookeeperrpc
zookeeperrpc_EXTERNAL_OBJECTS =

../lib/libzookeeperrpc.a: zookeeper/CMakeFiles/zookeeperrpc.dir/zookeeperclient.cpp.o
../lib/libzookeeperrpc.a: zookeeper/CMakeFiles/zookeeperrpc.dir/zookeepercenter.cpp.o
../lib/libzookeeperrpc.a: zookeeper/CMakeFiles/zookeeperrpc.dir/build.make
../lib/libzookeeperrpc.a: zookeeper/CMakeFiles/zookeeperrpc.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/feng/CLionProjects/git-tinglei/protobuf-rpc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX static library ../../lib/libzookeeperrpc.a"
	cd /home/feng/CLionProjects/git-tinglei/protobuf-rpc/build/zookeeper && $(CMAKE_COMMAND) -P CMakeFiles/zookeeperrpc.dir/cmake_clean_target.cmake
	cd /home/feng/CLionProjects/git-tinglei/protobuf-rpc/build/zookeeper && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/zookeeperrpc.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
zookeeper/CMakeFiles/zookeeperrpc.dir/build: ../lib/libzookeeperrpc.a

.PHONY : zookeeper/CMakeFiles/zookeeperrpc.dir/build

zookeeper/CMakeFiles/zookeeperrpc.dir/clean:
	cd /home/feng/CLionProjects/git-tinglei/protobuf-rpc/build/zookeeper && $(CMAKE_COMMAND) -P CMakeFiles/zookeeperrpc.dir/cmake_clean.cmake
.PHONY : zookeeper/CMakeFiles/zookeeperrpc.dir/clean

zookeeper/CMakeFiles/zookeeperrpc.dir/depend:
	cd /home/feng/CLionProjects/git-tinglei/protobuf-rpc/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/feng/CLionProjects/git-tinglei/protobuf-rpc /home/feng/CLionProjects/git-tinglei/protobuf-rpc/zookeeper /home/feng/CLionProjects/git-tinglei/protobuf-rpc/build /home/feng/CLionProjects/git-tinglei/protobuf-rpc/build/zookeeper /home/feng/CLionProjects/git-tinglei/protobuf-rpc/build/zookeeper/CMakeFiles/zookeeperrpc.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : zookeeper/CMakeFiles/zookeeperrpc.dir/depend

