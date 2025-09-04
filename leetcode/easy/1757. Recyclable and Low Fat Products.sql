# Write your MySQL query statement below
SELECT
    product_id
FROM
    Products
WHERE
    -- low_fats = 'Y' and recyclable = 'Y'
    'N' NOT IN (low_fats, recyclable)