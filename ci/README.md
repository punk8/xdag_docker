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

4. 执行ci.sh，其中<branch>为你想要使用的分支名

   ```shell
   ./ci.sh xdagj <branch>
   ```




service.sh 使用

```shell
./service.sh start 

./service.sh stop

./service.sh restart
```

