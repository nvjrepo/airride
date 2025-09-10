view: dim_customers {
  sql_table_name: prod.marts.dim_customers ;;

  dimension: customer_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.customer_id
  }

  dimension: name {
    label: "Customer Name"
    type: string
    sql: ${TABLE}.name
  }

  dimension: group_name {
    label: "Customer Group Name"
    type: string
    sql: ${TABLE}.group_name
  }

  dimension: group_type {
    label: "Customer Group Type"
    type: string
    sql: ${TABLE}.group_type
  }

  dimension: booking_country {
    description: "Countries where the trips is booked, from customer phone number"
    type: string
    sql: ${TABLE}.booking_country
  }

  dimension_group: first_orderred {
    label: "Customer First Order" 
    description: "timestamp when customers book the first ride"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.first_orderred_at
  }

}
