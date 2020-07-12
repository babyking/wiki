---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: __strong和__weak
date: 2019-10-29 14:04
category: 技术
tags: [ios,objc]
---



[进一步谈谈 __strong 和 __weak](https://ziecho.com/post/ios/2015-09-02)

```objc
- (void)foo {
    __weak typeof(self) weakSelf = self; //解决循环引用
    self.block = ^{
        __strong typeof(weakSelf) strongSelf = weakSelf; // retain(self)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
          NSLog(@"%@",strongSelf);
          if (strongSelf) { //这里还是要做检测,保证程序的健壮性
            // dosth
          }
        });
      	// 结束后 strongSelf超出作用域, 会release(self)
    };
    self.block();
    [self.navigationController popViewControllerAnimated:YES];
}
```

~~` __strong`只能保证在block执行期间self不为nil,尽可能保证在执行期间持有self,只是尽可能,block中还是要检查self的有效性.~~

`__strong` 的作用主要指的是在block开始执行时,这个时候如weakSelf(也就是self)不为空的话,那么尽可能的让block在执行的过程中持有这个weakSelf,让其不被release.  如果在开始执行的时候self已经被释放,__strong本身也无力回天,所以在block执行过程中还是要对self做检测的

