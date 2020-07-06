## mkdocs导出pdf

1. 安装mkpdfs插件

   ```sh
   pip install mkpdfs
   ```

2. mkdocs中plugint配置

   ```yaml
   plugins:
       - search
       - mkpdfs
   ```

3. `mkdocs build` 或者 `mkdocs serve`

   pdf文件位于`site/pdf/` 下



## 遇到的问题:

> 最终通过降级安装解决

首先遇到的就是 `Unable to revert mtime: /Library/Fonts`

安装 `brew install libmagic`后不再出现

```sh
➜  mkdocs git:(master) ✗ mkdocs build
Unable to revert mtime: /Library/Fonts
Traceback (most recent call last):
  File "/Users/bob/.pyenv/versions/3.7.7/bin/mkdocs", line 8, in <module>
    sys.exit(cli())
  File "/Users/bob/.pyenv/versions/3.7.7/Python.framework/Versions/3.7/lib/python3.7/site-packages/click/core.py", line 829, in __call__
    return self.main(*args, **kwargs)
  File "/Users/bob/.pyenv/versions/3.7.7/Python.framework/Versions/3.7/lib/python3.7/site-packages/click/core.py", line 782, in main
    rv = self.invoke(ctx)
  File "/Users/bob/.pyenv/versions/3.7.7/Python.framework/Versions/3.7/lib/python3.7/site-packages/click/core.py", line 1259, in invoke
    return _process_result(sub_ctx.command.invoke(sub_ctx))
  File "/Users/bob/.pyenv/versions/3.7.7/Python.framework/Versions/3.7/lib/python3.7/site-packages/click/core.py", line 1066, in invoke
    return ctx.invoke(self.callback, **ctx.params)
  File "/Users/bob/.pyenv/versions/3.7.7/Python.framework/Versions/3.7/lib/python3.7/site-packages/click/core.py", line 610, in invoke
    return callback(*args, **kwargs)
  File "/Users/bob/.pyenv/versions/3.7.7/Python.framework/Versions/3.7/lib/python3.7/site-packages/mkdocs/__main__.py", line 152, in build_command
    build.build(config.load_config(**kwargs), dirty=not clean)
  File "/Users/bob/.pyenv/versions/3.7.7/Python.framework/Versions/3.7/lib/python3.7/site-packages/mkdocs/config/base.py", line 197, in load_config
    errors, warnings = cfg.validate()
  File "/Users/bob/.pyenv/versions/3.7.7/Python.framework/Versions/3.7/lib/python3.7/site-packages/mkdocs/config/base.py", line 107, in validate
    run_failed, run_warnings = self._validate()
  File "/Users/bob/.pyenv/versions/3.7.7/Python.framework/Versions/3.7/lib/python3.7/site-packages/mkdocs/config/base.py", line 62, in _validate
    self[key] = config_option.validate(value)
  File "/Users/bob/.pyenv/versions/3.7.7/Python.framework/Versions/3.7/lib/python3.7/site-packages/mkdocs/config/config_options.py", line 131, in validate
    return self.run_validation(value)
  File "/Users/bob/.pyenv/versions/3.7.7/Python.framework/Versions/3.7/lib/python3.7/site-packages/mkdocs/config/config_options.py", line 609, in run_validation
    plgins[item] = self.load_plugin(item, cfg)
  File "/Users/bob/.pyenv/versions/3.7.7/Python.framework/Versions/3.7/lib/python3.7/site-packages/mkdocs/config/config_options.py", line 617, in load_plugin
    Plugin = self.installed_plugins[name].load()
  File "/Users/bob/.pyenv/versions/3.7.7/Python.framework/Versions/3.7/lib/python3.7/site-packages/pkg_resources/__init__.py", line 2443, in load
    return self.resolve()
  File "/Users/bob/.pyenv/versions/3.7.7/Python.framework/Versions/3.7/lib/python3.7/site-packages/pkg_resources/__init__.py", line 2449, in resolve
    module = __import__(self.module_name, fromlist=['__name__'], level=0)
  File "/Users/bob/.pyenv/versions/3.7.7/Python.framework/Versions/3.7/lib/python3.7/site-packages/mkpdfs_mkdocs/__init__.py", line 1, in <module>
    from .mkpdfs import Mkpdfs
  File "/Users/bob/.pyenv/versions/3.7.7/Python.framework/Versions/3.7/lib/python3.7/site-packages/mkpdfs_mkdocs/mkpdfs.py", line 17, in <module>
    class Mkpdfs(BasePlugin):
  File "/Users/bob/.pyenv/versions/3.7.7/Python.framework/Versions/3.7/lib/python3.7/site-packages/mkpdfs_mkdocs/mkpdfs.py", line 20, in Mkpdfs
    ('design', config_options.Type(utils.string_types, default=None)),
AttributeError: module 'mkdocs.utils' has no attribute 'string_types'
```



后面遇到

`AttributeError: module 'mkdocs.utils' has no attribute 'string_types'`

```sh
➜  mkdocs git:(master) ✗ mkdocs build
Traceback (most recent call last):
  File "/Users/bob/.pyenv/versions/3.7.7/bin/mkdocs", line 8, in <module>
    sys.exit(cli())
  File "/Users/bob/.pyenv/versions/3.7.7/Python.framework/Versions/3.7/lib/python3.7/site-packages/click/core.py", line 829, in __call__
    return self.main(*args, **kwargs)
  File "/Users/bob/.pyenv/versions/3.7.7/Python.framework/Versions/3.7/lib/python3.7/site-packages/click/core.py", line 782, in main
    rv = self.invoke(ctx)
  File "/Users/bob/.pyenv/versions/3.7.7/Python.framework/Versions/3.7/lib/python3.7/site-packages/click/core.py", line 1259, in invoke
    return _process_result(sub_ctx.command.invoke(sub_ctx))
  File "/Users/bob/.pyenv/versions/3.7.7/Python.framework/Versions/3.7/lib/python3.7/site-packages/click/core.py", line 1066, in invoke
    return ctx.invoke(self.callback, **ctx.params)
  File "/Users/bob/.pyenv/versions/3.7.7/Python.framework/Versions/3.7/lib/python3.7/site-packages/click/core.py", line 610, in invoke
    return callback(*args, **kwargs)
  File "/Users/bob/.pyenv/versions/3.7.7/Python.framework/Versions/3.7/lib/python3.7/site-packages/mkdocs/__main__.py", line 152, in build_command
    build.build(config.load_config(**kwargs), dirty=not clean)
  File "/Users/bob/.pyenv/versions/3.7.7/Python.framework/Versions/3.7/lib/python3.7/site-packages/mkdocs/config/base.py", line 197, in load_config
    errors, warnings = cfg.validate()
  File "/Users/bob/.pyenv/versions/3.7.7/Python.framework/Versions/3.7/lib/python3.7/site-packages/mkdocs/config/base.py", line 107, in validate
    run_failed, run_warnings = self._validate()
  File "/Users/bob/.pyenv/versions/3.7.7/Python.framework/Versions/3.7/lib/python3.7/site-packages/mkdocs/config/base.py", line 62, in _validate
    self[key] = config_option.validate(value)
  File "/Users/bob/.pyenv/versions/3.7.7/Python.framework/Versions/3.7/lib/python3.7/site-packages/mkdocs/config/config_options.py", line 131, in validate
    return self.run_validation(value)
  File "/Users/bob/.pyenv/versions/3.7.7/Python.framework/Versions/3.7/lib/python3.7/site-packages/mkdocs/config/config_options.py", line 609, in run_validation
    plgins[item] = self.load_plugin(item, cfg)
  File "/Users/bob/.pyenv/versions/3.7.7/Python.framework/Versions/3.7/lib/python3.7/site-packages/mkdocs/config/config_options.py", line 617, in load_plugin
    Plugin = self.installed_plugins[name].load()
  File "/Users/bob/.pyenv/versions/3.7.7/Python.framework/Versions/3.7/lib/python3.7/site-packages/pkg_resources/__init__.py", line 2443, in load
    return self.resolve()
  File "/Users/bob/.pyenv/versions/3.7.7/Python.framework/Versions/3.7/lib/python3.7/site-packages/pkg_resources/__init__.py", line 2449, in resolve
    module = __import__(self.module_name, fromlist=['__name__'], level=0)
  File "/Users/bob/.pyenv/versions/3.7.7/Python.framework/Versions/3.7/lib/python3.7/site-packages/mkpdfs_mkdocs/__init__.py", line 1, in <module>
    from .mkpdfs import Mkpdfs
  File "/Users/bob/.pyenv/versions/3.7.7/Python.framework/Versions/3.7/lib/python3.7/site-packages/mkpdfs_mkdocs/mkpdfs.py", line 17, in <module>
    class Mkpdfs(BasePlugin):
  File "/Users/bob/.pyenv/versions/3.7.7/Python.framework/Versions/3.7/lib/python3.7/site-packages/mkpdfs_mkdocs/mkpdfs.py", line 20, in Mkpdfs
    ('design', config_options.Type(utils.string_types, default=None)),
AttributeError: module 'mkdocs.utils' has no attribute 'string_types'
```



这个问题在这里也有人遇到  https://github.com/zhaoterryy/mkdocs-pdf-export-plugin/issues/76

有人建议降级安装 mkdocs`pip install --upgrade mkdocs==1.0.4`

**降级安装后,成功运行.**

