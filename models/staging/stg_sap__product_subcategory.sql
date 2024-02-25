with 
    source_subcategories as (
        select
            cast(productsubcategoryid as int) as product_subcategory_id
            , cast(productsubcategoryid as int) as product_category_id
            , cast(name as string) as subcategory_name
            , cast(rowguid as string) as row_guid
            , cast(modifieddate as string) as modified_date
        from {{ source('sap_adw', 'productsubcategory') }}
    )
   
select * 
from source_subcategories