# 0.本地连接数据库
# mysql -u root -p

# 1.创建数据库employee_db
create  database employee_db;

# 2.在数据库employee_db中创建table：`Employee`
use employee_db;

CREATE TABLE IF NOT EXISTS `Employee`(
   `id` INT ,
   `name` VARCHAR(40) NOT NULL,
   `age` INT,
   `gender` VARCHAR(20),
   `companyId` INT,
   `salary` INT,
   PRIMARY KEY ( `id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

# 3.将`employee-data.csv`文件中的数据导入数据表Employee中
load data infile '/Users/lrliang/Documents/takeScriptures/毕业生训练营/Mysql基础/2018-04-04-05-16-35-1522818995/employee-data.csv'
into table Employee
CHARACTER SET utf8
fields terminated by ','
optionally enclosed by '"' escaped by '"'
lines terminated by '\n';
--lines terminated by '\r\n';

# 换成LOAD DATA LOCAL INFILE
LOAD DATA LOCAL INFILE '/Users/lrliang/Documents/takeScriptures/毕业生训练营/Mysql基础/2018-04-04-05-16-35-1522818995/employee-data.csv'
into table Employee
CHARACTER SET utf8
fields terminated by ','
optionally enclosed by '"' escaped by '"'
lines terminated by '\n';

# 4.在数据库employee_db中创建table：`Company`
CREATE TABLE IF NOT EXISTS `Company`(
   `id` INT,
   `companyName` VARCHAR(40) NOT NULL,
   `employeeNumber` INT,
   PRIMARY KEY ( `id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

# 5.将`company-data.csv`文件中的数据导入Company数据表中
LOAD DATA LOCAL INFILE '/Users/lrliang/Documents/takeScriptures/毕业生训练营/Mysql基础/2018-04-04-05-16-35-1522818995/company-data.csv'
into table Company
CHARACTER SET utf8
fields terminated by ','
optionally enclosed by '"' escaped by '"'
lines terminated by '\n';

# 6.找出Employee表中姓名包含`n`字符并且薪资大于6000的雇员所有个人信息
SELECT * FROM Employee WHERE name like "%n%" AND `salary` > 6000;

# ps:本练习中只需要将6的结果复制到`result.txt`文件中