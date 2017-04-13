# Redis容器构建

## 编译dockerfile
docker build -t moredo/redis:3.2.8 .

## 运行容器
docker run -d -it --name redis_6371 -p 6371:6379 -v /data/redis/6371:/data moredo/redis:3.2.8
<br />
-v 挂载本地路径到容器内路径
<br />
-p 映射本地端口到容器端口

## 启动redis集群
docker run -d -it --name redis_6371 -p 6371:6371 -p 16371:16371 -v /data/redis/6371:/data -e port=6371 -e bind=0.0.0.0 -e appendonly=yes -e cluster=yes moredo/redis:3.2.8 <br />
docker run -d -it --name redis_6372 -p 6372:6372 -p 16372:16372 -v /data/redis/6372:/data -e port=6372 -e bind=0.0.0.0 -e appendonly=yes -e cluster=yes moredo/redis:3.2.8 <br />
docker run -d -it --name redis_6373 -p 6373:6373 -p 16373:16373 -v /data/redis/6373:/data -e port=6373 -e bind=0.0.0.0 -e appendonly=yes -e cluster=yes moredo/redis:3.2.8 <br />
docker run -d -it --name redis_6374 -p 6374:6374 -p 16374:16374 -v /data/redis/6374:/data -e port=6374 -e bind=0.0.0.0 -e appendonly=yes -e cluster=yes moredo/redis:3.2.8 <br />
docker run -d -it --name redis_6375 -p 6375:6375 -p 16375:16375 -v /data/redis/6375:/data -e port=6375 -e bind=0.0.0.0 -e appendonly=yes -e cluster=yes moredo/redis:3.2.8 <br />
docker run -d -it --name redis_6376 -p 6376:6376 -p 16376:16376 -v /data/redis/6376:/data -e port=6376 -e bind=0.0.0.0 -e appendonly=yes -e cluster=yes moredo/redis:3.2.8 <br />
### 创建集群
redis-trib create --replicas 1 192.168.0.1:6371 192.168.0.1:6372 192.168.0.1:6373 192.168.0.1:6374 192.168.0.1:6375 192.168.0.1:6376