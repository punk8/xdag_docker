echo "rebuild xdagj"
my_home=$(cd "$(dirname "$0")"; pwd)
if [ $# -lt 1 ]; then
        echo "[`date`] usage : ./build.sh {[module]}"
        exit 1
fi
#CMD=$1

branch=${2:-'develop'}

echo $branch

#if [ $CMD != "release" ] && [ $CMD != "java" ] && [ $CMD != "vue" ] && [ $CMD != "toolkit" ]; then
#       echo "[`date`] usage : ./build.sh {release|java|vue|toolkit}"
#       echo "aaaaa"
#       exit 1
#fi

MODULE=$1
echo $MODULE

type git
ret=$?
if [ "$ret" != 0 ]; then
        echo "[`date`] WARNING : git not install."
        exit 1
fi

command -v mvn
ret=$?
if [ "$ret" != 0 ]; then
    echo "[`date`] WARNING : maven not install."
    exit 1
fi

cd $MODULE
git checkout $branch
# 1.2) pull newest code
git pull origin $branch

ret=$?
if [ "$ret" != 0 ]; then
    echo "[`date`] WARNING : git pull failed."
    exit 1
fi

# build 
cd src/c 
if [ ! -d 'build' ]; then
    mkdir build
    cd build 
    cmake .. 
    make
fi

cd $my_home/$MODULE
mvn clean package -Dmaven.test.skip=true
ret=$?
if [ "$ret" != 0 ]; then
        echo "[`date`] WARNING : compile fail."
        exit 1
fi

echo $MODULE

# 切回工作目录
cd $my_home
if [ ! -d "$my_home/xdag_pool" ]; then
  mkdir $my_home/xdag_pool
fi
scp $MODULE/target/xdagj*.jar $my_home/xdag_pool
scp $MODULE/script/xdag.sh $my_home/xdag_pool
scp $MODULE/src/main/resources/xdag-*.config $my_home/xdag_pool
scp $MODULE/src/main/resources/netdb-*.txt $my_home/xdag_pool
rm -rf $MODULE/dist
scp ./service.sh $my_home/xdag_pool
# 重启服务
cd $my_home/xdag_pool && ./service.sh restart $MODULE
