with 
    source_categories as (
        select
            cast(productcategoryid as int) as product_category_sk
            , cast(name as string) as category_name
            , cast(rowguid as string) as row_guid
            , cast(modifieddate as string) as modified_date

        from {{ source('sap_adw', 'productcategory') }}
    )
   
select * 
from source_categories