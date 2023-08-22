cmake_minimum_required(VERSION 3.0.2)
project(zk_cpp)
add_definitions(-DTHREADED)
add_compile_options(-std=c++17)
add_definitions()
add_library(zk_cpp
         zk_cpp.h
         zk_cpp.cpp

        )
target_link_libraries(zk_cpp zookeeper_mt)
target_include_directories(zk_cpp   PRIVATE /usr/local/include)

add_executable(zk_cpp_test zk_cpp_test.cpp)
target_link_libraries(zk_cpp_test zk_cpp zookeeper_mt)
target_link_directories(zk_cpp_test BEFORE PUBLIC /usr/local/lib)