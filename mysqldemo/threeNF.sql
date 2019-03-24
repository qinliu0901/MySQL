-- 数据库的三大设计范式.sql
 
-- 范式：数据库设计规范，简而言之，数据库的设计好坏会影响两个方面，
--一是影响到数据的存储性能，二是影响开发人员对数据的操作。所以需要建立科学的规范的数据库来优化数据的存储方式。

--1. 第一范式：拆字段

-- 定义：当关系模式R的所有属性都不能在分解为更基本的数据单位时，称R是满足第一范式的，简记为1NF。
 -- 数据表中的所有字段都是不可分割的原子值；每一列属性都是不可再分的属性值，确保每一列的原子性
 -- 字段拆分的越详细，越有利于后面的工作开展；范式，设计的越详细，越有利于某些的实际操作，但也不一定都是好处。

CREATE TABLE student IF NOT EXISTS(
id INT PRIMARY KEY,
name VARCHAR(10),
country VARCHAR(30)
city VARCHAR(10))


INSERT INTO student VALUES(1, 'Gretchen', 'China', 'Hangzhou')
-- 而不是把地址都写为一个字符串，‘中国杭州市江干区2号大街’


-- 2. 第二范式：拆表

-- 2NF
 -- 必须是满足第一范式的前提下，第二范式要求，除主键外的每一字段都必须完全依赖于主键。
 -- 如果出现不完全依赖，只可能发生在联合主键的情况下。
 -- 应该是  不可能出现除了主键之外的两条完全相同的记录，这样会冗余，突出主键的重要；
 -- 例如：一个人同时订几个房间，就会出来一个订单号多条数据，这样子联系人都是重复的，就会造成数据冗余，应该拆开来。一条记录做一件事情。

CREATE TABLE IF NOT EXISTS myorder(
	order_id INT PRIMARY KEY,
	product_id INT,
	customer_id INT
);

CREATE TABLE IF NOT EXISTS myorder(
	id INT PRIMARY KEY,
	name VARCHAR(20)
);

# 而不是PRIMARY KEY(id,,name)


-- 3. 第三范式：
 
-- 数据之间不能存在传递依赖，即每个属性与主键有直接关系3NF
 -- 必须是满足第1范式的前提下，第三范式要求，除开主键外的其他列之间不存在传递依赖关系。（冗余了）
-- 比如Student表（学号，姓名，年龄，性别，所在院校，院校地址，院校电话）
--这样一个表结构，就存在上述关系。 学号--> 所在院校 --> (院校地址，院校电话)
--这样的应该拆开来，如下。
--（学号，姓名，年龄，性别，所在院校）--（所在院校，院校地址，院校电话）
