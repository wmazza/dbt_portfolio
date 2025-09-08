with payments as (
    select 
        *
    from {{ source("stripe", "payments") }}

),

payments_completed as (
    select 
        orderid as order_id,
        max(created) as payment_finalized_date,
        sum(amount) / 100.0 as total_amount_paid
    from payments
    where status <> 'fail'
    group by orderid

)

select 
    *
from 
    payments_completed