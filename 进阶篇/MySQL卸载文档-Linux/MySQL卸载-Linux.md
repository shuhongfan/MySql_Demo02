## MySQL卸载-Linux版

停止MySQL服务

```
systemctl stop mysqld
```



查询MySQL的安装文件

```
rpm -qa | grep -i mysql
```

![image-20211031233522877](assets/image-20211031233522877.png) 



卸载上述查询出来的所有的MySQL安装包

```
rpm -e mysql-community-client-plugins-8.0.26-1.el7.x86_64 --nodeps

rpm -e mysql-community-server-8.0.26-1.el7.x86_64 --nodeps

rpm -e mysql-community-common-8.0.26-1.el7.x86_64 --nodeps

rpm -e mysql-community-libs-8.0.26-1.el7.x86_64 --nodeps

rpm -e mysql-community-client-8.0.26-1.el7.x86_64 --nodeps

rpm -e mysql-community-libs-compat-8.0.26-1.el7.x86_64 --nodeps
```



删除MySQL的数据存放目录

```
rm -rf /var/lib/mysql/
```



删除MySQL的配置文件备份

```
rm -rf /etc/my.cnf.rpmsave
```

























