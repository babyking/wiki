---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: 说说swift方法里的参数标签
date: 2019-09-12 14:13
category: 技术
tags: [swift,objc]
---



方法参数标签在其他语言里很少见,如果没有oc的经验,直接看到swift的代码标签会有些懵圈.

上一段swift2的代码

```swift
func sendMessage(msg: String){
  // send msg
}
var msg = "hello"
sendMessage(msg)
```

一个参数的方法似乎与其他语言没什么不同,如果方法有两个参数就得写成这样了

```swift
func sendMessage(msg: String, to sb: String){
  // send msg to sb
}
var msg = "hello"
var sb = "bob"
sendMessage(msg, to:sb) 
```

为什么sendMessage后面的参数会变这样,感觉乱乱的. 这个原因主要是因为swift的语言设计的时候的主要目标是替代现有的objective-c,语言的更替最需要考虑的就是语言多年积累的生态,各种库和框架. 所以swift需要兼容这些.



再来看一段obj-c的代码就会更容易明白为什么要这么设计了.

```objc
[[NSNotificationCenter defaultCenter] addObserver:observer
                                         selector:aSelector
                                             name:LKLNFT_APP_INITIATIVE_COMPLETED
                                           object:nil];
```

参数加上标签可以更清楚的说明参数的用意,很显然,obj-c中的表达形式更优雅一些.

同时object-c中方法并不是简单通过方法名来区别不同的方法调用的.而是通过叫 selector来区分的.什么是selector

,看下面几个同名但参数不同的方法.

```objective-c
-(void) sendMessage {}

-(void) sendMessage:(NSString*) msg {}

-(void) sendMessage:(NSString*) msg to:(NSString*) sb {}
```

三个方法,虽然方法名相同,参数不同,但其实是三个不同的方法,在obj-c中这三个方法调用实际上是通过

`sendMessage` 

`sendMessage:`

`sendMessage:to:`

来区分的.方法如果有参数,那么方法名充当了第一个参数的标签,也可 以说第一个参数是省略了标签的.这样的设计,会让代码读起来更像一句人话.  同时因为objc-c的语法让这样的定义有对称,有美感.

但是到了swift中,方法定义是跟大多数语言一样,方法名加上括号以及括号中的参数,这样的语法设计很显然无法保持 上面说的对称与美感,为了兼容obj-c,总让人看起来怪怪的.

```swift
sendMessage(msg, to:sb)
```



从swift3开始,对这个做了一些调整,就是方法的第一个参数不再是默认省略标签了, ~~所有的参数在方法定义都必须显示声明标签~~ ,如果调用的时候不想输入标签,那也要使用`_` 进行声明.

```swift
func send(msg msg:String, to sb:String){}
send(msg:msg, to:sb)

//如果不想输入参数标签,使用 _ 进行声明,这样就更类c语言的调用一样的风格了
func send(_ msg:String, _ sb:String){}
send(msg,sb)

```



到这里,基本明白swift为什么会有方法标签了,如果没有obj-c的兼容问题,估计语言的设计者不会保留标签这个特性了,毕竟现在的IDE或是编辑器都可以很方便的显示参数的相关信息,并不需要通过语言特性来实现,有时候对开发者反而是个负担. 好在swift3的做法也基本能自圆其说了,但仍然无法有obj-c那样的对称美了. 但想到obj-c是一个80年代就出生的语言,当年连个象样的编辑器都不多,别说IDE了.所以这样的别致设计还真是让人眼前一亮. 



swift5补充:  有三种方式,但是一般最常用 的就是前两种

```swift
//第一种
//定义,编译器默认生成跟内部参数一样的外部名称 func send(msg msg: String, to to:String){}
func send(msg:String, to:String){}  
send(msg: "hello", to: "bob")

//第二种
//通过 _ 省略外部名称,调用方式就跟其他语言一样
func send(_ msg:String, _ to: String){}
send("hello", "bob")

//第三种 以前是objc最常用的,现在反而最不常用
func send(exMsg msg:String, exTo to:String){}
send (exMsg:"hello", exTo:"bob")

```



