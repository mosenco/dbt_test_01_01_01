{{ config(materialized='table') }}

select 
    order_id_local,
    order_date_local
from just-data-warehouse.international_reporting.it_dwh_order
where payment.oos_refund > 0