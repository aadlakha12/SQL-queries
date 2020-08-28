Select
   table1.emp_no,
   count(*) as cnt 
from
   (
      Select distinct
         employees.titles.emp_no,
         employees.titles.from_date 
      from
         employees.titles 
      order by
         employees.titles.emp_no 
   )
   table1 
   left join
      (
         Select distinct
            employees.salaries.emp_no,
            employees.salaries.from_date 
         from
            employees.salaries 
      )
      table2 
      on table1.emp_no = table2.emp_no 
      and table2.from_date = table1.from_date 
where
   table2.emp_no is null 
group by
   table1.emp_no;
