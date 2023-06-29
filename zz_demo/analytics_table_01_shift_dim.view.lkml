view: analytics_table_01_shift_dim {
  sql_table_name: `hca-cti-nonprd.optimizer.analytics_table_01_shift_dim`
    ;;

  dimension: day_number {
    type: number
    sql: ${TABLE}.day_number ;;
  }

  dimension: hard_to_fill_day_name {
    type: string
    sql: ${TABLE}.hard_to_fill_day_name ;;
  }

  dimension: is_hard_to_fill_day {
    type: yesno
    sql: ${TABLE}.is_hard_to_fill_day ;;
  }

  dimension: is_holiday {
    type: yesno
    sql: ${TABLE}.is_holiday ;;
  }

  dimension: is_weekend {
    type: yesno
    sql: ${TABLE}.is_weekend ;;
  }

  dimension: run_name_id {
    type: string
    sql: ${TABLE}.run_name_id ;;
  }

  dimension_group: shift {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.shift_date ;;
  }

  dimension: shift_id {
    type: number
    sql: ${TABLE}.shift_id ;;
  }

  dimension: shift_week_num {
    type: number
    sql: ${TABLE}.shift_week ;;
  }

  dimension: time_of_day {
    type: string
    sql: ${TABLE}.time_of_day ;;
  }

  measure: count {
    type: count
    drill_fields: [hard_to_fill_day_name]
  }
}
