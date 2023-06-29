view: shift_target_dim {
  sql_table_name: optimizer.analytics_table_03_shift_target_dim
    ;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${run_name_id} || '|' || ${shift_id} || '|' || ${skill_mix_name} ;;
  }

#######################
### Original Dimensions
#######################

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

  dimension: skill_mix_name {
    view_label: "Analytics"
    group_label: "Analytics"
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

#######################
### Derived Dimensions
#######################

#######################
### Measures
#######################

  measure: count {
    type: count
    drill_fields: [skill_mix_name]
  }

  measure: sum_skill_mix_target {
    type: sum
    sql: ${skill_mix_target} ;;
  }
}
