view: run_name_dim {
  sql_table_name: optimizer.analytics_table_99_run_name_dim
    ;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${run_name_id} ;;
  }

#######################
### Original Dimensions
#######################

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: facility {
    type: string
    sql: ${TABLE}.facility ;;
  }

  dimension: fte_delta {
    hidden: yes
    sql: ${TABLE}.fte_delta ;;
  }

  dimension_group: period_end {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.period_end_date ;;
  }

  dimension_group: period_start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.period_start_date ;;
  }

  dimension: run_name_id {
    type: number
    sql: ${TABLE}.run_name_id ;;
  }

  dimension: simulation {
    hidden: yes
    sql: ${TABLE}.simulation ;;
  }

  dimension: site_code {
    type: string
    sql: ${TABLE}.site_code ;;
  }

  dimension: solver_type {
    type: string
    sql: ${TABLE}.solver_type ;;
  }

  dimension: solver_version {
    type: string
    sql: ${TABLE}.solver_version ;;
  }

  dimension_group: timestamp_ran {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    datatype: datetime
    sql: ${TABLE}.timestamp_ran ;;
  }

#######################
### Derived Dimensions
#######################

  dimension: is_latest_run {
    type: yesno
    sql: ${run_name_id} = ${max_run_name_by_facility_department_start_date.max_run_name_id} ;;
  }

  dimension: period_start_string {
    type: string
    sql: CAST(${period_start_date} AS STRING) ;;
  }
#######################
### Measures
#######################

  measure: count {
    type: count
    drill_fields: []
  }

  measure: max_run_name_id {
    type: max
    sql: ${run_name_id} ;;
  }
}

view: run_name_dim__fte_delta {
  dimension: run_name_dim__fte_delta {
    type: string
    hidden: yes
    sql: analytics_table_99_run_name_dim__fte_delta ;;
  }

  dimension: delta {
    group_label: "FTE Delta"
    type: number
    sql: delta ;;
  }

  dimension: position {
    group_label: "FTE Delta"
    type: string
    sql: position ;;
  }

  dimension: time_of_day {
    group_label: "FTE Delta"
    type: string
    sql: time_of_day ;;
  }
}

view: run_name_dim__simulation {
  dimension: run_name_dim__simulation {
    type: string
    hidden: yes
    sql: analytics_table_99_run_name_dim__simulation ;;
  }

  dimension: percent_forecast {
    group_label: "Simulation"
    type: number
    sql: percent_forecast ;;
  }

  dimension: simul_value {
    group_label: "Simulation"
    type: number
    sql: simul_value ;;
  }
}

view: max_run_name_by_facility_department_start_date {
  derived_table: {
    explore_source: shift_staff_fact {
      column: max_run_name_id { field: run_name_dim.max_run_name_id }
      column: facility { field: run_name_dim.facility }
      column: department { field: run_name_dim.department }
      column: period_start_date { field: run_name_dim.period_start_date }
    }
  }
  dimension: pk {
    primary_key: yes
    type: string
    sql: ${facility} || '|' || ${department} || '|' || ${period_start_date} ;;
  }
  dimension: max_run_name_id {
    hidden: yes
    type: number
  }
  dimension: facility {
    hidden: yes
  }
  dimension: department {
    hidden: yes
  }
  dimension: period_start_date {
    hidden: yes
    type: date
  }
}
