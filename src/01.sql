-- Write the SQL code that will create the table structure for a table named
-- EMP_1. This table is a subset of the EMPLOYEE table. Note that JOB_CODE is a
-- foreign key to JOB. (Problem 7.1)

CREATE TABLE EMP_1(
	EMP_NUM	INTEGER,
	EMP_LNAME	VARCHAR(15),
	EMP_FNAME	VARCHAR(15),
	EMP_INITIAL	CHAR(1),
	EMP_HIREDATE	DATE,
	JOB_CODE	INTEGER,
	FOREIGN KEY (JOB_CODE) REFERENCES JOB(JOB_CODE)
	ON UPDATE CASCADE ON DELETE RESTRICT
	)
