SELECT TOP (1000) [Transaction ID]
      ,[Date]
      ,[Customer ID]
      ,[Gender]
      ,[Age]
      ,[Product Category]
      ,[Quantity]
      ,[Price per Unit]
      ,[Total Amount]
  FROM [Data Analysis Class].[dbo].['retail_sales_dataset - Copy$']

  select COUNT ([Customer ID])CustomerID, [Product Category], Quantity
  from [dbo].['retail_sales_dataset - Copy$']
  group by [Product Category], Quantity
  having COUNT ([Customer ID])>90

  select  [Customer ID], SUM([Price per Unit]) AS Price, Age
  from [dbo].['retail_sales_dataset - Copy$']
  group by [Customer ID], Age
  having Age>20
  order by Price


  select [Customer ID], Gender, MAX (Quantity) over (partition by Gender) max_per_quantity
  from [dbo].['retail_sales_dataset - Copy$']

  select Gender, MAX(Quantity)
  from [dbo].['retail_sales_dataset - Copy$']
  Group by Gender

  select [Customer ID], max(Age) Age, [Product Category], min(Quantity) QTY, [Price per Unit]
  from [dbo].['retail_sales_dataset - Copy$']
  group by [Customer ID], [Product Category], [Price per Unit]
  having [Price per Unit]<50
  
  select [Customer ID], avg(Quantity) QTY, [Product Category] , Gender
  from [dbo].['retail_sales_dataset - Copy$']
  group by [Customer ID], [Gender],[Product Category]
 order by [Customer ID] desc 