SELECT  
  restaurant.restaurant_id_local,
  restaurant.group_restaurant_id,
  restaurant.restaurant_name,
  restaurant.partner_type,
  restaurant.partner_category,
  cuisine,
FROM 
  `just-data-warehouse.international_reporting.it_dwh_partner`
WHERE
  chain.chain = 'Branded'
GROUP BY ALL