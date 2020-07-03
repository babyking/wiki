### 日期格式化

`date '+%Y%m%d %T'`  20180926 21:59:45

### 网络

```bash
#查看http请求的header
tcpdump -s 1024 -l -A -n host 192.168.9.56
tcpdump -s 1024 -l -A src 192.168.9.56 or dst 192.168.9.56
sudo tcpdump -A -s 1492 dst port 80

#本地网络中IP地址为192.168.0.5的主机现在与外界通信的情况
sudo tcpdump -i eth0 src host 192.168.0.5

#查看网卡eth0的http请求的tcp包
tcpdump -i eth0 port http
tcpdump -i eth0 port http or port smtp or port imap or port pop3 -l -A | egrep -i 'pass=|pwd=|log=|login=|user=|username=|pw=|passw=|passwd=|password=|pass:|user:|userna me:|password:|login:|pass |user '


#查看tcp，upd，icmp非ssh的包
tcpdump -n -v tcp or udp or icmp and not port 22


#查看http请求的request 包
sudo tcpdump -i eth0 port 80 -w -


#过滤http响应的get host头信息
sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E "GET \/.*|Host\: .*"


#DNS查询请求响应包
sudo tcpdump -i en0 'udp port 53'

#nmap -sP指定使用Ping echo 进行扫描 /24查看目的网络有多少主机处于运行状态
nmap -sP 192.168.0.1
nmap -sP 192.168.0.0/24
nmap -O www.baidu.com

#Netstat主要用于Linux/Unix主机察看自身的网络状况，如开启的端口、在为哪些用户服务以及服务的状态
netstat -a
netstat -nlp

#netcat扫描机器开放的端口
nc -z -v -n 172.31.100.7 21-25

#netcat 命令会连接开放端口21并且打印运行在这个端口上服务的banner信息。
nc -v 172.31.100.7 21

#输出网络的路由表
route

#显示结果包括服务器已经运行了多长时间，有多少登陆用户和对服务器性能的总体评估（load average）。
uptime

#监控 eth1 的网卡的流量 
iftop -i eth1 
#以位元组(bytes 即字节)为单位显示流量(预设是位元 bits): 
iftop -B 
#直接显示 IP, 不进行DNS 反解: 
iftop -n 
#直接显示连接埠编号, 不显示服务名称: 
iftop -N 
#显示某个网段进出封包流量 
iftop -F 192.168.1.0/24 or 192.168.1.0/255.255.255.0 


#网络流量实时监控工具之nload,查看网卡eth0的流量
nload -n eth0

#查看各个网卡的流量
nload -h

#IPTraf是一个网络监控工具,功能比nload更强大,可以监控所有的流量,IP流量,按协议分的流量,还可以设置过滤器
iptraf


#查看网络接口当前配置与接口命名：
ifconfig
#打开（up）或关闭（down）适配器
ifconfig <网络名> <up|down>
#为适配器分配IP地址：
ifconfig <网络名> <ip地址>
#为适配器分配第二个IP地址：
ifconfig <网络名:实例数> <ip地址>

#显示某个网络适配器的驱动信息，适用于查询软件兼容性的情况：
ethtool -i eth0
#显示网络数据：
ethtool -S
#设置适配器连接速度（Mbps）
ethtool speed <10|100|1000>


#iwconfig 查基本的Wi-Fi网络设置，如SSID、channel和加密等细节。此外还可以修改一些高级设置，包括接收敏感度，RTS/CTS，碎片，以及重试数
#显示当前无线设置，包括接口名称：
iwconfig
#设置ESSID（扩展服务设置识别器）或网络名：
iwconfig <接口名> essid <网络名>


#wget
wget -S --spider http://osswin.sourceforge.net/ 2>&1 | grep Mod

#查看mac地址
cat /sys/class/net/*/address

#查看eth0的ip
ifconfig eth0 | awk '/inet addr/ {split ($2,A,":"); print A[2]}'

#curl 查看页面对应的domail name
curl -s http://en.m.wikipedia.org/wiki/List_of_Internet_top-level_domains | sed -n '/<tr valign="top">/{s/<[^>]*>//g;p}'

#talnet
telnet localhost 6666

#查看所有的网络接口
awk '{print $1}' /proc/net/dev|grep :|sed "s/:.*//g"


#查看DNS server版本好
nslookup -q=txt -class=CHAOS version.bind NS.PHX5.NEARLYFREESPEECH.NET
```



### 进程

```shell
## processes  进程管理

##ps查看当前系统执行的线程列表，进行瞬间状态，不是连续状态，连续状态需要使用top名称查看  更多常用参数请使用 man ps查看
ps

##显示所有进程详细信息
ps aux

##-u 显示某个用户的进程列表
ps -f -u www-data 

## -C 通过名字或者命令搜索进程
ps -C apache2

## --sort  根据进程cpu使用率降序排列，查看前5个进程  -pcpu表示降序  pcpu升序
ps aux --sort=-pcpu | head -5 

##-f 用树结构显示进程的层次关系，父子进程情况下
ps -f --forest -C apache2 

##显示一个父进程的所有子进程
ps -o pid,uname,comm -C apache2
ps --ppid 2359 

##显示一个进程的所有线程  -L 参数
ps -p 3150 -L 

##显示进程的执行时间 -o参数
ps -e -o pid,comm,etime 

##watch命令可以用来实时捕捉ps显示进程
watch -n 1 'ps -e -o pid,uname,cmd,pmem,pcpu --sort=-pmem,-pcpu | head -15' 

##jobs 查看后台运行的进程  jobs命令执行的结果，＋表示是一个当前的作业，减号表是是一个当前作业之后的一个作业，jobs -l选项可显示所有任务的PID,jobs的状态可以是running, stopped, Terminated,但是如果任务被终止了（kill），shell 从当前的shell环境已知的列表中删除任务的进程标识；也就是说，jobs命令显示的是当前shell环境中所起的后台正在运行或者被挂起的任务信息
jobs

##查看后台运营的进程号
jobs -p

##查看现在被终止或者退出的进程号
jobs -n


##kill命令 终止一个前台进程可以使用Ctrl+C键   kill  通过top或者ps获取进程id号  kill [-s 信号 | -p ] [ -a ] 进程号 ...
##发送指定的信号到相应进程。不指定型号将发送SIGTERM（15）终止指定进程。 关闭进程号12的进程
kill 12


##等同于在前台运行PID为123的进程时按下Ctrl+C键
kill -2 123

##如果任无法终止该程序可用“-KILL” 参数，其发送的信号为SIGKILL(9) ，将强制结束进程  
kill -9 123

##列出所有信号名称
##HUP    1    终端断线
##INT     2    中断（同 Ctrl + C）
##QUIT    3    退出（同 Ctrl + \）
##TERM   15    终止
##KILL    9    强制终止
##CONT   18    继续（与STOP相反， fg/bg命令）
##STOP    19    暂停（同 Ctrl + Z）
kill -l

##得到指定信号的数值
kill -l KILL

##杀死指定用户所有进程
kill -u peidalinux
kill -9 $(ps -ef | grep peidalinux) 

##将后台中的命令调至前台继续运行  将进程123调至前台执行
fg 123

##将一个在后台暂停的命令，变成继续执行
bg  123

##该命令可以在你退出帐户/关闭终端之后继续运行相应的进程。nohup就是不挂起的意思  下面输出被重定向到myout.file文件中
nohup command > myout.file 2>&1 &

##at：计划任务，在特定的时间执行某项工作，在特定的时间执行一次。
## 格式：at HH:MM YYYY-MM-DD //HH（小时）:MM（分钟） YYYY（年）-MM（月份）-DD（日）
##HH[am pm]+D(天) days //HH（小时）[am（上午）pm（下午）]+days（天）
at 12:00（时间） //at命令设定12:00执行一项操作
#at>useradd aaa //在at命令里设定添加用户aaa
#ctrl+d //退出at命令
#tail -f /etc/passwd //查看/etc/passwd文件后十行是否增加了一个用户aaa

##计划任务设定后，在没有执行之前我们可以用atq命令来查看系统没有执行工作任务。
atq

##启动计划任务后，如果不想启动设定好的计划任务可以使用atrm命令删除。
atrm 1 //删除计划任务1

##pstree命令：列出当前的进程，以及它们的树状结构  格式：pstree [选项] [pid|user]
pstree

##nice命令：改变程序执行的优先权等级 应用程序优先权值的范围从-20～19，数字越小，优先权就越高。一般情况下，普通应用程序的优先权值（CPU使用权值）都是0，如果让常用程序拥有较高的优先权等级，自然启动和运行速度都会快些。需要注意的是普通用户只能在0～19之间调整应用程序的优先权值，只有超级用户有权调整更高的优先权值（从-20～19）。
nice [-n <优先等级>][--help][--version][命令]
nice -n 5 ls

##sleep命令：使进程暂停执行一段时间
date;sleep 1m;date


##renice命令 renice命令允许用户修改一个正在运行进程的优先权。 利用renice命令可以在命令执行时调整其优先权。
##其中，参数number与nice命令的number意义相同。（1） 用户只能对自己所有的进程使用renice命令。（2） root用户可以在任何进程上使用renice命令。（3） 只有root用户才能提高进程的优先权
renice -5 -p 5200  #PID为5200的进程nice设为-5 

##pmap命令用于显示一个或多个进程的内存状态。其报告进程的地址空间和内存状态信息 #pmap PID 
pmap 20367

##top 动态查看进程的变化。
top


##crontab 任务调度
##基本格式 :
##*　　*　　*　　*　　*　　command
##分　时　日　月　周　命令
##第1列表示分钟1～59 每分钟用*或者 */1表示
##第2列表示小时1～23（0表示0点）
##第3列表示日期1～31
##第4列表示月份1～12
##第5列标识号星期0～6（0表示星期天）
##第6列要运行的命令
crontab -e ##执行文字编辑器来设定时程表，内定的文字编辑器是 VI，如果你想用别的文字编辑器，则请先设定 VISUAL 环境变数来指定使用那个文字编辑器(比如说 setenv VISUAL joe)

crontab -r ##删除目前的时程表

crontab -l ##列出目前的时程表

crontab file [-u user] ##-用指定的文件替代目前的crontab。
#crontab文件的一些示例
30 21 * * * /usr/local/etc/rc.d/lighttpd restart  ##表示每晚的21:30重启apache。

45 4 1,10,22 * * /usr/local/etc/rc.d/lighttpd restart ##表示每月1、10、22日的4 : 45重启apache。

10 1 * * 6,0 /usr/local/etc/rc.d/lighttpd restart ##表示每周六、周日的1 : 10重启apache。

0,30 18-23 * * * /usr/local/etc/rc.d/lighttpd restart ##表示在每天18 : 00至23 : 00之间每隔30分钟重启apache。

* 23-7/1 * * * /usr/local/etc/rc.d/lighttpd restart  ##晚上11点到早上7点之间，每隔一小时重启apache



　　
```



### 性能

```shell
#查看当前系统load
uptime

#查看系统状态和每个进程的系统资源使用状况
top

#可视化显示CPU的使用状况
htop

#查看每个CPU的负载信息
mpstat -P ALL 1

#每隔1秒查看磁盘IO的统计信息
iostat -xkdz 1

#每隔一秒查看虚拟内存的使用信息
vmstat 1

#查看内存使用统计信息
free

#查看网络使用信息
nicstat -z 1

#类似vmstat的显示优化的工具
dstat 1

#查看系统活动状态，比如系统分页统计，块设备IO统计等
sar

#网络连接状态查看
netstat -s

#进程资源使用信息查看
pidstat 1
pidstat -d 1

#查看某个进程的系统调用信息 -p后面是进程id，-tttT 进程系统后的系统调用时间
strace -tttT -p 12670
#统计IO设备输入输出的系统调用信息
strace -c dd if=/dev/zero of=/dev/null bs=512 count=1024k


#tcpdump 查看网络数据包
tcpdump -nr /tmp/out.tcpdump

#块设备的读写事件信息统计
btrace /dev/sdb 

#iotop查看某个进程的IO操作统计信息
iotop -bod5

#slabtop 查看内核 slab内存分配器的使用信息
slabtop -sc

#系统参数设置
sysctl -a

#系统性能指标统计信息
perf stat gzip file1
#系统cpu活动状态查看
perf record -a -g -F 997 sleep 10
```



### CPU

```shell
#限制某个线程的cpu使用率
sudo cpulimit -p pid -l 50
ps -eo %cpu,args | grep -m1 PROCESS | awk '{print $1}'

#将当前进程按照memory和cpu排序
ps aux --sort=%mem,%cpu

#按照cpu使用率排序
ps -e -o pcpu,cpu,nice,state,cputime,args --sort pcpu | sed "/^ 0.0 /d"

#查看当前系统的物理cpu个数
grep "processor" /proc/cpuinfo | wc -l	
grep -c -e '^cpu[0-9]\+' /proc/stat

#查看当前cpu型号
grep "model name" /proc/cpuinfo

#查看当前cpu信息
cat /proc/cpuinfo

#查看当前系统的位数
grep -q '\<lm\>' /proc/cpuinfo && echo 64 bits || echo 32 bits
getconf LONG_BIT | grep '64'
java -version

#查看当前系统的cpu频率
awk -F": " '/cpu MHz\ */ { print "Processor (or core) running speed is: " $2 }' /proc/cpuinfo ; dmidecode | awk -F": " '/Current Speed/ { print "Processor real speed is: " $2 }'


#查看每个cpu每个进程的cpu使用率
ps ax -L -o pid,tid,psr,pcpu,args | sort -nr -k4| head -15 | cut -c 1-90

#查看当前中断
cat /proc/interrupts

#查看多个处理器的使用率相关信息
mpstat –P ALL 1

#每个物理CPU中Core的个数：
cat /proc/cpuinfo | grep "cpu cores" | uniq | awk -F: '{print $2}'

#是否为超线程？
#如果有两个逻辑CPU具有相同的”core id”，那么超线程是打开的。
#每个物理CPU中逻辑CPU(可能是core, threads或both)的个数：
cat /proc/cpuinfo | grep "siblings"

#/proc/stat 文件中有一行记录的机器从启动依赖，各个中断序号发生中断的次数。
#这一行以intr开头，接下来的第一个数字是总的中断数目，之后就是分别的中断数目，从0开始。
cat /proc/stat  | grep intr

```

### IO

```shell
IO.sh

##iostat是查看磁盘活动统计情况

##显示所有设备负载情况 r/s:  每秒完成的读 I/O 设备次数。即 rio/s；w/s:  每秒完成的写 I/O 设备次数。即 wio/s等
iostat 

##每隔2秒刷新磁盘IO信息，并且每次显示3次
iostat 2 3

#显示某个磁盘的IO信息
iostat -d sda1

##显示tty和cpu信息
iostat -t

##以M为单位显示磁盘IO信息
iostat -m

##查看TPS和吞吐量信息  kB_read/s：每秒从设备（drive expressed）读取的数据量；kB_wrtn/s：每秒向设备（drive expressed）写入的数据量；kB_read：读取的总数据量；kB_wrtn：写入的总数量数据量；
iostat -d -k 1 1

#查看设备使用率（%util）、响应时间（await）
iostat -d -x -k 1 1

#查看CPU状态
iostat -c 1 3

#统计进程(pid)的stat,进程的stat自然包括进程的IO状况
pidstat

#只显示IO
pidstat -d  1 

#-d IO 信息,-r 缺页及内存信息-u CPU使用率-t 以线程为统计单位1  1秒统计一次
pidstat -u -r -d -t 1

#文件级IO分析,查看当前文件由哪些进程打开
lsof   
ls /proc/pid/fd

#利用 sar 报告磁盘 I/O 信息DEV 正在监视的块设备 tps 每秒钟物理设备的 I/O 传输总量 rd_sec/s 每秒从设备读取的扇区数量 wr_sec/s 每秒向设备写入的扇区数量 avgrq-sz I/O 请求的平均扇区数
#avgqu-sz I/O 请求的平均队列长度 await I/O 请求的平均等待时间，单位为毫秒 svctm I/O 请求的平均服务时间，单位为毫秒 %util I/O 请求所占用的时间的百分比，即设备利用率
sar -pd 10 3 

#iotop  top的io版
iotop

#查看页面缓存信息 其中的Cached 指用于pagecache的内存大小（diskcache-SwapCache）。随着写入缓存页，Dirty 的值会增加 一旦开始把缓存页写入硬盘,Writeback的值会增加直到写入结束。
cat /proc/meminfo 

#查看有多少个pdflush进程 Linux 用pdflush进程把数据从缓存页写入硬盘
#pdflush的行为受/proc/sys/vm中的参数的控制/proc/sys/vm/dirty_writeback_centisecs (default 500): 1/100秒, 多长时间唤醒pdflush将缓存页数据写入硬盘。默认5秒唤醒2个（更多个）线程。如果wrteback的时间长于dirty_writeback_centisecs的时间，可能会出问题
cat /proc/sys/vm/nr_pdflush_threads

#查看I/O 调度器
#调度算法
#noop anticipatory deadline [cfq] 
#deadline :    deadline 算法保证对既定的IO请求以最小的延迟时间。
#anticipatory：    有个IO发生后，如果又有进程请求IO，则产生一个默认6ms猜测时间，猜测下一个进程请求IO是干什么。这对于随机读取会造成较大的延时。对数据库应用很糟糕，而对于Web Server等则会表现不错。
#cfq:        对每个进程维护一个IO队列，各个进程发来的IO请求会被cfq以轮循方式处理，对每一个IO请求都是公平。适合离散读的应用。
#noop:        对所有IO请求都用FIFO队列形式处理。默认IO不会存在性能问题。
cat /sys/block/[disk]/queue/scheduler


#改变IO调度器
$ echo deadline > /sys/block/sdX/queue/scheduler
#提高调度器请求队列的
$ echo 4096 > /sys/block/sdX/queue/nr_requests
```

### AWK

```shell
#删除temp文件的重复行
awk '!($0 in array) { array[$0]; print }' temp

#查看最长使用的10个unix命令
awk '{print $1}' ~/.bash_history | sort | uniq -c | sort -rn | head -n 10

#查看机器的ip列表
ifconfig -a | awk '/Bcast/{print $2}' | cut -c 5-19

#查看机器的每个远程链接机器的连接数
netstat -antu | awk '$5 ~ /[0-9]:/{split($5, a, ":"); ips[a[1]]++} END {for (ip in ips) print ips[ip], ip | "sort -k1 -nr"}'

#查看某个进程打开的socket数量
ps aux | grep [process] | awk '{print $2}' | xargs -I % ls /proc/%/fd | wc -l


#查看无线网络的ip
sudo ifconfig wlan0 | grep inet | awk 'NR==1 {print $2}' | cut -c 6-

#批量重命名文件
find . -name '*.jpg' | awk 'BEGIN{ a=0 }{ printf "mv %s name%01d.jpg\n", $0, a++ }' | bash

#查看某个用户打开的文件句柄列表
for x in `ps -u 500 u | grep java | awk '{ print $2 }'`;do ls /proc/$x/fd|wc -l;done

#计算文件temp的第一列的值的和
awk '{s+=$1}END{print s}' temp

#查看最常用的命令和使用次数
history | awk '{if ($2 == "sudo") a[$3]++; else a[$2]++}END{for(i in a){print a[i] " " i}}' |  sort -rn | head

#查找某个时间戳的文件列表
cp -p `ls -l | awk '/Apr 14/ {print $NF}'` /usr/users/backup_dir

#格式化输出当前的进程信息
ps -ef | awk -v OFS="\n" '{ for (i=8;i<=NF;i++) line = (line ? line FS : "") $i; print NR ":", $1, $2, $7, line, ""; line = "" }'

#查看输入数据的特定位置的单个字符
echo "abcdefg"|awk 'BEGIN {FS="''"} {print $2}'

#打印行号
ls | awk '{print NR "\t" $0}'

#打印当前的ssh 客户端
netstat -tn | awk '($4 ~ /:22\s*/) && ($6 ~ /^EST/) {print substr($5, 0, index($5,":"))}'

#打印文件第一列不同值的行
awk '!array[$1]++' file.txt

#打印第二列唯一值
awk '{ a[$2]++ } END { for (b in a) { print b } }' file

#查看系统所有分区
awk '{if ($NF ~ "^[a-zA-Z].*[0-9]$" && $NF !~ "c[0-9]+d[0-9]+$" && $NF !~ "^loop.*") print "/dev/"$NF}'  /proc/partitions

#查看2到100所有质数
for num in `seq 2 100`;do if [ `factor $num|awk '{print $2}'` == $num ];then echo -n "$num ";fi done;echo

#查看第3到第6行
awk 'NR >= 3 && NR <= 6' /path/to/file

#逆序查看文件
awk '{a[i++]=$0} END {for (j=i-1; j>=0;) print a[j--] }'

#打印99乘法表
seq 9 | sed 'H;g' | awk -v RS='' '{for(i=1;i<=NF;i++)printf("%dx%d=%d%s", i, NR, i*NR, i==NR?"\n":"\t")}'

```

### 日志Log

```shell
#统计apache cookie log中访问频率最高的20个ip和访问次数
cat cookielog | awk '{ a[$1] += 1; } END { for(i in a) printf("%d, %s\n", a[i], i ); }' | sort -n | tail -20

#统计apache cookie log中返回404的url列表
awk '$11 == 404 {print $8}' access_log | uniq -c | sort -rn | head

#统计一个ip访问超过20次的ip和访问次数列表，把$1改为url对应的$9,则可以统计每个url的访问次数
cat access_log | awk '{print $1}' | sort | uniq -c | sort -n | awk '{ if ($1 > 20)print $1,$2}'

#统计每个url的平均访问时间
cat cookielog | awk '{ a[$6] += 1; b[$6] += $11; } END { for(i in a) printf("%d, %d, %s\n", a[i],a[i]/b[i] i ); }' | sort -n | tail -20


#打印访问apache的新ip列表
tail -f access.log | awk -W interactive '!x[$1]++ {print $1}'

#通过日志查看当天指定ip访问次数过的url和访问次数:
cat access.log | grep "10.0.21.17" | awk '{print $7}' | sort | uniq -c | sort –nr


#通过日志查看当天访问次数最多的时间段
awk '{print $4}' access.log | grep "26/Mar/2012" |cut -c 20-50|sort|uniq -c|sort -nr|head

#查看某一天的访问量
cat access_log|grep '12/Nov/2012'|grep "******.htm"|wc|awk '{print $1}'|uniq 

#查看访问时间超过30ms的url列表
cat access_log|awk ‘($NF > 30){print $7}’|sort -n|uniq -c|sort -nr|head -20 

#列出响应时间超过60m的url列表并统计出现次数
cat access_log |awk ‘($NF > 60 && $7~/\.php/){print $7}’|sort -n|uniq -c|sort -nr|head -100 

#排除搜索引擎后的url访问次数
sed "/Baiduspider/d;/Googlebot/d;/Sogou web spider/d;" xxx.log|awk -F' ' '{print $7}'|sort | uniq -c | sort -k1,2 -nr 

#统计/index.html页面的访问uv
grep "/index.html" access.log | cut –d “ ” –f 4| sort | uniq | wc –l 
```

