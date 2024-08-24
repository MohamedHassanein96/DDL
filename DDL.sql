--
create database company

go 
create schema persons
go
use company
go

--•	Create a table named "Employees" with columns for ID (integer), Name (varchar), and Salary (decimal).
create table persons.Employees
(
ID int primary key,
Name varchar,
Salary decimal)
go 
--•	Add a new column named "Department" to the "Employees" table with data type varchar(50).
alter table persons.Employees
add Department varchar(50);
go  
---•	Remove the "Salary" column from the "Employees" table.
alter table persons.Employees
drop column Salary;
go 





create schema object;

--•	Create a new table called "Projects" with columns for ProjectID (integer) and ProjectName (varchar).
create table object.Projects
(
ProjectID int,
ProjectName  varchar(50))


alter table object.Projects
alter column  ProjectID INT NOT NULL;


--•	Add a primary key constraint to the "Employees" table for the "ID" column.
alter table object.Projects
add constraint pk_ProjectID primary key (ProjectID);

--•	Create a foreign key relationship between the "Employees" table (referencing "ID") and the "Projects" table (referencing "ProjectID").
alter table persons.Employees
add constraint fk_Employe_ID FOREIGN KEY(ID) REFERENCES object.Projects(ProjectID)


--•	Remove the foreign key relationship between "Employees" and "Projects."
alter table persons.Employees
Drop constraint fk_Employe_ID


--•	Add a unique constraint to the "Name" column in the "Employees" table.
alter table persons.Employees
add constraint UN_Name Unique (name)


---•	Create a table named "Customers" with columns for CustomerID (integer), FirstName (varchar), LastName (varchar), and Email (varchar), and Status (varchar).
create table  persons.Customers
( customer_ID INT ,
FName varchar(50),
LName varchar(50),
Email varchar(50),
Status varchar(50))
go 

--•	Add a unique constraint to the combination of "FirstName" and "LastName" columns in the "Customers" table.

Alter  table  persons.Customers
add constraint UN_Full_Name unique (FName,LName)

--

Alter  table  persons.Customers
alter column  Status  varchar NOT NULL;

--•	Add a default value of 'Active' for the "Status" column in the "Customers" table, where the default value should be applied when a new record is inserted.
Alter  table  persons.Customers
add constraint DF_Status default 'Active' for  Status;
  
  --•	Create a table named "Orders" with columns for OrderID (integer), CustomerID (integer), OrderDate (datetime), and TotalAmount (decimal).
create table object.Orders 
(
OrderID int,
CustomerID  int ,
OrderDate  datetime2,
TotalAmount decimal)


--	Add a check constraint to the "TotalAmount" column in the "Orders" table to ensure that it is greater than zero.
alter table object.Orders 
add constraint Check_TotalAmount Check   (TotalAmount >0);

---•	Create a schema named "Sales" and move the "Orders" table into this schema.
create schema Sales;


--	Rename the "Orders" table to "SalesOrders."
ALTER SCHEMA Sales TRANSFER OBJECT::object.Orders

EXEC sp_rename 'Sales.Orders', 'SalesOrders'

--•	Rename the "Department" column in the "Employees" table to "DeptName".
EXEC sp_rename 'Persons.Employees.Department', 'DeptName', 'Column';


