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

  --This is for or operator
  select [Transaction ID],[Product Category],Age, Gender
  from [dbo].['retail_sales_dataset - Copy$']
  where Gender='Male' or Age

  --This is for and operator
  select [Customer ID],Age,[Price per Unit],Gender
  from [Data Analysis Class].[dbo].['retail_sales_dataset - Copy$']
  where Age>25 and [Price per Unit]=50

  --This is for in operator
  select [Customer ID],Gender, [Product Category]
  from [dbo].['retail_sales_dataset - Copy$'] 
  where [Product Category] in ('Beauty', 'Clothing')

  --This is for not in operator
  select [Customer ID],Gender, [Product Category]
  from [dbo].['retail_sales_dataset - Copy$'] 
  where [Product Category] not in ('Beauty', 'Clothing')

  --This is for between operator
  --between operator is for values
  select [Customer ID],Gender,Age,[Product Category],[Price per Unit]
  from [dbo].['retail_sales_dataset - Copy$']
  where [Price per Unit] between 20 and 50