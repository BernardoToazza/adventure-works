with
    int_produtos as (
        select *
        from {{ ref('int_enriched_products') }}
    )

select *
from int_produtos