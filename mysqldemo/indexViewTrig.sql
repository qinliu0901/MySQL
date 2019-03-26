/* 索引：建立在表之上，由单列或多列组成，用来排序数据以加快搜索和排序操作的速度*/
-- 创建普通索引
CREATE TABLE TEST1(
id TINYINT UNSIGNED,
username VARCHAR(20),
INDEX in_id(id),
KEY in_username(username)
);

-- 添加索引
ALTER TABLE student ADD INDEX index_name(sname);
CREATE INDEX student_id_index ON student(sno);
-- 查看索引是否启用
EXPLAIN SELECT * FROM student WHERE sno = 101 \G;

-- 创建唯一索引
CREATE TABLE TEST2(
id TINYINT UNSIGNED AUTO_INCREMENT KEY,
username VARCHAR(20) NOT NULL UNIQUE,
card CHAR(18) NOT NULL,
UNIQUE KEY uni_card(card)
);
-- 创建全文索引
CREATE TABLE TEST3(
id TINYINT UNSIGNED AUTO_INCREMENT KEY,
username VARCHAR(20) NOT NULL UNIQUE,
card CHAR(18) NOT NULL,
FULLTEXT INDEX full_card(card) 
);

-- 创建单列索引
CREATE TABLE TEST4(
id TINYINT UNSIGNED AUTO_INCREMENT KEY,
test1 VARCHAR(20) NOT NULL,
test2 VARCHAR(20) NOT NULL,
test3 VARCHAR(20) NOT NULL,
test4 VARCHAR(20) NOT NULL,
INDEX in_test1(test1)
);
-- 创建多列索引
CREATE TABLE TEST5(
id TINYINT UNSIGNED AUTO_INCREMENT KEY,
test1 VARCHAR(20) NOT NULL,
test2 VARCHAR(20) NOT NULL,
test3 VARCHAR(20) NOT NULL,
test4 VARCHAR(20) NOT NULL,
INDEX mul_t1_t2_t3_t4(test1,test2,test3,test4)
);

--删除索引
DROP INDEX in_id ON TEST1;
ALTER TABLE TEST1 DROP INDEX in_username(username);

-- 添加索引
CREATE INDEX in_id ON TEST1(id);

ALTER TABLE TEST1 ADD INDEX in_username(username);




--视图：是一个虚拟表，所见即所需，可以访问部分数据
-- 创建视图
CREATE VIEW stu_view as SELECT * FROM student;
CREATE OR REPLACE VIEW stu_view as SELECT * FROM student;
-- 查看视图结构
DESC stu_view;
-- 查看视图构建结构
SHOW CREATE VIEW stu_view;

-- 打开视图
SELECT * FROM stu_view;
-- 创建视图指定列名
CREATE VIEW stu_view1(id,name) AS SELECT sno,sname FROM student;

-- 修改视图，列数一致
ALTER VIEW stu_view1(id,name,ssex) AS SELECT sno,sname,ssex FROM student;

--删除视图
DROP VIEW stu_view1;
-- 视图来源可以是真实表，也可以是视图
CREATE VIEW stu_view3 as SELECT * FROM stu_view1;
-- 不可修改的视图
-- 有count(),sum(),group by,select有子查询，创建的视图select来源于是一个不可修改的视图,不可修改。


-- 触发器：在执行某个操作时，运行的另一个指令
CREATE TABLE tbl_trig(
action VARCHAR(20),
action_time DATETIME
);
--创建触发器，当往student表里插入数据时，会触发tbl_trig表往里面添加相应的值
CREATE TRIGGER trig01 BEFORE 
INSERT ON student FOR EACH ROW 
BEGIN # 多条语句时
INSERT INTO tbl_trig(action,action_time) VALUES('insert', NOW());
END
-- 往student表里插入数据
INSERT INTO student(sno,sname,ssex) VALUES(110,'qi','male');
-- 查看tbl_trig表，发现已经插入insert和时间
SELECT * FROM tbl_trig;

-- 删除触发器，触发器相当于日志
DROP TRIGGER trig01;

