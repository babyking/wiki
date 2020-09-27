---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: 全新安装设置macOS记录
date: 2020-05-18 08:37
category: Mac
tags: [mac]
---



全新安装macOS Catalina及软件,内容比较杂,有些安装的顺序和细节容易忘,记录一下,以备以后参考.



1. 移动硬盘安装盘安装macOS,如果机器已经装有10.15以上的系统,抹盘的时候需要把Macintosh HD - Data一并抹掉,安装的时候系统会自己创建Data盘.

2. 安装完成后更新最新的macOS版本,如果有的话

3. 将以前的备份的常用软件copy到/Application中

4. Shadowsocks ,后面一些应用程序要使用到.设置开机自动启动

5. 安装坚果网盘,有一些软件配置数据在网盘中,后面会使用到.注意网盘的数据目录不要使用默认.

6. 系统配置中将trackpad的的`Tap to click`打开,取消`scroll direction:Natural`,在 Accessibility->Ponter Control->Trackpad Option... -> Enable dragging 中打开三指拖拽.lookup启用`三指轻拍`

7. 系统配置中设置apple id,如果有多台电脑,最好保持一致. 取消邮件,图片同步.打开iCloundDrive

8. Finder中边栏设置,主目录设置显示, 关闭tags,我一般不使用. 顺带把go2shell这个插件安装一下.运行go2shell可进行安装.打开显示 `status bar`和`path bar`

9. Dock设置自动隐藏

10. icloud帐号作为appleid登录,可同步数据.有多台电脑,请保持一至.  如果购买APP的帐户与icloud帐户独立 ,需要AppStore里登出再登录.

11. 设置`1password`,后面会经常用到

12. 安装 `Home brew`  ` https://brew.sh/     `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`   有可能要打开翻墙模式.

13. 通过brew cask安装软件.如chrome

14. chrome登录,同步数据

15. 安装karabiner-element,并设置坚果网盘中相应的数据. https://karabiner-elements.pqrs.org/  设置相应权限,把网盘中的配置数据目录  .../karabiner ln 到  ~/.config/karabiner.  建议重启.

16. 安装[搜狗五笔输入法](https://pinyin.sogou.com/mac/wubi.php)_

    * 将系统配置->键盘中的`后一个输入法`关闭,`前一个输入法`的快捷键设置为 `⌃⌥⌘+0`,与karabiner-el中的一键切换输入法一致. 
    * 将搜狗输入法中的shift禁用,否则会与karabiner中的一键切换输入法设置冲突. 
    * 打开五笔拼音混合输入
    * 中文状态下使用英文标点

17. 安装Alfred并激活,设置同步数据. 激活快捷键设置为`⌘+spacebar`记得更改 spotlight search的快捷键,有可能有冲突.spotlight设置为 `⌥⌘ +spacebar`和`⌃⌥⌘+spacebar`

18. 安装Keyboard Maestro, 设置同步网盘中的配置数据,设置开机启动 .

19. export ALL_PROXY=socks5://127.0.0.1:1086  

20. iTerm2 

    * 设置normal和insert模式的光标,在~/.vimrc下加入

    ```
    " Change cursor shape between insert and normal mode in iTerm2.app
    if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
    endif
    ```

    * 设置option快速移动文字.

    * 安装`oh-my-zsh`  ` sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`  把`export ALL_PROXY=socks5://127.0.0.1:1086` 放置到~/.zshrc中,很多脚本执行需要代理:)

    * 安装autojump `brew install autojump` 根据安装提示把 `[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh` 加入到 .zshrc中

    * git config

      ```bash
      # git
      git config --global alias.co checkout
      git config --global alias.br branch
      git config --global alias.ci commit
      git config --global alias.st status
      
      git config --global user.email "babyking1949@gmail"
      git config --global user.name "babyking"
      ```

    * 设置border

      ![image-20200527142455052](../assets/blog/image-20200527142455052.png)
      
    * 登录其他的系统可以设置徽标

      <img src="/image/image-20200610110312815.png" alt="image-20200610110312815"  />

21. `brew install tldr` 并设置别名 alias manx=tldr

22. 安装 pyenv `brew install pyenv`

23. 安装设置sizeup,设置以hyper为主的快捷键. 四角快捷键需要接入外接机械键盘来设定.

24. palua, 用于切换F功能键的功能状态. 设置开机启动

25. evernote,同步数据

26. VPN软件Viscosity,支持openvpn,

27. Dash的已安装数据迁移 `~/Library/Application Support/Dash/`

28. QQ的这个快捷键得去掉,很坑

    ![qqshortcut](../assets/blog/qqshortcut.png)

29. vscode启动命令行

    ```sh
    ln -s /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code /usr/local/bin/code
    ```

    

