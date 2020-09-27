---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: 这段shell怎么理解
date: 2020-06-11 16:24
category: 技术
tags: [shell,bash,pyenv]
---

```shell
#!/usr/bin/env bash
set -e
[ -n "$PYENV_DEBUG" ] && set -x

program="${0##*/}"
if [[ "$program" = "python"* ]]; then
  for arg; do
    case "$arg" in
    -c* | -- ) break ;;
    */* )
      if [ -f "$arg" ]; then
        export PYENV_FILE_ARG="$arg"
        break
      fi
      ;;
    esac
  done
fi

export PYENV_ROOT="/Users/bob/.pyenv"
exec "/usr/local/Cellar/pyenv/1.2.18/libexec/pyenv" exec "$program" "$@"
```

