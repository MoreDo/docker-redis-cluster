# Redis容器构建

## 编译dockerfile
docker build -t moredo/redis:3.2.8 .

## 运行容器
docker run -d -it --name redis_6371 -p 6371:6379 -v /data/redis/6371:/data moredo/redis:3.2.8
<br />
-v 挂载本地路径到容器内路径
<br />
-p 映射本地端口到容器端口

## 创建集群
docker exec -it 容器ID /bin/bash
<br />
redis-trib create --replicas 1 192.168.0.1:6371 192.168.0.1:6372 192.168.0.1:6373 192.168.0.1:6374 192.168.0.1:6375 192.168.0.1:6376