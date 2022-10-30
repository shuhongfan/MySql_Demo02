## JDK安装

JDK具体安装步骤如下： 

### 1. 上传安装包

使用FinalShell自带的上传工具将jdk的二进制发布包上传到Linux 

由于上述在进行文件上传时，选择的上传目录为根目录 /，上传完毕后，我们执行指令 cd / 切换到根目录下，查看上传的安装包。

![image-20210814180702071](assets/image-20210814180702071.png) 



### 2. 解压安装包

执行如下指令，将上传上来的压缩包进行解压，并通过-C参数指定解压文件存放目录为 /usr/local。

```
tar -zxvf jdk-8u171-linux-x64.tar.gz -C /usr/local
```

![image-20210814181014481](assets/image-20210814181014481.png) 





### 3. 配置环境变量

使用vim命令修改/etc/profile文件，在文件末尾加入如下配置

```
JAVA_HOME=/usr/local/jdk1.8.0_171
PATH=$JAVA_HOME/bin:$PATH
```

具体操作指令如下: 

```
1). 编辑/etc/profile文件，进入命令模式
	vim /etc/profile

2). 在命令模式中，输入指令 G ， 切换到文件最后
	G

3). 在命令模式中输入 i/a/o 进入插入模式，然后切换到文件最后一行
	i

4). 将上述的配置拷贝到文件中
	export JAVA_HOME=/usr/local/jdk1.8.0_171
	export PATH=$JAVA_HOME/bin:$PATH
	
5). 从插入模式，切换到指令模式
	ESC
	
6). 按:进入底行模式，然后输入wq，回车保存
	:wq
```







### 4. 重新加载profile文件

为了使更改的配置立即生效，需要重新加载profile文件，执行命令:

```
source /etc/profile
```





### 5. 检查安装是否成功

```
java -version
```

![image-20210814182327675](assets/image-20210814182327675.png) 

























## MyCat安装

### 1. 上传Mycat压缩包到服务器

Mycat-server-1.6.7.3-release-20210913163959-linux.tar.gz 



### 2. 解压MyCat的压缩包

```
tar -zxvf Mycat-server-1.6.7.3-release-20210913163959-linux.tar.gz -C /usr/local/
```













