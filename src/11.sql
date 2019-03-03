-- Write a query to display the employee number, last name, email address,
-- title, and department name of each employee who job title ends in the word
-- "ASSOCIATE." Sort the output by department name, employee title, and
-- employee number. (Problem 7.50)

SELECT LGEMPLOYEE.EMP_NUM, LGEMPLOYEE.EMP_LNAME, LGEMPLOYEE.EMP_EMAIL, LGEMPLOYEE.EMP_TITLE, LGDEPARTMENT.DEPT_NAME
FROM LGEMPLOYEE, LGDEPARTMENT
WHERE LGEMPLOYEE.DEPT_NUM = LGDEPARTMENT.DEPT_NUM
AND LGEMPLOYEE.EMP_TITLE LIKE 'ASSOCIATE'
ORDER BY LGDEPARTMENT.DEPT_NAME ASC, LGEMPLOYEE.EMP_TITLE ASC, LGEMPLOYEE.EMP_NUM ASC;