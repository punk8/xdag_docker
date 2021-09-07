## ci自动化部署

### ci 使用

1. 新建一个工程目录，并进入该目录

   ```shell
   mkdir workspace && cd workspace
   ```

2. 将本ci.sh跟service.sh文件复制进工作目录，执行

   ```shell
   chmod 777 ci.sh
   chmod 777 service.sh
   ```

3. 克隆xdagj项目

   ```shell
   git clone https://github.com/XDagger/xdagj.git
   ```

4. 执行ci.sh，其中<branch>为你想要使用的分支名，可以自动启动xdagj

   ```shell
   ./ci.sh xdagj <branch>
   ```



### xdag_pool中 service.sh 使用
   
service.sh 用于控制xdagj的启动关闭以及重启

```shell
./service.sh start 

./service.sh stop

./service.sh restart
```

