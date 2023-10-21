/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [ProductKey]
      ,[OrderDateKey]
      ,[DueDateKey]
      ,[ShipDateKey]
      ,[CustomerKey]
      ,[PromotionKey]
      ,[CurrencyKey]
      ,[SalesTerritoryKey]
      ,[SalesOrderNumber]
      ,[SalesOrderLineNumber]
      ,[RevisionNumber]
      ,[OrderQuantity]
      ,[UnitPrice]
      ,[ExtendedAmount]
      ,[UnitPriceDiscountPct]
      ,[DiscountAmount]
      ,[ProductStandardCost]
      ,[TotalProductCost]
      ,[SalesAmount]
      ,[TaxAmt]
      ,[Freight]
      ,[CarrierTrackingNumber]
      ,[CustomerPONumber]
      ,[OrderDate]
      ,[DueDate]
      ,[ShipDate]
  FROM [AdventureWorksDW2017].[dbo].[FactInternetSales]

  Select * from [AdventureWorksDW2017].[dbo].[FactInternetSales]
  Select * from [dbo].[DimCustomer]
               Select FirstName+(' ')+LastName from [dbo].[DimCustomer]
  Select * from [dbo].[DimSalesTerritory]
               Select SalesTerritoryKey, SalesTerritoryRegion from [dbo].[DimSalesTerritory]


Select A.CustomerKey, (B.FirstName+' '+B.LastName) as CustomerName, A.SalesTerritoryKey, A.SalesOrderNumber, A.UnitPrice, A.ExtendedAmount,A.TotalProductCost, A.SalesAmount, (SalesAmount-TotalProductCost) as 'Profit', A.OrderDate, C.SalesTerritoryRegion 
from [AdventureWorksDW2017].[dbo].[FactInternetSales] as A
inner join [dbo].[DimCustomer] as B       on A.CustomerKey=B.CustomerKey
Inner Join [dbo].[DimSalesTerritory] as C  on A.SalesTerritoryKey=C.SalesTerritoryKey      
Where A.CustomerKey= @Customer  --------SCRIPT 1 (CUSTOMERSALESDETAILREPORT2.DS/SEPT REPORTPART) with one parameter modified to fit Report builder laguauge 


SELECT customerkey, SalesAmount from [AdventureWorksDW2017].[dbo].[FactInternetSales]    ---Generaing Total Data

SELECT customerkey, SUM(SalesAmount) from [AdventureWorksDW2017].[dbo].[FactInternetSales]
Group by CustomerKey                  --  Grouping Customer by using SUM

SELECT A.CustomerKey, (B.FirstName+' '+B.LastName) as CustomerName, SUM(A.SalesAmount) as 'TotalSale' from [AdventureWorksDW2017].[dbo].[FactInternetSales] as A
inner join [dbo].[DimCustomer] as B   on A.CustomerKey=B.CustomerKey
Where OrderDate between '2012-01-05' and '2012-12-30'
and SalesTerritoryKey=6
Group by A.CustomerKey, B.FirstName+' '+B.LastName     ---- Adding More parameters using WHERE (Orderdate & SalesTerritoryKey).  NOTE- Puting GROUP BY before WHERE will generate Error
---NOTE: When Using 'GROUP BY',every parameter must be added to the GROUP BY command - except the Agrregate (SUM) function.

SELECT A.CustomerKey, (B.FirstName+' '+B.LastName) as CustomerName, SUM(A.SalesAmount) as 'TotalSale' from [AdventureWorksDW2017].[dbo].[FactInternetSales] as A
inner join [dbo].[DimCustomer] as B   on A.CustomerKey=B.CustomerKey
Where OrderDate between @startdate and @Enddate
and SalesTerritoryKey= @Territory
Group by A.CustomerKey,  B.FirstName+' '+B.LastName    ---- SCRIPT 2 (SALESSUMMARYREPORT.DS/ACCOUNT) - Modifying the Parameters/Commands/Criteria to fit Report Builderlanguaue. Then take Script 1 to Report Builder App.



