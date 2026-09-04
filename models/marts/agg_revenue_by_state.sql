select
    state,
    toStartOfMonth(order_date) as month,
    round(sum(price), 2) as revenue,
    round(sum(freight_value), 2) as freight,
    count(distinct order_id) as orders_count,
    count(distinct customer_unique_id) as customers_count
from {{ ref('fct_order_items') }}
where order_status = 'delivered'
group by
    state,
    month