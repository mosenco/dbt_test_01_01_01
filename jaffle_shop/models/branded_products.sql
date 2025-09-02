WITH
  branded_partners AS (
    SELECT
      *
    FROM
      {{ ref ('stg_chain_partners') }}
  ),
  product_list AS (
    SELECT
      *
    FROM
      {{ ref ('stg_product_name') }}
  ),
  branded_product_2025 AS (
    SELECT
      restaurant_name,
      product_name,
      COALESCE(net_amount, 0.0) as net_amount
    FROM
      product_list p
    INNER JOIN branded_partners b USING (restaurant_id_local)
    WHERE
      order_date_local >= '2025-01-01'
    GROUP BY
        ALL
  )
SELECT
  *
FROM
  branded_product_2025
