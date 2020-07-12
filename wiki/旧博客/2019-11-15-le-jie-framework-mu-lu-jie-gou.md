---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: 了解Framework目录结构
date: 2019-11-15 13:27
category: 技术
tags: [ios,mac]
---



macOS/iOS中的frameswork的目录结构像是这样

```xml
MyFramework.framework/
    MyFramework  -> Versions/Current/MyFramework
    Resources    -> Versions/Current/Resources
    Versions/
        A/
            MyFramework
            Resources/
                English.lproj/
                    InfoPlist.strings
                Info.plist

        Current  -> A
```



根目录中除了Versions外,其他两个都是link,versions下Current是一个link指向实际的framework内容,这样设计主要是当有多个版本的时候,升级的时候只需要更改Current 这个link就可以了.如下所示:



```xml
MyFramework.framework/
    MyFramework  -> Versions/Current/MyFramework
    Resources    -> Versions/Current/Resources
    Versions/
        A/
            MyFramework
            Resources/
                English.lproj/
                    InfoPlist.strings
                Info.plist
        B/
            MyFramework
            Resources/
                English.lproj/
                    InfoPlist.strings
                Info.plist
        Current  -> B
```

