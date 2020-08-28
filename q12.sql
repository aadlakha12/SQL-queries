Select
   dname as dept_name,
   (
      count(if (table1.sal > table2.average, 1, null)) / count(*)
   )
   *100 as above_avg_pect 
from
   (
      Select
         s.emp_no emp,
         d.dept_name dname,
         s.salary sal 
      from
         employees.salaries s,
         employees.dept_emp e,
         employees.departments d 
      where
         year(s.to_date) = 9999 
         and year(e.to_date) = 9999 
         and s.emp_no = e.emp_no 
         and e.dept_no = d.dept_no
   )
   table1 
   inner join
      (
         Select
            d.dept_name dnam,
            avg(s.salary) average 
         from
            employees.salaries s,
            employees.dept_emp e,
            employees.departments d 
         where
            year(s.to_date) = 9999 
            and year(e.to_date) = 9999 
            and s.emp_no = e.emp_no 
            and e.dept_no = d.dept_no 
         group by
            d.dept_name
      )
      table2
      on table1.dname = table2.dnam 
group by
   dname;
 
 
 