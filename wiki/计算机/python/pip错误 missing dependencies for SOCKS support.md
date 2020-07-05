pip错误 missing dependencies for SOCKS support

pip install 时报以下错误

```sh
ERROR: Could not install packages due to an EnvironmentError: Missing dependencies for SOCKS support.
```



解决	

```sh
unset all_proxy
unset ALL_PROXY
pip install pysocks
```

