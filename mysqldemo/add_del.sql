--数据记录的增，删，改
--插入记录
CREATE TABLE IF NOT EXISTS user2(
id SMALLINT UNSIGNED KEY AUTO_INCREMENT,
username VARCHAR(20) NOT NULL UNIQUE,
password CHAR(32) NOT NULL,
email VARCHAR(50) NOT NULL DEFAULT '834153554@QQ.com',
age TINYINT UNSIGNED DEFAULT 18
);
INSERT user2(username,password) VALUES('A','AAA');
INSERT INTO user2 SET id=98,username='LIU',password='2',email='834153554@QQ.com',age=18;
--将查询结果添加到表中
CREATE TABLE IF NOT EXISTS test(
id SMALLINT UNSIGNED KEY AUTO_INCREMENT,
username VARCHAR(20) NOT NULL UNIQUE
);
INSERT test SELECT id,username FROM user2;

INSERT test(username) SELECT username FROM user2;

--更新记录
UPDATE user2 SET age=20;

UPDATE user2 SET password='123',age=10 WHERE id=1;

UPDATE user2 SET age=age-5 WHERE id>1;

--删除记录
DELETE FROM test WHERE id=1;
--彻底清空,格式清空
TRUNCATE TABLE test;


