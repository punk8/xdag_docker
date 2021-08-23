# 基础镜像
FROM ubuntu:20.04

ENV LANG=C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

# aliyun source
#RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list

# install library
RUNsed apt-get -y clean \
     && apt-get -y update \
     && apt-get install -y sudo cmake gcc build-essential pkg-config libssl-dev libgmp-dev libtool libsecp256k1-dev librandomx-dev git

# huge page 
RUN sudo bash -c "echo vm.nr_hugepages=2560 >> /etc/sysctl.conf"



# workdir /xdag-testnet/
WORKDIR /xdag-testnet/

# xdag clone
RUN git clone https://github.com/XDagger/xdag.git \ 
    && cd xdag \
    && cd secp256k1 && bash ./autogen.sh && ./configure && make && sudo make install

RUN cd xdag \
    && mkdir build && cd build && cmake .. && make

WORKDIR /xdag-testnet/xdag/build/
COPY netdb* ./
COPY dnet_keys.bin ./



