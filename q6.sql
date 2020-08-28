Select
   A.emp_no as e1,
   B.emp_no as e2 
from
   employees.employees A,
   employees.employees B 
where
   (
      A.emp_no < B.emp_no 
      and 
      (
         year(A.birth_date) = '1955' 
         and year(B.birth_date) = '1955'
      )
   )
   and A.emp_no in
   (
      Select
         employees.dept_emp.emp_no 
      from
         employees.dept_emp 
      where
         year(employees.dept_emp.to_date) = '9999' 
         and employees.dept_emp.dept_no = 'd001' 
   )
   and B.emp_no in 
   (
      Select
         employees.dept_emp.emp_no 
      from
         employees.dept_emp 
      where
         year(employees.dept_emp.to_date) = '9999' 
         and employees.dept_emp.dept_no = 'd001'
   )
; 