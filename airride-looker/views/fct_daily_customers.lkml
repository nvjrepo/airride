view: fct_daily_customers {
  sql_table_name: prod.marts.fct_daily_customers ;;

  dimension: unique_id {
    primary_key: yes
    hidden: yes    
    type: number
    sql: ${TABLE}.unique_id
  }

  dimension_group: date {
    label: "Customer"
    description: "Customer point in time monitoring"
    type: time
    datatype: date    
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.date_day
  }

  dimension: customer_id {
    hidden: yes    
    type: number
    sql: ${TABLE}.customer_id
  }

  dimension: order_id {
    hidden: yes    
    type: number
    sql: ${TABLE}.order_id
  }

  dimension: trip_id {
    hidden: yes    
    type: number
    sql: ${TABLE}.trip_id
  }
  
  dimension: is_active {
    label: "whether the customer active in the date"
    type: yesno
    sql: ${TABLE}.is_active
  }

  measure: total_customers {
    description: "total customers in a given point in time"
    type: count
  }

  measure: total_active_customers {
    description: "total customers having at least 1 order in a given point in time"
    type: count
    filters: [is_active: "yes"]
  }

  measure: active_users_rate {
    description: "active users out of total users"
    type: number:
    sql: ${total_active_customers} / nullif(${total_customers}, 0)
    value_format_name: percent_2
  }

}
