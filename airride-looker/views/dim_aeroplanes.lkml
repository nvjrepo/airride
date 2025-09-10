view: dim_aeroplanes {
  sql_table_name: prod.marts.dim_aeroplanes ;;

  dimension: aeroplane_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.aeroplane_id
  }

  dimension: hashed_aeroplane_id {
    type: string
    sql: ${TABLE}.hashed_aeroplane_id
  }

  dimension: model {
    label: "Aeroplane Model"
    type: string
    sql: ${TABLE}.model
  }

  dimension: manufacturer {
    label: "Aeroplane Manufacturer"
    type: string
    sql: ${TABLE}.manufacturer
  }

  dimension: max_seats {
    label: "Aeroplane Max Seats"
    type: number
    sql: ${TABLE}.max_seats
  }

  dimension: aeroplane_size {
    description: "Maximum seats allowed in the plane"
    type: string
    sql: ${TABLE}.aeroplane_size
  }

}
