#    
ruby中可以方便的获取shell的返回值  ```ruby path=`pwd`  ```
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
