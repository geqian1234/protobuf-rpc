#ifndef ZOOKEEPERCENTER_H
#define ZOOKEEPERCENTER_H
#include<string>
#include<memory>
#include<wangle/service/Service.h>
#include<folly/SocketAddress.h>

#include"zookeeperclient.h"
#include "../protobufCoder/RpcMessage.pb.h"
#include"google/protobuf/service.h"

class ZookeeperCenter
{

public:
 struct MethodData {
        const google::protobuf::MethodDescriptor* m_descriptor;  //protobuf方法描述
        const google::protobuf::Message* request_proto;          //protobuf请求数据类型
        const google::protobuf::Message* response_proto;         //protobuf响应数据类型
    };
//ServiceRegister(const char* ip_port);
ZookeeperCenter()=default;
int registerService(std::string serviceName,
std::unordered_map<std::string,MethodData>& data,folly::SocketAddress address);
int connect(std::string path);
std::shared_ptr<zkcpp::zk_cpp> getzkcpp();
private:
 ZkClient *zoo_handler;
};

#endif