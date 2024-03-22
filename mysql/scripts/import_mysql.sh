#!/bin/bash

DOCKER_CONN="docker exec -i mysql"

#导入数据
echo -e "\e[34mimport database:\e[0m"
${DOCKER_CONN} mysql -uroot -p'RZ3X5mh8LUqkWNSh' -f < /data/mysql/backups/b_edu_com.sql
