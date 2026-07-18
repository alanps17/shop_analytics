with numbered as (
select
    customer_id,
    name,
    nullif(email, '') as email,
    city,
    registered_at,
    row_number() over (partition by email order by registered_at) as row_num
from shop_analytics.customers
)
select
    customer_id,
    name,
    email,
    city,
    registered_at
from numbered
where row_num = 1