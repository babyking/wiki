---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: 关于crystal语言的一些记录
date: 2019-11-16 22:47
category: 技术 
tags: [crystal,ruby]
---

关于crystal语言的一些记录

## brew 安装时显示的依赖

```sh
brew info crystal
crystal: stable 0.31.1 (bottled), HEAD
Fast and statically typed, compiled language with Ruby-like syntax
https://crystal-lang.org/
Not installed
From: https://mirrors.ustc.edu.cn/homebrew-core.git/Formula/crystal.rb
==> Dependencies
Build: autoconf ✔, automake ✔, libatomic_ops ✘, libtool ✔
Required: gmp ✔, libevent ✔, libyaml ✘, llvm@8 ✘, pcre ✔, pkg-config ✔
==> Options
--HEAD
	Install HEAD version
==> Analytics
install: 954 (30 days), 5,434 (90 days), 20,040 (365 days)
install_on_request: 880 (30 days), 4,978 (90 days), 18,284 (365 days)
build_error: 0 (30 days)
```



## libssl的问题

crystal run xxx.cr 的时候显示

```sh
cr build httpd.cr
ld: library not found for -lssl (this usually means you need to install the development package for libssl)
clang: error: linker command failed with exit code 1 (use -v to see invocation)
Error: execution of command failed with code: 1: `cc "${@}" -o '/Users/bob/Develop/practice/crystal/scratch/httpd'  -rdynamic  `command -v pkg-config > /dev/null && pkg-config --libs --silence-errors libssl || printf %s '-lssl -lcrypto'` `command -v pkg-config > /dev/null && pkg-config --libs --silence-errors libcrypto || printf %s '-lcrypto'` -lz -lpcre /usr/local/Cellar/crystal/0.31.1/embedded/lib/libgc.a -lpthread /usr/local/Cellar/crystal/0.31.1/src/ext/libcrystal.a -levent -liconv -ldl -L/usr/local/Cellar/crystal/0.31.1/embedded/lib -L/usr/lib -L/usr/local/lib`
```



解决:

```sh
ln -s /usr/local/opt/openssl/lib/libcrypto.dylib /usr/local/lib
ln -s /usr/local/Cellar/openssl/1.0.2q/lib/libssl.dylib /usr/local/lib/
```



## 编译时static的问题

```sh
crystal build hello.cr --release --link-flags -static


ld: library not found for -lcrt0.o (this usually means you need to install the development package for libcrt0.o)
```

查得答案

> This option will not work on Mac OS X unless all libraries (including libgcc.a) have also been compiled with -static. Since neither a static version of libSystem.dylib nor crt0.o are provided, this option is not useful to most people.

-static  在macOS下不支持,不要使用.



## Amber运行时问题

amber是crystal下的web框架,对标ruby下的rails.

```sh
LIBRARY_PATH和LD_LIBRARY_PATH环境变量
ld: library not found for -lssl (this usually means you need to install the development package for libssl)
clang: error: linker command failed with exit code 1 (use -v to see invocation)
Error: execution of command failed with code: 1: `cc "${@}" -o '/Users/bob/develop/practice/crystal/pet-tracker/bin/pet-tracker'  -rdynamic  -lyaml -lz `command -v pkg-config > /dev/null && pkg-config --libs --silence-errors libssl || printf %s '-lssl -lcrypto'` `command -v pkg-config > /dev/null && pkg-config --libs --silence-errors libcrypto || printf %s '-lcrypto'` -lpcre /usr/local/Cellar/crystal/0.31.1/embedded/lib/libgc.a -lpthread /usr/local/Cellar/crystal/0.31.1/src/ext/libcrystal.a -levent -liconv -ldl -L/usr/local/Cellar/crystal/0.31.1/embedded/lib -L/usr/lib -L/usr/local/lib`
07:39:14 Watch run  | (INFO) Compile time errors detected, exiting...
```

解决

```sh
export LIBRARY_PATH=/usr/local/Cellar/openssl/1.0.2s/lib:$LIBRARY_PATH
```



