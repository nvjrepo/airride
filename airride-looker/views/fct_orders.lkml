view: fct_orders {
  sql_table_name: prod.marts.fct_orders ;;

  dimension: order_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.order_id
  }

  dimension: trip_id {
    hidden: yes    
    type: number
    sql: ${TABLE}.trip_id
  }

  dimension: customer_id {
    hidden: yes
    type: number
    sql: ${TABLE}.customer_id
  }

  dimension: seat_number {
    type: string
    sql: ${TABLE}.seat_number
  }

  dimension: is_successful_order {
    type: yesno
    sql: ${TABLE}.is_successful_order
  }

  dimension: status {
    label: "Order Status"
    type: string
    sql: ${TABLE}.status
  }

  dimension: amount {
    type: number
    hidden: yes
    sql: ${TABLE}.amount
  }

  measure: total_amount {
    label: "Total Booking Amount"
    type: number
    sql: ${TABLE}.amount
    value_format_name: eur
  }

  measure: total_orders {
    description: "count of orders"
    type: count_distinct
    sql: ${order_id}
  }

  measure: total_successful_amount {
    label: "Revenue"
    description: "count of orders having 'Finished' status"
    type: count_distinct
    sql: ${order_id}
    filters: [is_successful_order: "yes"]
  }

  measure: total_occupied_seats {
    description: "count of seats booked per order"
    type: count_distinct
    sql: ${seat_number}
  }

  measure: revenue_per_order {
    type: number:
    sql: ${total_successful_amount}/ nullif(${total_orders}, 0) ;;
    value_format_name: decimal_2
  }

}
