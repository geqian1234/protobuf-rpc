#ifndef ZOOKEEPERCLIENT
#define ZOOKEEPERCLIENT
#include"../zk_cpp/zk_cpp.h"
#include<string>
#include<memory>
using zkcpp::zk_cpp;
#ifdef __cplusplus
extern "C"{
    #endif
class ZkClient
{
public:
ZkClient()=default;
~ZkClient()=default;
zkcpp::zoo_rc connect(std::string server);
zkcpp::zoo_rc create_persistence_node(const char* path,std::string const &value);
zkcpp::zoo_rc create_ephemeral_node(const char* path,std::string const &value);
std::shared_ptr<zk_cpp> gethandle();
bool isconnected();
private:

std::shared_ptr<zk_cpp> zoohandle;
bool connected{false};
};
#ifdef __cplusplus
}
#endif
#endif