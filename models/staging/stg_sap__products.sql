with 
    source_products as (
        select
            cast(productid as int) as product_sk
            , cast(name as string) as product_name
            , cast(productnumber as string) as product_number
            , cast(makeflag as boolean) as make_flag
            , cast(finishedgoodsflag as boolean) as finished_goods_flag
            , cast(color as string) as color
            , cast(safetystocklevel as int) as safety_stock_level
            , cast(reorderpoint as int) as reorder_point
            , cast(standardcost as float64) as standard_cost
            , cast(listprice as float64) as list_price
            , cast(size as string) as size
            , cast(sizeunitmeasurecode as string) as size_unit_measure_code
            , cast(weightunitmeasurecode as string) as weight_unit_measure_code
            , cast(weight as float64) as weight
            , cast(daystomanufacture as int)  as days_to_manufacture
            , cast(productline as string) as product_line
            , cast(class as string) as class
            , cast(style as string) as style
            , cast(productsubcategoryid as int) as product_subcategory_fk
            , cast(productmodelid as int) as product_model_id
            , cast(sellstartdate as string) as sell_start_date
            , cast(sellenddate as string) as sell_end_ddate
            , cast(discontinueddate as string) as discontinued_date
            , cast(rowguid as string) as row_guid
            , cast(modifieddate as string) as modified_date

        from {{ source('sap_adw', 'product') }}
    )
   
select * 
from source_products
order by product_sk
