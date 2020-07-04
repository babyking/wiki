> this是永远不会延作用域链或原型链出现一个“查找”的过程的，只会在函数调用时就完全确认

只有5种情况:



1. ()=>(){console.log(this);}  

   箭头函数在设计中使用的是Lexical this，即这个函数被创建时的this就是函数内部的this.

   需要注意的是，**这个函数创建时并不是一个读代码的人肉眼能看到这个函数的时候**，很多人有这样的误解，比如这样的代码：

   ```js
   function printThis() {
     let print = () => console.log(this);
     
     print();
   }
   
   printThis.call([1]);
   printThis.call([2]);
   ```

   有些人会理解都一样，输出的是Window，因为看到print函数的时候是顶级作用域。但其实print函数是在printThis被调用的时候才会被创建的，而printThis的this由外部的call决定着，所以输出自然是[1]和[2]

2. function f(){console.log(this);}

   这种函数直接调用(Function Invocation Pattern)情况的调用,**f作为独立的变量使用**,而不是属性, this永远都是全局对象.

3. foo.bar()的调用方式(Method Invocation Pattern),这种形式一般有`.`或`[]` ,this一定是`.` `[]`前面的对象.

4. new foo() 调用方式(Constructor Pattern),函数内部的this一定是new返回的这个对象.

5. foo.call(thisObj),foo.apply(thisObj) 调用方式(Apply Pattern),这种情况this一定是call或是apply的第一个参数thisObj,如果thisObj为null或是undefined,则this为全局对象(**因为this不能为null或undefined**)

   `call或apply，第一个参数如果为null或undefined，默认是变成global对象，在严格模式下不会发生这一转换。???`

