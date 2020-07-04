### 参考

1. 仅有600行代码的精简版Rails，可作为学习Rails源码的向导 https://github.com/xaqi/mini-rails
2. https://rebuilding-rails.com/

### 提出问题(操作)

1. bundel exe 如何省略
2. 创建了sqlite,如何往其他数据库迁移
3. 

### 遇到的问题

1. `RAILS_ENV=development environment is not defined in config/webpacker.yml, falling back to production environment
   ➜  build-an-api-rails-`

   解决:

   ```sh
   # 先安装yarn
   brew install yarn
   # 再安装webpacker
   bundle exec rails webpacker:install
   ```

2. 

### Gem使用国内镜像

```ruby
gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/
gem sources -l

https://gems.ruby-china.com   # 确保只有 gems.ruby-china.com
```

你可以用 Bundler 的 [Gem 源代码镜像命令](http://bundler.io/v1.5/bundle_config.html#gem-source-mirrors)。

```
$ bundle config mirror.https://rubygems.org https://gems.ruby-china.com
```

这样你不用改你的 Gemfile 的 source。

```
source 'https://rubygems.org/'
gem 'rails', '4.2.5'
...
```

### rails new 时bundle install 时间长

新建rails项目时，rails new老是卡在bundle install那里.

```ruby	
rails new my_app --skip-bundle  
cd my_app  
bundle install --local
```



### 安装指定版本的rails

```ruby
gem install rails -v 5.0.0
// gem install rails --version=5.0.0
```



### 生成指定版本的Rails项目

```ruby
//本地 Rails 默认5.0.2 版本
$ gem list --local
rails (5.0.2, 5.0.0.1, 5.0.0, 4.2.8)

//使用 version 生成指定version的项目
rails version new application_name
//例如生成 4.2.8
rails 4.2.8 new todolis
```

生成项目后,执行bundle,然后就可以使用rails(不用指定版本)了,通过bundle来指定版本.

### config.ru 作用是什么? 

ru是rackup的缩写. config.ru是一个Rack-based Server启动的配置文件.

### 什么是Rack?

Rails 就是一个 Rack app. 实际上, 基本上所有的 Ruby web framework 都是`rack app`

参考 [为什么我们需要Rack](https://ruby-china.org/topics/21517)

### rails的生命周期?



### 数据库配置

#### sqlite3

```yaml
# SQLite version 3.x
#   gem install sqlite3
#
#   Ensure the SQLite 3 gem is defined in your Gemfile
#   gem 'sqlite3'
#
default: &default
  adapter: sqlite3
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  timeout: 5000

development:
  <<: *default
  database: db/development.sqlite3

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
  <<: *default
  database: db/test.sqlite3

production:
  <<: *default
  database: db/production.sqlite3
```

#### mysql

```yaml
# MySQL. Versions 5.1.10 and up are supported.
#
# Install the MySQL driver
#   gem install mysql2
#
# Ensure the MySQL gem is defined in your Gemfile
#   gem 'mysql2'
#
# And be sure to use new-style password hashing:
#   https://dev.mysql.com/doc/refman/5.7/en/password-hashing.html
#
default: &default
  adapter: mysql2
  encoding: utf8
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: root
  password:
  host: localhost

development:
  <<: *default
  database: rails_app_mysql_development

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
  <<: *default
  database: rails_app_mysql_test

# As with config/secrets.yml, you never want to store sensitive information,
# like your database password, in your source code. If your source code is
# ever seen by anyone, they now have access to your database.
#
# Instead, provide the password as a unix environment variable when you boot
# the app. Read http://guides.rubyonrails.org/configuring.html#configuring-a-database
# for a full rundown on how to provide these environment variables in a
# production deployment.
#
# On Heroku and other platform providers, you may have a full connection URL
# available as an environment variable. For example:
#
#   DATABASE_URL="mysql2://myuser:mypass@localhost/somedatabase"
#
# You can use this database configuration with:
#
#   production:
#     url: <%= ENV['DATABASE_URL'] %>
#
production:
  <<: *default
  database: rails_app_mysql_production
  username: rails_app_mysql
  password: <%= ENV['RAILS_APP_MYSQL_DATABASE_PASSWORD'] %>

```

