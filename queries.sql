CREATE TABLE Employee
(
  emp_id INT NOT NULL,
  first_name VARCHAR(40) NOT NULL,
  last_name VARCHAR(40) NOT NULL,
  salary INT NOT NULL,
  birth_date DATE NOT NULL,
  dept_id INT,
  PRIMARY KEY (emp_id));
  
ALTER TABLE employee
ADD FOREIGN KEY (dept_id) REFERENCES Department(dept_id) ON DELETE SET NULL;

ALTER TABLE employee
ADD COLUMN spv_id INt;


CREATE TABLE Department
(
  dept_id INT NOT NULL,
  dept_name VARCHAR(40) NOT NULL,
  supervisor_id INT,
  PRIMARY KEY (dept_id),
  FOREIGN KEY(supervisor_id) REFERENCES employee(emp_id) ON DELETE SET NULL);

  
INSERT INTO employee VALUES(100, 'David', 'Wallace', 250000, '1967-11-17',  NULL);
INSERT INTO department VALUES(1000, 'Accounting', 100);
 
UPDATE employee
SET dept_id = 1000
WHERE emp_id = 100;

INSERT INTO employee VALUES(101, 'Jan', 'Levinson', 110000, '1961-05-11', NULL);
INSERT INTO employee VALUES(102, 'Michael', 'Scott', 75000, '1964-03-15', NULL);
INSERT INTO employee VALUES(103, 'Angela', 'Martin', 63000, '1971-06-25', NULL);
INSERT INTO employee VALUES(104, 'Kelly', 'Kapoor', 55000, '1980-02-05', NULL);
INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', 69000,'1958-02-19', NULL);
INSERT INTO employee VALUES(106, 'Josh', 'Porter', 78000, '1969-09-05', NULL);
INSERT INTO employee VALUES(107, 'Andy', 'Bernard', 65000, '1973-07-22', NULL);
INSERT INTO employee VALUES(108, 'Jim', 'Halpert', 71000, '1978-10-01', NULL);
INSERT INTO employee VALUES(109, 'Pamela', 'Beesly', 50000, '1979-09-05', NULL);

INSERT INTO department VALUES(1001, 'Executive', 101);
INSERT INTO department VALUES(1002, 'Technology', 102);

UPDATE employee
SET dept_id = 1000
WHERE emp_id = 109;

-- 4.1
SELECT dept_name
FROM department;

-- 4.2
SELECT first_name , last_name
FROM employee;

-- 4.3
SELECT dept_name , employee.first_name, employee.last_name
FROM employee
JOIN department 
ON employee.emp_id = supervisor_id;

-- 4.4
SELECT employee.first_name, employee.last_name , dept_name 
FROM employee 
JOIN department
WHERE employee.dept_id = department.dept_id;

UPDATE employee
SET spv_id = 100
WHERE emp_id = 109;

-- 4.5
SELECT employee.first_name, employee.last_name 
FROM employee
WHERE dept_id IN(
SELECT dept_id
FROM department
WHERE dept_name = 'Technology');


-- 4.6
SELECT
       e.first_name AS EmployeeFirstName, e.last_name AS EmployeeLastName, 
       s.last_name AS SupervisorFirstName,  s.last_name AS SupervisorLastName
FROM
       employee e
LEFT JOIN
       employee s
ON
       e.spv_id = s.emp_id;
   

