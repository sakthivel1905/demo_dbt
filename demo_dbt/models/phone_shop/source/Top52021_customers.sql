with PRODUCT_TABLE as (
    select * from {{ ref('stg_product')}}
),
ORDER_TABLE as (
    select * from {{ ref('stg_order')}}
),
final as (
SELECT PRODUCT_TABLE.PRODUCT_NAME,ORDER_TABLE.ORDER_DATETIME
FROM PRODUCT_TABLE
INNER JOIN ORDER_TABLE
ON PRODUCT_TABLE.PRODUCT_ID=ORDER_TABLE.PRODUCT_ID
WHERE YEAR(ORDER_DATETIME)=2021
ORDER BY ORDER_TABLE.ORDER_AMOUNT DESC LIMIT 5
)

select * from final