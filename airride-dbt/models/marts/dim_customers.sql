with customers as (
    select * from {{ ref('stg_airride__customers') }}
),

groups as (
    select * from {{ ref('stg_airride__customer_groups') }}
),

countries as (
    select * from {{ ref('src_countries') }}
),

first_orders as (
    select
        customer_id,
        min(started_at) as first_orderred_at

    from {{ ref('int_order_trip__joined') }}
    {{ dbt_utils.group_by(1) }}

),

joined as (
    select
        customers.customer_id,
        customers.name,
        groups.name as group_name,
        groups.type as group_type,
        countries.country_name as booking_country,

        first_orders.first_orderred_at
      
    from customers
    left join groups
        on customers.customer_group_id = groups.customer_group_id
    left join countries
        on customers.country_code = countries.country_code
    left join first_orders
        on customers.customer_id = first_orders.customer_id
)

select * from joined
