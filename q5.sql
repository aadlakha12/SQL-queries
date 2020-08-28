Select
   employees.departments.dept_name,
   count(employees.dept_emp.emp_no) as noe 
from
   employees.dept_emp,
   employees.departments 
where
   employees.dept_emp.dept_no = employees.departments.dept_no 
group by
   employees.dept_emp.dept_no 
order by
   employees.departments.dept_name;