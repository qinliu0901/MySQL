--查询数据操作DQL
SELECT * FROM test;
SELECT test.* FROM test;
SELECT id,password FROM test;

--给表名起别名
SELECT id,password FROM user2 AS a;
SELECT a.id,a.password FROM user2 AS a;
--给字段起别名
SELECT id AS '编号',password AS '密码' FROM user2 AS a;

--WHERE 条件
SELECT id,password FROM user2 WHERE id=1;

--检测字段值是否为null
SELECT * FROM user2 WHERE age<=>NULL;

SELECT * FROM user2 WHERE age IS NULL;
SELECT * FROM user2 WHERE age IS NOT NULL;

--查询编号在3-10之间的用户
SELECT * FROM user2 WHERE id BETWEEN 3 AND 10;
SELECT * FROM user2 WHERE id NOT BETWEEN 3 AND 10;--取反

--查询编号为1,3,4,5

SELECT * FROM user2 WHERE id IN(1,3,4,5);

SELECT * FROM user2 WHERE username IN('king');
SELECT * FROM user2 WHERE username NOT IN('king');

--模糊查询
--%；代表0个一个或者多个任意字符，_：代表1个任意字符

SELECT * FROM user2 WHERE username LIKE '%张%';
SELECT * FROM user2 WHERE username LIKE '%in%';
SELECT * FROM user2 WHERE username LIKE '%in%';

SELECT * FROM user2 WHERE username LIKE '___';--三个下划线就是三位的
--结合起来用
SELECT * FROM user2 WHERE username LIKE '_i%';--不分大小写

SELECT * FROM user2 WHERE username NOT LIKE '_i%';

--查询 逻辑运算符AND OR
SELECT * FROM user2 WHERE username='king' AND password=123;

SELECT * FROM user2 WHERE id>=3 AND age IS NOT NULL AND password=123;

--OR
SELECT * FROM user2 WHERE id>=3 OR username LIKE '_i%';


--分组查询
--字段分组
SELECT * FROM user2 GROUP BY proId;

--向用户表中添加字段
ALTER TABLE user2 ADD sex ENUM('male','female');
UPDATE user2 SET sex='male' WHERE id IN(1,2,3);

--按字段的位置分组

SELECT * FROM user2 GROUP BY 2;

SELECT * FROM user2 WHERE id>=3 AND GROUP BY sex;

-- 查询id，sex，用户名详情按照性别分组
SELECT id,sex,GROUP_CONCAT(username) FROM user2 GROUP BY sex;

SELECT proId,GROUP_CONCAT(username),GROUP_CONCAT(id),GROUP_CONCAT(sex) FROM user2 GROUP BY proId;

--查询编号，sex，用户名详情以及组中总人数按照sex分类

SELECT id,sex,GROUP_CONCAT(username)AS users,COUNT(*) AS totalUsers FROM user2 GROUP BY sex;
SELECT COUNT(id) FROM user2;

--COUNT不统计null值
--MAX(),MIN(),AVG(),SUM()，WITH ROLLUP 统计所有记录的总和




-- DQL.sql 2019/3/24
 
 -- 查询语句，使用DQL命令查询数据


/* select distinct 字段名 from 表名
left join   on

where 
group by
having
order by
limit
*/

SELECT NOW(); # 查询当前时间

-- concat()拼接函数,一个或多个拼接
SELECT CONCAT(sname, ', hello') as Hello from student;
-- 数值类型才可以+

SELECT * FROM student WHERE sname LIKE 'liu_'; # 单个字符匹配
SELECT * FROM student WHERE sname LIKE 'liu%'; # 全部匹配

/* 连接查询：内连接inner join  on，外连接
外连接：左连接以左表为主，左表都能查到，但右表不一定，右连接以右表为主*/


SELECT s.sname, s.sno FROM student s 
LEFT JOIN score sc ON s.sno = sc.sno WHERE degree > 80;

-- 自查询
SELECT s.sname,s.no FROM student s, student st WHERE s.no = st.no;

-- 多字段排序，先按第一个字段排序，再第二个，如果第一个排序后数据相同再按第二个字段排序
SELECT * FROM student ORDER BY sno LIMIT 3;
SELECT * FROM student ORDER BY sno LIMIT 1,2; # 从第二条开始，显示两条，第一个数字开始位置偏移量，第二个参数显示条数

-- with rollup 添加一行计算总和，GROUP_CONCAT拼接分组中的数据
SELECT GROUP_CONCAT(sname), COUNT(ssex) FROM student GROUP BY ssex WITH ROLLUP;
SELECT ssex, COUNT(ssex) FROM student GROUP BY ssex HAVING COUNT(ssex) > 4;

-- 两表合并，列数相同
-- union合并W完全相同的数据，不相同的显示，union all合并所有数据
 SELECT * FROM student UNION ALL SELECT * FROM score;

 SELECT sname FROM student WHERE EXISTS (SELECT sno FROM student WHERE sno = 2);











