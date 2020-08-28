Select
   table3.title as src,
   table4.title as dst 
from
   (
      Select distinct
         employees.titles.title 
      from
         employees.titles
   )
   table3,
   (
      Select distinct
         employees.titles.title 
      from
         employees.titles
   )
   table4 
where
   (
      table3.title,
      table4.title
   )
   not in 
   (
      WITH RECURSIVE Anc (asrc, adst) as 
      (
         with parent as 
         (
            select
               table1.title psrc,
               table2.title pdst 
            from
               employees.titles table1,
               employees.titles table2 
            where
               table1.emp_no = table2.emp_no 
               and table1.from_date < table2.from_date 
               and table1.to_date = table2.from_date 
            group by
               table1.title,
               table2.title
         )
         Select
            * 
         from
            parent 
         union
         distinct (
         Select
            P.psrc , A.adst 
         from
            parent P, Anc A 
         where
            P.pdst = A.asrc)
      )
      Select
         anc.asrc,
         anc.adst 
      from
         Anc anc 
      where
         anc.asrc = table3.title 
         and anc.adst = table4.title
   )
order by
   table3.title,
   table4.title;


