-- BDSM Practical--




create database emp;
CREATE TABLE employees (
Emp_id INT PRIMARY KEY ,
EName VARCHAR(50),
Salary FLOAT,
Commission FLOAT,
Hire_date DATE,
Address VARCHAR(100)
);


INSERT INTO employees (Commission,Hire_date,Address) VALUES
(45.2,'2011-05-19',"Bhopal"),
(56.2,'2011-09-19', "Bhopal"),
(67.6,'2010-05-18', "Indore");


SELECT EName, Salary FROM employees WHERE Salary = 5000;


SELECT EName, Salary + COALESCE(Commission, 0) AS Total_Income FROM employees;


SELECT EName, Salary FROM employees ORDER BY Salary DESC;


SELECT EName, Salary FROM employees WHERE Salary BETWEEN 40000 AND 50000;


SELECT EName FROM employees WHERE EName LIKE 'J%' OR EName LIKE 'K%' OR EName LIKE 'L%' OR EName LIKE
'M%';


-- Sample PL/SQL block for SELECT
-- BEGIN
-- SELECT EName, Salary FROM employees;
-- END;
-- not working >>

SELECT EName, Salary FROM employees;


INSERT INTO employees (emp_id,EName, Salary) VALUES (9,'John Doe', 5000);


SET SQL_SAFE_UPDATES = 0;
UPDATE employees SET Salary = 6000 WHERE EName = 'John Doe';


DELETE FROM employees WHERE Emp_id = 1;


SELECT EName, Hire_date FROM employees;


SELECT emp_id, Ename, salary
FROM employees
ORDER BY salary DESC
LIMIT 5;


--not tested--
DELIMITER //

CREATE TRIGGER prevent_delete_sundays
BEFORE DELETE ON employee
FOR EACH ROW
BEGIN
    IF DAYOFWEEK(OLD.Hire_date) = 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Deletion on Sundays is not allowed.';
    END IF;
END;
//

DELIMITER ;


