SELECT
  order_date_local,
  restaurant_id_local,
  ol.product_name,
  ol.net_amount
FROM
  `just-data-warehouse.international_reporting.it_dwh_order`,
  UNNEST (order_line) ol
WHERE
  order_status.order_status_good IS TRUE
  AND ol.product_name IS NOT NULL
