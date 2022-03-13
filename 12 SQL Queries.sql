--TASK DAY-2 [MUKUL SHARMA]

--USE [mukul.sharma] DATABASE
USE [mukul.sharma]

--CREATE Employee TABLE 
CREATE TABLE Employee(
EmpId INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
EmpName VARCHAR(50) NOT NULL,
EmpSalary DECIMAL(10,2) NOT NULL,
EmpJoiningDate DATE NOT NULL,
DepartmentId INT FOREIGN KEY REFERENCES Department(DepartmentId))

--INSERT VALUES IN Employee
INSERT INTO Employee(
EmpName,
EmpSalary,
EmpJoiningDate,
DepartmentId
)
VALUES
('Mukul Sharma',50000,'2021-01-03',1),
('Dilip Upadyay',70000,'2021-02-03',1),
('Ashish Mehra',25000,'2021-03-03',1),
('Sanchit Chaudhary',20000,'2021-04-03',1),
('Varun Nayak',30000,'2021-04-03',2),
('Tej Varma',20000,'2021-05-03',2),
('Anuj Kori',15000,'2021-06-03',3),
('Raam Sharma',80000,'2022-05-03',4),
('Aman Kumar',65000,'2022-06-03',4)

--CREATE Department TABLE
CREATE TABLE Department(
DepartmentId INT PRIMARY KEY,
DepartmentName VARCHAR(50))
SELECT * FROM Department

--INSERT RECORD INTO Department TABLE
INSERT INTO Department(DepartmentId,DepartmentName)
VALUES
(1,'JAVA'),(2,'.NET'),(3,NULL),(4,NULL)

DROP TABLE Employee
DROP TABLE Department

--SELECT QUERY FOR Employee TABLE
SELECT * FROM Employee



--1)write down SQL query to print employee Name, ID, Salary & Join Date who are working in ".NET" department.
SELECT EmpName,EmpId,EmpSalary,EmpJoiningDate FROM Employee
WHERE DepartmentId=(SELECT DepartmentId FROM Department WHERE  DepartmentName='.NET')
SELECT * FROM Employee

--2)write down SQL query to print DepartmentId and Total number of employees who are working in that department i.e DepartmentId, TotalEmployeeCount
SELECT DepartmentId AS DepartmentId, count(EmpName) AS TotalEmployeeCount FROM Employee
GROUP BY DepartmentId


--3)write down SQL query to print DepartmentId and Total number of employees who are working in that department NOTE: Print the Only DepartmentId that are having more than 3 Employees i.e DepartmentId, TotalEmployeeCount
SELECT DepartmentId AS DepartmentId, COUNT(EmpName) AS TotalEmployeeCount FROM Employee
GROUP BY DepartmentId
HAVING COUNT(*) > 3

--4)write down SQL query to print the employees in order to their salary Highest to Lowest.
SELECT EmpName,EmpSalary FROM Employee 
ORDER BY EmpSalary DESC 
SELECT * FROM Employee


--5)write down SQL query to print TOP 5 highest salaried employee. 
SELECT TOP 5 EmpName FROM Employee 
ORDER BY EmpSalary DESC
SELECT * FROM Employee

----6)write down SQL query to print only "JAVA" departments employees who have joined within Jan 2021 to Dec 2021
SELECT EmpName,EmpJoiningDate FROM Employee
WHERE (EmpJoiningDate BETWEEN '2021-01-01' AND '2021-12-31') AND DepartmentId=(SELECT DepartmentId FROM Department 
WHERE DepartmentName='JAVA')
SELECT * FROM Employee

--7)write down SQL query to print employee who is working in .net and java department
SELECT EmpName FROM Employee
WHERE DepartmentId=(SELECT DepartmentId FROM Department where DepartmentName='.NET' ) 
OR DepartmentId=(SELECT DepartmentId FROM Department where DepartmentName='JAVA' )
SELECT * FROM Employee
SELECT * FROM Department

--8)write down SQL query to print employees whose not working in .net and whose salary is 20000 or more
SELECT EmpName,EmpSalary FROM Employee
WHERE NOT DepartmentId=(SELECT DepartmentId FROM Department WHERE DepartmentName='.NET') 
AND EmpSalary >=20000
SELECT * FROM Employee

--9)write down SQL query to print employees who have no department assigned And they are joined by the Year 2022
SELECT EmpName FROM Employee
WHERE DepartmentId=(SELECT DepartmentId FROM Department WHERE DepartmentName=NULL) AND 
EmpJoiningDate LIKE '2022%'


--10)write down SQL query to print the ".NET" department employees 1. Maximum salary, 2. Minimum salary & 3. Total Employee
SELECT MAX(EmpSalary) AS MAX_SALARY,MIN(EmpSalary) AS MIN_SALARY,COUNT(EmpName) AS TOTAL_EMPLOYEES FROM Employee
WHERE DepartmentId=(SELECT DepartmentId FROM Department WHERE DepartmentName= '.NET')
SELECT * FROM Employee

--11)write down SQL query to print department vise Average salary. Here Column should display like DepartmentId & AverageSalary

SELECT DepartmentId,AVG(EmpSalary) AS AVERAGE_SALARY FROM Employee 
GROUP BY DepartmentId
SELECT * FROM Employee

--12)write down SQL query to print total salary of "Java" and ".NET" department
SELECT DepartmentId,SUM(EmpSalary) AS TOTALSALARY FROM Employee
WHERE (DepartmentId=(SELECT DepartmentId FROM Department  WHERE DepartmentName='JAVA') OR
DepartmentId=(SELECT DepartmentId FROM Department WHERE DepartmentName='.NET'))
GROUP BY DepartmentId
SELECT * FROM Employee


