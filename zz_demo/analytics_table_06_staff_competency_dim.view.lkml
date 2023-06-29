view: analytics_table_06_staff_competency_dim {
  sql_table_name: `hca-cti-nonprd.optimizer.analytics_table_06_staff_competency_dim`
    ;;

  dimension: run_name_id {
    type: string
    sql: ${TABLE}.run_name_id ;;
  }

  dimension: staff_competency_answer {
    type: yesno
    sql: ${TABLE}.staff_competency_answer ;;
  }

  dimension: staff_competency_name {
    type: string
    sql: ${TABLE}.staff_competency_name ;;
  }

  dimension: staff_id {
    type: number
    sql: ${TABLE}.staff_id ;;
  }

  measure: count {
    type: count
    drill_fields: [staff_competency_name]
  }
}
