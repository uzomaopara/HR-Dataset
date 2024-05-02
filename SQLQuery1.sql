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

  select [Customer ID], Age, [Price per Unit], max([Product Category]) Product
  from [dbo].['retail_sales_dataset - Copy$']
  where [Product Category]='clothing' and [Price per Unit]>30
  group by [Customer ID], [Price per Unit],Age
  order by Age
 