/* PART 1: SELECTING ALL THE DATA */
with
    products as(
        select
            product_sk
            , product_name
            , product_number
            , color
            , product_subcategory_fk
        from {{ ref('stg_sap__products') }}
    )

    , products_categories as(
        select
            product_category_sk
            , category_name
        from {{ ref('stg_sap__products_category') }}
    )

    , products_subcategories as(
        select
            product_subcategory_sk
            , product_category_fk
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
            on  products.product_subcategory_fk = products_subcategories.product_subcategory_sk
        left join products_categories
            on products_subcategories.product_category_fk = products_categories.product_category_sk

    )

select *
from joined_tables
order by product_sk