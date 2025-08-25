SELECT
    DATE(TimeStamp) as cancelled_date,
    RestaurantId as rest_id,
    deleted_offer_id
FROM
    `just-data.production_je_justsaying.restaurantoffersdeletedmessage_it_*`,
    UNNEST (OfferIds) AS deleted_offer_id
WHERE
    DATE(TimeStamp) <= @END_DATE