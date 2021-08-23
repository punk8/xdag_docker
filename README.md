#### Build images

1. 在该文件夹下，可以补充或者修改白名单配置文件

2. 运行docker生成镜像

```shell
docker build -t <images_name> .
```

#### Run container

```shell
 docker run -it --privileged --name <container_name> <images_name> /bin/bash
```

#### Exit container

键盘输入

```shell
退出时如果想继续运行
ctrl+p，ctrl+q
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


