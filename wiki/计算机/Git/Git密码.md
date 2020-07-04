### git —global的配置保存在哪

~/.gitconfig



### 保存用户名和密码

Git可以将用户名，密码和仓库链接保存在硬盘中，而不用在每次push的时候都输入密码。

保存密码到硬盘一条命令就可以

```
$ git config credential.helper store
```

当git push的时候输入一次用户名和密码就会被记录

> 确认默认文件名及保存路径 ,—global的时候的文件内容与路径,如果不主动创建文件,是否会创建默认文件,文件名是什么??



### gitlab(github)需要输入用户名密码的问题

> 参考[Git 工具 - 凭证存储](https://git-scm.com/book/zh/v2/Git-%E5%B7%A5%E5%85%B7-%E5%87%AD%E8%AF%81%E5%AD%98%E5%82%A8)

1. 进入~（用户）目录，cd ~

2. 建立文件  .git-credentials， touch  .git-credentials

3. 编辑文件  .git-credentials， vi  .git-credentials

4. 添加http://用户名:密码@gitlab.com  // 根据情况替换ip或域名

5. 执行命令：git config --global credential.helper store  [--file ~/.git-credentials]

   **不加--file 默认是~/.git-credentials**  .git-credentials文件要手动创建?待确认

6. 查看文件：more .gitconfig，可以看到如下信息，设置成功。

```config
[user]
	email = jintongbao@lakala.com
	name = jintongbao
[credential]
	helper = store
```

