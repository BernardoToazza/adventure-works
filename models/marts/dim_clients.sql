/* PART 1: SELECTING ALL THE DATA */
with
    person as(
        select
        businessentityid as id_business_entity
        , persontype as person_type
        , namestyle as name_style
        , title 
        , firstname as first_name
        , lastname as last_name
        , suffix
        , emailpromotion as email_promotion
        , additionalcontactinfo as additional_contact_info
        , demographics
            
        from {{ ref('person') }}
    )

    , products_categories as(
        select
            product_category_id
            , category_name
        from {{ ref('stg_sap__products_category') }}
    )

    , products_subcategories as(
        select
            product_subcategory_id
            , product_category_id
            , subcategory_name
        from {{ ref('stg_sap__product_subcategory') }}

    )
/* PART 2: JOINING ALL THE TABLES */

    , joined_tables as(
        select
            /*ID's */
            products.product_sk
            , products_subcategories.product_subcategory_sk
            , products_categories.product_category_sk
            /*Names */
            , products.product_name
            , products.product_number
            , products_categories.category_name
            , products_subcategories.subcategory_name
            /*Characteristics */
            , products.color
        from products
        left join products_subcategories
            on  products.product_subcategory_id = products_subcategories.product_subcategory_id
        left join products_categories
            on products_subcategories.product_category_id = products_categories.product_category_id

    )

select *
from joined_tables
order by product_id