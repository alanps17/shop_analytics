select
    order_id,
    customer_id,
    order_status,
    toDateTimeOrNull(order_purchase_timestamp) as order_purchase_ts,
    toDateTimeOrNull(order_approved_at) as order_approved_ts,
    toDateTimeOrNull(order_delivered_carrier_date) as order_delivered_carrier_ts,
    toDateTimeOrNull(order_delivered_customer_date) as order_delivered_customer_ts,
    toDateTimeOrNull(order_estimated_delivery_date) as order_estimated_delivery_ts
from shop_analytics.orders_raw