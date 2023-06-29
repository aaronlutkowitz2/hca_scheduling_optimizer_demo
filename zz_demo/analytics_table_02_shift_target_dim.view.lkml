view: analytics_table_02_shift_target_dim {
  sql_table_name: `hca-cti-nonprd.optimizer.analytics_table_02_shift_target_dim`
    ;;

  dimension: run_name_id {
    type: string
    sql: ${TABLE}.run_name_id ;;
  }

  dimension: shift_id {
    type: number
    sql: ${TABLE}.shift_id ;;
  }

  dimension: skill_mix_name {
    type: string
    sql: ${TABLE}.skill_mix_name ;;
  }

  dimension: skill_mix_staffed {
    type: number
    sql: ${TABLE}.skill_mix_staffed ;;
  }

  dimension: skill_mix_target {
    type: number
    sql: ${TABLE}.skill_mix_target ;;
  }

  measure: count {
    type: count
    drill_fields: [skill_mix_name]
  }
}
