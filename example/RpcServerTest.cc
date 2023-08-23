#include<string>

#include"net/PbRpcServer.h"
#include"exampleservice.pb.h"
class HelloServiceImpl:public example::HelloService
{
void Hello(::google::protobuf::RpcController* controller,
                        const ::example::HelloReqMessage* request,
                        ::example::HelloResMessage* response,
                        ::google::protobuf::Closure* done)override
 {
        std::string name=request->clientname();
        response->set_response("Hello! "+name+"!");
 }
};
class IntCalServiceImpl:public example::IntCalService
{
     void Add(::google::protobuf::RpcController* controller,
                        const ::example::OperaReq* request,
                        ::example::OperaRes* response,
                        ::google::protobuf::Closure* done)
    {
             response->set_c(request->a()+request->b());

          if(done)
          {
            done->Run();
          }

    }
  void Sub(::google::protobuf::RpcController* controller,
                        const ::example::OperaReq* request,
                        ::example::OperaRes* response,
                        ::google::protobuf::Closure* done)
    {
   response->set_c(request->a()-request->b());

          if(done)
          {
            done->Run();
          }
     }
};
int main(int argc,char *argv[])
{
    HelloServiceImpl helloservice;
    IntCalServiceImpl intcalservice;
    std::string path("127.0.0.1:2181");
    std::shared_ptr<ZookeeperCenter> zookeepercenter=std::make_shared<ZookeeperCenter>();
    zookeepercenter->connect(path);
    pbRPCServer rpc_server;
    rpc_server.RegisterZooServer(zookeepercenter);
    //RPC绑定服务 同一个端口可绑定多个服务
    rpc_server.RegisterService(&helloservice);
    rpc_server.RegisterService(&intcalservice);

    //启动RPC服务器 默认监听8888端口
    if(argc <= 1)
    {
        rpc_server.Start(8888);
    }
    else
    {
        int port = atoi(argv[1]);
        rpc_server.Start(port);
    }

    std::cout<<"RPC Server Stop!"<<std::endl;
return 0;
}