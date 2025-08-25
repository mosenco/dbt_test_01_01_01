SELECT
  off.RestaurantId,
  p.restaurant_info.restaurant_name,
  restaurant_info.groceries_rest_flag,
  p.sales_hierarchy.tm,
  o.OfferPeriod.DayOfWeek,
  dow.weekday_number,
  o.OfferPeriod.RunningDates.From AS offer_start_date,
  o.OfferPeriod.RunningDates.To AS offer_end_date,
  o.QualifyingCriteria.MinimumSpendValue,
  o.OfferType,
  o.ItemLevelDiscount.Discount.DiscountType,
  o.ItemLevelDiscount.Discount.Value AS DiscountValue,
  o.Percent.DiscountAmount AS percent_DiscountAmount,
FROM
  `just-data.production_je_justsaying.restaurantofferscreatedmessage_it_*` AS off,
  UNNEST (Offers) AS o
  INNER JOIN `just-data-warehouse.international_reporting.restaurant_daily_track_it` AS p ON SAFE_CAST(off.RestaurantId AS INT64) = p.rest_id
GROUP BY ALL