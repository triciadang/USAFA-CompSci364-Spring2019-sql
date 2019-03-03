-- Write a query to display the employee number, first name, last name, and
-- largest salary amount for each employee in department 200. Sort the output
-- by largest salary in descending order and employee number in ascending
-- order. (Problem 7.57)

SELECT LGEMPLOYEE.EMP_NUM, LGEMPLOYEE.EMP_FNAME, LGEMPLOYEE.EMP_LNAME, MAX(LGSALARY_HISTORY.SAL_AMOUNT)
FROM LGEMPLOYEE, LGSALARY_HISTORY
WHERE LGEMPLOYEE.EMP_NUM = LGSALARY_HISTORY.EMP_NUM
AND LGEMPLOYEE.DEPT_NUM = 200
GROUP BY LGEMPLOYEE.EMP_NUM
ORDER BY MAX(LGSALARY_HISTORY.SAL_AMOUNT) DESC, LGEMPLOYEE.EMP_NUM ASC;