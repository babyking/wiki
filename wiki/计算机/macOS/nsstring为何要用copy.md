# NSString为何要用copy？而不是strong？

strong和retain同义, weak和assign同义, 为什么要采用这种说法, 似乎是ARC出现后为了消除引用计数的观念而采用的做法. 至于为什么要用copy, 由于纯NSString是只读的, 所以strong和copy的结果一样,据stackOverflow上的说法,是为了防止mutable string被无意中修改, NSMutableString是NSString的子类, 因此NSString指针可以持有NSMutableString对象

> 说的是同义,assign 修饰原始类型变量,weak不可以.