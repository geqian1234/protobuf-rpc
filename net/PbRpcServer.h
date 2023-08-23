
#ifndef RPC_PROTOBUF_CPP_PBRPCSERVER_H
#define RPC_PROTOBUF_CPP_PBRPCSERVER_H

#include <iostream>

#include <folly/init/Init.h>
#include <folly/hash/FarmHash.h>
#include <folly/executors/CPUThreadPoolExecutor.h>
#include <folly/executors/IOThreadPoolExecutor.h>

#include <wangle/service/Service.h>
#include <wangle/service/ExecutorFilter.h>
#include <wangle/channel/AsyncSocketHandler.h>
#include <wangle/channel/EventBaseHandler.h>
#include <wangle/bootstrap/ServerBootstrap.h>

#include <google/protobuf/service.h>


#include "codec/LengthFieldPrepender.h"
#include "codec/LengthFieldBasedFrameDecoder.h"
#include "protobufCoder/RpcMessage.pb.h"
#include "protobufCoder/RpcMsgSerializeHandler.h"
#include "net/ServiceDispatcher/ServerDispatcher.h"

#include"zookeeper/zookeepercenter.h"
using namespace folly;
using namespace wangle;

//RpcMsg Server端序列化工作流
using RpcMsgServerSerializePipeline = wangle::Pipeline<IOBufQueue&, rpc::codec::RpcMessage>;

typedef std::function<void (rpc::codec::RpcMessage, rpc::codec::RpcMessage&)> HandleRpcCallFunc;
using MethodData=ZookeeperCenter::MethodData;

/*
 *  RpcMsgService
 *  定义protobuf消息Service
 * 实现()方法进行第一级RPC调用
 * (第一级RPC调用进行服务的消息分发 第二级RPC调用进行方法的消息分发)
 */
class RpcMsgService : public Service<rpc::codec::RpcMessage, rpc::codec::RpcMessage> {
public:
    /*RpcMsgService构造函数*/
    RpcMsgService(HandleRpcCallFunc arg);

    /*RpcMsgService调用流程*/
    Future<rpc::codec::RpcMessage> operator()(rpc::codec::RpcMessage request) override;


private:
    HandleRpcCallFunc _handleRpcCall;   //RPC call function
};



/*
 * RPC Message pipeline工厂
 * pipeline数据流:
 *     上行： 异步Socket IO          IO事件循环           消息分帧(头部2byte的消息长度)      第一级RPC服务消息序列化             服务端服务消息分发器
 *           AsyncSocketHandler -> EventBaseHandler -> LengthFieldBasedFrameDecoder -> RpcMsgServerSerializeHandler -> MultiplexServerDispatcher
 *
 *     下行： 服务调用返回数据    第一级RPC服务消息序列化            消息头部添加长度           IO事件循环           异步Socket IO
 *           RpcMsgService -> RpcMsgServerSerializeHandler -> LengthFieldPrepender -> EventBaseHandler -> AsyncSocketHandler
 */
class RpcMsgServerPipelineFactory : public PipelineFactory<RpcMsgServerSerializePipeline> {
public:
    /*RpcMsgPipelineFactory构造函数 默认线程池线程数为CPU核数*/
    RpcMsgServerPipelineFactory(HandleRpcCallFunc arg);

    /*exeThreadNum设置服务执行线程池线程数量*/
    RpcMsgServerPipelineFactory(HandleRpcCallFunc arg, int exeThreadNum);

    /*RPC消息处理流工厂创建消息处理pipeline*/
    RpcMsgServerSerializePipeline::Ptr newPipeline(std::shared_ptr<AsyncTransportWrapper> socket) override;


private:
    /*Service 执行过滤器（设置服务执行线程池）*/
    ExecutorFilter<rpc::codec::RpcMessage, rpc::codec::RpcMessage> service_;
};


/*
 * protobuf RPC Server
 */
class pbRPCServer {
public:
    typedef int32_t serviceID;
    typedef int32_t methodID;

public:
    /*方法元数据*/
   
    /*服务元数据*/
    struct ServiceData {
        google::protobuf::Service* rpcService;                   //protobuf rpc service
        std::unordered_map<std::string, MethodData> methodMap;      //存储methodId与方法对应关系（通过方法ID查询相应的方法）
    };
    typedef std::unordered_map<std::string,ServiceData> ServiceMap;
   
    /*注册服务*/
    bool RegisterService(::google::protobuf::Service* service);
    void RegisterZookeeper();
    /*启动RPC服务器*/
    void Start(int bindPort);
    void RegisterZooServer(std::shared_ptr<ZookeeperCenter>zk);
private:
    google::protobuf::Service* GetService(std::string const&ServiceName);

   
    MethodData* GetMethod(std::string const& ServiceName,std::string const& MethodName);

    /*根据RPC请求的serviceId和methodId取出相应的方法去执行并获取执行结果写回响应*/
    void handleRpcCall(rpc::codec::RpcMessage req, rpc::codec::RpcMessage &res);

private:
    /*RPC服务方法调用map*/
    std::unordered_map<serviceID, ServiceData> _rpcCallMap;

    /*TCP服务器*/
    ServerBootstrap<RpcMsgServerSerializePipeline> tcpServer;
    std::shared_ptr<ZookeeperCenter> zookeeperregister;
     ServiceMap servicemap;
};


#endif //RPC_PROTOBUF_CPP_PBRPCSERVER_H
