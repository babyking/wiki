---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: 安装Spleeter
date: 2019-11-06 09:22
category: 技术
tags: [python,tensorflow,伴奏]
---



[Spleeter](https://github.com/deezer/spleeter) 使用tensorflow可以将一首歌分拆出分轨.

macOS 10.14.6

## pyenv安装python

```sh
➜  ~ pyenv install 3.7.0
python-build: use openssl from homebrew
python-build: use readline from homebrew
Installing Python-3.7.0...
python-build: use readline from homebrew

BUILD FAILED (OS X 10.14.6 using python-build 20180424)

Inspect or clean up the working tree at /var/folders/7l/s7d6ygtd6sb4vysmrctb8gkm0000gn/T/python-build.20191105212533.59697
Results logged to /var/folders/7l/s7d6ygtd6sb4vysmrctb8gkm0000gn/T/python-build.20191105212533.59697.log

Last 10 log lines:
  File "/private/var/folders/7l/s7d6ygtd6sb4vysmrctb8gkm0000gn/T/python-build.20191105212533.59697/Python-3.7.0/Lib/ensurepip/__main__.py", line 5, in <module>
    sys.exit(ensurepip._main())
  File "/private/var/folders/7l/s7d6ygtd6sb4vysmrctb8gkm0000gn/T/python-build.20191105212533.59697/Python-3.7.0/Lib/ensurepip/__init__.py", line 204, in _main
    default_pip=args.default_pip,
  File "/private/var/folders/7l/s7d6ygtd6sb4vysmrctb8gkm0000gn/T/python-build.20191105212533.59697/Python-3.7.0/Lib/ensurepip/__init__.py", line 117, in _bootstrap
    return _run_pip(args + [p[0] for p in _PROJECTS], additional_paths)
  File "/private/var/folders/7l/s7d6ygtd6sb4vysmrctb8gkm0000gn/T/python-build.20191105212533.59697/Python-3.7.0/Lib/ensurepip/__init__.py", line 27, in _run_pip
    import pip._internal
zipimport.ZipImportError: can't decompress data; zlib not available
make: *** [install] Error 1
```



提示zlib未安装

```sh
brew install zlib
```

同时还要设置环境变量

```sh
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"
export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"
```

再运行`pyenv install 3.7.0`安装成功



## 安装Spleeter

```sh
pip install spleeter
```

setuptools版本不对

```sh
tensorboard 1.14.0 has requirement setuptools>=41.0.0, but you'll have setuptools 39.0.1 which is incompatible.
```

pip版本也低

```sh
You are using pip version 10.0.1, however version 19.3.1 is available.
You should consider upgrading via the 'pip install --upgrade pip' command.
```

先升级pip

```sh
pip install --upgrade pip
```

再安装setuptools

```sh
pip install setuptools==41.0.0
```

再重新安装 spleeter

```sh
pip install spleeter
```

安装成功



## 使用spleeter

```sh
spleeter separate -i 1.mp3 -p spleeter:2stems -o out
Traceback (most recent call last):
  File "/Users/bob/.pyenv/versions/3.7.0/bin/spleeter", line 11, in <module>
    load_entry_point('spleeter==1.4.1', 'console_scripts', 'spleeter')()
  File "/Users/bob/.pyenv/versions/3.7.0/lib/python3.7/site-packages/spleeter/__main__.py", line 48, in entrypoint
    main(sys.argv)
  File "/Users/bob/.pyenv/versions/3.7.0/lib/python3.7/site-packages/spleeter/__main__.py", line 42, in main
    entrypoint(arguments, params)
  File "/Users/bob/.pyenv/versions/3.7.0/lib/python3.7/site-packages/spleeter/commands/separate.py", line 162, in entrypoint
    audio_adapter = get_audio_adapter(arguments.audio_adapter)
  File "/Users/bob/.pyenv/versions/3.7.0/lib/python3.7/site-packages/spleeter/utils/audio/adapter.py", line 135, in get_audio_adapter
    return get_default_audio_adapter()
  File "/Users/bob/.pyenv/versions/3.7.0/lib/python3.7/site-packages/spleeter/utils/audio/adapter.py", line 124, in get_default_audio_adapter
    AudioAdapter.DEFAULT = FFMPEGProcessAudioAdapter()
  File "/Users/bob/.pyenv/versions/3.7.0/lib/python3.7/site-packages/spleeter/utils/audio/ffmpeg.py", line 147, in __init__
    self._ffmpeg_path = _get_ffmpeg_path()
  File "/Users/bob/.pyenv/versions/3.7.0/lib/python3.7/site-packages/spleeter/utils/audio/ffmpeg.py", line 71, in _get_ffmpeg_path
    raise IOError(f'FFMPEG binary ({ffmpeg_path}) not found')
OSError: FFMPEG binary (ffmpeg) not found
```

提示ffmpeg未安装

```sh
brew install ffmpeg
```

安装完成后,正常工作

```sh
➜  split spleeter separate -i 1.mp3 -p spleeter:2stems -o out
INFO:tensorflow:Downloading model archive https://github.com/deezer/spleeter/releases/download/v1.4.0/2stems.tar.gz

```

但是速度很慢 ,可以将[https://github.com/deezer/spleeter/releases/ ](https://github.com/deezer/spleeter/releases/ )中的几个文件下载

![screenshot_2019_1105_1025_16](../assets/blog/screenshot_2019_1105_1025_16.png)

解压后放到 `pretrained_models`下

![screenshot_2019_1105_1026_24](../assets/blog/screenshot_2019_1105_1026_24.png)

可以正常工作了.