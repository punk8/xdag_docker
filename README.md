# xdag_docker

#### Build images

1. 在该文件夹下，可以补充或者修改白名单配置文件

2. 运行docker生成镜像

```shell
docker build -t <images_name> .
```

#### Run container

```shell
 docker run -it --name <container_name> <images_name> /bin/bash
```

