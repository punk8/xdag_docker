echo "hello"

NODE_NUM=$1
NODE_POOL=127.0.0.1
NODE_PORT=800
POOL_PORT=801
RPC_PORT=802

if [ $NODE_NUM -ge 10 ];then
  echo "NODE_NUM need less than 10"
  exit
fi

echo "" > netdb-testnet.txt
echo "" > netdb-white-testnet.txt
for n in $(seq 1 $NODE_NUM)
do
  echo "$NODE_POOL:$NODE_PORT$n" >> netdb-testnet.txt
  echo "$NODE_POOL:$NODE_PORT$n" >> netdb-white-testnet.txt
done

