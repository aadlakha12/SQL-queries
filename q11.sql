Select
   table2.dept_name,
   table2.emp_no,
   table3.salary 
from
   (
      Select
         - min( - employees.salaries.salary) as salary,
         employees.dept_emp.dept_no 
      from
         employees.salaries 
         inner join
		 employees.dept_emp  on employees.salaries.emp_no = employees.dept_emp.emp_no
      group by
         employees.dept_emp.dept_no
   )
   table3 
   inner join
      (
         Select
            employees.departments.dept_name,
            employees.departments.dept_no,
            table1.emp_no,
            table1.salary 
         from
            employees.departments 
            inner join
               (
                  Select
                     employees.dept_emp.dept_no,
                     employees.dept_emp.emp_no,
                     employees.salaries.salary 
                  from
                     employees.dept_emp 
                     inner join
                        employees.salaries 
                        on employees.dept_emp.emp_no = employees.salaries.emp_no
               )
               table1 
               on table1.dept_no = employees.departments.dept_no
      )
      table2 
      on table2.dept_no = table3.dept_no 
where
   table3.salary = table2.salary 
order by
   table2.dept_name;