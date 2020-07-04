### Pyenv安装

```bash
$ sudo yum install git -y
$ git clone git://github.com/yyuu/pyenv.git .pyenv
$ echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
$ echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
$ echo 'eval "$(pyenv init -)"' >> ~/.bashrc
$ source ~/.bashrc
```



### IO占用

iotop 命令

需要安装

```shell
$ sudo yum install iotop
```



### 用户加入sudo组

执行命令出现" is not in the shudder files"

```bash
$ su -
$ visudo
```

文件末添加

```config
用户名 ALL=(ALL)ALL
```





### SSH原理及使用

SSH连线握手过程:

> 1. Client对Server发起请求
> 2. Server将自己的公钥送给Client
> 3. 用Server的公钥加密Client自己的公钥，并送给Server
> 4. Server解开密文，取得Client的公钥，以Client的公钥加密后续讯息
> 5. 开始加密对谈，在这个加密的通道内交换登入密码等讯息



实际操作

```shell
$ ssh user@host
```

第一次登录,会提示:

```shell
$ ssh user@host

　　The authenticity of host 'host (12.18.429.21)' can't be established.

　　RSA key fingerprint is 98:2e:d7:e0:de:9f:ac:67:28:c2:42:2d:37:16:58:4d.

　　Are you sure you want to continue connecting (yes/no)?
```

无法确认主机身份,只知道其公钥指纹,问你是否继续

> 公钥登录,每次不用再输入密码
>
> 如果本地没有生成公私钥,先生成
>
> ```shell
> $ ssh-keygen -t rsa 
> ```
>
> 如果不行,确认远程主机 /etc/ssh/sshd_config 中有以下配置
>
> ```config
> RSAAuthentication yes
> PubkeyAuthentication yes
> AuthorizedKeysFile .ssh/authorized_keys
> ```
>
> 重启ssh服务
>
> 远程主机将用户公钥保存在用户主目录的 $HOME/.ssh/authorized_keys文件中.
>
> 如:
>
> ```config
> $ cat ~/.ssh/authorized_keys
> ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDTMbl1oCYjeS17py7jqn9NPOnMOsxbhXn8WWNJQFUBIw++/CEKyaFoPAtizwAJz+k2bhcUk5DNQzKPc3u1Yhs3Wm2Yw0E0VZZeSimSfrTS+J65s0O0M9LNOKXFYiW09crVTbd3FErG0heb3HJAd7f9uGZNLzxXZ90c3JmsjkS78151ZIR035eq0pJTIFA9EAjdQPbHCQi9hFVbHmWto38TsfS1i8wtAJcjParXvdSkMBfLpGt40frZm1lRpzT0djf/zpTjFbk7lmMW+SkBYaMa6FvLquusYaoJ3XMV2Oqe+RgAfix5Fsw2XsfxOxGFKsBr5bFI2huaww+22sYjDZEL bob@bobs-MacBook-Pro.local
> ```
>
> 

### 让所有的命令历史可查

缓存理论的应用场景,所有你键入过的命令都应该可以模糊查询,通过设置2个环境变量 HISTFILESIZE 和 HISTSIZE ,同时注意备份历史文件 .bash_history  或 .zsh_history 等.

在.bash_rc加入如下配置,如果你用zsh应该是在.zsh_rc,类推

```shell
HISTFILESIZE=200000
HISTSIZE=200000 #20万,一天平均键入100条命令的话,大概能保存6年
HISTCONTROL=ignoredups  #从命令历史中剔除连续重复的条目
#HISTCONTROL=erasedups  #从命令历史中剔除重复的条目
```



### 网络设置

```bash
sudo vi /etc/sysconfig/network-scripts/ifcfg-eth0 #网卡名视机器而定	
```

> BOOTPROTO="dhcp"
>
> ONBOOT="yes"

或手动配置如下:

> BOOTPROTO=static
>
> ONBOOT=yes
>
> IPADDR=192.168.8.250
>
> NETMASK=255.255.255.0
>
> NETWORK=192.168.8.0
>
> GATEWAY=192.168.8.2
>
> DNS1=192.168.8.2 

```bash
sudo service network restart
```

如果ifconfig不存在,需要安装net-tools

```shell
$ yum -y upgrade 
$ yum install net-tools
```

> 注意:
>
> yum -y update
>
> 升级所有包，改变软件设置和系统设置,系统版本内核都升级
>
> yum -y upgrade
>
> 升级所有包，不改变软件设置和系统设置，系统版本升级，内核不改变



### CentOS 自带防火墙 Firewalld 的安装与配置

一、Firewalld 与 Iptables 的区别 
FirewallD 是一个比较前沿的防火墙，它有命令行和图形接口，下面是 FirewallD 与 iptables 的主要区别： 
FirewallD 引入了区域和服务，替换了传统防火墙的规则。 

FirewallD 的规则集是 动态的，允许在不关闭连接和 sessions 的情况下更新规则。 

二、安装 Firewalld 

- 检查是否已经安装防火墙 

```sh
  yum install firewalld firewall-config
```

  

安装防火墙 

```sh
yum install firewalld
```


启动服务：

```sh
sudo systemctl start firewalld
sudo systemctl enable firewalld
```

停止服务：

```sh
sudo systemctl stop firewalld
sudo systemctl disable firewalld
```

三、Firewalld 的常用命令

查看所有的区域 

```sh
firewall-cmd --get-zones
```

查看当前区域

```sh
firewall-cmd --get-active-zones
```

设置当前区域 为 public 

```sh
firewall-cmd –-set-default-zone=public
```

查看某个区域下开放的端口 

```sh
firewall-cmd --zone=public --list-ports
```

为某个区域添加端口

```sh
firewall-cmd --zone=public --add-port=3306/tcp
```

永久打开一个端口 

```sh
firewall-cmd --permanent --add-port=3306/tcp
```

为某个区域删除端口 

```sh
firewall-cmd --zone=public --remove-port=3306/tcp
```

