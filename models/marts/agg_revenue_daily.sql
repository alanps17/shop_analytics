select
    order_date,
    category,
    round(sum(price), 2) as revenue,
    count(distinct order_id) as orders_count
from {{ ref('fct_order_items') }}
where order_status = 'delivered'
group by
    order_date,
    category