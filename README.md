dashboard 镜像版本为kubernetesui/dashboard:v2.0.0-rc7，同时加入一个dashboard-admin的帐号，绑定的权角色为admin
etcd-cluster 可为k8s内的容器提供etcd服务功能，未配置ssl,默认支持3个节点，只会在带有third-party/app: etcd的节点上运行。三个节点的地址为http://etcd-node-0.etcd-cluster:12379，http://etcd-node-1.etcd-cluster:12379，http://etcd-node-2.etcd-cluster:12379。持久文件会放在节点的/data/k8s/etcd目录下。
prometheus.v2.11.0 为官方版本，fix目录下的yaml进行了一些功能调整。主要为prometheus运行时绑定到master节点上。通过配置kubernetes.io/role: master来进行节点选择。另外作了本地持久化，在运行节点的/data/k8s/prometheus目录。
third-party 有jumpserver他haproxy。jumpserver进行了配置，使得jumpserver在启动后，不会连接到jumpserver官方服务器进行KEY的认证。版本为1.5.8。haproxy的功能作为集群内容器连接外部中间件使用，比如连接到外部的redis主库, haproxy可自动对redis进行主库选择，当redis主down掉后sentinel进行redis选主时haproxy同样会进行新主库的连接。k8s内的应用不用从新调整配置，也不用使用域名进行外部程序连接。非常方便，只需要维护haproxy的configmap就可以实现整个集群的中间件迁移。
