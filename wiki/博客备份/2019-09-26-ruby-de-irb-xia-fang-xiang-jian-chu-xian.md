---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: ruby的irb下方向键出现^[[A
date: 2019-09-26 15:31
category: 技术
tags: [ruby,readline]
---



很久都不用ruby了,最近要写个alfred的插件,里面会用到ruby的脚本. 使用中发现我在irb下的方向键出现^[[A这样的字符. 印象中以前好像也遇到这个问题,但已经记不起来如何解决了.

![image-20190926153437386](../assets/blog/image-20190926153437386.png)

^[[A ^[[B这些字符是什么意思呢? 

早年终端都是电传打字机,是没有方向键的,后来有了显示器输出终端,可以以行的方式来编辑传送数据了,所以用 [esc][A 这样的转义字符来表示方向键,当然这些字符需要被终端正确的解析. 现在的终端模拟器是以软件的方式去模拟兼容这些终端的,所以软件里有个著名的包 readline,是专门用来解决这样的问题的. 

不只是irb,像python这样的interpreter 都需要readline的支持,如果在编译的时候没有使用readline或是实现同样的功能, 在interpreter下就会出现上面说的^[[A^[[B^[[C^[[D这样的`乱码`



知道这些,问题就好解决了.

ruby是用rbenv进行安装的,安装时需要集成readline

没有安装readline的话先安装

```sh
brew install readline
```

加入readline 编译选项进行安装

```sh
RUBY_CONFIGURE_OPTS=--with-readline-dir=`brew --prefix readline` rbenv install 2.5.1
```

安装完成后,重新进入irb,问题解决.



>参考: https://github.com/guard/guard/wiki/Add-Readline-support-to-Ruby-on-Mac-OS-X