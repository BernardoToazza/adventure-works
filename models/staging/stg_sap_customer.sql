with 
    source_customer as (
        select
            customerid as customer_id
            , personid as person_id
            , storeid as store_id
            , territoryid as territory_id
            , rowguid
            , modifieddate

        from {{ source('sap_adw', 'customer') }}
    )
   
select * 
from source_customer