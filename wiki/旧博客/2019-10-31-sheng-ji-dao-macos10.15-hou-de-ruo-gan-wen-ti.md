---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: 升级到macOS10.15后的若干问题
date: 2019-10-31 18:00
category: Mac
tags: [mac]
---



## Mail

Alfred的mail wf不可用了,原因是Catalina中不再允许第三方应用检索Mail的数据了,无解

![image-20191211150647047](../assets/blog/image-20191211150647047.png)

## Finder

finder里两个文件显示相同文件名

![image-20191210154829184](../assets/blog/image-20191210154829184.png)

但在终端下显示

![image-20191210154845465](../assets/blog/image-20191210154845465.png)

不知道什么原因





## Alfred

blog相关的脚不工作了

```sh
[2019-10-31 17:57:49][action.script] Processing output of 'output.notification' with arg ''
[2019-10-31 17:58:03][trigger.hotkey] Processing output of 'input.keyword' with arg ''
[2019-10-31 17:58:08][trigger.hotkey] Processing output of 'input.keyword' with arg ''
[2019-10-31 17:58:21][input.keyword] Processing output of 'action.script' with arg '关键时候能救命 'xattr -cr /path/to/application.app''
[2019-10-31 17:58:21][ERROR: action.script] xcrun: error: invalid active developer path (/Library/Developer/CommandLineTools), missing xcrun at: /Library/Developer/CommandLineTools/usr/bin/xcrun
[2019-10-31 17:58:21][action.script] Processing output of 'action.script' with arg 'git pull error:
'
[2019-10-31 17:58:21][ERROR: action.script] xcrun: error: invalid active developer path (/Library/Developer/CommandLineTools), missing xcrun at: /Library/Developer/CommandLineTools/usr/bin/xcrun
xcrun: error: invalid active developer path (/Library/Developer/CommandLineTools), missing xcrun at: /Library/Developer/CommandLineTools/usr/bin/xcrun
xcrun: error: invalid active developer path (/Library/Developer/CommandLineTools), missing xcrun at: /Library/Developer/CommandLineTools/usr/bin/xcrun
xcrun: error: invalid active developer path (/Library/Developer/CommandLineTools), missing xcrun at: /Library/Developer/CommandLineTools/usr/bin/xcrun
[2019-10-31 17:58:21][action.script] Processing output of 'output.notification' with arg ''
```

google了一下,给出的解决方法是重装xcode command line

```
xcode-select --install
```



## 有些APP打不开了

```sh
xattr -cr /path/to/application.app
```

这个不能多说了



## 权限

老版本的应用如果没有完全卸载,那么权限项可能已经存在,如果直接替换了新版本的应用,可能需要删除权限再重新添加才能生效.

![screenshot_2019_1101_1224_13](../assets/blog/screenshot_2019_1101_1224_13.png)



## karabiner-elements

```verilog
[2019-11-01 11:55:11.329] [info] [console_user_server] core_configuration is updated.
[2019-11-01 11:55:11.373] [info] [console_user_server] Check for updates...
[2019-11-01 11:55:12.701] [error] [observer] grabber_client error: No buffer space available
[2019-11-01 11:55:12.804] [error] [console_user_server] grabber_client error: No buffer space available
[2019-11-01 11:55:14.268] [error] [observer] grabber_client error: No buffer space available
[2019-11-01 11:55:14.312] [error] [console_user_server] grabber_client error: No buffer space available
[2019-11-01 11:55:15.729] [error] [observer] grabber_client error: No buffer space available
[2019-11-01 11:55:15.838] [error] [console_user_server] grabber_client error: No buffer space available
[2019-11-01 11:55:17.221] [error] [observer] grabber_client error: No buffer space available
[2019-11-01 11:55:17.395] [error] [console_user_server] grabber_client error: No buffer space available
[2019-11-01 11:55:18.552] [error] [observer] grabber_client error: No buffer space available
[2019-11-01 11:55:18.826] [error] [console_user_server] grabber_client error: No buffer space available
[2019-11-01 11:55:19.903] [error] [observer] grabber_client error: No buffer space available
[2019-11-01 11:55:20.269] [error] [console_user_server] grabber_client error: No buffer space available
[2019-11-01 11:55:21.409] [error] [observer] grabber_client error: No buffer space available
[2019-11-01 11:55:21.930] [error] [console_user_server] grabber_client error: No buffer space available

```

karbiner 12.6.0. 偶尔发生,重启后恢复正常. 等新版本看是否修复此问题.



## zip无法解压

![screenshot_2019_1106_0929_33](../assets/blog/screenshot_2019_1106_0929_33.png)

使用第三方的keka可以正常解压,不知为何?

> 解决:
>
> 切换系统为中文后就可以使用了,不知道是语言的问题还是因为重新启动就解决了.





## Preview

有些pdf打不开了,但是chrome还是可以打开的

![screenshot_2019_1106_0432_27](../assets/blog/screenshot_2019_1106_0432_27.png)

> 解决:
>
> 将系统语言切换到中文,就可以打开了,然后再切回英文,也可以打开了,不知道为什么,但是解决了.也许是重新启动就好了?



## PHP

Catalina的 PHP版本比较新,7.3.9

alfred里的一些脚本警告


```sh
Warning: count(): Parameter must be an array or an object that implements Countable in /Users/bob/Nutstore/Preferences/alfred/Alfred.alfredpreferences/workflows/user.workflow.B0724C7A-42CF-490E-9CCE-7761BD21428F/e4WorkflowApp.php on line 51
```

警告的是下面if所在的行

```php
// Loading default configuration
		if (count($e4Config['defaults']) > 0)
			foreach ($e4Config['defaults'] AS $key => $value)
				$this->addDefault($key, $value);
```

原因是7.2以后,count函数的参数要实现Countable接口.



## Reminder(提醒)

长的文字不能折行?



![screenshot_2019_1108_0926_51](../assets/blog/screenshot_2019_1108_0926_51.png)

后续: 新的reminder升级了数据格式,一条提醒分为标题和内容,那意思就是内容多的你就弄个简短的标题,把文字多的放到内容部分.好像没毛病.但是,我是说但是,为啥手机端的reminder反着来?  标题多长都能显示全,内容部分的文字多了反而显示不全,这是什么配合?

![image-20200327155338928](../assets/blog/image-20200327155338928.png)



## Preview

经常提示无法打开pdf,预览正常,重启电脑后正常.