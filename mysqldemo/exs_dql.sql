--更新用户名为4位的用户，让其已有年龄-3

CREATE DATABASE IF NOT EXISTS cms DEFAULT CHARACTER SET utf8;
USE cms;
-- 管理员表cms_admin
CREATE TABLE cms_admin(
id TINYINT UNSIGNED AUTO_INCREMENT KEY,
username VARCHAR(20) NOT NULL UNIQUE,
password CHAR(32) NOT NULL,
email VARCHAR(50) NOT NULL DEFAULT 'admin@qq.com',
role ENUM('普通管理员','超级管理员') DEFAULT '普通管理员'
);
INSERT cms_admin(username,password,email,role) VALUES('admin','admin','admin@qq.com',2);

INSERT cms_admin(username,password) VALUES('king','king'),

('麦子','maizi'),

('queen','queen'),

('test','test');

-- 创建分类表cms_cate
CREATE TABLE cms_cate(
id TINYINT UNSIGNED AUTO_INCREMENT KEY,
cateName VARCHAR(50) NOT NULL UNIQUE,
cateDesc VARCHAR(200) NOT NULL DEFAULT ''
);

INSERT cms_cate(cateName,cateDesc) VALUES('国内新闻','聚焦当今最热的国内新闻'),
('国际新闻','聚焦当今最热的国际新闻'),
('体育新闻','聚焦当今最热的体育新闻'),
('军事新闻','聚焦当今最热的军事新闻'),
('教育新闻','聚焦当今最热的教育新闻');

-- 创建新闻表cms_news
CREATE TABLE cms_news(
id INT UNSIGNED AUTO_INCREMENT KEY,
title VARCHAR(50) NOT NULL UNIQUE,
content TEXT,
clickNum INT UNSIGNED DEFAULT 0,
pubTime INT UNSIGNED,
cId TINYINT UNSIGNED NOT NULL COMMENT '新闻所属分类，对应分类表中的id',
aId TINYINT UNSIGNED NOT NULL COMMENT '哪个管理员发布的，对应管理员表中的id'
);
INSERT cms_news(title,content,pubTime,cId,aId) VALUES('亚航客机失联搜救尚无线索 未发求救信号','马来西亚亚洲航空公司一架搭载155名乘客的客机28日早晨从印度尼西亚飞往新加坡途中与空中交通控制塔台失去联系，下落不明。',1419818808,1,2),
('北京新开通四条地铁线路 迎接首位客人','12月28日凌晨，随着北京地铁6号线二期、7号线、15号线西段、14号线东段的开通试运营，北京的轨道交通运营里程将再添62公里，共计达到527公里。当日凌晨5时许，北京地铁7号线瓷器口换乘站迎来新线开通的第一位乘客。',1419818108,2,1),
('考研政治题多次出现习近平讲话内容','新京报讯 （记者许路阳 (微博)）APEC反腐宣言、国家公祭日、依法治国……昨日，全国硕士研究生招生考试进行首日初试，其中，思想政治理论考题多次提及时事热点，并且多次出现习近平在不同场合的讲话内容。',1419818208,3,2),
('深度-曾雪麟：佩兰别重蹈卡马乔覆辙','12月25日是前国足主帅曾雪麟的85岁大寿，恰逢圣诞节，患有尿毒症老爷子带着圣诞帽度过了自己的生日。此前，腾讯记者曾专访曾雪麟，尽管已经退休多年，但老爷子仍旧关心着中国足球，为国足揪心，对于国足近几位的教练，他只欣赏高洪波。对即将征战亚洲杯的国足，老爷子希望佩兰不要重蹈卡马乔的覆辙',1419818308,2,4),
('国产JAD-1手枪枪架投入使用 手枪可变"冲锋枪"','日前，JAD-1型多功能手枪枪架通过公安部特种警用装备质量监督检验中心检验，正式投入生产使用。此款多功能枪架由京安盾(北京)警用装备有限公司开发研制，期间经广东省江门市公安特警支队试用，获得好评。',1419818408,4,4),
('麦子学院荣获新浪教育大奖','麦子学院最大的职业IT教育平台，获奖了',1419818508,1,5),
('麦子学院荣获腾讯教育大奖','麦子学院最大的职业IT教育平台，获奖了',1419818608,1,5),
('麦子学院新课上线','麦子学院PHP课程马上上线了，小伙伴快来报名学习哈',1419818708,1,5);

-- 创建身份表 provinces
CREATE TABLE provinces(
id TINYINT UNSIGNED AUTO_INCREMENT KEY,
proName VARCHAR(10) NOT NULL UNIQUE
);
INSERT provinces(proName) VALUES('北京'),
('上海'),
('深圳'),
('广州'),
('重庆');

-- 创建用户表cms_user
CREATE TABLE cms_user(
id INT UNSIGNED AUTO_INCREMENT KEY,
username VARCHAR(20) NOT NULL UNIQUE,
age TINYINT UNSIGNED DEFAULT 18,
password CHAR(32) NOT NULL,
email VARCHAR(50) NOT NULL DEFAULT 'user@qq.com',
regTime INT UNSIGNED NOT NULL,
face VARCHAR(100) NOT NULL DEFAULT 'user.jpg',
proId TINYINT UNSIGNED NOT NULL COMMENT '用户所属省份'
);

INSERT cms_user(username,password,regTime,proId)

VALUES('张三','zhangsan',1419811708,1),
('张三丰','zhangsanfeng',1419812708,2),
('章子怡','zhangsan',1419813708,3),
('long','long',1419814708,4),
('ring','ring',1419815708,2),
('queen','queen',1419861708,3),
('king','king',1419817708,5),
('blek','blek',1419818708,1),
('rose','rose',1419821708,2),
('lily','lily',1419831708,2),
('john','john',1419841708,2);

UPDATE cms_user SET age=11 WHERE id=1;
UPDATE cms_user SET age=21 WHERE id=2;
UPDATE cms_user SET age=33 WHERE id=3;
UPDATE cms_user SET age=44 WHERE id=4;
UPDATE cms_user SET age=25 WHERE id=5;
UPDATE cms_user SET age=77 WHERE id=6;
UPDATE cms_user SET age=56 WHERE id=7;
UPDATE cms_user SET age=88 WHERE id=8;
UPDATE cms_user SET age=12 WHERE id=9;
UPDATE cms_user SET age=32 WHERE id=10;
UPDATE cms_user SET age=65 WHERE id=11;
ALTER TABLE cms_user ADD sex VARCHAR(50) NOT NULL DEFAULT 'male';



--更新用户名为4位的用户，让其已有年龄-3

UPDATE cms_user SET age=age-3 WHERE username LIKE '____';

--更新前3条记录，年龄+10
UPDATE cms_user SET age=age-10 LIMIT 3;

UPDATE cms_user SET age=age+10 ORDER BY id DESC LIMIT 3;




--连接查询

--查询cms_user id,username
-- provinces,proName
SELECT cms_user.id,username,proName FROM cms_user,provinces
WHERE cms_user.proId=provinces.id;

SELECT u.id,u.username,u.email,u.sex,p.proName
FROM cms_user AS u
INNER JOIN provinces AS p
ON u.proId=p.id;

SELECT u.id,u.username,u.email,u.sex,p.proName
FROM provinces AS p
CROSS JOIN cms_user AS u
ON u.proId=p.id;


SELECT u.id,u.username,u.email,u.sex,p.proName
FROM provinces AS p
JOIN cms_user AS u
ON u.proId=p.id;

--查询cms_user id,username，sex
--查询 provinces proName
--条件是cms_user的性别为男的用户
--对分组结果进行筛选，分组数>=3
SELECT u.id,u.username,u.email,u.sex,p.proName,COUNT(*) AS TOTAL,GROUP_CONCAT(username)
FROM cms_user AS u
JOIN provinces AS p
ON u.proId=p.id
WHERE u.sex='male'
GROUP BY p.proName
HAVING COUNT(*)>=3
ORDER BY u.id ASC
LIMIT 0,2;


--查询cms_news中的id，title
--查询cms_cate的cateName
SELECT n.id,n.title
FROM cms_news AS n
JOIN cms_cate AS c
ON n.cId=c.id;

--cms_admin username,role
SELECT n.id,n.title,a.username,a.role
FROM cms_news AS n
JOIN cms_admin AS a
ON n.aId=a.id;

--cms_news中的id，title
--cms_cate的cateName
--cms_admin username,role
--关键是找到表与表之间的联系
SELECT n.id,n.title,a.username,a.role,c.cateName
FROM cms_cate AS c
JOIN cms_news AS n
ON n.cId=c.id
JOIN cms_admin AS a
ON n.aId=a.id;

--插入错误的数据
INSERT cms_user(username,password,regTime,proId)
VALUES('TEST1','TEST1','1235648566',20)

--左外连接查询，以左表为准
SELECT u.id,u.username,u.email,u.sex,p.proName
FROM provinces AS p
LEFT JOIN cms_user AS u
ON u.proId=p.id;
--右外连接，以右表为准
SELECT u.id,u.username,u.email,u.sex,p.proName
FROM provinces AS p
RIGHT JOIN cms_user AS u
ON u.proId=p.id;

-- 员工职员表
CREATE TABLE IF NOT EXISTS department(
id TINYINT UNSIGNED AUTO_INCREMENT KEY,
depName VARCHAR(20) NOT NULL UNIQUE
)ENGINE=INNODB;
INSERT department(depName) VALUES('教学部'),
('市场部'),
('运营部'),
('督导部');

CREATE TABLE IF NOT EXISTS employee(
id TINYINT UNSIGNED AUTO_INCREMENT KEY,
username VARCHAR(20) NOT NULL UNIQUE,
depId TINYINT UNSIGNED
)ENGINE=INNODB;
INSERT employee(username,depId) VALUES('liuqin',1),
('liu1',2),
('liu2',3),
('liu3',4),
('liu4',1);
--外键

CREATE TABLE IF NOT EXISTS department(
id TINYINT UNSIGNED AUTO_INCREMENT KEY,
depName VARCHAR(20) NOT NULL UNIQUE
)ENGINE=INNODB;

INSERT department(depName) VALUES('教学部'),
('市场部'),
('运营部'),
('督导部');

CREATE TABLE IF NOT EXISTS employee(
id TINYINT UNSIGNED AUTO_INCREMENT KEY,
username VARCHAR(20) NOT NULL UNIQUE,
depId TINYINT UNSIGNED,
FOREIGN KEY(depId) REFERENCES department(id)
)ENGINE=INNODB;

INSERT employee(username,depId) VALUES('liuqin',1),
('liu1',2),
('liu2',3),
('liu3',4),
('liu4',1);

SELECT e.id,e.username,d.depName FROM
employee AS e
JOIN
department AS d
ON e.depId=d.id;

DELETE FROM department WHERE depName='督导部';

DELETE FROM employee WHERE depId=4;
--要先删部门下的员工，再删部门

--删除员工表
DROP TABLE employee;

CREATE TABLE IF NOT EXISTS employee(
id TINYINT UNSIGNED AUTO_INCREMENT KEY,
username VARCHAR(20) NOT NULL UNIQUE,
depId TINYINT UNSIGNED,
CONSTRAINT emp_fk_dep FOREIGN KEY(depId) REFERENCES department(id)
)ENGINE=INNODB;

INSERT employee(username,depId) VALUES('liuqin',1),
('liu1',2),
('liu2',3),
('liu3',4),
('liu4',1);
--删除外键
ALTER TABLE employee DROP FOREIGN KEY emp_fk_dep;
--添加外键
ALTER TABLE employee ADD CONSTRAINT emp_fk_dep FOREIGN KEY(depId) REFERENCES department(id);

--------CASCADE
DROP TABLE department,employee; 
CREATE TABLE IF NOT EXISTS department(
id TINYINT UNSIGNED AUTO_INCREMENT KEY,
depName VARCHAR(20) NOT NULL UNIQUE
)ENGINE=INNODB;

INSERT department(depName) VALUES('教学部'),
('市场部'),
('运营部'),
('督导部');

CREATE TABLE IF NOT EXISTS employee(
id TINYINT UNSIGNED AUTO_INCREMENT KEY,
username VARCHAR(20) NOT NULL UNIQUE,
depId TINYINT UNSIGNED
-- FOREIGN KEY(depId) REFERENCES department(id) ON DELETE CASCADE ON UPDATE CASCADE
-- 删除后变成NULL, FOREIGN KEY(depId) REFERENCES department(id) ON DELETE SET NULL ON UPDATE SET NULL
)ENGINE=INNODB;

INSERT employee(username,depId) VALUES('liuqin',1),
('liu1',2),
('liu2',3),
('liu3',4),
('liu4',1);

--删除部门表的第一个部门
DELETE FROM department WHERE id=1;

--联合查询:UNION查询结果是删除了共同的元素,UNION ALL是合并了全部的
SELECT username FROM employee UNION SELECT username FROM cms_user;

SELECT username FROM employee UNION ALL SELECT username FROM cms_user;

SELECT username,age FROM employee UNION ALL SELECT username,age FROM cms_user;



-- 子查询IN,NOT IN
SELECT id FROM department;

SELECT id,username FROM employee WHERE depId IN(1,2,3,4);

SELECT id,username FROM employee WHERE depId IN(SELECT id FROM department);

-- 创建学员表
CREATE TABLE IF NOT EXISTS student(
id TINYINT UNSIGNED AUTO_INCREMENT KEY,
username VARCHAR(20) NOT NULL UNIQUE,
score TINYINT UNSIGNED
);
INSERT student(username,score) VALUES('liu1',99),
('liu2',99),
('liu3',80),
('liu4',70),
('liu5',60),
('liu6',53),
('liu7',80),
('liu8',77);

-- 创建奖学金表
CREATE TABLE IF NOT EXISTS scholarship(
id TINYINT UNSIGNED AUTO_INCREMENT KEY,
level TINYINT UNSIGNED
);
INSERT scholarship(level) VALUES(90),(80),(70);
-- 查询获得一等奖学金的学生
SELECT level FROM scholarship WHERE id=1;
SELECT id,username FROM student WHERE score>=90;
SELECT id,username FROM student WHERE score>=(SELECT level FROM scholarship WHERE id=1);

-- 查询所有获得奖学金的学生
SELECT id,username,score FROM student WHERE score>=ANY(SELECT level FROM scholarship);
SELECT id,username,score FROM student WHERE score>=SOME(SELECT level FROM scholarship);
-- 一等
SELECT id,username,score FROM student WHERE score>=ALL(SELECT level FROM scholarship);
-- 查询没有获得奖学金的学生
SELECT id,username,score FROM student WHERE score<ALL(SELECT level FROM scholarship);

SELECT id,username,score FROM student WHERE score=ANY(SELECT level FROM scholarship);
SELECT id,username,score FROM student WHERE score<>ALL(SELECT level FROM scholarship);

INSERT TEST1(id,username)
SELECT id,username FROM student;-- 先执行这句

-- 正则表达式
-- ^ 匹配字符开始的部分，$匹配字符串的末尾部分
-- .表示任意字符
SELECT * FROM cms_user WHERE username REGEXP '.';
SELECT * FROM cms_user WHERE username REGEXP 'R..G';
-- [字符集合]
SELECT * FROM cms_user WHERE username REGEXP '[lto]';
SELECT * FROM cms_user WHERE username REGEXP '[^lto]';-- 除了字符集合中的

SELECT * FROM cms_user WHERE username REGEXP 'ng|qu';

SELECT * FROM cms_user WHERE username REGEXP 'que*';-- 出现0次，1次或者多次
SELECT * FROM cms_user WHERE username REGEXP 'e*';

SELECT * FROM cms_user WHERE username REGEXP 'e+';-- 一次或者多次

SELECT * FROM cms_user WHERE username REGEXP 'que{2}';-- 出现2次

-- XOR异或，是不同为真








