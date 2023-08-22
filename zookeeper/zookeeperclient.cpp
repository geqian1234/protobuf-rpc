#include"zookeeperclient.h"

zkcpp::zoo_rc ZkClient::connect(std::string server)
{
    if(!zoohandle)
    {
       zoohandle=std::make_shared<zk_cpp>();
    }
   zkcpp::zoo_rc ret=zoohandle->connect(server);
   connected=ret==zkcpp::zoo_rc::z_ok?true:false;
   return ret;
}
std::shared_ptr<zk_cpp> ZkClient::gethandle()
{
    return zoohandle;
}
zkcpp::zoo_rc ZkClient::create_persistence_node(const char* path,std::string const& value)
{
    std::vector<zkcpp::zoo_acl_t> acl;
    acl.push_back(zk_cpp::create_world_acl(zkcpp::zoo_perm_all));
    zoohandle->create_persistent_node(path,value,acl);
}
zkcpp::zoo_rc ZkClient::create_ephemeral_node(const char* path,std::string const &value)
{
    std::vector<zkcpp::zoo_acl_t> acl;
    acl.push_back(zk_cpp::create_world_acl(zkcpp::zoo_perm_all));
    zoohandle->create_ephemeral_node(path,value,acl);
}

bool ZkClient::isconnected()
{
  
    return connected;
}