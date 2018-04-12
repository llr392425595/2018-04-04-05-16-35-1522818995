# 找出薪水在公司的平均薪水之上的人员名字
# 输出标准中包含Employee中所有字段和该employee所在公司名称以及该公司平均薪资：
# id | name | age | gender | companyId | salary | companyName | avgsal


select Employee.id,name,age,gender,companyId,salary,companyName from Company left join Employee on Company.id = Employee.companyId;

select companyName, avg(salary) as avgSalary
from Company left join Employee
on Company.id = Employee.companyId
group by companyId;


select * from
(select Employee.id,name,age,gender,companyId,salary,companyName from Company left join Employee on Company.id = Employee.companyId) as t1
left join
(select companyName, avg(salary) as avgSalary from Company left join Employee on Company.id = Employee.companyId group by companyId) as t2
on t1.companyName = t2.companyName
where salary > avgSalary
;
