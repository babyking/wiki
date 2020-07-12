---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: rbenv无法安装的问题
date: 2020-02-24 12:37
category: 技术
tags: [ruby]
---



在另一台电脑上安装rbenv,报如下问题:

```sh
/usr/local/Cellar/ruby-build/2019120
brew install rbenv
==> Installing dependencies for rbenv: ruby-build
==> Installing rbenv dependency: ruby-build
==> Downloading https://github.com/rbenv/ruby-build/archive/v20191205.tar.gz
==> Downloading from https://codeload.github.com/rbenv/ruby-build/tar.gz/v20191205
            -=O=#     #    #     #
Error: An exception occurred within a child process:
  Errno::EACCES: Permission denied @ dir_s_mkdir - /usr/local/Cellar/ruby-build/20191205
```

显示权限不够,使用`sudo`后依然不行.

后来发现 `/usr/local/Cellar`目录下的权限owner都是`root`,不知道自己什么时候操作的.

将权限设置复原后,问题解决!

```sh
sudo chown -R $(whoami):admin /usr/local
sudo chown -R $(whoami):admin /usr/local/Cellar
sudo chown -R $(whoami):admin /usr/local/Homebrew
sudo chown -R $(whoami):admin /usr/local/lib
```



