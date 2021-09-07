# 基础镜像
#FROM java:15
FROM adoptopenjdk/openjdk15:x86_64-ubuntu-jre15u-nightly

ENV LANG=C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

#RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN apt-get -y clean \
     && apt-get -y update \
     && apt-get install -y sudo cmake gcc build-essential pkg-config wget libssl-dev libgmp-dev libtool libsecp256k1-dev git vim screen
# mvn
RUN wget http://apache-mirror.rbc.ru/pub/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz \
        && tar xzvf apache-maven-3.3.9-bin.tar.gz \
        && cp -R apache-maven-3.3.9 /usr/local/bin \
        && rm -rf apache-maven-* \
        && export PATH=/usr/local/bin/apache-maven-3.3.9/bin:$PATH \
        && ln -s /usr/local/bin/apache-maven-3.3.9/bin/mvn /usr/local/bin/mvn
#RUN ls -l /usr/local/bin
#RUN echo $PATH

WORKDIR /xdag_workspace/
# xdag clone
RUN git clone https://github.com/XDagger/xdagj.git && cd xdagj \
        && cd src/c && mkdir build && cd build && cmake .. && make \
        && cd ../../.. && mvn clean package -DskipTests \
        && cd .. && mkdir xdag_pool && cd xdag_pool \
        && cp ../xdagj/script/xdag.sh ./ \
        && cp ../xdagj/script/service.sh ./ \
        && cp ../xdagj/target/xdagj-*.jar ./ \
        && cp ../xdagj/src/main/resources/xdag-*.config ./ \
        && cp ../xdagj/src/main/resources/netdb-*.txt ./ \
        && rm -rf ../xdagj	

