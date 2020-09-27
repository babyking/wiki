---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: 如何解决bundle install太慢的问题
date: 2020-02-24 14:20
category: 技术
tags: [ruby,bundle,gem]
---

解决bundle install太慢的问题

```sh
bundle config mirror.https://rubygems.org https://gems.ruby-china.com
```



不用更改Gemfile中的source.

使用`gem source --add --remove` 管理gem镜像好像对`bundle install`不起作用.



参考: [https://gems.ruby-china.com/](https://gems.ruby-china.com/)