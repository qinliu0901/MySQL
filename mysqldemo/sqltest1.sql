
CREATE DATABASE IF NOT EXISTS `mai` DEFAULT CHARACTER SET 'UTF8';

USE `mai`;

-- 当需要输入中文时，需要临时转换客户端的编码方式
-- SET NAMES GBK;
CREATE TABLE IF NOT EXISTS `user`(
id SMALLINT,
username VARCHAR(20),
age TINYINT,
sex ENUM('male','female','none'),
email VARCHAR(50),
addr VARCHAR(200),
birth YEAR,
salary FLOAT(8,2),
married TINYINT(1) COMMENT '0 is unmarried'
)ENGINE=INNODB CHARSET=UTF8;

CREATE TABLE IF NOT EXISTS course(
cid TINYINT,
courseName VARCHAR(50),
courseDesc VARCHAR(200)
);

CREATE TABLE IF NOT EXISTS cms_cate(
id TINYINT,
cateName VARCHAR(50),
cateDesc VARCHAR(200)
)ENGINE=MYISAM CHARSET=UTF8;

CREATE TABLE IF NOT EXISTS cms_news(
id INT,
title VARCHAR(50),
content TEXT,
pubTime INT,
clickNum INT,
isTop TINYINT(1) COMMENT '0 is TOP'
)ENGINE=MYISAM CHARSET=UTF8;

--查看cms_news表的表结构
DESC cms_news;
DESCRIBE cms_news;
SHOW COLUMNS FROM cms_news;

--向表中插入记录INSERT tb1_name VALUE|VALUES(值,..)
CREATE TABLE IF NOT EXISTS test1(
num1 TINYINT UNSIGNED,
num2 SMALLINT ZEROFILL,
num3 INT,
num4 BIGINT
);
INSERT test1 VALUES(-128,-32768,-1,986366);

--查询表中所有记录
SELECT * FROM test1;
--零填充ZEROFILL,补零，填满显示长度

CREATE TABLE test2(
num1 FLOAT(6,2),
num2 DOUBLE (6,2),
num3 DECIMAL(6,2)--定点数据类型
);
--保留小数点后两位
INSERT test2 VALUES(3.145,3.256,3.154);

--测试枚举类型
CREATE TABLE IF NOT EXISTS test3(
sex ENUM('男','女','保密')
);
INSERT test3 VALUES('male');

--测试集合类型
CREATE TABLE IF NOT EXISTS test4(
fav SET('A','B','C','D')
);
INSERT test4 VALUES('B,C');
INSERT test4 VALUES('A,C');
