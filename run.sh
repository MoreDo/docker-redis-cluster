#!/bin/sh

if [ ! -f "/etc/redis/redis.conf" ] ; then
	mkdir /etc/redis/
	cp /usr/local/redis-3.2.8/redis.conf /etc/redis/redis.conf

	if [ -n "$port" ] ; then
		sed -ri "s@^(port).*@\1 ${port}@" /etc/redis/redis.conf
	fi
	if [ -n "$bind" ] ; then
		sed -ri "s@^(bind).*@\1 ${bind}@" /etc/redis/redis.conf
	fi
	if [ -n "$appendonly" ] ; then
		sed -ri "s@^(appendonly).*@\1 ${appendonly}@" /etc/redis/redis.conf
	fi
	if [ "$cluster" = 'yes' ] ; then
		echo cluster-enabled yes >> /etc/redis/redis.conf
		echo cluster-config-file nodes.conf >> /etc/redis/redis.conf
		echo cluster-node-timeout 5000 >> /etc/redis/redis.conf
	fi
fi

exec /usr/local/bin/redis-server /etc/redis/redis.conf

