Select
   table1.emp as h_empno,
   table1.salary as h_salary,
   table1.hire as h_date,
   table2.emp as l_empno,
   table2.salary as l_salary,
   table2.hire as l_date 
from
   (
      Select
         employees.employees.emp_no as emp,
         employees.employees.birth_date as birth,
         employees.employees.hire_date as hire,
         employees.salaries.salary as salary 
      from
         employees.employees,
         employees.salaries 
      where
         employees.employees.emp_no = employees.salaries.emp_no 
         and year(employees.salaries.to_date) = '9999' 
         and year(employees.employees.birth_date) = '1965'
   )
   table1,
   (
      select
         employees.employees.emp_no as emp,
         employees.employees.birth_date as birth,
         employees.employees.hire_date as hire,
         employees.salaries.salary as salary 
      from
         employees.employees,
         employees.salaries 
      where
         employees.employees.emp_no = employees.salaries.emp_no 
         and year(employees.salaries.to_date) = '9999' 
         and year(employees.employees.birth_date) = '1965'
   )
   table2 
where
   table1.hire > table2.hire 
   and table1.salary > table2.salary 
order by
   table1.emp,
   table2.emp;