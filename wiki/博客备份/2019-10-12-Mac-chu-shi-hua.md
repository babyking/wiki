---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: Mac初始化
date: 2019-10-12 13:55
category: Mac
tags: [mac]
---


> 一台合乎自己使用习惯的Mac的设置



## 用户名

多台电脑使用同一用户名,方便一些脚本在不同电脑上一致性,虽然然脚本中可以使用$HOME这样的环境变量.

## 效率软件

Karabiner-element

* 配置网盘同步

Alfred

* 剪切板历史 `⌃⌥⌘⇧` + `y`  
* Action`⌃⌥⌘⇧` +  `+`
* Previous Path `⌃⌥⌘⇧` + `-`
* Clipboard 历史的保存时间设置为最大
* 数据网盘同步

Keyboard Maestro

* 配置网盘同步
* 

以上三款软件导入常用配置,配置使用坚果云同步

Shotcat, `⌘⇧` + `space` 

## 输入法

1. 只保留中英两个输入法

2. 在系统设置->键盘中设置两个输入法切换的快捷键(⌃⌥⌘⇧+0),这里的设置跟karabiner中的一键shift切换设置的映射键相同

3. 安装ShowyEdge软件,可以通过顶部颜色块来帮助识别当前输入法状态

4. 中文输入法的shift切换中英文关闭

5. 五笔输入法的拼音混合输入打开

6. 五笔输入法字库的定制

   > 清歌输入法提供了字库的编辑功能
   
7. 如果五笔无法提供字库的定制,提供词的调频功能也可以部分解决问题,但是五笔输入法的字词调频功能是一把双刃剑,这跟拼音不同.

## 截图设置

~~系统截图的命名设置.默认命名中有空格.~~

~~**下面的命名方式请不要采用,因为日期无法根据当前日期时间动态更新**~~

```sh
#defaults write com.apple.screencapture name "screenshot_$(date +%Y%m%d_%H%M%S)"
#defaults write com.apple.screencapture "include-date" 0
```

快捷键

1. 长按4,截图到clipboard, 相当于 `⌘⌥`+ `4`
2. `hyper`+`4`,截图并编辑圈选,相关于 `⌃⌘⌥`+ `4`



## 浏览器/Chrome

1. 繁体转简体



## 终端/iTerm2

**iterm2设置**

1. 目录

   ![Screen Shot 2019-10-22 at 10.25.58 AM](../assets/blog/screenshot_2019_1031_0438_24.png)

   

2. 边框

   ![image-20191021112346574](../assets/blog/image-20191021112346574.png)

3. `⌥ + ←→` 以单词为单位移动光标

   ![screenshot_2019_1031_0438_56](../assets/blog/screenshot_2019_1031_0438_56.png)
   
4. `⌘`+`delete`  `⌥`+`delete`

   0x15,0x17

   ![image-20191124171900819](../assets/blog/image-20191124171900819.png)



**vi设置**

vi光标设置, `.vimrc` 中加入

```sh
" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
```



**/etc/hosts**

设置公司内网ip域名映射

**oh-my-zsh**

**Homebrew**

一般要取消brew install时的update. 放到.bashrc或.zshrc等文件里

```sh
export HOMEBREW_NO_AUTO_UPDATE=true
```

**pyenv**

```sh
# pyenv
# export PATH="$HOME/.pyenv/bin:$PATH" //新版本不需要显式设置shim
eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
```

**pip 使用国内镜像**

创建~/.pip/pip.conf

```sh
[global]
index-url = http://mirrors.aliyun.com/pypi/simple
[install]
trusted-host = mirrors.aliyun.com
```



**rbenv**

```sh
# rbenv
# export PATH="$HOME/.rbenv/bin:$PATH" //新版本不需要显式设置shim
eval "$(rbenv init -)"
```

**git**

```sh
# git alias
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status

# git 
git config --global user.email "babyking1949@gmail"
git config --global user.name "babyking"
```

**autojump**

```sh
brew install autojump
# ~/.zshrc中加入autojump
# plugins=(autojump)
```

**tldr**(too long don't read)

```sh
brew install tldr
# 在.zshrc中加入别名, manx比tldr更容易记忆和使用  
# alias manx=tldr
```

**alias**

```sh
alias manx=tldr
alias cr=crystal
alias his="history | grep "
```



## Dash

全局选中文字快捷键 `⇧⌘` + `R` ,karabiner中长按 `R` 也映射到此组合.

## ~~Snip~~

~~截图快捷键使用 `⌃⌥⌘⇧` + `4`~~

> macOS自己提供了截图圈选功能后,第三方的截图工具不怎么用了.

## Palua

快捷切换function功能键模式,`⌥⌘` + `tab`

## Go2Shell

运行运行安装,配置通过运行来进行.

## VSCode

1. Alfred中的vscode helper的菜单控制其长度
2. 

## SizeUp

hyper+上下左右方向键

hyper+ins,del,pgup,pgdn,四个corner

## Vanilla

状态栏图标管理 [官网](https://matthewpalmer.net/vanilla/)

## 其他软件列表

* ShadowsocksX-NG-R8
* Wunderlist
* Nutstore
* 1Password
* axel 多线程下载
* the archiver ,解决windows下压缩文件的乱码问题.

