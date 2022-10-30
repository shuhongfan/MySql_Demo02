-- ---------------------------------------------------- 函数演示 ------------------------------
-- 字符串函数
-- concat
select concat('Hello' , ' MySQL');

-- lower
select lower('Hello');

-- upper
select upper('Hello');

-- lpad
select lpad('01', 5, '-');

-- rpad
select rpad('01', 5, '-');

-- trim
select trim(' Hello  MySQL ');

-- substring
select substring('Hello MySQL',1,5);


-- 案例:  由于业务需求变更，企业员工的工号，统一为5位数，目前不足5位数的全部在前面补0。比如： 1号员工的工号应该为00001。
update emp set workno = lpad(workno, 5, '0');


-- -------------------------------------------------------------------------------------------------------------

-- 数值函数
-- ceil
select ceil(1.1);

-- floor
select floor(1.9);

-- mod
select mod(7,4);

-- rand
select rand();

-- round
select round(2.344,2);


-- 案例: 通过数据库的函数，生成一个六位数的随机验证码。
select lpad(round(rand()*1000000 , 0), 6, '0');

-- --------------------------------------------------------------------------------------------------------


-- 日期函数
-- curdate()
select curdate();

-- curtime()
select curtime();

-- now()
select now();

-- YEAR , MONTH , DAY
select YEAR(now());

select MONTH(now());

select DAY(now());

-- date_add
select date_add(now(), INTERVAL 70 YEAR );

-- datediff
select datediff('2021-10-01', '2021-12-01');


-- 案例: 查询所有员工的入职天数，并根据入职天数倒序排序。
select name, datediff(curdate(), entrydate) as 'entrydays' from emp order by entrydays desc;





-- 流程控制函数
-- if
select if(false, 'Ok', 'Error');

-- ifnull
select ifnull('Ok','Default');

select ifnull('','Default');

select ifnull(null,'Default');

-- case when then else end
-- 需求: 查询emp表的员工姓名和工作地址 (北京/上海 ----> 一线城市 , 其他 ----> 二线城市)
select
    name,
    ( case workaddress when '北京' then '一线城市' when '上海' then '一线城市' else '二线城市' end ) as '工作地址'
from emp;




-- 案例: 统计班级各个学员的成绩，展示的规则如下：
-- >= 85，展示优秀
-- >= 60，展示及格
-- 否则，展示不及格

create table score(
    id int comment 'ID',
    name varchar(20) comment '姓名',
    math int comment '数学',
    english int comment '英语',
    chinese int comment '语文'
) comment '学员成绩表';
insert into score(id, name, math, english, chinese) VALUES (1, 'Tom', 67, 88, 95 ), (2, 'Rose' , 23, 66, 90),(3, 'Jack', 56, 98, 76);

--
select
    id,
    name,
    (case when math >= 85 then '优秀' when math >=60 then '及格' else '不及格' end ) '数学',
    (case when english >= 85 then '优秀' when english >=60 then '及格' else '不及格' end ) '英语',
    (case when chinese >= 85 then '优秀' when chinese >=60 then '及格' else '不及格' end ) '语文'
from score;









