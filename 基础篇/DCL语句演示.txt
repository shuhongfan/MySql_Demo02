-- 创建用户 itcast , 只能够在当前主机localhost访问, 密码123456;
create user 'itcast'@'localhost' identified by '123456';

-- 创建用户 heima , 可以在任意主机访问该数据库, 密码123456 ;
create user 'heima'@'%' identified by '123456';


-- 修改用户 heima 的访问密码为 1234 ;
alter user 'heima'@'%' identified with mysql_native_password by '1234';


-- 删除itcast@localhost用户
drop user 'itcast'@'localhost';




-- 查询权限
show grants for 'heima'@'%';


-- 授予权限
grant all on itcast.* to 'heima'@'%';


-- 撤销权限
revoke all on itcast.* from 'heima'@'%';







