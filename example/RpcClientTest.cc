//
// Created by chijinxin on 19-5-8.
//

#include <iostream>
#include <folly/init/Init.h>
#include <google/protobuf/message.h>
#include "net/PbRpcClient.h"
#include "net/futureRpcCallProxy.h"

#include "example/exampleservice.pb.h"

using namespace std;
using namespace folly;
using namespace example;


int main(int argc, char* argv[])
{
    /*
     * 如果使用 folly::Future<T>::onTimeout()
     * 需要在 main()中调用 folly::Init init(&argc, &argv)
     * This usually means that either main() never called folly::init, or singleton was requested before main() (which is not allowed).
     */
    folly::Init init(&argc, &argv);

    RpcChannel c;   
    string path("127.0.0.1:2181");
    std::shared_ptr<ZookeeperCenter> zookeepercenter=std::make_shared<ZookeeperCenter>();
   zookeepercenter->connect(path);
 
    HelloService_Stub rpc_helloservice(&c);

   
    IntCalService_Stub rpc_intcalservice(&c);

    futureRpcCallProxy helloServiceCallProxy(&rpc_helloservice,zookeepercenter);
    futureRpcCallProxy calCallProxy(&rpc_intcalservice,zookeepercenter);
     //myServiceCallProxy.
    //设置负载均衡策略
    //myServiceCallProxy.setLBStrategy(futureRpcCallProxy::HASH);

    //添加可用RPC服务器
   // myServiceCallProxy.addRemoteHost("127.0.0.1", 8888);
   // service2CallProxy.addRemoteHost("127.0.0.1", 8888);
  //  myServiceCallProxy.addRemoteHost("127.0.0.1", 9999);
  //  service2CallProxy.addRemoteHost("127.0.0.1", 9999);

//    //指定超时时间
//    myServiceCallProxy.addRemoteHost("127.0.0.1", 8888, 10);
//    service2CallProxy.addRemoteHost("127.0.0.1", 8888, 10);
//    myServiceCallProxy.addRemoteHost("127.0.0.1", 9999, 10);
//    service2CallProxy.addRemoteHost("127.0.0.1", 9999, 10);

    int i = 0;
    while(i < 100000)
    {
        
        if(i%5 == 0)
        {
            std::shared_ptr<HelloReqMessage> req = std::make_shared<HelloReqMessage>();

            ostringstream ss;
            stringstream ssi;
            ss<<" --- "<<i<<" --- ";
            req->set_request(ss.str());
            //req->SerializePartialToOstream(&cout);
            helloServiceCallProxy.CallMethod<EchoRes>("Hello", req)
                    .thenValue(
                            [req](HelloResMessage res)
                            {
                                cout<<"AsyncFuture call MyService::Echo() req: "<<req->request()<<"| res: "<<res.response()<<endl;
                            })
                    .thenError(folly::tag_t<std::exception>{},
                            [](const std::exception& e)
                            {
                                std::cerr<<"Call MyService::Echo() ERROR --- "<< exceptionStr(e) <<std::endl;
                            });
        }
        //2. Test MyService::Add()
        else if(i%5 == 1)
        {
            std::shared_ptr<OperaReq> req = std::make_shared<OperaReq>();

            req->set_a(i);
            req->set_b(i);

            calCallProxy.CallMethod<OperaRes>("Add", req)
                    .thenValue(
                            [req](OperaRes res)
                            {
                                cout<<"AsyncFuture call MyService::Add()  req: ";
                                cout<<"a="<<req->a()<<", b="<<req->b()<<" | res: a+b="<<res.c()<<endl;
                            })
                    .thenError(folly::tag_t<std::exception>{},
                            [](const std::exception& e)
                            {
                                std::cerr<<"Call MyService::Add() ERROR --- "<< exceptionStr(e) <<std::endl;
                            });
        }
        //3. Test MyService::Sub()
        else if(i%5 == 2)
        {
            std::shared_ptr<OperaReq> req = std::make_shared<OperaReq>();

            req->set_a(i+i);
            req->set_b(i);

            calCallProxy.CallMethod<OperaRes>("Sub", req)
                    .thenValue(
                            [req](OperaRes res)
                            {
                                cout<<"AsyncFuture call MyService::Sub()  req: ";
                                cout<<"a="<<req->a()<<", b="<<req->b()<<" | res: a-b="<<res.c()<<endl;
                            })
                    .thenError(folly::tag_t<std::exception>{},
                            [](const std::exception& e)
                            {
                                std::cerr<<"Call MyService::Sub() ERROR --- "<< exceptionStr(e) <<std::endl;
                            });
        }
      
        i++;
    }

    this_thread::sleep_for(std::chrono::seconds(10));
    return 0;
}