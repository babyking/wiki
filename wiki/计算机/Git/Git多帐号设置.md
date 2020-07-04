### Git多帐号设置(转载)

>**Post author:** Yangyue Wan
>**Post link:** [https://yywanx.github.io/2017/11/30/Mac下使用多个Github账号/](https://yywanx.github.io/2017/11/30/Mac%E4%B8%8B%E4%BD%BF%E7%94%A8%E5%A4%9A%E4%B8%AAGithub%E8%B4%A6%E5%8F%B7/)
>**Copyright Notice:** All articles in this blog are licensed under [CC BY-NC-SA 3.0](https://creativecommons.org/licenses/by-nc-sa/3.0/) unless stating additionally.

我有两个github账号，一个是自己个人用的，另一个是公司工作用的。最近希望在Mac上可以同时使用这两个github账号，不引起冲突。做了一番research以后，在这里记录一下过程。这里我只需要用两个账号，如果需要使用多个的话，是一样的方法。

#### 需求

主要需求就是，对两个github账号分别用两套ssh key，在clone和push代码的时候，能够区分到底用那个账号。

#### 准备工作

如果之前进行过git config的话，需要先取消github关于账号信息的全局设定。如果没有的话，可以跳过这步。

```
git config --global --unset user.name
git config --global --unset user.email
```

#### 生成ssh key

先为个人账号生成一套ssh key

```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

一路回车即可，完成后会默认生成id_rsa和id_ras.pub这两个文件，这也是就是个人账号所要用到的私钥/公钥。

然后再为工作账号生成一套key

```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

然后在被问到`Enter file in which to save the key`的时候，输入`~/.ssh/id_rsa_work`，后面也是一路回车。

至此，就生成了两套不同的ssh key。

#### 添加key到github

登录两个github账号，分别在`Settings->SSH and GPG keys`点击`New SSH key`。

在本地，通过

```
cat ~/.ssh/ssh_key_name.pub
```



获得公钥的内容，添加到刚刚打开的github网站上去。

#### 添加key到本地ssh agent

先删除agent里面所有旧的key

```
ssh-add -D
```

然后添加新的两套key

```
ssh-add -K ~/.ssh/id_rsa
ssh-add -K ~/.ssh/id_rsa_work
```

#### 修改ssh config文件

最后一步就是配置ssh config文件。

打开config文件

```
vim ~/.ssh/config
```

加入以下内容

```
# personal
Host personal.github.com
HostName github.com
User git
IdentityFile ~/.ssh/id_rsa

# company
Host company.github.com  # 这个名字可任意设置
HostName github.com
User git
IdentityFile ~/.ssh/id_rsa_work
```

最后测试一下

```
ssh -T git@personal.github.com
ssh -T git@company.github.com
```

如果看到`successfully authenticated`的信息，就说明成功了。

#### 使用

以前clone repo的时候，比如以PyTorch的repo来举例，直接像这样就行了

```
git clone git@github.com:pytorch/pytorch.git
```

现在需要根据情况将`git@github.com`替换成`git@personal.github.com`或者`git@company.github.com`。

clone完了以后，在repo目录下需要执行

```
git config user.email "xxx@xxx.com"
git config user.name "xxname"
```

需要重新设置origin (以company举例)

```
git remote rm origin
git remote add origin git@company.github.com:pytorch/pytorch.git
```

最后push的话照常使用

```
git push origin master
```

到此就全部搞定:)

- 

