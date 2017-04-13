# Docker Redis Cluster

## 编译dockerfile
docker build -t moredo/redis:3.2.8 .

## 启动容器
docker-compose up

## 创建集群
docker exec -it 容器ID /bin/bash
<br />
redis-trib create --replicas 1 192.168.0.1:6371 192.168.0.1:6372 192.168.0.1:6373 192.168.0.1:6374 192.168.0.1:6375 192.168.0.1:6376