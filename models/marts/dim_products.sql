select
    p.product_id,
    coalesce(nullif(p.product_category_name, ''), 'unknown') as category,
    coalesce(nullif(t.product_category_name_english, ''), 'unknown') as category_en,
    p.product_photos_qty,
    p.product_weight_g,
    p.product_length_cm,
    p.product_height_cm,
    p.product_width_cm

from {{ ref('stg_products') }} as p

left join {{ ref('stg_category_translation') }} as t
    on t.product_category_name = p.product_category_name