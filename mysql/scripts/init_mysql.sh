#!/bin/bash

USERNAME="root"
PASSWORD="RZ3X5mh8LUqkWNSh"
CLIENTUSER="'creshop'@'%'"
CLIENTPASS="'N4F3ABaFui'"

DB_ADMIN="mysql -u ${USERNAME} -p${PASSWORD}"
DOCKER_CONN="docker exec -i mysql"
ARRAY_DATABASES="edu2b"
echo -e ${DB_ADMIN}
echo -e ${DOCKER_CONN}
echo -e ${ARRAY_DATABASES}

#显示数据库
echo -e "\e[34m显示数据库：\e[0m"
${DOCKER_CONN} ${DB_ADMIN} -e "show databases"

#创建用户
echo -e "\e[34m创建用户：\e[0m"
${DOCKER_CONN} ${DB_ADMIN} -e "create user ${CLIENTUSER} identified by ${CLIENTPASS}"

#创建表
echo -e "\e[34m创建表：\e[0m"
for database in ${ARRAY_DATABASES}
do
    ${DOCKER_CONN} ${DB_ADMIN} -e "create database if not exists ${database}"
done

#显示数据库
echo -e "\e[34m显示数据库：\e[0m"
${DOCKER_CONN} ${DB_ADMIN} -e "show databases"

#授权
echo -e "\e[34授权：\e[0m"
for database in ${ARRAY_DATABASES}
do
    ${DOCKER_CONN} ${DB_ADMIN} -e "grant all on ${database}.* to ${CLIENTUSER}"
done
