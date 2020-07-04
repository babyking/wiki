1. $(var##*/)  从前删除至最后一个/处(包括/),适合获取路径中的文件名

2. `` 和 $() 功能一样,后可以嵌套

3. echo 输出到变量的写法:    ` result=$(echo $varname)`

4. sed变量替换  `sed -i  '' "$(echo $line_number)s/^.*$/date: $(echo $date_str)/" $(echo $s)`

5. 输出多行到文件

   ```sh
   cat>file<<END
   line1
   line2
   `echo hello`
   <<END
   ```

6. 条件不成立 if not condition then 这样

   ```sh
   [ ! -e /etc/passwd ] && echo "noT exists" 
   ```

7. shift,参数左移,最左边的丢掉

   ```sh
   # test.sh a b c d 
   # $1,$2,$3,$4 四个参数分别是 a b c d
   shift
   # $1,$2,$3 只有3个参数 ,值为 b c d
   shift
   # $1 $2 只有2个参数, 值为 c d
   ```

8. $#,  参数的个数,类似于C里面的argc

9. 像rbenv一样在初始化运行时定义一些buit in  函数

   ```
   eval "$(rbenv init -)"
   ```

10. 判断一个变量是否为空,注意加引号,是`=`不是`==`

    ```sh
    [ "$var"="" ] && echo "is empty"
    ```

11. 字符串截取

    ```sh
    ${var:1:70}
    ```

12. 当前执行脚本执行的目录

    ```sh
    CURRENT_SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)
    或者
    CURRENT_SHELL_FOLDER=$(readlink -f $(dirname $0))
    ```

13. 实现进度条

    ```sh
    #!/bin/bash
    # \r 是回车  -en e表示转义,n表示不换行
    echo -en '[###                                  ]   5%\r'
    sleep 2
    echo -en '[############                         ]   25%\r'
    sleep 1
    echo -en '[#############                        ]   35%\r'
    sleep 1
    echo -en '[##################                   ]   45%'
    sleep 2
    ```

14. 两个短杠的作用

    ```sh
    gem install mysql -- --with-ldflags=-L/usr/local/opt/openssl/lib --with-cppflags=-I/usr/local/opt/openssl/include
    ```

    上面的`--`代表后面的参数`--with-ldflags=-L/usr/local/opt/openssl/lib --with-cppflags=-I/usr/local/opt/openssl/include`  gem 命令不作解析,而直接传递进去,gem的命令执行过程中全使用这个参数.至于如何使用,有时间作个小测试.

15. shell执行过程中显示出错的行(哪一行出错),最好加上 set -x

    ```
    error() {
      local parent_lineno="$1"
      local message="$2"
      local code="${3:-1}"
      if [[ -n "$message" ]] ; then
        echo "Error on or near line ${parent_lineno}: ${message}; exiting with status ${code}"
      else
        echo "Error on or near line ${parent_lineno}; exiting with status ${code}"
      fi
      exit "${code}"
    }
    trap 'error ${LINENO}' ERR
    ```

    