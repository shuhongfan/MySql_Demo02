## MySQL安装

### 1. 准备一台Linux服务器

云服务器或者虚拟机都可以; 

Linux的版本为 CentOS7;



### 2. 下载Linux版MySQL安装包

https://downloads.mysql.com/archives/community/

![image-20211031230239760](assets/image-20211031230239760.png) 



### 3. 上传MySQL安装包

![image-20211031231930205](assets/image-20211031231930205.png) 



### 4. 创建目录,并解压

```
mkdir mysql

tar -xvf mysql-8.0.26-1.el7.x86_64.rpm-bundle.tar -C mysql
```



### 5. 安装mysql的安装包

```
cd mysql

rpm -ivh mysql-community-common-8.0.26-1.el7.x86_64.rpm 

rpm -ivh mysql-community-client-plugins-8.0.26-1.el7.x86_64.rpm 

rpm -ivh mysql-community-libs-8.0.26-1.el7.x86_64.rpm 

rpm -ivh mysql-community-libs-compat-8.0.26-1.el7.x86_64.rpm

yum install openssl-devel

rpm -ivh  mysql-community-devel-8.0.26-1.el7.x86_64.rpm

rpm -ivh mysql-community-client-8.0.26-1.el7.x86_64.rpm

rpm -ivh  mysql-community-server-8.0.26-1.el7.x86_64.rpm

```



### 6. 启动MySQL服务

```
systemctl start mysqld
```

```
systemctl restart mysqld
```

```
systemctl stop mysqld
```



### 7. 查询自动生成的root用户密码

```
grep 'temporary password' /var/log/mysqld.log
```

命令行执行指令 :

```
mysql -u root -p
```

然后输入上述查询到的自动生成的密码, 完成登录 .



### 8. 修改root用户密码

登录到MySQL之后，需要将自动生成的不便记忆的密码修改了，修改成自己熟悉的便于记忆的密码。

```
ALTER  USER  'root'@'localhost'  IDENTIFIED BY '1234';
```

执行上述的SQL会报错，原因是因为设置的密码太简单，密码复杂度不够。我们可以设置密码的复杂度为简单类型，密码长度为4。

```
set global validate_password.policy = 0;
set global validate_password.length = 4;
```

降低密码的校验规则之后，再次执行上述修改密码的指令。



### 9. 创建用户

默认的root用户只能当前节点localhost访问，是无法远程访问的，我们还需要创建一个root账户，用户远程访问

```
create user 'root'@'%' IDENTIFIED WITH mysql_native_password BY '1234';
```



### 10. 并给root用户分配权限

```
grant all on *.* to 'root'@'%';
```



### 11. 重新连接MySQL

```
mysql -u root -p
```

然后输入密码



### 12. 通过DataGrip远程连接MySQL





