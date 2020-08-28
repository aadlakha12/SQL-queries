Select
   table1.emp_no,
   table1.dept_name 
from
   (
      Select
         employees.dept_manager.emp_no,
         employees.departments.dept_name,
         DATEDIFF(employees.dept_manager.from_date, employees.dept_manager.to_date) as tab1diff 
      from
         employees.dept_manager,
         employees.departments 
      where
         employees.dept_manager.dept_no = employees.departments.dept_no 
         and year(employees.dept_manager.to_date) != '9999'
   )
   table1 
   inner join
      (
         Select
            * 
         from
            (
               Select
                  employees.departments.dept_name,
                  min(DATEDIFF(employees.dept_manager.from_date, employees.dept_manager.to_date)) as tab2diff 
               from
                  employees.dept_manager,
                  employees.departments 
               where
                  employees.dept_manager.dept_no = employees.departments.dept_no 
                  and year(employees.dept_manager.to_date) != '9999' 
               group by
                  dept_name 
            )
            as a 
      )
      table2 
      on table1.dept_name = table2.dept_name 
      and table1.tab1diff = table2.tab2diff 
order by
   table1.emp_no;