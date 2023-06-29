view: staff_week_dim {
  sql_table_name: optimizer.analytics_table_08_staff_week_dim
    ;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${run_name_id} || '|' || ${staff_id} || '|' || ${week} ;;
  }

#######################
### Original Dimensions
#######################

  dimension: count_extra_hours {
    type: number
    sql: ${TABLE}.count_extra_hours ;;
  }

  dimension: count_extra_hours_above_wanted_at_or_below_willing {
    type: number
    sql: ${TABLE}.count_extra_hours_above_wanted_at_or_below_willing ;;
  }

  dimension: count_extra_hours_above_willing {
    type: number
    sql: ${TABLE}.count_extra_hours_above_willing ;;
  }

  dimension: count_extra_hours_at_wanted {
    type: number
    sql: ${TABLE}.count_extra_hours_at_wanted ;;
  }

  dimension: count_extra_hours_below_wanted {
    type: number
    sql: ${TABLE}.count_extra_hours_below_wanted ;;
  }

  dimension: count_pto_hours {
    type: number
    sql: ${TABLE}.count_pto_hours ;;
  }

  dimension: count_pto_shifts {
    type: number
    sql: ${TABLE}.count_pto_shifts ;;
  }

  dimension: count_scheduled_hours {
    type: number
    sql: ${TABLE}.count_scheduled_hours ;;
  }

  dimension: count_scheduled_shifts {
    type: number
    sql: ${TABLE}.count_scheduled_shifts ;;
  }

  dimension: day_shift_clustering {
    type: string
    sql: ${TABLE}.day_shift_clustering ;;
  }

  dimension: extra_hours_wanted {
    type: number
    sql: ${TABLE}.extra_hours_wanted ;;
  }

  dimension: extra_hours_willing {
    type: number
    sql: ${TABLE}.extra_hours_willing ;;
  }

  dimension: fte_hours_required_after_pto {
    type: number
    sql: ${TABLE}.fte_hours_required_after_pto ;;
    # sql: 0 ;; # AZ change later

  }

  dimension: labor_type {
    label: "Labor Type"
    type: string
    sql: ${TABLE}.labor_type ;;
  }

  dimension: night_shift_clustering {
    type: string
    sql: ${TABLE}.night_shift_clustering ;;
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

  dimension: staff_week_hours_required {
    type: number
    sql: ${TABLE}.staff_week_hours_required ;;
  }

  ## ASW - AZ - convert this column from STRING to FLOAT64
  dimension: week {
    type: number
    sql: cast(${TABLE}.week as float64) ;;
  }

#######################
### Derived Dimensions
#######################

  dimension: has_met_fte_min {
    type: yesno
    sql: ${count_scheduled_hours} >= ${fte_hours_required_after_pto} ;;
  }

  dimension: fte_shifts_required_after_pto {
    type: number
    ### Key assumption: every shift is 12 hours
    sql: ${fte_hours_required_after_pto} / 12 ;;
  }

  dimension: diff_scheduled_required {
    type: number
    sql: (${count_scheduled_hours} - ${fte_hours_required_after_pto}) / 12 ;;
  }

#######################
### Measures
#######################

  measure: count {
    type: count
  }

  measure: count_met_fte_min {
    type: count
    filters: [has_met_fte_min: "Yes"]
  }

  measure: sum_fte_shifts_required_after_pto {
    type: sum
    sql: ${fte_shifts_required_after_pto} ;;
    value_format_name: decimal_1
  }

  measure: count_pk {
    type: count_distinct
    sql: ${pk} ;;
  }
}
