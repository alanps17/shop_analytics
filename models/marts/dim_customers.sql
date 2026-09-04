select
    customer_unique_id,
    any(customer_city) as city,
    any(customer_state) as state,
    any(customer_zip_code_prefix) as zip_prefix,
    count(*) as orders_count
from {{ ref('stg_customers') }}
group by customer_unique_id