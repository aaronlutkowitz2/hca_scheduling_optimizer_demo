view: analytics_table_05_staff_dim {
  sql_table_name: `hca-cti-nonprd.optimizer.analytics_table_05_staff_dim`
    ;;

  dimension: clustered_vs_spread {
    type: string
    sql: ${TABLE}.clustered_vs_spread ;;
  }

  dimension: day_night {
    type: string
    sql: ${TABLE}.day_night ;;
  }

  dimension: fte_required {
    type: number
    sql: ${TABLE}.fte_required ;;
  }

  dimension: hours_required_weekly {
    type: number
    sql: ${TABLE}.hours_required_weekly ;;
  }

  dimension: job_status {
    type: string
    sql: ${TABLE}.job_status ;;
  }

  dimension: position {
    type: string
    sql: ${TABLE}.position ;;
  }

  dimension: run_name_id {
    type: string
    sql: ${TABLE}.run_name_id ;;
  }

  dimension: staff_34_id {
    type: string
    sql: ${TABLE}.staff_34_id ;;
  }

  dimension: staff_id {
    type: number
    sql: ${TABLE}.staff_id ;;
  }

  dimension: staff_name {
    type: string
    sql: ${TABLE}.staff_name ;;
  }

  dimension: weekend_group {
    type: string
    sql: ${TABLE}.weekend_group ;;
  }

  dimension: years_nursing {
    type: number
    sql: ${TABLE}.years_nursing ;;
  }

  dimension: years_nursing_ld {
    type: number
    sql: ${TABLE}.years_nursing_ld ;;
  }

  dimension: years_nursing_ld_facility {
    type: number
    sql: ${TABLE}.years_nursing_ld_facility ;;
  }

  measure: count {
    type: count
    drill_fields: [staff_name]
  }
}
