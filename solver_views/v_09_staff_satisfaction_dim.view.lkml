view: staff_satisfaction_dim {
  sql_table_name: optimizer.analytics_table_09_staff_satisfaction_dim
    ;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${run_name_id} || '|' || ${staff_id} || '|' || ${shift_id} || '|' || ${rule}  ;;
  }

#######################
### Original Dimensions
#######################

  dimension: actual {
    type: yesno
    sql: ${TABLE}.actual ;;
  }

  dimension: penalty_or_bonus {
    type: number
    sql: ${TABLE}.penalty_or_bonus ;;
  }

  dimension: rule {
    type: string
    sql: ${TABLE}.rule ;;
  }

  dimension: run_name_id {
    type: string
    sql: ${TABLE}.run_name_id ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}.score ;;
  }

  dimension: shift_id {
    type: number
    sql: ${TABLE}.shift_id ;;
  }

  dimension: shift_score {
    label: "Total Score"
    type: number
    sql: ${TABLE}.shift_score ;;
  }

  dimension: staff_id {
    type: number
    sql: ${TABLE}.staff_id ;;
  }

  dimension: weight {
    type: number
    sql: ${TABLE}.weight ;;
  }

#######################
### Derived Dimensions
#######################

#######################
### Measures
#######################

  measure: count {
    type: count
    drill_fields: []
  }

  measure: count_pk {
    type: count_distinct
    sql: ${pk} ;;
  }

  measure: average_score {
    hidden: yes
    type: average
    sql: ${score} ;;
    value_format_name: decimal_1
    order_by_field: average_abs_score
  }

  measure: average_abs_score {
    hidden: yes
    type: average
    sql: abs(${score}) ;;
    value_format_name: decimal_1
  }

  measure: average_satisfaction_score {
    type: average
    sql: ${shift_score} ;;
    drill_fields: [
        staff_satisfaction_dim.rule
      , staff_satisfaction_dim.penalty_or_bonus
      , staff_satisfaction_dim.average_score
    ]
    value_format_name: decimal_1
  }
}
