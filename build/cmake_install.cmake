# Install script for directory: /home/feng/CLionProjects/git-tinglei/protobuf-rpc

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/libstatic" TYPE STATIC_LIBRARY FILES "/home/feng/CLionProjects/git-tinglei/protobuf-rpc/lib/libpbrpc.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/home/feng/CLionProjects/git-tinglei/protobuf-rpc/protobufCoder/RpcMessage.pb.h"
    "/home/feng/CLionProjects/git-tinglei/protobuf-rpc/protobufCoder/RpcMsgSerializeHandler.h"
    "/home/feng/CLionProjects/git-tinglei/protobuf-rpc/net/ServiceDispatcher/ServerDispatcher.h"
    "/home/feng/CLionProjects/git-tinglei/protobuf-rpc/net/ServiceDispatcher/ClientDispatcher.h"
    "/home/feng/CLionProjects/git-tinglei/protobuf-rpc/net/PbRpcClient.h"
    "/home/feng/CLionProjects/git-tinglei/protobuf-rpc/net/PbRpcServer.h"
    "/home/feng/CLionProjects/git-tinglei/protobuf-rpc/codec/LengthFieldPrepender.h"
    "/home/feng/CLionProjects/git-tinglei/protobuf-rpc/codec/LengthFieldBasedFrameDecoder.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/feng/CLionProjects/git-tinglei/protobuf-rpc/build/zk_cpp/cmake_install.cmake")
  include("/home/feng/CLionProjects/git-tinglei/protobuf-rpc/build/zookeeper/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/feng/CLionProjects/git-tinglei/protobuf-rpc/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
