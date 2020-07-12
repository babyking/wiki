---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: refusing to merge unrelated histories
date: 2020-03-30 14:28
category: 开发 
tags: [git]
---

我经常会先创建一个git仓库后,才想起把这个仓库整到github上.

1.先在github上创建仓库.

```sh
git remote add origin xxx.git
git pull origin master  #如果创建的仓库有新的文件,需要执行
git push -u origin master
```

在执行pull的时候,一般会报下面这个错误,因为远程新建的文件(一般是.gitignore,README)与本地没有相关联的历史

```sh
refusing to merge unrelated histories
```

这个时候需要增加 `--allow-unrelated-histories`参数

```sh
git pull origin masteR --allow-unrelated-histories
```

这个时候就可以了.  

在`git push` `git merge`遇到此类问题都可以使用.但使用前自己一定要清楚问题在哪.