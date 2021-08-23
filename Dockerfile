# 基础镜像
FROM ubuntu:20.04

ENV LANG=C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

# aliyun source
#RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list

# install library
RUN apt-get -y clean \
     && apt-get -y update \
     && apt-get install -y sudo cmake gcc build-essential pkg-config libssl-dev libgmp-dev libtool libsecp256k1-dev librandomx-dev git vim screen \
# huge page 
#RUN sudo bash -c "echo vm.nr_hugepages=2560 >> /etc/sysctl.conf"
    && sudo sysctl -w vm.nr_hugepages=2560


# workdir /xdag_workspace/
WORKDIR /xdag_workspace/

# xdag clone
RUN git clone https://github.com/XDagger/xdag.git \ 
    && cd xdag \
    && cd secp256k1 && bash ./autogen.sh && ./configure && make && sudo make install \
    && cd .. \ 
    && mkdir build && cd build && cmake .. && make

WORKDIR /xdag_workspace/xdag/build/
COPY netdb* ./
COPY dnet_keys.bin ./



