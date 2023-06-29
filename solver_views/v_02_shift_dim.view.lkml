view: shift_dim {
  sql_table_name: optimizer.analytics_table_02_shift_dim
    ;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${run_name_id} || '|' || ${shift_id} ;;
  }

#######################
### Original Dimensions
#######################

  dimension: day_number {
    view_label: "Analytics"
    group_label: "Shift"
    type: number
    sql: ${TABLE}.day_number ;;
  }

  dimension: hard_to_fill_day_name {
    type: string
    sql: ${TABLE}.hard_to_fill_day_name ;;
  }

  dimension: is_hard_to_fill_day {
    type: yesno
    sql: ${TABLE}.is_hard_to_fill_day ;;
  }

  dimension: is_holiday {
    type: yesno
    sql: ${TABLE}.is_holiday ;;
  }

  dimension: is_weekend {
    type: yesno
    sql: ${TABLE}.is_weekend ;;
  }

  dimension: run_name_id {
    hidden: yes
    type: string
    sql: ${TABLE}.run_name_id ;;
  }

  dimension_group: shift {
    view_label: "Analytics"
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
    sql: ${TABLE}.shift_date ;;
  }

  dimension: shift_id {
    hidden: yes
    type: number
    sql: ${TABLE}.shift_id ;;
  }

  ## ASW: AZ - change "shift week" column to "shift week num"
  dimension: shift_week_num {
    view_label: "Analytics"
    group_label: "Shift"
    type: number
    sql: ${TABLE}.shift_week_num ;;
  }

  dimension: time_of_day {
    view_label: "Analytics"
    group_label: "Shift"
    type: string
    sql: ${TABLE}.time_of_day ;;
  }

#######################
### Derived Dimensions
#######################

  dimension: date_dow {
    view_label: "Analytics"
    group_label: "Shift"
    type: date
     sql: CAST(${shift_date} AS Timestamp) ;;
    # see here: https://help.looker.com/hc/en-us/articles/360023800253-Easy-Date-Formatting-with-Liquid
    html: {{ rendered_value | date: "%a %b %d" }} ;;
  }

  dimension: day_number_time_of_day {
    view_label: "Analytics"
    group_label: "Shift"
    type: string
    sql: 'Day ' ||  right('00' || cast(${day_number} as string),2) || ' ' || ${time_of_day} ;;
  }

#######################
### Measures
#######################

  measure: count {
    type: count
    drill_fields: [hard_to_fill_day_name]
  }
}
