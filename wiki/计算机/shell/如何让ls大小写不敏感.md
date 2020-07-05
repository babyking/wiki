如何让ls大小写不敏感

在写alfred的插件的时候,需要ls根据通配符列出的文件名不区分大小写.

bash下设置:

```bsh
shopt -s nocaseglob
```

zsh:

```bsh
unsetopt CASE_GLOB
```

yash:

```bsh
set +o case-glob
```



如果长期使用可以放到`.[shell_name]rc`文件中去. 