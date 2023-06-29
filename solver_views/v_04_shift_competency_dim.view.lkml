view: shift_competency_dim {
  sql_table_name: optimizer.analytics_table_04_shift_competency_dim
    ;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${run_name_id} || '|' || ${shift_id} || '|' || ${competency_mix_name} ;;
  }

#######################
### Original Dimensions
#######################

  dimension: competency_mix_name {
    view_label: "Analytics"
    group_label: "Analytics"
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
    hidden: yes
    type: string
    sql: ${TABLE}.run_name_id ;;
  }

  dimension: shift_id {
    hidden: yes
    type: number
    sql: ${TABLE}.shift_id ;;
  }

#######################
### Derived Dimensions
#######################

#######################
### Measures
#######################

  measure: count {
    type: count
    drill_fields: [competency_mix_name]
  }

  measure: sum_competency_mix_target {
    type: sum
    sql: ${competency_mix_target} ;;
  }
}
