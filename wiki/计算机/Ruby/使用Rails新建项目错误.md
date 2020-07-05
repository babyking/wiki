使用Rails新建项目时使用mysql时报如下错误

```sh
Fetching mysql2 0.5.3
Installing mysql2 0.5.3 with native extensions
Gem::Ext::BuildError: ERROR: Failed to build gem native extension.

    current directory: /Users/bob/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/mysql2-0.5.3/ext/mysql2
/Users/bob/.rbenv/versions/2.5.1/bin/ruby -r ./siteconf20200218-99851-19a42fp.rb extconf.rb
checking for rb_absint_size()... yes
checking for rb_absint_singlebit_p()... yes
checking for rb_wait_for_single_fd()... yes
-----
Using mysql_config at /usr/local/bin/mysql_config
-----
checking for mysql.h... yes
checking for errmsg.h... yes
checking for SSL_MODE_DISABLED in mysql.h... yes
checking for SSL_MODE_PREFERRED in mysql.h... yes
checking for SSL_MODE_REQUIRED in mysql.h... yes
checking for SSL_MODE_VERIFY_CA in mysql.h... yes
checking for SSL_MODE_VERIFY_IDENTITY in mysql.h... yes
checking for MYSQL.net.vio in mysql.h... yes
checking for MYSQL.net.pvio in mysql.h... no
checking for MYSQL_ENABLE_CLEARTEXT_PLUGIN in mysql.h... yes
checking for SERVER_QUERY_NO_GOOD_INDEX_USED in mysql.h... yes
checking for SERVER_QUERY_NO_INDEX_USED in mysql.h... yes
checking for SERVER_QUERY_WAS_SLOW in mysql.h... yes
checking for MYSQL_OPTION_MULTI_STATEMENTS_ON in mysql.h... yes
checking for MYSQL_OPTION_MULTI_STATEMENTS_OFF in mysql.h... yes
checking for my_bool in mysql.h... no
-----
Don't know how to set rpath on your system, if MySQL libraries are not in path mysql2 may not load
-----
-----
Setting libpath to /usr/local/Cellar/mysql/8.0.12/lib
-----
creating Makefile

current directory: /Users/bob/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/mysql2-0.5.3/ext/mysql2
make "DESTDIR=" clean

current directory: /Users/bob/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/mysql2-0.5.3/ext/mysql2
make "DESTDIR="
compiling client.c
compiling infile.c
compiling mysql2_ext.c
compiling result.c
compiling statement.c
linking shared-object mysql2/mysql2.bundle
ld: library not found for -lssl
clang: error: linker command failed with exit code 1 (use -v to see invocation)
make: *** [mysql2.bundle] Error 1

make failed, exit code 2

Gem files will remain installed in /Users/bob/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/mysql2-0.5.3 for inspection.
Results logged to /Users/bob/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/extensions/x86_64-darwin-18/2.5.0-static/mysql2-0.5.3/gem_make.out

An error occurred while installing mysql2 (0.5.3), and Bundler cannot continue.
Make sure that `gem install mysql2 -v '0.5.3' --source 'https://rubygems.org/'` succeeds before bundling.

In Gemfile:
  mysql2
         run  bundle binstubs bundler
Could not find gem 'mysql2 (>= 0.4.4)' in any of the gem sources listed in your Gemfile.
         run  bundle exec spring binstub --all
Could not find gem 'mysql2 (>= 0.4.4)' in any of the gem sources listed in your Gemfile.
Run `bundle install` to install missing gems.
       rails  webpacker:install
Could not find gem 'mysql2 (>= 0.4.4)' in any of the gem sources listed in your Gemfile.
Run `bundle install` to install missing gems.
```



如下解决:

```sh
#如果没有安装openssl,则先安装
brew install opensll

# 注意使用sudo 
sudo gem install mysql2 -v '0.5.3' -- --with-ldflags=-L/usr/local/opt/openssl/lib --with-cppflags=-I/usr/local/opt/openssl/include
```

