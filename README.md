# protobuf-rpc
基于Wangle 框架和Protobuf序列化库实现的C++版RPC框架，适合用来学习网络编程，分布式系统等

**特性**：

**1. 使用Google Protobuf描述RPC服务**

**2. 基于folly::Future 实现异步调用**

**3. 支持在同一个端口绑定多个服务**

**依赖**

**1.安装folly**  [folly安装](https://github.com/facebook/folly.git)

**2.安装wangle** [wangle安装](https://github.com/facebook/wangle.git)

**3.安装protobuf**

**4.编译 protobuf-rpc**
```
git clone https://github.com/geqian1234/protobuf-rpc.git
mkdir build
cd build
cmake ..
make
```
**example：**

**编译example目录**

**1. 定义服务的proto文件**

**2. 服务端 RpcServerTest.cc**

**3. 客户端 RpcClientTest.cc**





