view: analytics_table_07_staff_preferences_dim {
  sql_table_name: `hca-cti-nonprd.optimizer.analytics_table_07_staff_preferences_dim`
    ;;

  dimension: preference_answer {
    type: string
    sql: ${TABLE}.preference_answer ;;
  }

  dimension: preference_name {
    type: string
    sql: ${TABLE}.preference_name ;;
  }

  dimension: run_name_id {
    type: string
    sql: ${TABLE}.run_name_id ;;
  }

  dimension: staff_id {
    type: number
    sql: ${TABLE}.staff_id ;;
  }

  measure: count {
    type: count
    drill_fields: [preference_name]
  }
}
