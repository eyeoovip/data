#!/bin/bash

#date=$(date '+%Y%m%d%H%M')
date=$(date '+%Y%m%d')
#创建文件夹
if [ ! -d /data/nginx/logsbak ]; then
	mkdir -p /data/nginx/logsbak
fi

#保存日志文件
if [ -f /data/nginx/logsbak/$date.tar.gz ]; then
	rm -f /data/nginx/logsbak/$date.tar.gz
fi
if [ -d /data/nginx/logs ]; then
	tar -cvzf /data/nginx/logsbak/$date.tar.gz /data/nginx/logs
fi

#清空文件日志
if [ -d /data/nginx/logs ]; then
	cd /data/nginx/logs
	ls /data/nginx/logs | awk 'NR>1 {print "echo > " $NF}' | sh
fi

#删除30天前的数据
find /data/nginx/logsbak -type f -ctime +30 | xargs rm -rf

exit 0