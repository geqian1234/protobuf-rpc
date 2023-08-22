cmake_minimum_required(VERSION 3.0.2)
project(zookeeperrpc)

add_compile_options(-std=c++17)
add_library(zookeeperrpc
          zookeeperclient.h
          zookeeperclient.cpp
          zookeepercenter.h
          zookeepercenter.cpp
        )
target_link_libraries(zookeeperrpc zk_cpp)