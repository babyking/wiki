---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: PostgreSQL安装信息
date: 2019-10-23 21:18
category: 技术
tags: [postgresql,数据库]
---

```zsh
➜   brew install postgresql
==> Installing dependencies for postgresql: icu4c and readline
==> Installing postgresql dependency: icu4c
==> Downloading https://homebrew.bintray.com/bottles/icu4c-64.2.mojave.bottle.tar.gz
==> Downloading from https://akamai.bintray.com/e8/e858556120acc0c2d52b8fb572b677856724cc28d24a7e1b2762d458a2977c8e?__gda__=exp=1571836626~hmac=46aa67265aaa1a26b263967090ea3d41a91756aab7f8986f51395217cb144738&response-content-disposition=attachment%3Bfilename%3D%22icu4c-6
######################################################################## 100.0%
==> Pouring icu4c-64.2.mojave.bottle.tar.gz
==> Caveats
icu4c is keg-only, which means it was not symlinked into /usr/local,
because macOS provides libicucore.dylib (but nothing else).

If you need to have icu4c first in your PATH run:
  echo 'export PATH="/usr/local/opt/icu4c/bin:$PATH"' >> ~/.zshrc
  echo 'export PATH="/usr/local/opt/icu4c/sbin:$PATH"' >> ~/.zshrc

For compilers to find icu4c you may need to set:
  export LDFLAGS="-L/usr/local/opt/icu4c/lib"
  export CPPFLAGS="-I/usr/local/opt/icu4c/include"

For pkg-config to find icu4c you may need to set:
  export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig"

==> Summary
🍺  /usr/local/Cellar/icu4c/64.2: 257 files, 69.2MB
==> Installing postgresql dependency: readline
==> Downloading https://homebrew.bintray.com/bottles/readline-8.0.1.mojave.bottle.tar.gz
==> Downloading from https://akamai.bintray.com/3c/3c754391e9d243835811d128771ca0f1a565024100fd2c2871534353d46aaf0e?__gda__=exp=1571836647~hmac=474fe6717da8cb29fd770b81fe74c293228fddb44397ef9dffd39aed009d1cfb&response-content-disposition=attachment%3Bfilename%3D%22readlin
######################################################################## 100.0%
==> Pouring readline-8.0.1.mojave.bottle.tar.gz
==> Caveats
readline is keg-only, which means it was not symlinked into /usr/local,
because macOS provides the BSD libedit library, which shadows libreadline.
In order to prevent conflicts when programs look for libreadline we are
defaulting this GNU Readline installation to keg-only.

For compilers to find readline you may need to set:
  export LDFLAGS="-L/usr/local/opt/readline/lib"
  export CPPFLAGS="-I/usr/local/opt/readline/include"

For pkg-config to find readline you may need to set:
  export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"

==> Summary
🍺  /usr/local/Cellar/readline/8.0.1: 48 files, 1.5MB
==> Installing postgresql
==> Downloading https://homebrew.bintray.com/bottles/postgresql-11.5_1.mojave.bottle.tar.gz
==> Downloading from https://akamai.bintray.com/46/463c6a192a0b6a5d1359b68db24003b2dac6895cdb86c827c41bf03fffd856d6?__gda__=exp=1571836652~hmac=78736972fa13e552dc6e8f7fe581c42a435078e29770b622841e267be9f4033a&response-content-disposition=attachment%3Bfilename%3D%22postgre
######################################################################## 100.0%
==> Pouring postgresql-11.5_1.mojave.bottle.tar.gz
==> /usr/local/Cellar/postgresql/11.5_1/bin/initdb --locale=C -E UTF-8 /usr/local/var/postgres
==> Caveats
To migrate existing data from a previous major version of PostgreSQL run:
  brew postgresql-upgrade-database

To have launchd start postgresql now and restart at login:
  brew services start postgresql
Or, if you don't want/need a background service you can just run:
  pg_ctl -D /usr/local/var/postgres start
==> Summary
🍺  /usr/local/Cellar/postgresql/11.5_1: 3,189 files, 35.4MB
==> `brew cleanup` has not been run in 30 days, running now...
Removing: /usr/local/Cellar/libpng/1.6.36... (27 files, 1.2MB)
Removing: /usr/local/Cellar/readline/7.0.3_1... (46 files, 1.5MB)
Removing: /usr/local/Cellar/readline/7.0.5... (46 files, 1.5MB)
Removing: /usr/local/Cellar/readline/8.0.0... (48 files, 1.5MB)
Removing: /Users/bob/Library/Logs/Homebrew/libtiff... (64B)
Removing: /Users/bob/Library/Logs/Homebrew/wxmac... (64B)
Removing: /Users/bob/Library/Logs/Homebrew/go... (64B)
Removing: /Users/bob/Library/Logs/Homebrew/libpng... (64B)
Removing: /Users/bob/Library/Logs/Homebrew/elixir... (64B)
Removing: /Users/bob/Library/Logs/Homebrew/erlang... (64B)
Removing: /Users/bob/Library/Logs/Homebrew/openssl@1.1... (64B)
Removing: /Users/bob/Library/Logs/Homebrew/jpeg... (64B)
Pruned 58 symbolic links and 2 directories from /usr/local
==> Caveats
==> icu4c
icu4c is keg-only, which means it was not symlinked into /usr/local,
because macOS provides libicucore.dylib (but nothing else).

If you need to have icu4c first in your PATH run:
  echo 'export PATH="/usr/local/opt/icu4c/bin:$PATH"' >> ~/.zshrc
  echo 'export PATH="/usr/local/opt/icu4c/sbin:$PATH"' >> ~/.zshrc

For compilers to find icu4c you may need to set:
  export LDFLAGS="-L/usr/local/opt/icu4c/lib"
  export CPPFLAGS="-I/usr/local/opt/icu4c/include"

For pkg-config to find icu4c you may need to set:
  export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig"

==> readline
readline is keg-only, which means it was not symlinked into /usr/local,
because macOS provides the BSD libedit library, which shadows libreadline.
In order to prevent conflicts when programs look for libreadline we are
defaulting this GNU Readline installation to keg-only.

For compilers to find readline you may need to set:
  export LDFLAGS="-L/usr/local/opt/readline/lib"
  export CPPFLAGS="-I/usr/local/opt/readline/include"

For pkg-config to find readline you may need to set:
  export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"

==> postgresql
To migrate existing data from a previous major version of PostgreSQL run:
  brew postgresql-upgrade-database

To have launchd start postgresql now and restart at login:
  brew services start postgresql
Or, if you don't want/need a background service you can just run:
  pg_ctl -D /usr/local/var/postgres start
```

