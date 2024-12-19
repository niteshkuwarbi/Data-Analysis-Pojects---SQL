show databases;

USE new_db;
  
CREATE TABLE Employee(
	Employee_id int PRIMARY KEY, 
    FirstName varchar(50),
    LastName varchar(50),
    Department varchar(50),
    Salary decimal(7,2)
);

CREATE TABLE Customer(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    LastName VARCHAR(50),
    Country VARCHAR(50),
    Age int(2),
	Phone int(20)
);

-- Insert some sample data into the Customers table
INSERT INTO Customer (CustomerID, CustomerName, LastName, Country, Age, Phone)
VALUES (1, 'Shubham', 'Thakur', 'India','23','99999999'),
       (2, 'Aman ', 'Chopra', 'Australia','21','88888888'),
       (3, 'Naveen', 'Tulasi', 'Sri lanka','24','77777777'),
       (4, 'Aditya', 'Arpan', 'Austria','21','55555555'),
       (5, 'Nishant. Salchichas S.A.', 'Jain', 'Spain','22','44444444');
       
INSERT INTO Customer (CustomerID, CustomerName, LastName, Country, Age, Phone)
VALUES
	(6, 'Vipin', 'Thakur', 'India', 24, 88888888),
	(7, 'Michaele', 'John', 'Australia', 27, 99999999),
    (8, 'Lauren', 'Page', 'Spain', 27, 66666666);
    
			--  TABLES IN SQL
    
    
SELECT * FROM customer;

CREATE TABLE subtable AS
SELECT CustomerID, CustomerName
FROM Customer;
    
SELECT * FROM subtable;

DROP TABLE IF EXISTS subtable;

select * from subtable; 		-- will show error

DELETE FROM customer WHERE CustomerName = 'Ayush';

INSERT INTO employee (Employee_id, FirstName, LastName, Department, Salary) 
VALUES 
(1, 'Amit', 'Singh', 'HR', '35242.00'),
(2, 'Rahul', 'Singh', 'Development', '65897.00'),
(3, 'Priya', 'Rawat', 'Graphic Designing', '70280.00'),
(4, 'Sonia', 'Singh', 'HR', '66666.00'),
(5, 'Kiran', 'Joshi', 'Marketing', '55555.00');

SELECT * FROM employee;

ALTER TABLE employee RENAME TO employee_details;

ALTER TABLE employee_details ADD email varchar(50);

SELECT * FROM employee_details;


			-- SQL QUERIES
        
        
SELECT * FROM CUSTOMER;

SELECT CustomerName, Age FROM CUSTOMER;

SELECT CustomerName FROM CUSTOMER WHERE Age=21;

SELECT * FROM employee_details 
WHERE Salary >60000
LIMIT 2;

SELECT * FROM CUSTOMER
ORDER BY rand()
LIMIT 3;

SELECT * FROM employee_details;

SELECT FIRSTNAME, DEPARTMENT
FROM employee_details
WHERE Employee_id IN (1,2,3);

CREATE TABLE assignment_details
(
    stu_id VARCHAR(20),
    stu_name VARCHAR(20),
    assn_name VARCHAR(20),
    due_date DATE,
    submission_date DATE
);

INSERT INTO assignment_details VALUES
('191021','SUJITH','DBMS','2021-04-21','2021-04-25'),
('191022','SUDEEP','DBMS','2021-04-21','2021-04-20'),
('191023','SARASWAT','O.S','2021-04-22','2021-04-24'),
('191024','SATWIK','C++','2021-04-23','2021-04-19'),
('191025','KOUSHIK','C++','2021-04-23','2021-04-21'),
('191026','ABHISHEK','O.S','2021-04-22','2021-04-20');

SELECT * FROM ASSIGNMENT_DETAILS;

	-- Query 1:  Display students who have submitted on ‘2021-04-20’.
SELECT * FROM ASSIGNMENT_DETAILS 
WHERE submission_date = '2021-04-20';

	-- Query 2: Display students who have submitted after duedate.
SELECT * FROM ASSIGNMENT_DETAILS
WHERE due_date<submission_date;

	-- Query 3: Display students who have submitted before duedate. 
SELECT * FROM ASSIGNMENT_DETAILS
WHERE due_date>=submission_date;

	-- Query 4: Display students who have submitted O.S assignment on time. 
SELECT * FROM ASSIGNMENT_DETAILS
WHERE assn_name = 'O.S' AND due_date>=submission_date;

SELECT * FROM EMPLOYEE_DETAILS;

INSERT INTO EMPLOYEE_DETAILS
VALUES (6, 'Vidu', 'Bora', 'Develpment', '60900.00', 'abc@gmail.com');

UPDATE EMPLOYEE_DETAILS SET email = 'XYZ@gmail.com' 
WHERE Employee_id = 1;

UPDATE EMPLOYEE_DETAILS SET Department = 'Development'
WHERE Employee_id = 6;

				--  SQL CLAUSES
                
SELECT * FROM EMPLOYEE_DETAILS;

SELECT Employee_id, FirstName, Salary FROM EMPLOYEE_DETAILS WHERE Salary>=66666;

SELECT Employee_id, FirstName, Salary FROM EMPLOYEE_DETAILS WHERE Salary BETWEEN 55555 AND 70000;

SELECT * FROM EMPLOYEE_DETAILS WHERE FirstName LIKE '%A';

SELECT * FROM EMPLOYEE_DETAILS WHERE Department IN ('HR', 'Development');
 
SELECT Department, sum(Salary) as Salary
FROM EMPLOYEE_DETAILS
GROUP BY Department;
 
SELECT Department, sum(Salary) as Salary
FROM EMPLOYEE_DETAILS
GROUP BY Department
HAVING SUM(Salary) >= 70000;

SELECT * FROM EMPLOYEE_DETAILS ORDER BY Salary DESC;


					-- SQL OPERATORS
                    
                    
SELECT * FROM EMPLOYEE_DETAILS;

SELECT * FROM EMPLOYEE_DETAILS WHERE FirstName LIKE 'R%';

SELECT * FROM EMPLOYEE_DETAILS WHERE LastName LIKE 'S%';

SELECT * FROM EMPLOYEE_DETAILS WHERE email LIKE '%gmail.com%';

SELECT FirstName, LastName FROM EMPLOYEE_DETAILS
WHERE Department IN ('HR', 'Development');
                    
SELECT FirstName, LastName FROM EMPLOYEE_DETAILS
WHERE Department NOT IN ('HR', 'Development');

SELECT * FROM EMPLOYEE_DETAILS
WHERE email IS NULL;

SELECT * FROM EMPLOYEE;
SELECT * FROM EMPLOYEE_DETAILS;

SELECT * FROM EMPLOYEE
UNION
SELECT * FROM EMPLOYEE_DETAILS
ORDER BY FirstName;

SELECT * FROM EMPLOYEE
UNION ALL
SELECT * FROM EMPLOYEE_DETAILS
ORDER BY FirstName;

SELECT * FROM CUSTOMER;

SELECT CustomerName, Age,
CASE
	WHEN Country = 'India' THEN 'Indian'
    ELSE 'Foreign'
END AS Nationality
FROM CUSTOMER;

SELECT CustomerName, Age,
CASE
	WHEN Age>=22 THEN 'The age is greater than 21'
    WHEN Age=21 THEN 'The age is 21'
    ELSE 'The Age is over 22'
END AS QuantityText
FROM Customer;


				-- SQL AGGREGATE FUNCTIONS
                
                
SELECT * FROM EMPLOYEE_DETAILS;

SELECT COUNT(*) AS TotalEmployees FROM EMPLOYEE_DETAILS;

SELECT SUM(Salary) AS TotalSalary FROM EMPLOYEE_DETAILS;

SELECT AVG(Salary) AS AverageSalary FROM EMPLOYEE_DETAILS;

SELECT MAX(Salary) AS HighestSalary FROM EMPLOYEE_DETAILS;

SELECT MIN(Salary) AS LowestSalary FROM EMPLOYEE_DETAILS;

SELECT * FROM CUSTOMER;

SELECT CustomerName,
	MAX(Age) AS max_age
FROM CUSTOMER
HAVING MIN(Age) > 22;

						-- SQL DATA CONSTRAINTS
                        
SELECT * FROM CUSTOMER;

SELECT CustomerName FROM CUSTOMER
WHERE Age = 21
group by CustomerName
HAVING COUNT(DISTINCT Country) = 1;

-- Foreign key

SELECT * FROM CUSTOMER;

CREATE TABLE ORDERS(
	OrderID INT PRIMARY KEY,
    OrderNumber INT NOT NULL,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

INSERT INTO ORDERS(OrderID, OrderNumber, CustomerID)
VALUES (11, 101, 1), (12, 102, 2), (13, 103, 3), (14, 104, 4), (15, 105, 5);

INSERT INTO ORDERS(OrderID, OrderNumber, CustomerID)
VALUES (16, 106, 6), (17, 107, 7), (18, 108, 8);

UPDATE ORDERS 
SET CustomerID = 3 
WHERE OrderID = 18;

UPDATE ORDERS 
SET CustomerID = 4 
WHERE OrderID = 17;

UPDATE ORDERS 
SET CustomerID = 5 
WHERE OrderID = 16;

-- INSERTING VALUE IN THE FOREIGN KEY TABLE i.e., ORDERS 

INSERT INTO ORDERS (OrderID, OrderNumber, CustomerID)
VALUES (16, 106, 6);
-- RETURNS AN ERROR: FOREIGN KEY constraint failed
 

						-- SQL JOINING DATA
                       

INSERT INTO CUSTOMER(CustomerID, CustomerName, LastName, Country, Age, Phone)
VALUES
	(6, 'Vipin', 'Thakur', 'India', 24, 88888888),
	(7, 'Michaele', 'John', 'Australia', 27, 99999999),
    (8, 'Lauren', 'Page', 'Spain', 27, 66666666);
    
SELECT * FROM CUSTOMER;

SELECT * FROM ORDERS;

SELECT c.CustomerID, c.CustomerName, c.LastName, c.Country, c.Age, o.OrderID
FROM CUSTOMER c
JOIN ORDERS o ON c.CustomerID = o.CustomerID;

			-- INNER JOIN
            
SELECT c.CustomerID, c.CustomerName, c.Country, o.OrderID
FROM CUSTOMER c
INNER JOIN ORDERS o
ON c.CustomerID = o.CustomerID;

			-- LEFT JOIN
            
SELECT c.CustomerID, c.CustomerName, c.Country, c.Age, o.OrderID, o.OrderNumber
FROM CUSTOMER c
LEFT JOIN ORDERS o
ON c.CustomerID = o.CustomerID;

			-- RIGHT JOIN
            
SELECT c.CustomerID, c.CustomerName, c.Country, c.Age, o.OrderID, o.OrderNumber
FROM CUSTOMER c
RIGHT JOIN ORDERS o
ON o.CustomerID = c.CustomerID;

			-- FULL JOIN
            
SELECT c.CustomerID, c.CustomerName
FROM CUSTOMER c 
FULL JOIN ORDERS o
ON o.StudentID = c.StudentID;

-- Group by

SELECT * FROM employee_details;

SELECT FirstName, count(Department)
AS people_from_HR
FROM employee_details
WHERE Department = 'HR' GROUP BY FirstName;


						-- SQL FUNCTIONS
                        
                        
select now();		-- returns current date and time

SELECT CURDATE();

SELECT CURTIME();

		-- STRING FUNCTIONS
SELECT CONCAT_WS('_', 'nitesh', 'kuwarbi');

SELECT LCASE('NITESH KUWARBI');

SELECT LEFT('niteshkuwarbi333', '6');

		-- NUMERIC FUNCTIONS
SELECT ACOS(0.25);		-- returns cosine number

SELECT ASIN(0.25);		-- returns the arc sine of a number, in radians

SELECT ATAN(2.5); 		-- returns the arc tangent of a number, in radians

SELECT POWER(2, 3);

SELECT RADIANS(180);

SELECT ROUND(4.78);

			-- STATISTICAL FUNCTIONS
SELECT * FROM EMPLOYEE_DETAILS;

SELECT AVG(Salary) from EMPLOYEE_DETAILS;

SELECT COUNT(FirstName) FROM EMPLOYEE_DETAILS;

SELECT MAX(Salary) FROM EMPLOYEE_DETAILS;

SELECT MIN(Salary) FROM EMPLOYEE_DETAILS;

SELECT VARIANCE(Salary) AS variance_salary FROM EMPLOYEE_DETAILS;

SELECT STDDEV(Salary) AS standard_dev_salary FROM EMPLOYEE_DETAILS;

