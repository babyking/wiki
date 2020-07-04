## normal和insert模式下设置不同光标

~/.vimrc 增加下面代码

```bash
" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
```

## 光标按照单词快速移动设置

![image-20200518134955411](../../assets/image-20200518134955411.png)

![image-20200518135032915](../../assets/image-20200518135032915.png)

![image-20200518135053805](../../assets/image-20200518135053805.png)

![image-20200518135115372](../../assets/image-20200518135115372.png)

![image-20200518135128323](../../assets/image-20200518135128323.png)