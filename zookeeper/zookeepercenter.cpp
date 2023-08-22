#include"zookeepercenter.h"
#include<vector>

int ZookeeperCenter::registerService(std::string serviceName,
std::unordered_map<std::string,MethodData>& data,folly::SocketAddress address)
{
   //// const google::protobuf::ServiceDescriptor* pSerDes = service->GetDescriptor();
   // std::string sername=pSerDes->name();
   // std::string fullname=pSerDes->full_name();
    auto p="/"+serviceName;
    zkcpp::zoo_rc ret;
    if(zoo_handler->gethandle()->exists_node(p.c_str(),nullptr,false)==zkcpp::zoo_rc::z_no_node)
    {
       ret= zoo_handler->create_persistence_node(p.c_str(),serviceName);
    }
    for( auto methodmsg:data)
    {
      auto name=methodmsg.first;
      auto methoddata=methodmsg.second;
              zkcpp::zoo_rc retmethed;
        const google::protobuf::MethodDescriptor* m_descriptor=methoddata.m_descriptor;
        std::string methedname=m_descriptor->name();
       auto mp=p+"/"+methedname;
     // address.convertToIPv4();
       auto address_str=address.getHostStr();
       auto port=address.getPort();
      // std::cout<<port<<std::endl;
       auto value=address_str+"&"+std::to_string(port);
       retmethed=zoo_handler->create_ephemeral_node(mp.c_str(),value);
    }
    return ret==zkcpp::zoo_rc::z_ok?0:-1;
}
int ZookeeperCenter::connect(std::string path)
{
   if(!zoo_handler)
   {
      zoo_handler=new ZkClient{};
   }
   zoo_handler->connect(path);
}
std::shared_ptr<zkcpp::zk_cpp> ZookeeperCenter::getzkcpp()
{
   return zoo_handler->gethandle();
}