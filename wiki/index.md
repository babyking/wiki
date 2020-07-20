#    
go中,nil是指针,切片,map及接口的零值
___
作者：Molho
链接：https://www.zhihu.com/question/264270664/answer/280896102
来源：知乎
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

1，不仅仅是9和弦省略5音，7和弦，11，13和弦也都可以省略5音。因为5音既不像3音那样决定了这条音阶是Minor或是Major，又不像7音那样，在3音确定的基础上进一步决定了该条音阶是Major，Mixolydian，Melodic minor或是Minor。再者，5音也不像9，11，13一样是色彩音，和弦里有没有这个音对色彩几乎没什么影响。所以除非是#5或者b5，否则5音都是可省的。2，11和弦并不能省3音，省略了3音的11和弦只能叫做sus4。11和弦通常只见于m7和m7b5这类minor类的和声。而在Major和Dominant类的和声里，通常只会使用#11音，而不是11音。这是因为在Major和Dominant类的和声里，11音会与3音形成小九度（小二度），而3音又是决定着和声性质的，这里的小九度会使和声变得非常模糊。而11音在Minor和声，#11在Major和Dominant和声里，和3音形成的都是大九度（大二度）关系，因此就会好一些。3，和声的tension是彼此独立的，11和弦不一定要包含9音，13和弦也不一定包含11音。对于一个没有上下文的单独的和声标记来说，只要包含最重要的那些音就可以了。比如单独一个G13，最重要的音就是根音G，3音B，7音F，13音E，所以你只要弹GFBE就够了。在此情况下你可以加入9音使得色彩更丰富一些，就变成了GFABE。但是色彩的使用一定要根据上下文来确定，比如到底是#9还是b9还是#11。4，对于什么时候该省略音这个问题，其实记住一个点就好，那就是对于小九度和三全音的避让，尤其是小九度。除了7b9和声里b9和根音的小九度之外，其他情况下任何两个音都要避免形成小九度关系。再一个就是三全音，比如mM7和Major7，要使用11音的时候就一定要当心，因为7音和11音会形成三全音，导致原本的Minor和Major听感向Dominant转变，使得和声变的模棱两可。
___
如何不靠运气变得富有(更新中) https://github.com/fat-garage/how-to-get-rich-without-getting-lucky
___
类型关心存储,接口关心做啥?
___
`iota` 念 `一欧搭`
___
golang中iota的全名（不是用法）是什么 这就是全名。 “iota”是希腊字母表中的字母。这是典型的数学符号
___
MacOS Big Sur 下解决 Karabiner-Elements 失效问题 http://machbbs.com/v2ex/152316
___
go中 的类型别名 `type byte=int8` 与 `type byte2 int8` 是不一样的.
___
ruby URL 正则  ```ruby\n rg = /http(s?)\:\/\/[0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*(:(0-9)*)*(\/?)([a-zA-Z0-9\-\.\?\,\'\/\\\+&amp;%$#_]*)?/ \n```
___
ruby中可以方便的获取shell的返回值  
```ruby
path=`pwd`
```
___
Ruby pbcopy and pbpaste def pbcopy(input)
  str = input.to_s
  IO.popen('pbcopy', 'w') { |f| f << str }
  str
end

def pbpaste
  `pbpaste`
end
___
if [ $? -eq 0 ]; then
    echo "succeed"
else
    echo "failed"
fi
___


if [ $? -ne 0 ]; then
    echo "mkdocs build failed!"
fi
___
if [ $? -ne 0 ]; then
    echo "failed"
else
    echo "succeed"
fi
___
大前端面试宝典 - 图解前端 https://lucifer.ren/fe-interview/#/
___
alfred中的runscript 运行python,ruby只能运行系统自带的版本,如何使用指定的版本呢?
___
alfred的keyword可以是动态的吗?这样可以动态的增加一些wf
___
typora命令行设置 `alias typora="open -a typora"`

___
