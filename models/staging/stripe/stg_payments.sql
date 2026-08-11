with source as (
    select
        ID,
        ORDERID,
        PAYMENTMETHOD,
        STATUS,
        AMOUNT,
        CREATED,
        _BATCHED_AT
    from {{ source('stripe', 'payment') }}
),

renamed as (
    select
        ID as payment_id,
        ORDERID as order_id,
        PAYMENTMETHOD as payment_method,
        STATUS as payment_status,
        AMOUNT as amount,
        CREATED as created_at,
        _BATCHED_AT as batched_at
    from source
)

select *
from renamed;