WITH RECURSIVE tab (src,dst,years) AS (
WITH t1 AS (
SELECT DISTINCT t.title AS par,tt.title AS child, AVG(YEAR(t.to_date) - YEAR(t.from_date)+1) AS dur
    FROM employees.titles AS t, employees.titles AS tt WHERE t.emp_no = tt.emp_no AND t.from_date < tt.from_date
    AND t.to_date = tt.from_date
    GROUP BY par,child)
SELECT * FROM t1
UNION DISTINCT 
(SELECT P.par , A.dst, P.dur+A.years
FROM t1 P, tab A
WHERE P.child = A.src AND P.par != A.dst AND A.years<100))
SELECT a2.src , a2.dst, MIN(a2.years) years
FROM tab a2 GROUP BY src, dst ORDER BY  src ,dst;