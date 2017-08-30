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













