view: staff_dim {
  sql_table_name: optimizer.analytics_table_05_staff_dim
    ;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${run_name_id} || '|' || ${staff_id} ;;
  }

#######################
### Original Dimensions
#######################

  dimension: clustered_vs_spread {
    type: string
    sql: ${TABLE}.clustered_vs_spread ;;
  }

  dimension: day_night {
    view_label: "Analytics"
    group_label: "Staff"
    type: string
    sql: ${TABLE}.day_night;;
  }

  dimension: fte_required {
    type: number
    sql: ${TABLE}.fte_required ;;
  }

  dimension: hours_required_weekly {
    type: number
    sql: ${TABLE}.hours_required_weekly ;;
  }

  dimension: labor_type {
    label: "Labor Type"
    type: string
    sql: ${TABLE}.labor_type ;;
  }

  dimension: job_status {
    view_label: "Analytics"
    group_label: "Staff"
    type: string
    sql: ${TABLE}.job_status ;;
  }

  dimension: position {
    view_label: "Analytics"
    group_label: "Staff"
    type: string
    sql: ${TABLE}.position ;;
  }

  dimension: run_name_id {
    hidden: yes
    type: string
    sql: ${TABLE}.run_name_id ;;
  }

  dimension: staff_34_id {
    view_label: "Analytics"
    group_label: "Staff"
    type: string
    sql: ${TABLE}.staff_34_id ;;
  }

  dimension: staff_id {
    hidden: yes
    type: number
    sql: ${TABLE}.staff_id ;;
  }

  dimension: staff_name {
    view_label: "Analytics"
    group_label: "Staff"
    type: string
    sql: ${TABLE}.staff_name ;;
  }

  dimension: weekend_group {
    view_label: "Analytics"
    group_label: "Staff"
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

#######################
### Derived Dimensions
#######################

  dimension: staff_name_34_id {
    view_label: "Analytics"
    group_label: "Staff"
    type: string
    sql: coalesce(${staff_name},'')||' - '||coalesce(${staff_34_id},'') ;;
  }
#######################
### Measures
#######################

  measure: count {
    type: count
    drill_fields: [staff_name]
  }
}
