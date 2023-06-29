connection: "cti-bq-hca-cti-nonprd"

include: "/solver_views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
include: "dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard
include: "/zz_demo/*.view.lkml"
##
#
explore: shift_staff_fact {
  label: "Solver Model"

  # always_filter: {
  #   filters: [shift_staff_fact.run_name_id: "1"]
  # }

  join: shift_dim {
    relationship: many_to_one
    sql_on:
          ${shift_staff_fact.run_name_id} = ${shift_dim.run_name_id}
      AND ${shift_staff_fact.shift_id} = ${shift_dim.shift_id}
    ;;
  }

  join: shift_target_dim {
    relationship: one_to_many
    sql_on:
          ${shift_dim.run_name_id} = ${shift_target_dim.run_name_id}
      AND ${shift_dim.shift_id} = ${shift_target_dim.shift_id}
    ;;
  }

  join: shift_competency_dim {
    relationship: one_to_many
    sql_on:
          ${shift_dim.run_name_id} = ${shift_competency_dim.run_name_id}
      AND ${shift_dim.shift_id} = ${shift_competency_dim.shift_id}
    ;;
  }

  join: staff_dim {
    relationship: many_to_one
    sql_on:
        ${shift_staff_fact.run_name_id} = ${staff_dim.run_name_id}
    AND ${shift_staff_fact.staff_id} = ${staff_dim.staff_id}
    ;;
  }

  join: staff_preferences_dim {
    relationship: one_to_many
    sql_on:
          ${staff_dim.run_name_id} = ${staff_preferences_dim.run_name_id}
      AND ${staff_dim.staff_id} = ${staff_preferences_dim.staff_id}
    ;;
  }

  join: staff_competency_dim {
    relationship: one_to_many
    sql_on:
        ${staff_dim.run_name_id} = ${staff_competency_dim.run_name_id}
    AND ${staff_dim.staff_id} = ${staff_competency_dim.staff_id}
    ;;
  }

  join: staff_week_dim {
    relationship: many_to_one
    sql_on:
        ${shift_staff_fact.run_name_id} = ${staff_week_dim.run_name_id}
    AND ${shift_staff_fact.staff_id} = ${staff_week_dim.staff_id}
    AND ${shift_dim.shift_week_num} = ${staff_week_dim.week}
    ;;
  }

  join: staff_satisfaction_dim {
    relationship: one_to_many
    sql_on:
        ${shift_staff_fact.run_name_id} = ${staff_satisfaction_dim.run_name_id}
    AND ${shift_staff_fact.shift_id} = ${staff_satisfaction_dim.shift_id}
    AND ${shift_staff_fact.staff_id} = ${staff_satisfaction_dim.staff_id}
    ;;
  }

  join: staffing_app_table {
    relationship: many_to_one
    sql_on:
          ${shift_staff_fact.run_name_id} = ${staffing_app_table.run_name_id}
      AND ${shift_staff_fact.shift_id} = ${staffing_app_table.shift_id}
      AND ${shift_staff_fact.staff_id} = ${staffing_app_table.staff_id}
    ;;
  }

### Run Name Dim
  join: run_name_dim {
    relationship: many_to_one
    sql_on:
          ${shift_staff_fact.run_name_id} = ${run_name_dim.run_name_id}
    ;;
  }

  join: run_name_dim__fte_delta {
    view_label: "Run Name Dim"
    sql: LEFT JOIN UNNEST(${run_name_dim.fte_delta}) as run_name_dim__fte_delta ;;
    relationship: one_to_many
  }

  join: run_name_dim__simulation {
    view_label: "Run Name Dim"
    sql: LEFT JOIN UNNEST(${run_name_dim.simulation}) as run_name_dim__simulation ;;
    relationship: one_to_many
  }

### Extra joins specific to one-off problems
  join: z_analytics {
    relationship: one_to_one
    sql_on: 1 = 1 ;;
  }

  join: backup_position_mapping {
    relationship: one_to_one
    sql_on: 1 = 1 ;;
  }

  join: staffing_app_staff_competency_filter {
    relationship: many_to_one
    sql_on:
          ${shift_staff_fact.run_name_id} = ${staffing_app_staff_competency_filter.run_name_id}
      AND ${shift_staff_fact.staff_id} = ${staffing_app_staff_competency_filter.staff_id}
    ;;
  }

  join: max_run_name_by_facility_department_start_date {
    relationship: many_to_one
    sql_on:
          ${run_name_dim.facility} = ${max_run_name_by_facility_department_start_date.facility}
      AND ${run_name_dim.department} = ${max_run_name_by_facility_department_start_date.department}
      AND ${run_name_dim.period_start_date} = ${max_run_name_by_facility_department_start_date.period_start_date}
    ;;
  }
}





#############################





#Sandbox play area

# explore: analytics_table_04_shift_staff_fact {}
