view: fct_trips {
  sql_table_name: prod.marts.fct_trips ;;

  dimension: trip_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.trip_id
  }

  dimension: aeroplane_id {
    hidden: yes    
    type: number
    sql: ${TABLE}.aeroplane_id
  }

  dimension_group: started {
    label: "Trip Started"
    type: time
    datatype: timestamp    
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.started_at
  }

  dimension_group: ended {
    label: "Trip Ended"
    type: time
    datatype: timestamp    
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.ended_at
  }

  dimension: origin_city {
    type: string
    sql: ${TABLE}.origin_city
  }

  dimension: destination_city {
    type: string
    sql: ${TABLE}.destination_city
  }

  dimension: origin_city_latitude {
    hidden: yes
    type: number
    sql: ${TABLE}.origin_city_latitude
  }

  dimension: origin_city_longitude {
    hidden: yes
    type: number
    sql: ${TABLE}.origin_city_longitude
  }

  dimension: destination_city_latitude {
    hidden: yes
    type: number
    sql: ${TABLE}.destination_city_latitude
  }

  dimension: destination_city_longitude {
    hidden: yes
    type: number
    sql: ${TABLE}.destination_city_longitude
  }

  dimension: origin_city_location {
    type: location
    hidden: yes
    sql_latitude: ${TABLE}.origin_city_latitude ;;
    sql_longitude: ${TABLE}.origin_city_longitude ;;
  }

  dimension: destination_city_location {
    type: location
    hidden: yes
    sql_latitude: ${TABLE}.destination_city_latitude ;;
    sql_longitude: ${TABLE}.destination_city_longitude ;;
  }

  dimension: trip_distance_in_km {
    description: "distance from origin to destination city per trip"
    type: distance
    start_location_field: origin_city_location
    end_location_field: destination_city_location
    units: kilometers
  }

  dimension_group: trip_duration {
    description: "time differences between start and end time"
    type: duration
    datatype: timestamp
    sql_start: ${TABLE}.started_at ;;
    sql_end: ${TABLE}.ended_at ;;
    intervals: [hour,day,week]

  }

  measure: avg_trip_distance_in_km {
    label: "Average Trip Distance in Kilometers"
    description: "average distance from origin to destination city"
    type: average
    sql: ${trip_distance_in_km} ;;
    value_format_name: decimal_2
  }  

  measure: total_trip_distance_in_km {
    label: "Total Trip Distance in Kilometers"
    description: "sum distance from origin to destination city"
    type: sum
    sql: ${trip_distance_in_km} ;;
    value_format_name: decimal_2
  }

  measure: total_trip_duration_in_hours {
    description: "total hour differences between start and end time"
    type: sum
    sql: ${trip_duration} ;;
    value_format_name: decimal_2
  }

  measure: utilisation_rate {
    description: "% of seats occupied per trip, total_occupied_seats/max_seats"
    type: number
    sql: ${fct_orders.total_occupied_seats} / nullif(max(${dim_aeroplanes.max_seats}), 0) ;;
    value_format_name: percent_2

  }

  measure: total_trips {
    description: "count of trip"
    type: count_distinct
    sql: ${trip_id}
  }

  measure: trip_duration_in_hours_per_trip {
    description: "total hour differences between start and end time devide by trips"
    type: number
    sql: ${total_trip_duration_in_hours} / nullif(${total_trips}, 0) ;;
    value_format_name: decimal_2
  }  

  measure: revenue_per_trip {
    type: number
    sql: ${fct_orders.total_successful_amount}/ nullif(${total_trips}, 0) ;;
    value_format_name: decimal_2
  }

}
