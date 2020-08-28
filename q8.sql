Select
   employees.departments.dept_name,
   count(employees.dept_manager.dept_no) - 1 as cnt 
from
   employees.dept_manager,
   employees.departments 
where
   employees.departments.dept_no = employees.dept_manager.dept_no 
group by
   employees.dept_manager.dept_no 
having
   cnt > 1 
order by
   employees.departments.dept_name;