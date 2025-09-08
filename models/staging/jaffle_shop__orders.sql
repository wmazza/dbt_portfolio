with orders as (
    select 
        *
    from {{ source("jaffle_shop", "orders") }}

)
select * from orders