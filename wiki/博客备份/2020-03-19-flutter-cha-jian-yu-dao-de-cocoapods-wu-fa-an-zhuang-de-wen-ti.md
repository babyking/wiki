---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: flutter插件遇到的cocoapods无法安装的问题
date: 2020-03-19 15:04
category: 技术
tags: [ruby,flutter,cocoapods]
---



在创建flutter 插件项目后执行pod install 时报如下 错误

```sh
lib/cocoapods-core/source/metadata.rb:15:in `initialize': undefined method `with_indifferent_access' for false:FalseClass
```

解决如下 :

```sh
rm -vrf ~/.cocoapods*
pod install --verbose
```

