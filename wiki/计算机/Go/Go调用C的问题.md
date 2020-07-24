# Go调用C的问题



```c
// hello.c
#include <stdio.h>
void hello(){
    printf("hello\n");
}
```



将c包装在一个go的包里

```go
//hello.go
package util

/*
#include "hello.c"
 */
import "C"

func Hello(){
	C.hello()
}
```

go调用 

```go
// main.go
package main

import "./util"
func main(){
	util.Hello()
}
```



调用报错,重复的symbol

```shell
duplicate symbol '_hello' in:
    $WORK/b002/_x002.o
    $WORK/b002/_x003.o
ld: 1 duplicate symbol for architecture x86_64
clang: error: linker command failed with exit code 1 (use -v to see invocation)
```



解决的办法是将c文件中的函数前加 `inline`或`static`  

```c
// hello.c
#include <stdio.h>
static void hello(){    //加static 或 inline
    printf("hello\n");
}
```

