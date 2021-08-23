### Run xdag by docker

#### Build images

1. 在本项目下，可以补充或者修改白名单配置文件（当前只存放了测试网用白名单）

2. 运行docker生成镜像

```shell
docker build -t <images_name> . --network host
```

#### Run container

```shell
docker run -it --privileged --network host --name <container_name> <images_name> /bin/bash 
```

#### Exit container

键盘输入

```shell
退出时如果想继续运行
1. ctrl+p -> 2. ctrl+q
如果不想继续运行
ctrl+d 或输入 exit
```

#### Restart container

1. 查询容器id
2. 重启容器
3. 进入容器

```shell
docker ps -a
#CONTAINER ID   IMAGE      COMMAND       CREATED         STATUS                      #PORTS     NAMES
#33e16f0837f3   xdag:0.1   "/bin/bash"   4 minutes ago   Exited (0) 38 seconds ago             xdag_01
docker start 33e16f0837f3
docker attach 33e16f0837f3
```

#### Run

1. 在容器内更新netdb

```shell
netdb-white-testnet.txt netdb-testnet.txt
```

1. 运行xdag

```shell
 ./xdag -t -v 7 -p 0.0.0.0:<node-port> -P 0.0.0.0:<pool-port>:4096:128:128:5:5:5:5 -rpc-enable -rpc-port <rpc-port> -randomx f -disable-refresh
```


