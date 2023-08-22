
#include <sstream>
#include "futureRpcCallProxy.h"

//构造函数
futureRpcCallProxy::futureRpcCallProxy(google::protobuf::Service* s,std::shared_ptr<ZookeeperCenter>zk, int ioThreadNum)
        :request_id(0L),
        service(s),
         lbs(RoundRobin),
         getLocalIP_flag(false)
{
    //默认为CPU核数
    if(ioThreadNum == 0)
    {
        int cpuNum = std::thread::hardware_concurrency();
        ioThreadPool = std::make_shared<folly::IOThreadPoolExecutor>(cpuNum);
    }
    else
    {
        ioThreadPool = std::make_shared<folly::IOThreadPoolExecutor>(ioThreadNum);
    }
    RegisterZooServer(zk);
    get_rpc_server_address();
}

//设置负载均衡策略 默认为轮询
void futureRpcCallProxy::setLBStrategy(LBStrategy l)
{
    lbs = l;
}
  void futureRpcCallProxy::RegisterZooServer(std::shared_ptr<ZookeeperCenter>zk)
  {
    zoocenter=zk;
  }
void futureRpcCallProxy::get_rpc_server_address()
{
    auto zk=zoocenter->getzkcpp();
    auto servicedes=service->GetDescriptor();
    auto name=servicedes->name();
    std::string path="/"+name;
   
    std::vector<std::string>children;
    zkcpp::zoo_rc ret=zk->exists_node(path.c_str(),nullptr,true);
   if(ret==zkcpp::zoo_rc::z_ok)
    {
       zk->get_children(path.c_str(), children,true);
       for(auto &sp:children)
       {
            std::string address;
            auto fullname=path+"/"+sp;
            zk->get_node(fullname.c_str(),address,nullptr,true);
            addRemoteHost(sp,address);
       }
    }
   

}

void futureRpcCallProxy::addRemoteHost(std::string const& methodname,std::string hostname,uint32_t t , uint64_t reqLimit)
{
    auto spilt=hostname.find('&',0);
    std::string host=hostname.substr(0,spilt);
    std::string portstr=hostname.substr(spilt+1,hostname.size()-spilt);
    int port=std::atoi(portstr.c_str());
    this->addRemoteHost(methodname,host,port,t,reqLimit);
}
/*
 * 添加RPC远程服务器
 * param:
 *      host: RPC服务器主机IP地址
 *      port: RPC服务器端口
 *      reqLimit: 最大pending请求的数量限制 默认值为INT64_MAX
 *      t: 远程RPC请求超时时间 单位ms
 */
void futureRpcCallProxy::addRemoteHost(std::string const& methodname,std::string host, int port, uint32_t t, uint64_t reqLimit)
{
    //在更新提供服务的RPC主机列表时需要加锁
    std::unique_lock<std::mutex> lock(update_mu);

    std::shared_ptr<PbRpcClient> clientPtr = std::make_shared<PbRpcClient>(host, port, ioThreadPool, reqLimit, t);

    SocketAddress addr;
    //std::cout<<clientPtr->pipeline->getTransportInfo()->localAddr->describe()<<std::endl;
    //LocalIPstr = addr.getIPAddress().str();
    //std::cout<<LocalIPstr<<std::endl;

    vRpcClient[methodname].push_back(clientPtr);


//    //获取本地IP地址
//    if(!getLocalIP_flag)
//    {
//        SocketAddress addr;
//        clientPtr->pipeline->getTransport()->getLocalAddress(&addr);
//        LocalIPstr = addr.getIPAddress().str();
//        getLocalIP_flag = true;
//    }
}

//轮询策略 选择服务器
std::shared_ptr<PbRpcClient> futureRpcCallProxy::RoundRobin_Select(std::string method_name,long curReqId)
{
    std::unique_lock<std::mutex> lock(update_mu);
    return vRpcClient[method_name][ curReqId % vRpcClient.size() ];
}

//随机策略 选择服务器
std::shared_ptr<PbRpcClient> futureRpcCallProxy::Random_Select(std::string method_name,long curReqId)
{

}

//Hash策略 选择服务器
//根据本地主机地址、服务名字、方法名字 进行hash运算 选取对应的远程RPC主机
//相同的请求会被映射到相同的RPC服务器，适合维护长连接和提高命中率
std::shared_ptr<PbRpcClient> futureRpcCallProxy::Hash_Select(std::string host,
        std::string service_name, std::string method_name)
{
    std::unique_lock<std::mutex> lock(update_mu);

    std::ostringstream ostr;
    ostr<<host<<service_name<<method_name;

    uint32_t hashCode = folly::hash::farmhash::Hash32(ostr.str().c_str(), ostr.str().length());

    return vRpcClient[method_name][ hashCode % vRpcClient.size() ];
}
