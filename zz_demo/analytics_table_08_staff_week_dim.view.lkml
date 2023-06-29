view: analytics_table_08_staff_week_dim {
  sql_table_name: `hca-cti-nonprd.optimizer.analytics_table_08_staff_week_dim`
    ;;

  dimension: count_extra_hours {
    type: number
    sql: ${TABLE}.count_extra_hours ;;
  }

  dimension: count_extra_hours_above_wanted_at_or_below_willing {
    type: number
    sql: ${TABLE}.count_extra_hours_above_wanted_at_or_below_willing ;;
  }

  dimension: count_extra_hours_above_willing {
    type: number
    sql: ${TABLE}.count_extra_hours_above_willing ;;
  }

  dimension: count_extra_hours_at_wanted {
    type: number
    sql: ${TABLE}.count_extra_hours_at_wanted ;;
  }

  dimension: count_extra_hours_below_wanted {
    type: number
    sql: ${TABLE}.count_extra_hours_below_wanted ;;
  }

  dimension: count_pto_hours {
    type: number
    sql: ${TABLE}.count_pto_hours ;;
  }

  dimension: count_pto_shifts {
    type: number
    sql: ${TABLE}.count_pto_shifts ;;
  }

  dimension: count_scheduled_hours {
    type: number
    sql: ${TABLE}.count_scheduled_hours ;;
  }

  dimension: count_scheduled_shifts {
    type: number
    sql: ${TABLE}.count_scheduled_shifts ;;
  }

  dimension: day_shift_clustering {
    type: string
    sql: ${TABLE}.day_shift_clustering ;;
  }

  dimension: fte_hours_required_after_pto {
    type: number
    sql: ${TABLE}.fte_hours_required_after_pto ;;
  }

  dimension: night_shift_clustering {
    type: string
    sql: ${TABLE}.night_shift_clustering ;;
  }

  dimension: run_name_id {
    type: string
    sql: ${TABLE}.run_name_id ;;
  }

  dimension: staff_id {
    type: number
    sql: ${TABLE}.staff_id ;;
  }

  dimension: staff_week_hours_required {
    type: number
    sql: ${TABLE}.staff_week_hours_required ;;
  }

  dimension: week {
    type: string
    sql: ${TABLE}.week ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
