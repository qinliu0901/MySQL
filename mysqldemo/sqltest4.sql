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











