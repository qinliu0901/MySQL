-- transaction.sql
 
 -- 事务是将一组SQL语句放在同一批次内去执行，要么完全执行，要么完全不执行
 -- engine=MyISAM不支持事务处理，InnoDB支持
 -- ACID原则：原子性，一致性，隔离性，持久性


SET AUTOCOMMIT = 0; # 关闭自动提交事务，1开启
START TRANSACTION; # 开始一个事务
DELETE name WHERE id=1; # 在事务中执行SQL语句
ROLLBACK; # 将事务回滚，撤销SQL语句，回到本次事务的初始状态
COMMIT; # 提交一个事务给数据库
SET AUTOCOMMIT = 1; # 开启自动提交事务，MySQL默认为开启1


CREATE TABLE account(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(32) NOT NULL,
cash DECIMAL(9,2) NOT NULL
);
INSERT INTO accout(name,cash) VALUES('A', 2000.00);
INSERT INTO accout(name,cash) VALUES('B', 10000.00);

-- 事务处理
SET AUTOCOMMIT = 0;
START TRANSACTION;
update account set cash = cash-500 where id=1;
update account set cash = cassh-500 where id=2; # error
ROLLBACK;# 失败就rollback
COMMIT;# 成功就commit
SET AUTOCOMMIT = 1;

-- 查看事务隔离级别
SELECT @@TRANSACTION_ISOLATION;
SELECT @@GLOBAL.TRANSACTION_ISOLATION; # 查看全局事务隔离级别
SELECT @@SESSION.TRANSACTION_ISOLATION; # 查看当前会话事务隔离级别

-- 设置事务隔离级别
-- 默认的REPEATABLE-READ
SET TRANSACTION_ISOLATION = 'READ-UNCOMMITED';
--READ-UNCOMMITED会造成脏读：当一个事务在执行操作未提交时，另一个事务查询时会查到刚刚未提交的数据；
SET GLOBAL.TRANSACTION_ISOLATION = 'READ-COMMITED'; # 读取提交，事务间只能查看已提交的数据，需要commit
 