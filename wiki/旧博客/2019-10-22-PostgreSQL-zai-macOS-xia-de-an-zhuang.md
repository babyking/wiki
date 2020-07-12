---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: PostgreSQL在macOS下的安装
date: 2019-10-22 09:13
category: 技术 
tags: [postgresql,数据库]
---



使用homebrew

```sh
brew install postgresql
```

安装过程中提示错误 

```sh
FATAL:  could not create semaphores: No space left on device

DETAIL:  Failed system call was semget.

HINT:  This error does *not* mean that you have run out of disk space.  It occurs when either the system limit for the maximum number of semaphore sets (SEMMNI), or the system wide maximum number of semaphores (SEMMNS), would be exceeded.  You need to raise the respective kernel parameter.  Alternatively, reduce PostgreSQL's consumption of semaphores by reducing its max_connections parameter.
```



google了一下,原因是内核参数中共享内存的最大连接数受限.

官网也给出了说明:  [https://www.postgresql.org/docs/current/kernel-resources.html](https://www.postgresql.org/docs/current/kernel-resources.html)

根据文档在 /etc/sysctl.conf 加入以下配置信息,如果没有此文件需要创建

```sh
# /etc/sysctl.conf
kern.sysv.shmmax=4194304
kern.sysv.shmmin=1
kern.sysv.shmmni=32
kern.sysv.shmseg=8
kern.sysv.shmall=1024
```

保存后,重启机器生效.

启动连接数据库

```sh
# 启动postgresql服务
brew services start postgresql
# 连接数据库
psql postgres
```



