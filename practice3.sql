#取得平均薪水最高的公司
#输出公司名称和平均薪水：companyName avgSalary

# 找出所有公司及平均薪资
select companyName, avg(salary) as avgSalary
from Company left join Employee
on Company.id = Employee.companyId
group by companyId;

# 找出最多
select companyName, max(avgSalary) as avgSalary from
(select companyName, avg(salary) as avgSalary
from Company left join Employee
on Company.id = Employee.companyId
group by companyId) as t;

