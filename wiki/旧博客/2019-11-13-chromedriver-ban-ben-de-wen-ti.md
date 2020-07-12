---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: ChromeDriver版本的问题
date: 2019-11-13 22:57
category: 技术
tags: [selenium,chromedriver]
---



最近使用selenium写个小爬虫,两台电脑其中一台Catalina工作正常,另一台 Mojave报下面错误.

```sh
Traceback (most recent call last):
	33: from script/mp3.rb:7:in `<main>'
	32: from /Users/bob/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/selenium-webdriver-3.14.0/lib/selenium/webdriver.rb:86:in `for'
	31: from /Users/bob/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/selenium-webdriver-3.14.0/lib/selenium/webdriver/common/driver.rb:44:in `for'
	30: from /Users/bob/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/selenium-webdriver-3.14.0/lib/selenium/webdriver/common/driver.rb:44:in `new'
	29: from /Users/bob/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/selenium-webdriver-3.14.0/lib/selenium/webdriver/chrome/driver.rb:48:in `initialize'
	28: from /Users/bob/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/selenium-webdriver-3.14.0/lib/selenium/webdriver/remote/bridge.rb:53:in `handshake'
	27: from /Users/bob/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/selenium-webdriver-3.14.0/lib/selenium/webdriver/remote/bridge.rb:97:in `create_session'
	26: from /Users/bob/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/selenium-webdriver-3.14.0/lib/selenium/webdriver/remote/bridge.rb:164:in `execute'
	25: from /Users/bob/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/selenium-webdriver-3.14.0/lib/selenium/webdriver/remote/http/common.rb:62:in `call'
	24: from /Users/bob/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/selenium-webdriver-3.14.0/lib/selenium/webdriver/remote/http/default.rb:104:in `request'
	23: from /Users/bob/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/selenium-webdriver-3.14.0/lib/selenium/webdriver/remote/http/common.rb:84:in `create_response'
	22: from /Users/bob/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/selenium-webdriver-3.14.0/lib/selenium/webdriver/remote/http/common.rb:84:in `new'
	21: from /Users/bob/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/selenium-webdriver-3.14.0/lib/selenium/webdriver/remote/response.rb:32:in `initialize'
	20: from /Users/bob/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/selenium-webdriver-3.14.0/lib/selenium/webdriver/remote/response.rb:69:in `assert_ok'
	19: from 19  libsystem_pthread.dylib             0x00007fff65f1e40d thread_start + 13
	18: from 18  libsystem_pthread.dylib             0x00007fff65f22249 _pthread_start + 66
	17: from 17  libsystem_pthread.dylib             0x00007fff65f1f2eb _pthread_body + 126
	16: from 16  chromedriver                        0x000000010f387337 chromedriver + 3838775
	15: from 15  chromedriver                        0x000000010f366354 chromedriver + 3703636
	14: from 14  chromedriver                        0x000000010f337187 chromedriver + 3510663
	13: from 13  chromedriver                        0x000000010f350a02 chromedriver + 3615234
	12: from 12  chromedriver                        0x000000010f322a09 chromedriver + 3426825
	11: from 11  chromedriver                        0x000000010f34ff67 chromedriver + 3612519
	10: from 10  chromedriver                        0x000000010f3501aa chromedriver + 3613098
	 9: from 9   chromedriver                        0x000000010f3432df chromedriver + 3560159
	 8: from 8   chromedriver                        0x000000010eff9265 chromedriver + 111205
	 7: from 7   chromedriver                        0x000000010eff82cd chromedriver + 107213
	 6: from 6   chromedriver                        0x000000010f01e663 chromedriver + 263779
	 5: from 5   chromedriver                        0x000000010f0216d8 chromedriver + 276184
	 4: from 4   chromedriver                        0x000000010eff21c0 chromedriver + 82368
	 3: from 3   chromedriver                        0x000000010eff6492 chromedriver + 99474
	 2: from 2   chromedriver                        0x000000010f095f6f chromedriver + 753519
	 1: from 1   chromedriver                        0x000000010f3152a3 chromedriver + 3371683
0   chromedriver                        0x000000010f381199 chromedriver + 3813785: session not created: This version of ChromeDriver only supports Chrome version 79 (Selenium::WebDriver::Error::SessionNotCreatedError)
```

意思是说当前版本的chromedriver只支持79版本的chrome,但是我自己通过homebrew装的确是78版本的chromedriver.  

`which chromedriver` 一看,是在rbenv的shims下,直接卸载ruby下的gem,但是还是不行,rbenv的shims下的chromedrive还在.直接查找,全部干掉.

```sh
➜  shims chromedriver
Starting ChromeDriver 79.0.3945.16 (93fcc21110c10dbbd49bbff8f472335360e31d05-refs/branch-heads/3945@{#262}) on port 9515
Only local connections are allowed.
Please protect ports used by ChromeDriver and related test frameworks to prevent access by malicious code.
^C
➜  shims ls ~/.rbenv/versions/*/bin/* | grep chromedriver
/Users/bob/.rbenv/versions/2.5.1/bin/chromedriver
/Users/bob/.rbenv/versions/2.5.1/bin/chromedriver-update
➜  shims ls ~/.rbenv/versions/*/bin/* | grep chromedriver | xargs rm
➜  shims ls ~/.rbenv/versions/*/bin/* | grep chromedriver
➜  shims which chromedriver
/Users/bob/.rbenv/shims/chromedriver
➜  shims which chromedriver | xargs rm
➜  shims which chromedriver
chromedriver not found
```

再重新安装

```sh
brew install chromedriver
```

工作正常.

另外发现我的`~/.zshrc` 中的pyenv 还将shims加入了PATH,同时还发现的更早以前的pyenv/bin目录,新版本已经不需要将bin和shims目录加入`$PATH`了.

