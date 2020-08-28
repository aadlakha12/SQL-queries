Select
   employees.employees.last_name,
   employees.salaries.salary,
   employees.salaries.from_date,
   employees.salaries.to_date 
from
   employees.employees,
   employees.salaries 
where
   employees.employees.emp_no = employees.salaries.emp_no 
order by
   employees.employees.last_name,
   employees.salaries.salary,
   employees.salaries.from_date,
   employees.salaries.to_date;