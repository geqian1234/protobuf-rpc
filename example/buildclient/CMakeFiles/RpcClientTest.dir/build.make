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
CMAKE_SOURCE_DIR = /home/feng/CLionProjects/git-tinglei/protobuf-rpc/example

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/feng/CLionProjects/git-tinglei/protobuf-rpc/example/buildclient

# Include any dependencies generated for this target.
include CMakeFiles/RpcClientTest.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/RpcClientTest.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/RpcClientTest.dir/flags.make

CMakeFiles/RpcClientTest.dir/exampleservice.pb.cc.o: CMakeFiles/RpcClientTest.dir/flags.make
CMakeFiles/RpcClientTest.dir/exampleservice.pb.cc.o: ../exampleservice.pb.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/feng/CLionProjects/git-tinglei/protobuf-rpc/example/buildclient/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/RpcClientTest.dir/exampleservice.pb.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/RpcClientTest.dir/exampleservice.pb.cc.o -c /home/feng/CLionProjects/git-tinglei/protobuf-rpc/example/exampleservice.pb.cc

CMakeFiles/RpcClientTest.dir/exampleservice.pb.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/RpcClientTest.dir/exampleservice.pb.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/feng/CLionProjects/git-tinglei/protobuf-rpc/example/exampleservice.pb.cc > CMakeFiles/RpcClientTest.dir/exampleservice.pb.cc.i

CMakeFiles/RpcClientTest.dir/exampleservice.pb.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/RpcClientTest.dir/exampleservice.pb.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/feng/CLionProjects/git-tinglei/protobuf-rpc/example/exampleservice.pb.cc -o CMakeFiles/RpcClientTest.dir/exampleservice.pb.cc.s

CMakeFiles/RpcClientTest.dir/RpcClientTest.cc.o: CMakeFiles/RpcClientTest.dir/flags.make
CMakeFiles/RpcClientTest.dir/RpcClientTest.cc.o: ../RpcClientTest.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/feng/CLionProjects/git-tinglei/protobuf-rpc/example/buildclient/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/RpcClientTest.dir/RpcClientTest.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/RpcClientTest.dir/RpcClientTest.cc.o -c /home/feng/CLionProjects/git-tinglei/protobuf-rpc/example/RpcClientTest.cc

CMakeFiles/RpcClientTest.dir/RpcClientTest.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/RpcClientTest.dir/RpcClientTest.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/feng/CLionProjects/git-tinglei/protobuf-rpc/example/RpcClientTest.cc > CMakeFiles/RpcClientTest.dir/RpcClientTest.cc.i

CMakeFiles/RpcClientTest.dir/RpcClientTest.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/RpcClientTest.dir/RpcClientTest.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/feng/CLionProjects/git-tinglei/protobuf-rpc/example/RpcClientTest.cc -o CMakeFiles/RpcClientTest.dir/RpcClientTest.cc.s

# Object files for target RpcClientTest
RpcClientTest_OBJECTS = \
"CMakeFiles/RpcClientTest.dir/exampleservice.pb.cc.o" \
"CMakeFiles/RpcClientTest.dir/RpcClientTest.cc.o"

# External object files for target RpcClientTest
RpcClientTest_EXTERNAL_OBJECTS =

RpcClientTest: CMakeFiles/RpcClientTest.dir/exampleservice.pb.cc.o
RpcClientTest: CMakeFiles/RpcClientTest.dir/RpcClientTest.cc.o
RpcClientTest: CMakeFiles/RpcClientTest.dir/build.make
RpcClientTest: CMakeFiles/RpcClientTest.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/feng/CLionProjects/git-tinglei/protobuf-rpc/example/buildclient/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable RpcClientTest"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/RpcClientTest.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/RpcClientTest.dir/build: RpcClientTest

.PHONY : CMakeFiles/RpcClientTest.dir/build

CMakeFiles/RpcClientTest.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/RpcClientTest.dir/cmake_clean.cmake
.PHONY : CMakeFiles/RpcClientTest.dir/clean

CMakeFiles/RpcClientTest.dir/depend:
	cd /home/feng/CLionProjects/git-tinglei/protobuf-rpc/example/buildclient && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/feng/CLionProjects/git-tinglei/protobuf-rpc/example /home/feng/CLionProjects/git-tinglei/protobuf-rpc/example /home/feng/CLionProjects/git-tinglei/protobuf-rpc/example/buildclient /home/feng/CLionProjects/git-tinglei/protobuf-rpc/example/buildclient /home/feng/CLionProjects/git-tinglei/protobuf-rpc/example/buildclient/CMakeFiles/RpcClientTest.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/RpcClientTest.dir/depend
