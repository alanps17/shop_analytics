select
    oi.order_id as order_id,
    oi.order_item_id,
    oi.product_id as product_id,
    oi.seller_id,
    o.customer_id,
    c.customer_unique_id,

    o.order_status,
    toDate(o.order_purchase_ts) as order_date,
    o.order_purchase_ts,
    o.order_delivered_customer_ts,

    coalesce(nullif(p.product_category_name, ''), 'unknown') as category,
    c.customer_city as city,
    c.customer_state as state,

    oi.price,
    oi.freight_value,
    round(oi.price + oi.freight_value, 2) as total_value

from {{ ref('stg_order_items') }} as oi

left join {{ ref('stg_orders') }} as o
    on o.order_id = oi.order_id

left join {{ ref('stg_products') }} as p
    on p.product_id = oi.product_id

left join {{ ref('stg_customers') }} as c
    on c.customer_id = o.customer_id