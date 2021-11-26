
-- Question 
-- Given the table schemas below, write a query to print the company_code, founder name, 
-- total number of lead managers, total number of senior managers, 
-- total number of managers, and total number of employees. 
-- Order your output by ascending company_code.

-- Link:https://www.hackerrank.com/challenges/binary-search-tree-1/problem

-- Note:
-- The tables may contain duplicate records.
-- The company_code is string, so the sorting should not be numeric.
 
--  For example, if the company_codes are C_1, C_2, and C_10, 
--  then the ascending company_codes will be C_1, C_10, and C_2.



-- My Solution 
SELECT 
c.company_code,c.founder,
COUNT(DISTINCT em.lead_manager_code) as lm_count,
COUNT(DISTINCT em.senior_manager_code) as sm_count,
COUNT(DISTINCT em.manager_code) as m_count,
COUNT(DISTINCT em.employee_code) as e_count
FROM Company c 
INNER JOIN employee em ON c.company_code=em.company_code
GROUP BY 1,2
ORDER BY CAST(RIGHT(c.company_code,LEN(c.company_code)-1) AS INT);

-- Fix for C01,..C09,C10...C20
SELECT 
c.company_code,c.founder,
COUNT(DISTINCT em.lead_manager_code) as lm_count,
COUNT(DISTINCT em.senior_manager_code) as sm_count,
COUNT(DISTINCT em.manager_code) as m_count,
COUNT(DISTINCT em.employee_code) as e_count
FROM Company c 
INNER JOIN employee em ON c.company_code=em.company_code
GROUP BY 1,2
ORDER BY CAST(RIGHT(c.company_code,LEN(c.company_code)-1) AS INT);