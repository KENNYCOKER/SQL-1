SECTION A (SQL)

---SECTION A   EXERCISE 1
Create database HumanResources

Create table [Employee]
(
employee_id int not null,
full_name nvarchar(50),
manager_id int,
date_of_hire datetime
)

create table [EmployeeSalary]
(
employee_id int not null,
salary money
)

create table [changelog]
(
table_name nvarchar(50) not null,
column_name nvarchar(50) not null,
old_value nchar(2000),
new_value nchar(2000),
modified_date datetime not null,
Modified_by nvarchar(50) not null
)

Insert into [Employee]
(employee_id, full_name, manager_id, date_of_hire)
Values 
('121', 'John Doe', '321', '1/31/2014'), 
('321', 'Jane Doe', '987', '1/30/2015'),
('421', 'Alice Jones', '875', '11/27/2016');


Insert into [EmployeeSalary]
(employee_id, salary)
Values 
('121', '8000'), 
('321', '9000'),
('421', '6000');


SELECT * FROM [dbo].[Employee]
SELECT * FROM [dbo].[EmployeeSalary]

SELECT A.employee_id, B.salary, A.date_of_hire FROM [dbo].[Employee] as A
inner join [dbo].[EmployeeSalary] as B
on A.employee_id=B.employee_id


---SECTION A - EXERCISE 2 (TO BE REVIEWED)
SELECT A.full_name, B.salary, A.manager_id as 'Manager Name', B.salary as 'Manager Salary' FROM [dbo].[Employee] as A
inner join [dbo].[EmployeeSalary] as B
on A.employee_id=B.employee_id


---SECTION B (SQL & SSRS)  USING ADVENTUREWORKSDW2017
Select top 3 * from [dbo].[FactResellerSales]
Select top 3 * from [dbo].[DimProduct]
Select top 3 * from [dbo].[DimReseller]
Select top 3 * from [dbo].[DimEmployee]
Select ResellerName from [dbo].[DimReseller] order by ResellerName Asc
Select OrderDateKey from [dbo].[FactResellerSales] order by OrderDateKey Asc

Select ProductKey, SalesOrderNumber, ResellerKey, OrderQuantity, UnitPrice, SalesAmount, OrderDateKey, ShipDateKey, EmployeeKey from [dbo].[FactResellerSales]
Select top 3 ProductKey, EnglishProductName from [dbo].[DimProduct]
Select top 3 ResellerKey, ResellerName from [dbo].[DimReseller]
Select top 3 EmployeeKey, FirstName, LastName from [dbo].[DimEmployee]

Select C.ResellerName, A.SalesOrderNumber, B.EnglishProductName, A.OrderQuantity,UnitPrice, SalesAmount from [dbo].[FactResellerSales] as A
inner join [dbo].[DimReseller] as C
on A.ResellerKey=C.ResellerKey
inner join [dbo].[DimProduct] as B
on A.Productkey = B.Productkey
where shipdatekey BETWEEN 20110101 and 20111201

---SECTION B1 I
Select C.ResellerName as 'Reseller Name', A.SalesOrderNumber as 'Sales Order Number', B.EnglishProductName as 'Product Name', A.OrderQuantity as 'Qty',UnitPrice as 'Unit Amount', SalesAmount as 'Total Amount' from [dbo].[FactResellerSales] as A
inner join [dbo].[DimReseller] as C
on A.ResellerKey=C.ResellerKey
inner join [dbo].[DimProduct] as B
on A.Productkey = B.Productkey
where shipdatekey BETWEEN 20110101 and 20111231

---SECTION B1 III
Select A.SalesOrderNumber as 'Sales Order Number', C.ResellerName as 'Reseller Name', A.OrderQuantity as 'Qty', UnitPrice as 'Unit Amount', SalesAmount as 'Total Amount', OrderDateKey as 'Order Date' from [dbo].[FactResellerSales] as A
inner join [dbo].[DimReseller] as C
on A.ResellerKey=C.ResellerKey
where shipdatekey BETWEEN 20110101 and 20110731
Where ResellerName = @Tresellername


Select B.FirstName, B.LastName, SalesAmount as 'Total Sales' from [dbo].[FactResellerSales] as A
inner join [dbo].[DimEmployee] as B
on A.EmployeeKey= B.EmployeeKey
where shipdatekey BETWEEN 20110101 and 20111231


---SECTION B1 V
Select B.FirstName + ' ' + B.LastName as 'Employee Name', SalesAmount as 'Total Sales' from [dbo].[FactResellerSales] as A
inner join [dbo].[DimEmployee] as B
on A.EmployeeKey= B.EmployeeKey
where shipdatekey BETWEEN 20110101 and 20111231


---SECTION C1
Select * from [dbo].[FactInternetSales]
Select * from [dbo].[DimCustomer]
Select * from [dbo].[DimProduct]
Select * from [dbo].[DimSalesTerritory]
Select * from [dbo].[DimDate]

SELECT [ProductKey]
      ,[OrderDateKey]
      ,[DueDateKey]
      ,[ShipDateKey]
      ,[CustomerKey]
      ,[CurrencyKey]
      ,[SalesTerritoryKey]
      ,[SalesOrderNumber]
      ,[UnitPrice]
      ,[ExtendedAmount]
      ,[ProductStandardCost]
      ,[TotalProductCost]
      ,[SalesAmount]
      ,[TaxAmt]
      ,[Freight]
      ,[OrderDate]
      ,[DueDate]
      ,[ShipDate]
  FROM [AdventureWorksDW2017].[dbo].[FactInternetSales]


  SELECT [CustomerKey]
      ,B.[StateProvinceName]
      ,([FirstName]+ ' '+ [LastName]) as CustomerName
      ,[BirthDate]
      ,[MaritalStatus]
      ,[Gender]
      ,[EmailAddress]
      ,[YearlyIncome]
      ,[TotalChildren]
      ,[NumberChildrenAtHome]
      ,[EnglishEducation]
      ,[EnglishOccupation]
      ,[NumberCarsOwned]
      ,[AddressLine1]
      ,[DateFirstPurchase]
  FROM [AdventureWorksDW2017].[dbo].[DimCustomer] as A
  Inner join [dbo].[DimGeography] as B 
  on A.Geographykey = B.GeographyKey


SELECT [ProductKey]
      ,[ProductAlternateKey]
      ,[EnglishProductName]
      ,[SafetyStockLevel]
      ,[DaysToManufacture]
      ,[EnglishDescription]
      ,[StartDate]
    FROM [AdventureWorksDW2017].[dbo].[DimProduct]

SELECT [SalesTerritoryKey]
      ,[SalesTerritoryRegion]
      ,[SalesTerritoryCountry]
      ,[SalesTerritoryGroup]
  FROM [AdventureWorksDW2017].[dbo].[DimSalesTerritory]


SELECT [DateKey]
      ,[FullDateAlternateKey]
      ,[DayNumberOfWeek]
      ,[EnglishDayNameOfWeek]
      ,[DayNumberOfMonth]
      ,[DayNumberOfYear]
      ,[WeekNumberOfYear]
      ,[EnglishMonthName]
      ,[MonthNumberOfYear]
      ,[CalendarQuarter]
      ,[CalendarYear]
      ,[CalendarSemester]
      ,[FiscalQuarter]
      ,[FiscalYear]
      ,[FiscalSemester]
  FROM [AdventureWorksDW2017].[dbo].[DimDate]






Select  C.ResellerName, SalesOrderNumber,B.EnglishProductName as 'Product Name', OrderQuantity,UnitPrice, SalesAmount from [dbo].[FactResellerSales] AS A
inner join [dbo].[DimReseller] AS C
on A.Resellerkey=C.ResellerKey
inner join [dbo].[DimProduct] AS B
on A.ProductKey=B.ProductKey
WHERE ShipDateKey BETWEEN 20110101 AND 20111230


Select SalesOrderNumber, C.ResellerName,B.EnglishProductName as 'Product Name', OrderQuantity,UnitPrice, SalesAmount, OrderDateKey from [dbo].[FactResellerSales] AS A
inner join [dbo].[DimReseller] AS C
on A.Resellerkey=C.ResellerKey
inner join [dbo].[DimProduct] AS B
on A.ProductKey=B.ProductKey
WHERE ShipDateKey BETWEEN 20110101 AND 20110730

Select FirstName +' '+ LastName as 'Employee Name',SalesAmount from [dbo].[FactResellerSales] as A
inner join[dbo].[DimEmployee] as B
on A.EmployeeKey = B.EmployeeKey
WHERE ShipDateKey BETWEEN 20110101 AND 20111230



