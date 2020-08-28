Select
   employees.dept_emp.emp_no,
   employees.departments.dept_name,
   employees.dept_emp.from_date 
from
   employees.dept_emp,
   employees.departments 
where
   employees.dept_emp.dept_no = employees.departments.dept_no 
   and year(employees.dept_emp.to_date) = '9999' 
order by
   employees.dept_emp.emp_no;