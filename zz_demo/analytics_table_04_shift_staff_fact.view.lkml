view: analytics_table_04_shift_staff_fact {
  sql_table_name: `hca-cti-nonprd.optimizer.analytics_table_04_shift_staff_fact`
    ;;

  dimension: day_night_switching {
    type: yesno
    sql: ${TABLE}.day_night_switching ;;
  }

  dimension: extra_hours_wanted {
    type: number
    sql: ${TABLE}.extra_hours_wanted ;;
  }

  dimension: extra_hours_willing {
    type: number
    sql: ${TABLE}.extra_hours_willing ;;
  }

  dimension: is_scheduled {
    type: yesno
    sql: ${TABLE}.is_scheduled ;;
  }

  dimension: is_scheduled_24_hours {
    type: yesno
    sql: ${TABLE}.is_scheduled_24_hours ;;
  }

  dimension: is_scheduled_htf_prefer_not {
    type: yesno
    sql: ${TABLE}.is_scheduled_htf_prefer_not ;;
  }

  dimension: is_scheduled_on_holiday_off {
    type: yesno
    sql: ${TABLE}.is_scheduled_on_holiday_off ;;
  }

  dimension: is_scheduled_prefer {
    type: yesno
    sql: ${TABLE}.is_scheduled_prefer ;;
  }

  dimension: is_scheduled_prefer_not {
    type: yesno
    sql: ${TABLE}.is_scheduled_prefer_not ;;
  }

  dimension: is_scheduled_pto {
    type: yesno
    sql: ${TABLE}.is_scheduled_pto ;;
  }

  dimension: is_scheduled_weekend_off {
    type: yesno
    sql: ${TABLE}.is_scheduled_weekend_off ;;
  }

  dimension: is_scheduled_weekend_on {
    type: yesno
    sql: ${TABLE}.is_scheduled_weekend_on ;;
  }

  dimension: is_scheduled_x {
    type: yesno
    sql: ${TABLE}.is_scheduled_x ;;
  }

  dimension: preference {
    type: string
    sql: ${TABLE}.preference ;;
  }

  dimension: run_name_id {
    type: string
    sql: ${TABLE}.run_name_id ;;
  }

  dimension: shift_id {
    type: number
    sql: ${TABLE}.shift_id ;;
  }

  dimension: staff_id {
    type: number
    sql: ${TABLE}.staff_id ;;
  }

  dimension: staff_satisfaction_score {
    type: number
    sql: ${TABLE}.staff_satisfaction_score ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: count_schedule {
    type: count
    drill_fields: []
    filters: [is_scheduled: "Yes"]
  }
}
