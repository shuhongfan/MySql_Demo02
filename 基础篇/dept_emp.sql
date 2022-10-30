create table dept(
    id   int auto_increment comment 'ID' primary key,
    name varchar(50) not null comment '部门名称'
)comment '部门表';
INSERT INTO dept (id, name) VALUES (1, '研发部'), (2, '市场部'),(3, '财务部'), (4, '销售部');


create table emp(
    id  int auto_increment comment 'ID' primary key,
    name varchar(50) not null comment '姓名',
    age  int comment '年龄',
    dept_id int comment '部门ID'
)comment '员工表';
INSERT INTO emp (id, name, age, dept_id) VALUES (1, '张无忌', 20, 1),(2, '杨逍', 33, 1),(3, '赵敏', 18, 2), (4, '常遇春', 43, 2),(5, '小昭', 19, 3),(6, '韦一笑', 48, 3);
