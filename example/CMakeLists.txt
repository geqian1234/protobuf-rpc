project(example)
cmake_minimum_required(VERSION 3.0.2)
include_directories(/home/feng/CLionProjects/git-tinglei/protobuf-rpc)

include_directories(/usr/local/include/zookeeper)
link_directories(/home/feng/CLionProjects/git-tinglei/protobuf-rpc/lib)
link_directories(/usr/local/lib)
add_definitions(-DTHREADED)
link_libraries(protobuf glog gflags wangle fizz proxygencurl proxygen folly fmt 
boost_context boost_filesystem boost_system double-conversion glog gflags event
ssl crypto pthread z rt ${event} dl iberty lzma unwind lz4 zstd snappy sodium absl_base 
absl_city absl_cord absl_log_severity gmock
absl_spinlock_wait absl_malloc_internal absl_throw_delegate absl_log_internal_check_op
absl_log_flags absl_log_globals absl_log_initialize absl_log_entry
absl_scoped_mock_log absl_int128 absl_strings absl_time absl_strings absl_string_view 
absl_strings_internal
absl_cordz_info absl_cordz_handle absl_bad_variant_access absl_bad_optional_access
absl_time_zone absl_synchronization absl_kernel_timeout_internal absl_cordz_sample_token absl_cord_internal
absl_exponential_biased absl_die_if_null absl_log_internal_nullguard absl_log_internal_log_sink_set
absl_log_internal_message absl_log_internal_proto absl_log_internal_format 
absl_strerror absl_hashtablez_sampler absl_raw_hash_set absl_crc_cpu_detect absl_log_sink
absl_log_internal_check_op absl_log_internal_conditions utf8_validity absl_log_severity 
absl_raw_logging_internal absl_scoped_set_env absl_crc_cord_state absl_crc_internal absl_crc32c
absl_malloc_internal absl_spinlock_wait absl_periodic_sampler absl_log_initialize  absl_graphcycles_internal absl_hash 
absl_low_level_hash absl_status absl_statusor 
absl_str_format_internal absl_cordz_functions
absl_bad_any_cast_impl absl_civil_time
absl_random_distributions absl_stacktrace absl_symbolize absl_leak_check 
absl_failure_signal_handler absl_examine_stack absl_demangle_internal absl_debugging_internal
absl_throw_delegate absl_flags_commandlineflag_internal
absl_flags_commandlineflag absl_flags_config absl_flags_internal absl_flags_marshalling
absl_flags_parse absl_flags_private_handle_accessor absl_flags_program_name 
absl_flags_reflection absl_flags_usage_internal absl_flags
absl_log_flags absl_exponential_biased absl_log_internal_globals)    
link_libraries(zookeeperrpc)
########## RPC客户端测试 promise/future风格异步RPC调用 #######
add_executable(RpcClientTest
        exampleservice.pb.cc
        exampleservice.pb.h
        RpcClientTest.cc
        )
target_link_libraries(RpcClientTest
            pbrpc zk_cpp zookeeperrpc zookeeper_mt
        )
################ RPC 服务器测试 ###########################
add_executable(RpcServerTest
         exampleservice.pb.cc
       exampleservice.pb.h
        RpcServerTest.cc
        )
target_link_libraries(RpcServerTest
        pbrpc zk_cpp zookeeperrpc zookeeper_mt
        )

target_include_directories(RpcServerTest PUBLIC /usr/local/include)