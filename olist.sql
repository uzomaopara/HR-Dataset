SELECT TOP (1000) [order_id]
      ,[customer_id]
      ,[order_status]
      ,[order_purchase_timestamp]
	  ,[order_approved_datetime]
      ,[order_delivered_carrier_date]
      ,[order_delivered_customer_date]
      ,[order_estimated_delivery_date]
  FROM [Data Analysis Class].[dbo].[olist_orders_dataset#csv$]

      

  --data cleaning
  select order_id, COUNT(*) duplicate_count
  from [dbo].[olist_orders_dataset#csv$]
  group by order_id
  having COUNT(*)>1

  --when using group by the filter is having

  select customer_id, COUNT(*) duplicate_count
  from [dbo].[olist_orders_dataset#csv$]
  group by customer_id
  having COUNT(*)>1

  --checking for null values
  select 'order_id' column_name, COUNT(*) null_vaalues
  from [dbo].[olist_orders_dataset#csv$]
  group by order_id
  having order_id is null 
  union 
  select 'customer_id', COUNT(*) duplicate_count
  from [dbo].[olist_orders_dataset#csv$]
  group by customer_id
  having customer_id is null
  union
   select 'order_approved_datetime', COUNT(*) duplicate_count
  from [dbo].[olist_orders_dataset#csv$]
  group by order_approved_datetime
  having order_approved_datetime is null
  union
   select 'order_delivered_carrier_date', COUNT(*) duplicate_count
  from [dbo].[olist_orders_dataset#csv$]
  group by order_delivered_carrier_date
  having order_delivered_carrier_date is null
  union
   select 'order_delivered_customer_date', COUNT(*) duplicate_count
  from [dbo].[olist_orders_dataset#csv$]
  group by order_delivered_customer_date
  having order_delivered_customer_date is null
  union
   select 'order_estimated_delivery_date', COUNT(*) duplicate_count
  from [dbo].[olist_orders_dataset#csv$]
  group by order_estimated_delivery_date
  having order_estimated_delivery_date is null

  --datediff
  select order_id, order_delivered_carrier_date, order_delivered_customer_date, order_status,
CONCAT(ABS( DATEDIFF(year,order_delivered_carrier_date,order_delivered_customer_date)%12),'Year:',
 ABS( DATEDIFF(day,order_delivered_carrier_date,order_delivered_customer_date)%30),'Days:',
 ABS( DATEDIFF(hour,order_delivered_carrier_date,order_delivered_customer_date)%24),'Hours:',
 DATEDIFF(minute,order_delivered_carrier_date,order_delivered_customer_date)%60,'Minutes:',
 DATEDIFF(SECOND,order_delivered_carrier_date,order_delivered_customer_date)%60,'Seconds')Time_Difference
 from [dbo].[olist_orders_dataset#csv$]
 order by Time_Difference desc

  --sub query
  select order_status, Time_Difference
  from 
 (select order_id, order_delivered_carrier_date, order_delivered_customer_date, order_status,
CONCAT(ABS( DATEDIFF(year,order_delivered_carrier_date,order_delivered_customer_date)%12),'Year:',
 ABS( DATEDIFF(day,order_delivered_carrier_date,order_delivered_customer_date)%30),'Days:',
 ABS( DATEDIFF(hour,order_delivered_carrier_date,order_delivered_customer_date)%24),'Hours:',
 DATEDIFF(minute,order_delivered_carrier_date,order_delivered_customer_date)%60,'Minutes:',
 DATEDIFF(SECOND,order_delivered_carrier_date,order_delivered_customer_date)%60,'Seconds')Time_Difference
 from [dbo].[olist_orders_dataset#csv$])as Time_difference_table
 group by order_status, Time_Difference

 --assignment
 --orders that were cancelled and also delivered

SELECT order_status, customer_id
FROM [dbo].[olist_orders_dataset#csv$]
WHERE order_status IN ('delivered', 'canceled')
GROUP BY order_status, customer_id

--approved orders but customers did not get

SELECT order_status, customer_id, order_delivered_customer_date, COUNT(*) AS null_values
FROM  [dbo].[olist_orders_dataset#csv$]
WHERE order_status = 'approved' AND order_delivered_customer_date IS NULL
GROUP BY order_status, customer_id, order_delivered_customer_date

--cancelled, carrier got it but was not delivered
SELECT order_status, customer_id,order_delivered_carrier_date, order_delivered_customer_date, COUNT(*) AS null_values
FROM  [dbo].[olist_orders_dataset#csv$]
WHERE order_status = 'cancelled' AND order_delivered_customer_date IS NULL
GROUP BY order_status, customer_id,order_delivered_carrier_date, order_delivered_customer_date