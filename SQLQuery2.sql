SELECT TOP (1000) [account]
      ,[sector]
      ,[year_established]
      ,[revenue]
      ,[employees]
      ,[office_location]
      ,[subsidiary_of]
  FROM [Data Analysis Class].[dbo].[accounts$]
  

  select sector, office_location, SUM(revenue) over (partition by sector) revenue_per_sec
  from [dbo].[accounts$]
  

  select sector, office_location, SUM(revenue) Revenue 
  from [dbo].[accounts$]
  group by sector, office_location
  having office_location='United states'

  -- partition
  select account, sector, COUNT(year_established) over (partition by sector) secotor_year
  from [dbo].[accounts$]

  -- rank
  select account, sector,revenue, RANK() over (partition by sector order by revenue )  secotor_year
  from [dbo].[accounts$]

  -- dense_rank
  select account, sector,revenue, Dense_RANK() over (partition by sector order by revenue )  secotor_year
  from [dbo].[accounts$]

  -- row number
  select account, sector,revenue, Row_number() over (partition by sector order by revenue )  secotor_year
  from [dbo].[accounts$]

  select account, sector,revenue, Row_number() over (partition by account order by account )  secotor_year
  from [dbo].[accounts$]
