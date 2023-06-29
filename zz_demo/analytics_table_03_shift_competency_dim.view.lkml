view: analytics_table_03_shift_competency_dim {
  sql_table_name: `hca-cti-nonprd.optimizer.analytics_table_03_shift_competency_dim`
    ;;

  dimension: competency_mix_name {
    type: string
    sql: ${TABLE}.competency_mix_name ;;
  }

  dimension: competency_mix_target {
    type: number
    sql: ${TABLE}.competency_mix_target ;;
  }

  dimension: competency_staffed {
    type: number
    sql: ${TABLE}.competency_staffed ;;
  }

  dimension: run_name_id {
    type: string
    sql: ${TABLE}.run_name_id ;;
  }

  dimension: shift_id {
    type: number
    sql: ${TABLE}.shift_id ;;
  }

  measure: count {
    type: count
    drill_fields: [competency_mix_name]
  }
}
