# 取得每个company中最高薪水的人员名字
# 输出结果包含公司名称和人员名称：companyName name

# 获取两个表的链接查询
select * from Company left join Employee on Company.id = Employee.companyId;
+----+-------------+----------------+------+------------+------+----------+-----------+--------+
| id | companyName | employeeNumber | id   | name       | age  | gender   | companyId | salary |
+----+-------------+----------------+------+------------+------+----------+-----------+--------+
|  0 | 'baidu'     |           1000 |    0 | 'xiaoming' |   20 | 'male'   |         0 |   6000 |
|  1 | 'alibaba'   |           2000 |    1 | 'xiaohong' |   19 | 'female' |         1 |   7000 |
|  2 | 'tengxun'   |           3000 |    2 | 'xiaozhi'  |   15 | 'male'   |         2 |   8000 |
|  1 | 'alibaba'   |           2000 |    3 | 'xiaogang' |   16 | 'male'   |         1 |   6000 |
|  0 | 'baidu'     |           1000 |    4 | 'xiaoxia'  |   15 | 'female' |         0 |   4000 |
+----+-------------+----------------+------+------------+------+----------+-----------+--------+

# 取得每个company中最高薪水的人员公司，名字，薪水
select companyName, name, max(salary)
from Company left join Employee
on Company.id = Employee.companyId
group by companyId
;

# 取得每个company中最高薪水的公司，人员名字
select companyName, name from
(select companyName, name, max(salary)
from Company left join Employee
on Company.id = Employee.companyId
group by companyId) as t ;