{{ config(
    engine='MergeTree()',
    order_by='(order_date, state, category)',
    partition_by='toYYYYMM(order_date)'
) }}

select
    order_date,
    assumeNotNull(state) as state,
    category,
    round(sum(price), 2) as revenue,
    round(sum(freight_value), 2) as freight,
    count(distinct order_id) as orders_count,
    count(distinct customer_unique_id) as customers_count,
    count(*) as items_count
from {{ ref('fct_order_items') }}
where order_status = 'delivered'
group by
    order_date,
    state,
    category