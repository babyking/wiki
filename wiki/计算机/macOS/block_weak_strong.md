# \_\_block & \_\_weak & \_\_strong

https://www.jianshu.com/p/501af50cd2d9

`__block & __weak`

1. ```objectivec
   1. __block不管是ARC还是MRC模式下都可以使用，可以修饰对象，还可以修饰基本数据类型。
   2. __weak只能在ARC模式下使用，也只能修饰对象（NSString），不能修饰基本数据类型（int）。
   3. __block对象可以在block中被重新赋值，__weak不可以。
   4. __block对象在ARC下可能会导致循环引用，非ARC下会避免循环引用，__weak只在ARC下使用，可以避免循环引用。
   ```

`__strong & __strong`

```objectivec
1、strong，weak 用来修饰属性。
strong 用来修饰强引用的属性；weak 用来修饰弱引用的属性；
2、__weak, __strong 用来修饰变量.
__strong 是默认的引用；__weak 声明了一个可以自动 nil 化的弱引用。  
```



https://ziecho.com/post/ios/2015-09-02

**结论**

1.一个用 `__weak` 修饰过的变量 `a`，如果再使用 `__strong` 修饰的变量 `b` 指向它， `a指向的对象` 的引用计数会`+1`。

2.当 block 从栈复制到堆上时，`weak`属性的变量所指向对象`不会增加引用计数`。