SELECT TOP (1000) [order_id]
      ,[payment_sequential]
      ,[payment_type]
      ,[payment_installments]
      ,[payment_value]
  FROM [Data Analysis Class].[dbo].[olist_order_payments_dataset#cs$]
  
  --orders paid for twice
  select order_id, COUNT(*) duplicate, payment_value
  from [dbo].[olist_order_payments_dataset#cs$]
  group by order_id, payment_value
  having COUNT(*)>1

  --find payment method having issues
  select payment_sequential,payment_type
  from[dbo].[olist_order_payments_dataset#cs$]
  where payment_sequential>1 
  order by payment_sequential desc
  
  --Assignment
  --count the different payment methods
  --try other joins


  --invoice paid for with full join
  select *
  from [dbo].[olist_order_payments_dataset#cs$] PD
  full join[dbo].[olist_orders_dataset#csv$] OD
  ON PD.order_id = OD.order_id
  WHERE order_status='invoiced'

  --count invoice that was paid
  select *
  from [dbo].[olist_order_payments_dataset#cs$] PD    --left table
  left join [dbo].[olist_orders_dataset#csv$] OD      --right table
  ON PD.order_id = OD.order_id
  WHERE order_status = 'invoiced' and payment_value is not null
  
  select payment_type, COUNT(*) Duplicates 
  from [dbo].[olist_order_payments_dataset#cs$]
  group by payment_type
  having count(*) >1

  select *
  from [dbo].[olist_order_payments_dataset#cs$] PD
  full join [dbo].[olist_orders_dataset#csv$] OD
  on  PD.order_id = OD.order_id

  select *
  from [dbo].[olist_order_payments_dataset#cs$] PD
  full join [dbo].[olist_orders_dataset#csv$] OD
  on  PD.order_id = OD.order_id
  where order_status = 'delivered' and PD.payment_value IS NOT NULL



WITH Invoice_table as (
SELECT OD.order_id,PD.payment_type, OD.order_status
CASE 
WHEN OD.order_status = 'invoiced' and PD.payyment_type= 'credit_card' then 'INVOICE PAID'
WHEN OD.order_status = 'invoiced' and PD.payyment_type= 'boleto' then 'INVOICE PAID'
WHEN OD.order_status = 'invoiced' and PD.payyment_type= 'voucher' then 'INVOICE PAID'
WHEN OD.order_status = 'invoiced' and PD.payyment_type= 'credit_card' then 'INVOICE PAID'
WHEN OD.order_status = 'invoiced' and PDpayyment_type= 'not_defined' then 'INVOICE PAID'
else 'invoice_not_paid'
end final dayyy opor
FROM [dbo].[olist_order_payments_dataset#cs$] PD
FULL JOIN [dbo].[olist_orders_dataset#csv$]  OD
on PD.order_id = OD.order_id
)
select Invoice_Status
from invoice_table
where invoice_status = 'invoice paid'

