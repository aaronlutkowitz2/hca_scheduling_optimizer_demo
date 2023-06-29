view: staff_preferences_dim {
  sql_table_name: optimizer.analytics_table_06_staff_preferences_dim
    ;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${run_name_id} || '|' || ${staff_id} || '|' || ${preference_name} ;;
  }

#######################
### Original Dimensions
#######################

  dimension: preference_answer {
    type: string
    sql: ${TABLE}.preference_answer ;;
  }

  dimension: preference_name {
    type: string
    sql: ${TABLE}.preference_name ;;
  }

  dimension: run_name_id {
    hidden: yes
    type: string
    sql: ${TABLE}.run_name_id ;;
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
    drill_fields: [preference_name]
  }
}
