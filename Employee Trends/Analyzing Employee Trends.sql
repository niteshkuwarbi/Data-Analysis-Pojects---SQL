show databases;

CREATE DATABASE IF NOT EXISTS employee_trends;

use employee_trends;

SELECT * FROM hr_data;

ALTER TABLE `hr_data`
CHANGE `ï»¿emp_no` `emp_no` int;


--- 1. Count the number of employees in each department ---

SELECT department, COUNT(emp_no) AS `No of Employee`
FROM hr_data
GROUP BY department;

--- 2. Calculate the average age for each department ---

SELECT department, AVG(age) as `Average Age`
FROM hr_data
GROUP BY department;

---- 3. Identify the most common job roles in each department ---

SELECT department, job_role, COUNT(*) AS role_count
FROM hr_data
GROUP BY department, job_role
ORDER BY department, role_count DESC;


--- 4. Calculate the average job satisfaction for each education level ---

SELECT education, AVG(job_satisfaction) AS `Average Satisfaction`
FROM hr_data
GROUP BY education;

--- 5. Determine the average age for employees with different levels of job satisfaction ---

SELECT job_satisfaction, AVG(age) AS average_age
FROM hr_data
GROUP BY job_satisfaction;

--- 6. Calculate the attrition rate for each age_band --

SELECT age_band, 
	   SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100 AS attrition_rate
FROM hr_data
GROUP BY age_band;

--- 7. Calculate the attrition rate for each department ----

SELECT department,
		SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100 AS attrition_rate
FROM hr_data
GROUP BY department;

--- 8. Identify the departments with the highest and lowest average job satisfaction ---

SELECT department, AVG(job_satisfaction) AS average_satisfaction
FROM hr_data
GROUP BY department
ORDER BY average_satisfaction DESC, department
LIMIT 1;

--- 9. Find the age_band with the highest attrition rate among employees with a specific education level ---

SELECT education, age_band, 
		SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)/ COUNT(*) * 100 AS attrition_rate
FROM hr_data
GROUP BY education, age_band
ORDER BY attrition_rate DESC
LIMIT 1;

--- 10. Find the education level with the highest average job satisfaction among employees who travel frequently ---

SELECT education, AVG(job_satisfaction) AS average_satisfaction
FROM hr_data
WHERE business_travel = 'Travel_Frequently'
GROUP BY education
ORDER BY average_satisfaction DESC
LIMIT 3;

--- 11. Identify the age band with the highest average job satisfaction among married employees ----

SELECT age_band, AVG(job_satisfaction) AS average_satisfaction
FROM hr_data
WHERE marital_status = 'Married'
GROUP BY age_band
ORDER BY average_satisfaction DESC
LIMIT 1;

--- 12. Find employees who have left the company (attrition = 'Yes') ----

SELECT COUNT(emp_no) 
FROM hr_data
WHERE attrition = 'Yes';

--- 13. Count the number of employees by gender ----

SELECT gender, COUNT(emp_no) as `Total Employee`
FROM hr_data
GROUP BY gender;

--- 14. Count the number of employees in each age band ---

SELECT age_band, COUNT(emp_no) as `Total Employee`
FROM hr_data
GROUP BY age_band;

--- 15. List all unique job roles and the number of employees in each ---

SELECT DISTINCT job_role, COUNT(emp_no) AS `Total Employee`
FROM hr_data
GROUP BY job_role;
