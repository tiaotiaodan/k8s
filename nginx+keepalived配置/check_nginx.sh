#!/bin/bash
#describe: keepalived Heart rate check whether nginx is working properly
#date: 2019/1/14
#author: shcihao
#Email: shichao@scajy.cn
count=$(ps -ef |grep nginx |egrep -cv "grep|$$")
DATE=`date +%F-%T`

if [ "$count" -eq 0 ];then
    /bin/systemctl stop keepalived 
    echo "${DATE}" >>/tmp/keepalived.log
    echo 'nginx server hang up, keepalived is stop' >> /tmp/keepalived.log
fi

