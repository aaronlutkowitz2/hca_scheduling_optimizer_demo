view: staff_competency_dim {
  sql_table_name: optimizer.analytics_table_07_staff_competency_dim
    ;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${run_name_id} || '|' || ${staff_id} || '|' || ${staff_competency_name} ;;
  }

#######################
### Original Dimensions
#######################

  dimension: overall_proficiency {
    type: string
    sql: ${TABLE}.overall_proficiency ;;
  }

  dimension: run_name_id {
    hidden: yes
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
    hidden: yes
    type: number
    sql: ${TABLE}.staff_id ;;
  }

#######################
### Derived Dimensions
#######################

#######################
### Measures
#######################

  measure: count {
    type: count
    drill_fields: [staff_competency_name]
  }
}
