# mkdocs常用设置

## 如何去掉搜索框?

`mkdocs.yml`的plugin设置为空

```yml
plugins: []
```



## 如何去掉TOC?

```yml
markdown_extensions:
  - toc:
      toc_depth : "1-1"
```

