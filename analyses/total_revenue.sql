-- Analysis: Total Revenue from Successful Payments

with payments as (

    select *
    from {{ ref('stg_payments') }}

),

successful_payments as (

    select
        amount
    from payments
    where payment_status = 'success'

)

select
    sum(amount) as total_revenue
from successful_payments;
