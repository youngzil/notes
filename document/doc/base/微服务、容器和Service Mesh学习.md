开源组织Cloud Native Computing Foundation（CNCF），CNCF也将隶属于Linux基金会管理

当前，业界 Service Mesh 主要有以下相关产品：
1、Buoyant 的 linkerd，基于 Twitter 的 Fingle，长期的实际产线运行经验及验证，支持 Kubernetes，DC/OS 容器管理平台，CNCF 官方支持的项目之一。
2、Lyft 的 Envoy，7层代理及通信总线，支持7层 HTTP 路由、TLS、gRPC、服务发现以及健康监测等，也是 CNCF 官方支持项目之一。
3、IBM、Google、Lyft 支持的 Istio，一个开源的微服务连接、管理平台以及给微服务提供安全管理，支持 Kubernetes、Mesos 等容器管理工具，其底层依赖于 Envoy。



https://linkerd.io/
https://github.com/linkerd/linkerd
linkerd官方文档中文版：https://legacy.gitbook.com/book/doczhcn/linkerd/details



https://istio.io/docs/
https://github.com/istio/istio
Istio官方文档中文版：http://istio.doczh.cn/


https://www.envoyproxy.io/
https://github.com/envoyproxy/envoy


https://blog.csdn.net/GitChat/article/details/78872404
https://www.jianshu.com/p/e23e3e74538e
https://blog.csdn.net/wangqingjiewa/article/details/78677912
http://blog.daocloud.io/cncf-3/



CNCF 计划为支持分布式、可扩展的应用需要的组件和组装方式提出一种规范，期望定义能够支持云原生应用和容器的整个基础设施堆栈。为了真正理解 CNCF 的既定目标，我们还需要了解它旗下的项目内容。
正如基金会目标中所描述的任务、角色以及价值观，基金会自创立以来名下已经管理了多个云端原生技术项目，包括：
– Kubernetes ：集群中管理跨多台主机容器化应用的开源系统；
– Prometheus ：专注于时间序列数据，为客户端依赖及第三方数据消费提供广泛集成支持的开源监控解决方案；
– OpenTracing：与厂商无关的分布式追踪开源标准；
– Fluentd：创建统一日志层的开源数据收集器。
– Linkerd：为微服务提供可靠性支持、自动化负载均衡、服务发现和运行时可恢复性的开源“服务网格”项目；
– gRPC：现代化高性能开源远程调用框架；
– CoreDNS：快速灵活的构建 DNS 服务器的方案；
– containerd：将容器运行时及其管理功能从 Docker Daemon 剥离的镜像管理和容器执行技术；
– rkt：帮助开发者打包应用和依赖包，简化搭环境等部署工作，提高容器安全性和易用性的容器引擎。



https://www.docker.com/
https://hub.docker.com/
https://github.com/docker
Docker vs. CoreOS Rkt：https://www.upguard.com/articles/docker-vs-coreos


https://kubernetes.io/
https://github.com/kubernetes/kubernetes
中文社区：https://www.kubernetes.org.cn/
kubernetes介绍：https://yeasy.gitbooks.io/docker_practice/content/kubernetes/


https://grpc.io/
https://github.com/grpc/grpc
https://github.com/grpc/grpc-java


https://prometheus.io/
https://github.com/prometheus/prometheus


http://opentracing.io/
https://github.com/opentracing
中文文档
https://wu-sheng.gitbooks.io/opentracing-io/content/pages/quick-start.html
https://github.com/opentracing-contrib/opentracing-specification-zh/blob/master/specification.md


https://www.fluentd.org/
https://github.com/fluent/fluentd


https://coredns.io/
https://github.com/coredns/coredns


https://containerd.io/
https://github.com/containerd/containerd


https://coreos.com/rkt/docs/latest/
https://github.com/rkt/rkt








