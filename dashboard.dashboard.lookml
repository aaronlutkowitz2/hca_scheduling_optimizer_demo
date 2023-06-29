- dashboard: 0__compare_runsmethods
  title: 0 -- Compare Runs(Methods)
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: Run Success Comparison
    name: Run Success Comparison
    model: cti_schedule_solver
    explore: shift_staff_fact
    type: looker_column
    fields: [z_analytics.overall_score, z_analytics.skill_mix_ratio_filled_required_score,
      z_analytics.proficiency_mix_ratio_filled_required_score, z_analytics.fte_min_ratio_score,
      z_analytics.staff_satisfaction_ratio_score, shift_staff_fact.run_name_id]
    filters: {}
    sorts: [z_analytics.overall_score desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      1 Skill Mix Weight: z_analytics.weight_skill_mix
      2 Competency Mix Weight: z_analytics.weight_competency_mix
      3 FTE Hours Weight: z_analytics.weight_fte_requirements
      4 Staff Satisfaction Weight: z_analytics.weight_staff_satisfaction
      Run Name ID: shift_staff_fact.run_name_id
    row: 0
    col: 0
    width: 24
    height: 12
  filters:
  - name: 2 Competency Mix Weight
    title: 2 Competency Mix Weight
    type: field_filter
    default_value: Medium
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: cti_schedule_solver
    explore: shift_staff_fact
    listens_to_filters: []
    field: z_analytics.weight_competency_mix
  - name: 3 FTE Hours Weight
    title: 3 FTE Hours Weight
    type: field_filter
    default_value: High
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: cti_schedule_solver
    explore: shift_staff_fact
    listens_to_filters: []
    field: z_analytics.weight_fte_requirements
  - name: 4 Staff Satisfaction Weight
    title: 4 Staff Satisfaction Weight
    type: field_filter
    default_value: Low
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: cti_schedule_solver
    explore: shift_staff_fact
    listens_to_filters: []
    field: z_analytics.weight_staff_satisfaction
  - name: 1 Skill Mix Weight
    title: 1 Skill Mix Weight
    type: field_filter
    default_value: High
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: cti_schedule_solver
    explore: shift_staff_fact
    listens_to_filters: []
    field: z_analytics.weight_skill_mix
  - name: Run Name ID
    title: Run Name ID
    type: field_filter
    default_value: '1,2'
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: cti_schedule_solver
    explore: shift_staff_fact
    listens_to_filters: []
    field: shift_staff_fact.run_name_id



- dashboard: 1_outputs_what_the_model_suggests
  title: 1- Outputs (What the model suggests)
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: 1- Outputs
    name: 1- Outputs
    model: cti_schedule_solver
    explore: shift_staff_fact
    type: looker_column
    fields: [z_analytics.overall_score, z_analytics.skill_mix_ratio_filled_required_score,
      z_analytics.proficiency_mix_ratio_filled_required_score, z_analytics.fte_min_ratio_score,
      z_analytics.staff_satisfaction_ratio_score]
    filters:
      z_analytics.weight_skill_mix: High
      z_analytics.weight_competency_mix: Medium
      z_analytics.weight_fte_requirements: High
      z_analytics.weight_staff_satisfaction: Low
    sorts: [z_analytics.overall_score desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Time of Day: shift_dim.time_of_day
      Facility: run_name_dim.facility
      Department: run_name_dim.department
      Period Start Date: run_name_dim.period_start_string
      Latest Run: run_name_dim.is_latest_run
      Run Name ID: shift_staff_fact.run_name_id
    row: 0
    col: 5
    width: 19
    height: 10
  - title: 1- Overall Score
    name: 1- Overall Score
    model: cti_schedule_solver
    explore: shift_staff_fact
    type: single_value
    fields: [z_analytics.overall_score, z_analytics.grade]
    filters:
      z_analytics.weight_skill_mix: High
      z_analytics.weight_competency_mix: Medium
      z_analytics.weight_fte_requirements: High
      z_analytics.weight_staff_satisfaction: Low
    sorts: [z_analytics.overall_score desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Time of Day: shift_dim.time_of_day
      Facility: run_name_dim.facility
      Department: run_name_dim.department
      Period Start Date: run_name_dim.period_start_string
      Latest Run: run_name_dim.is_latest_run
      Run Name ID: shift_staff_fact.run_name_id
    row: 4
    col: 0
    width: 5
    height: 6
  - title: 1 - Scheduled Shifts
    name: 1 - Scheduled Shifts
    model: cti_schedule_solver
    explore: shift_staff_fact
    type: looker_grid
    fields: [shift_staff_fact.count_scheduled, staff_dim.staff_name_34_id, shift_dim.date_dow]
    pivots: [shift_dim.date_dow]
    fill_fields: [shift_dim.date_dow]
    filters:
      z_analytics.weight_competency_mix: Medium
      z_analytics.weight_staff_satisfaction: Low
      z_analytics.weight_skill_mix: High
      z_analytics.weight_fte_requirements: High
    sorts: [shift_staff_fact.count_scheduled desc 0, shift_dim.date_dow]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      shift_staff_fact.count_scheduled: Scheduled
      shift_dim.date_dow: Date
    series_cell_visualizations:
      shift_staff_fact.count_scheduled:
        is_active: false
    conditional_formatting: [{type: equal to, value: 1, background_color: "#0a0b73",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Time of Day: shift_dim.time_of_day
      Facility: run_name_dim.facility
      Department: run_name_dim.department
      Period Start Date: run_name_dim.period_start_string
      Latest Run: run_name_dim.is_latest_run
      Run Name ID: shift_staff_fact.run_name_id
    row: 10
    col: 0
    width: 24
    height: 10
  - title: Competency Mix
    name: Competency Mix
    model: cti_schedule_solver
    explore: shift_staff_fact
    type: looker_grid
    fields: [shift_competency_dim.competency_mix_name, z_analytics.competency_mix_ratio_filled_required,
      shift_dim.date_dow]
    pivots: [shift_dim.date_dow]
    fill_fields: [shift_dim.date_dow]
    filters: {}
    sorts: [z_analytics.competency_mix_ratio_filled_required desc 0, shift_dim.date_dow]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      z_analytics.proficiency_mix_ratio_filled_required: "%"
      z_analytics.competency_mix_ratio_filled_required: "%"
      shift_competency_dim.competency_mix_name: Competency
      shift_dim.date_dow: Date
    series_cell_visualizations:
      z_analytics.proficiency_mix_ratio_filled_required:
        is_active: false
      z_analytics.competency_mix_ratio_filled_required:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          custom: {id: 5721a6ba-24ff-717c-4127-a06529627c99, label: Custom, type: continuous,
            stops: [{color: red, offset: 0}, {color: yellow, offset: 50}, {color: green,
                offset: 100}]}, options: {steps: 5, constraints: {min: {type: number,
                value: 0.5}, mid: {type: number, value: 0.7}, max: {type: number,
                value: 1}}, mirror: false, reverse: false, stepped: false}}, bold: false,
        italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Time of Day: shift_dim.time_of_day
      Facility: run_name_dim.facility
      Department: run_name_dim.department
      Period Start Date: run_name_dim.period_start_string
      Latest Run: run_name_dim.is_latest_run
      Run Name ID: shift_staff_fact.run_name_id
    row: 29
    col: 0
    width: 24
    height: 9
  - title: Skill Mix
    name: Skill Mix
    model: cti_schedule_solver
    explore: shift_staff_fact
    type: looker_grid
    fields: [shift_target_dim.skill_mix_name, z_analytics.skill_mix_ratio_filled_required,
      shift_dim.date_dow]
    pivots: [shift_dim.date_dow]
    fill_fields: [shift_dim.date_dow]
    filters: {}
    sorts: [shift_target_dim.skill_mix_name, shift_dim.date_dow]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      z_analytics.skill_mix_ratio_filled_required: "%"
      shift_dim.date_dow: Date
      shift_target_dim.skill_mix_name: Skill Mix
    series_cell_visualizations:
      z_analytics.skill_mix_ratio_filled_required:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          custom: {id: 1e6dc51d-bbad-883b-ab02-c21df5690dcb, label: Custom, type: continuous,
            stops: [{color: red, offset: 0}, {color: green, offset: 50}, {color: yellow,
                offset: 100}]}, options: {steps: 5, constraints: {min: {type: number,
                value: 0.75}, mid: {type: number, value: 1}, max: {type: number, value: 1.25}}}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    series_value_format:
      z_analytics.skill_mix_ratio_filled_required:
        name: percent_1
        decimals: '1'
        format_string: "#,##0.0%"
        label: Percent (1)
        label_prefix: Percent
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Time of Day: shift_dim.time_of_day
      Facility: run_name_dim.facility
      Department: run_name_dim.department
      Period Start Date: run_name_dim.period_start_string
      Latest Run: run_name_dim.is_latest_run
      Run Name ID: shift_staff_fact.run_name_id
    row: 20
    col: 0
    width: 24
    height: 4
  - title: FTE Min
    name: FTE Min
    model: cti_schedule_solver
    explore: shift_staff_fact
    type: looker_grid
    fields: [staff_dim.staff_name_34_id, shift_dim.shift_week_num, z_analytics.average_fte_scheduled]
    pivots: [shift_dim.shift_week_num]
    filters: {}
    sorts: [shift_dim.shift_week_num, z_analytics.average_fte_scheduled desc 0]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: []
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      staff_dim.staff_name_34_id: Staff Name - 3/4 ID
      z_analytics.fte_min_ratio: "%"
      shift_dim.shift_week_num: Shift Week
      z_analytics.average_fte_scheduled: "%"
    series_column_widths:
      staff_dim.staff_name_34_id: 255
    series_cell_visualizations:
      shift_staff_fact.count_scheduled:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: 1, background_color: "#0a0b73",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          custom: {id: 6003160e-9e93-2d63-894e-beef8497ffb6, label: Custom, type: continuous,
            stops: [{color: Orange, offset: 0}, {color: green, offset: 50}, {color: orange,
                offset: 100}]}, options: {steps: 5, constraints: {min: {type: number,
                value: 0.75}, mid: {type: number, value: 1}, max: {type: number, value: 1.5}},
            mirror: false, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Time of Day: shift_dim.time_of_day
      Facility: run_name_dim.facility
      Department: run_name_dim.department
      Period Start Date: run_name_dim.period_start_string
      Latest Run: run_name_dim.is_latest_run
      Run Name ID: shift_staff_fact.run_name_id
    row: 38
    col: 0
    width: 24
    height: 9
  - title: Shifts Scheduled by Preference
    name: Shifts Scheduled by Preference
    model: cti_schedule_solver
    explore: shift_staff_fact
    type: looker_bar
    fields: [staff_preferences_dim.count, shift_staff_fact.preference_text]
    pivots: [shift_staff_fact.preference_text]
    filters:
      shift_staff_fact.is_scheduled: 'Yes'
    sorts: [staff_preferences_dim.count desc 0, shift_staff_fact.preference_text]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: 1 - Weekend On - staff_preferences_dim.count,
            id: 1 - Weekend On - staff_preferences_dim.count, name: Weekend On}, {
            axisId: Prefer - staff_preferences_dim.count, id: Prefer - staff_preferences_dim.count,
            name: Prefer}, {axisId: Prefer not - staff_preferences_dim.count, id: Prefer
              not - staff_preferences_dim.count, name: Prefer not}, {axisId: shift_staff_fact.preference___null
              - staff_preferences_dim.count, id: shift_staff_fact.preference___null
              - staff_preferences_dim.count, name: X}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors:
      1 - Weekend On - staff_preferences_dim.count: darkgreen
      Prefer - staff_preferences_dim.count: green
      Prefer not - staff_preferences_dim.count: orange
      shift_staff_fact.preference___null - staff_preferences_dim.count: red
      Prefer - 2 - staff_preferences_dim.count: green
      Neutral - 3 - staff_preferences_dim.count: lightgreen
      5 - X - 5 - staff_preferences_dim.count: red
    series_labels:
      staff_dim.staff_name_34_id: Staff Name - 3/4 ID
      z_analytics.fte_min_ratio: "%"
      shift_dim.shift_week_num: Shift Week
      z_analytics.staff_satisfaction_ratio: "%"
      shift_staff_fact.preference___null - staff_preferences_dim.count: X
      1 - Weekend On - staff_preferences_dim.count: Weekend On
    show_sql_query_menu_options: false
    column_order: []
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    series_cell_visualizations:
      shift_staff_fact.count_scheduled:
        is_active: false
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: 1, background_color: "#0a0b73",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          custom: {id: 3fcd2814-c212-184f-6f2f-e72528f9130b, label: Custom, type: continuous,
            stops: [{color: Red, offset: 0}, {color: yellow, offset: 50}, {color: green,
                offset: 100}]}, options: {steps: 5, constraints: {min: {type: number,
                value: 0.75}, mid: {type: number, value: 0.9}, max: {type: number,
                value: 1}}, mirror: false, reverse: false, stepped: false}}, bold: false,
        italic: false, strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hide_totals: false
    hide_row_totals: false
    defaults_version: 1
    listen:
      Time of Day: shift_dim.time_of_day
      Facility: run_name_dim.facility
      Department: run_name_dim.department
      Period Start Date: run_name_dim.period_start_string
      Latest Run: run_name_dim.is_latest_run
      Run Name ID: shift_staff_fact.run_name_id
    row: 57
    col: 0
    width: 24
    height: 6
  - title: Staff Satisfaction
    name: Staff Satisfaction
    model: cti_schedule_solver
    explore: shift_staff_fact
    type: looker_grid
    fields: [staff_dim.staff_name_34_id, z_analytics.average_satisfaction_score, shift_dim.date_dow]
    pivots: [shift_dim.date_dow]
    fill_fields: [shift_dim.date_dow]
    filters: {}
    sorts: [staff_dim.staff_name_34_id, shift_dim.date_dow]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: []
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      staff_dim.staff_name_34_id: Staff Name - 3/4 ID
      z_analytics.fte_min_ratio: "%"
      shift_dim.shift_week_num: Shift Week
      z_analytics.staff_satisfaction_ratio: "%"
      z_analytics.average_satisfaction_score: "#"
      shift_dim.date_dow: Date
    series_cell_visualizations:
      shift_staff_fact.count_scheduled:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: 1, background_color: "#0a0b73",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          custom: {id: 3fcd2814-c212-184f-6f2f-e72528f9130b, label: Custom, type: continuous,
            stops: [{color: Red, offset: 0}, {color: yellow, offset: 50}, {color: green,
                offset: 100}]}, options: {steps: 5, constraints: {min: {type: number,
                value: -50}, mid: {type: number, value: -5}, max: {type: number, value: 50}},
            mirror: false, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Time of Day: shift_dim.time_of_day
      Facility: run_name_dim.facility
      Department: run_name_dim.department
      Period Start Date: run_name_dim.period_start_string
      Latest Run: run_name_dim.is_latest_run
      Run Name ID: shift_staff_fact.run_name_id
    row: 47
    col: 0
    width: 24
    height: 10
  - title: Proficiency Mix
    name: Proficiency Mix
    model: cti_schedule_solver
    explore: shift_staff_fact
    type: looker_grid
    fields: [z_analytics.proficiency_mix_ratio_filled_required_beginner, z_analytics.proficiency_mix_ratio_filled_required_advanced,
      z_analytics.proficiency_mix_ratio_filled_required_score, shift_dim.date_dow]
    fill_fields: [shift_dim.date_dow]
    filters: {}
    sorts: [shift_dim.date_dow]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: true
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: {}
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      z_analytics.proficiency_mix_ratio_filled_required_beginner: "% of Beginners\
        \ Scheduled"
      z_analytics.proficiency_mix_ratio_filled_required_advanced: "% of Advanced Scheduled"
      z_analytics.proficiency_mix_ratio_filled_required_score: Overall Score
    series_column_widths:
      shift_dim.day_number: 104
      z_analytics.proficiency_mix_ratio_filled_required_beginner: 191
      z_analytics.proficiency_mix_ratio_filled_required_advanced: 164
      z_analytics.proficiency_mix_ratio_filled_required_score: 93
    series_cell_visualizations:
      z_analytics.proficiency_mix_ratio_filled_required_beginner:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          custom: {id: 9d37feff-c18e-3683-158f-529295caca83, label: Custom, type: continuous,
            stops: [{color: green, offset: 0}, {color: red, offset: 100}]}, options: {
            steps: 5, constraints: {min: {type: number, value: 0.5}, mid: {type: number,
                value: 1}, max: {type: number, value: 1.25}}}}, bold: false, italic: false,
        strikethrough: false, fields: [z_analytics.proficiency_mix_ratio_filled_required_beginner]},
      {type: along a scale..., value: !!null '', background_color: "#1A73E8", font_color: !!null '',
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, custom: {
            id: 70fd814a-a067-2070-99ae-d6928930ab61, label: Custom, type: continuous,
            stops: [{color: red, offset: 0}, {color: green, offset: 100}]}, options: {
            steps: 5, constraints: {min: {type: number, value: 0.75}, mid: {type: number,
                value: 1}, max: {type: number, value: 1.1}}}}, bold: false, italic: false,
        strikethrough: false, fields: [z_analytics.proficiency_mix_ratio_filled_required_advanced]},
      {type: along a scale..., value: !!null '', background_color: "#1A73E8", font_color: !!null '',
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, custom: {
            id: 655732e7-cb5d-30af-ff27-50a273b2848f, label: Custom, type: continuous,
            stops: [{color: red, offset: 0}, {color: green, offset: 100}]}, options: {
            steps: 5, constraints: {min: {type: number, value: 0.5}, mid: {type: number,
                value: 1}, max: {type: number, value: 1.1}}}}, bold: false, italic: false,
        strikethrough: false, fields: [z_analytics.proficiency_mix_ratio_filled_required_score]}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    queryResponse:
      parent_id: a74940934b36e5149ff17cdc9072dd6f
      sql_changed: true
      aggregate_table_used_info:
      added_params:
      data:
      - shift_dim.date_dow:
          value: '2022-06-18'
          html: 'Sat Jun 18 '
        z_analytics.proficiency_mix_ratio_filled_required_beginner:
          value: 2.08
          rendered: 208.0%
          html: 208.0% (13/6.3)
        z_analytics.proficiency_mix_ratio_filled_required_advanced:
          value: 1.6
          rendered: 160.0%
          html: 160.0% (10/6.3)
        z_analytics.proficiency_mix_ratio_filled_required_score:
          value: 0.5
          rendered: 50.0%
      - shift_dim.date_dow:
          value: '2022-06-17'
          html: 'Fri Jun 17 '
        z_analytics.proficiency_mix_ratio_filled_required_beginner:
          value: 1.9310344827586208
          rendered: 193.1%
          html: 193.1% (14/7.3)
        z_analytics.proficiency_mix_ratio_filled_required_advanced:
          value: 1.3793103448275863
          rendered: 137.9%
          html: 137.9% (10/7.3)
        z_analytics.proficiency_mix_ratio_filled_required_score:
          value: 0.5
          rendered: 50.0%
      - shift_dim.date_dow:
          value: '2022-06-16'
          html: 'Thu Jun 16 '
        z_analytics.proficiency_mix_ratio_filled_required_beginner:
          value: 2
          rendered: 200.0%
          filterable_value: '2.0'
          html: 200.0% (14/7.0)
        z_analytics.proficiency_mix_ratio_filled_required_advanced:
          value: 1.4285714285714286
          rendered: 142.9%
          html: 142.9% (10/7.0)
        z_analytics.proficiency_mix_ratio_filled_required_score:
          value: 0.5
          rendered: 50.0%
      - shift_dim.date_dow:
          value: '2022-06-15'
          html: 'Wed Jun 15 '
        z_analytics.proficiency_mix_ratio_filled_required_beginner:
          value: 2
          rendered: 200.0%
          filterable_value: '2.0'
          html: 200.0% (7/3.5)
        z_analytics.proficiency_mix_ratio_filled_required_advanced:
          value: 0.8571428571428571
          rendered: 85.7%
          html: 85.7% (3/3.5)
        z_analytics.proficiency_mix_ratio_filled_required_score:
          value: 0.42857142857142855
          rendered: 42.9%
      - shift_dim.date_dow:
          value: '2022-06-14'
          html: 'Tue Jun 14 '
        z_analytics.proficiency_mix_ratio_filled_required_beginner:
          value: 2.6666666666666665
          rendered: 266.7%
          html: 266.7% (8/3.0)
        z_analytics.proficiency_mix_ratio_filled_required_advanced:
          value: 1
          rendered: 100.0%
          filterable_value: '1.0'
          html: 100.0% (3/3.0)
        z_analytics.proficiency_mix_ratio_filled_required_score:
          value: 0.5
          rendered: 50.0%
      - shift_dim.date_dow:
          value: '2022-06-13'
          html: 'Mon Jun 13 '
        z_analytics.proficiency_mix_ratio_filled_required_beginner:
          value: 2
          rendered: 200.0%
          filterable_value: '2.0'
          html: 200.0% (6/3.0)
        z_analytics.proficiency_mix_ratio_filled_required_advanced:
          value: 1
          rendered: 100.0%
          filterable_value: '1.0'
          html: 100.0% (3/3.0)
        z_analytics.proficiency_mix_ratio_filled_required_score:
          value: 0.5
          rendered: 50.0%
      - shift_dim.date_dow:
          value: '2022-06-12'
          html: 'Sun Jun 12 '
        z_analytics.proficiency_mix_ratio_filled_required_beginner:
          value: 2.769230769230769
          rendered: 276.9%
          html: 276.9% (9/3.3)
        z_analytics.proficiency_mix_ratio_filled_required_advanced:
          value: 0.9230769230769231
          rendered: 92.3%
          html: 92.3% (3/3.3)
        z_analytics.proficiency_mix_ratio_filled_required_score:
          value: 0.46153846153846156
          rendered: 46.2%
      - shift_dim.date_dow:
          value: '2022-06-11'
          html: 'Sat Jun 11 '
        z_analytics.proficiency_mix_ratio_filled_required_beginner:
          value: 1.7391304347826086
          rendered: 173.9%
          html: 173.9% (10/5.8)
        z_analytics.proficiency_mix_ratio_filled_required_advanced:
          value: 1.565217391304348
          rendered: 156.5%
          html: 156.5% (9/5.8)
        z_analytics.proficiency_mix_ratio_filled_required_score:
          value: 0.5
          rendered: 50.0%
      - shift_dim.date_dow:
          value: '2022-06-10'
          html: 'Fri Jun 10 '
        z_analytics.proficiency_mix_ratio_filled_required_beginner:
          value: 1.9259259259259258
          rendered: 192.6%
          html: 192.6% (13/6.8)
        z_analytics.proficiency_mix_ratio_filled_required_advanced:
          value: 1.3333333333333333
          rendered: 133.3%
          html: 133.3% (9/6.8)
        z_analytics.proficiency_mix_ratio_filled_required_score:
          value: 0.5
          rendered: 50.0%
      - shift_dim.date_dow:
          value: '2022-06-09'
          html: 'Thu Jun 09 '
        z_analytics.proficiency_mix_ratio_filled_required_beginner:
          value: 1.8
          rendered: 180.0%
          html: 180.0% (9/5.0)
        z_analytics.proficiency_mix_ratio_filled_required_advanced:
          value: 1.6
          rendered: 160.0%
          html: 160.0% (8/5.0)
        z_analytics.proficiency_mix_ratio_filled_required_score:
          value: 0.5
          rendered: 50.0%
      - shift_dim.date_dow:
          value: '2022-06-08'
          html: 'Wed Jun 08 '
        z_analytics.proficiency_mix_ratio_filled_required_beginner:
          value: 2.2222222222222223
          rendered: 222.2%
          html: 222.2% (10/4.5)
        z_analytics.proficiency_mix_ratio_filled_required_advanced:
          value: 0.8888888888888888
          rendered: 88.9%
          html: 88.9% (4/4.5)
        z_analytics.proficiency_mix_ratio_filled_required_score:
          value: 0.4444444444444444
          rendered: 44.4%
      - shift_dim.date_dow:
          value: '2022-06-07'
          html: 'Tue Jun 07 '
        z_analytics.proficiency_mix_ratio_filled_required_beginner:
          value: 2.5454545454545454
          rendered: 254.5%
          html: 254.5% (14/5.5)
        z_analytics.proficiency_mix_ratio_filled_required_advanced:
          value: 1.0909090909090908
          rendered: 109.1%
          html: 109.1% (6/5.5)
        z_analytics.proficiency_mix_ratio_filled_required_score:
          value: 0.5
          rendered: 50.0%
      - shift_dim.date_dow:
          value: '2022-06-06'
          html: 'Mon Jun 06 '
        z_analytics.proficiency_mix_ratio_filled_required_beginner:
          value: 2.4
          rendered: 240.0%
          html: 240.0% (12/5.0)
        z_analytics.proficiency_mix_ratio_filled_required_advanced:
          value: 1.4
          rendered: 140.0%
          html: 140.0% (7/5.0)
        z_analytics.proficiency_mix_ratio_filled_required_score:
          value: 0.5
          rendered: 50.0%
      - shift_dim.date_dow:
          value: '2022-06-05'
          html: 'Sun Jun 05 '
        z_analytics.proficiency_mix_ratio_filled_required_beginner:
          value: 2.1333333333333333
          rendered: 213.3%
          html: 213.3% (8/3.8)
        z_analytics.proficiency_mix_ratio_filled_required_advanced:
          value: 1.6
          rendered: 160.0%
          html: 160.0% (6/3.8)
        z_analytics.proficiency_mix_ratio_filled_required_score:
          value: 0.5
          rendered: 50.0%
      - shift_dim.date_dow:
          value: '2022-06-04'
          html: 'Sat Jun 04 '
        z_analytics.proficiency_mix_ratio_filled_required_beginner:
          value: 2.0869565217391304
          rendered: 208.7%
          html: 208.7% (12/5.8)
        z_analytics.proficiency_mix_ratio_filled_required_advanced:
          value: 1.391304347826087
          rendered: 139.1%
          html: 139.1% (8/5.8)
        z_analytics.proficiency_mix_ratio_filled_required_score:
          value: 0.5
          rendered: 50.0%
      - shift_dim.date_dow:
          value: '2022-06-03'
          html: 'Fri Jun 03 '
        z_analytics.proficiency_mix_ratio_filled_required_beginner:
          value: 1.8181818181818181
          rendered: 181.8%
          html: 181.8% (10/5.5)
        z_analytics.proficiency_mix_ratio_filled_required_advanced:
          value: 1.4545454545454546
          rendered: 145.5%
          html: 145.5% (8/5.5)
        z_analytics.proficiency_mix_ratio_filled_required_score:
          value: 0.5
          rendered: 50.0%
      - shift_dim.date_dow:
          value: '2022-06-02'
          html: 'Thu Jun 02 '
        z_analytics.proficiency_mix_ratio_filled_required_beginner:
          value: 2.24
          rendered: 224.0%
          html: 224.0% (14/6.3)
        z_analytics.proficiency_mix_ratio_filled_required_advanced:
          value: 1.44
          rendered: 144.0%
          html: 144.0% (9/6.3)
        z_analytics.proficiency_mix_ratio_filled_required_score:
          value: 0.5
          rendered: 50.0%
      - shift_dim.date_dow:
          value: '2022-06-01'
          html: 'Wed Jun 01 '
        z_analytics.proficiency_mix_ratio_filled_required_beginner:
          value: 2.1538461538461537
          rendered: 215.4%
          html: 215.4% (7/3.3)
        z_analytics.proficiency_mix_ratio_filled_required_advanced:
          value: 1.2307692307692308
          rendered: 123.1%
          html: 123.1% (4/3.3)
        z_analytics.proficiency_mix_ratio_filled_required_score:
          value: 0.5
          rendered: 50.0%
      - shift_dim.date_dow:
          value: '2022-05-31'
          html: 'Tue May 31 '
        z_analytics.proficiency_mix_ratio_filled_required_beginner:
          value: 2.933333333333333
          rendered: 293.3%
          html: 293.3% (11/3.8)
        z_analytics.proficiency_mix_ratio_filled_required_advanced:
          value: 0.26666666666666666
          rendered: 26.7%
          html: 26.7% (1/3.8)
        z_analytics.proficiency_mix_ratio_filled_required_score:
          value: 0.13333333333333333
          rendered: 13.3%
      - shift_dim.date_dow:
          value: '2022-05-30'
          html: 'Mon May 30 '
        z_analytics.proficiency_mix_ratio_filled_required_beginner:
          value: 2
          rendered: 200.0%
          filterable_value: '2.0'
          html: 200.0% (12/6.0)
        z_analytics.proficiency_mix_ratio_filled_required_advanced:
          value: 1.3333333333333333
          rendered: 133.3%
          html: 133.3% (8/6.0)
        z_analytics.proficiency_mix_ratio_filled_required_score:
          value: 0.5
          rendered: 50.0%
      - shift_dim.date_dow:
          value: '2022-05-29'
          html: 'Sun May 29 '
        z_analytics.proficiency_mix_ratio_filled_required_beginner:
          value: 2.4761904761904763
          rendered: 247.6%
          html: 247.6% (13/5.3)
        z_analytics.proficiency_mix_ratio_filled_required_advanced:
          value: 1.3333333333333333
          rendered: 133.3%
          html: 133.3% (7/5.3)
        z_analytics.proficiency_mix_ratio_filled_required_score:
          value: 0.5
          rendered: 50.0%
      - shift_dim.date_dow:
          value: '2022-05-28'
          html: 'Sat May 28 '
        z_analytics.proficiency_mix_ratio_filled_required_beginner:
          value: 1.7777777777777777
          rendered: 177.8%
          html: 177.8% (4/2.3)
        z_analytics.proficiency_mix_ratio_filled_required_advanced:
          value: 1.3333333333333333
          rendered: 133.3%
          html: 133.3% (3/2.3)
        z_analytics.proficiency_mix_ratio_filled_required_score:
          value: 0.5
          rendered: 50.0%
      - shift_dim.date_dow:
          value: '2022-05-27'
          html: 'Fri May 27 '
        z_analytics.proficiency_mix_ratio_filled_required_beginner:
          value: 1.75
          rendered: 175.0%
          html: 175.0% (7/4.0)
        z_analytics.proficiency_mix_ratio_filled_required_advanced:
          value: 1.5
          rendered: 150.0%
          html: 150.0% (6/4.0)
        z_analytics.proficiency_mix_ratio_filled_required_score:
          value: 0.5
          rendered: 50.0%
      - shift_dim.date_dow:
          value: '2022-05-26'
          html: 'Thu May 26 '
        z_analytics.proficiency_mix_ratio_filled_required_beginner:
          value: 2.75
          rendered: 275.0%
          html: 275.0% (11/4.0)
        z_analytics.proficiency_mix_ratio_filled_required_advanced:
          value: 0.5
          rendered: 50.0%
          html: 50.0% (2/4.0)
        z_analytics.proficiency_mix_ratio_filled_required_score:
          value: 0.25
          rendered: 25.0%
      - shift_dim.date_dow:
          value: '2022-05-25'
          html: 'Wed May 25 '
        z_analytics.proficiency_mix_ratio_filled_required_beginner:
          value: 2
          rendered: 200.0%
          filterable_value: '2.0'
          html: 200.0% (8/4.0)
        z_analytics.proficiency_mix_ratio_filled_required_advanced:
          value: 1.25
          rendered: 125.0%
          html: 125.0% (5/4.0)
        z_analytics.proficiency_mix_ratio_filled_required_score:
          value: 0.5
          rendered: 50.0%
      - shift_dim.date_dow:
          value: '2022-05-24'
          html: 'Tue May 24 '
        z_analytics.proficiency_mix_ratio_filled_required_beginner:
          value: 2
          rendered: 200.0%
          filterable_value: '2.0'
          html: 200.0% (15/7.5)
        z_analytics.proficiency_mix_ratio_filled_required_advanced:
          value: 1.3333333333333333
          rendered: 133.3%
          html: 133.3% (10/7.5)
        z_analytics.proficiency_mix_ratio_filled_required_score:
          value: 0.5
          rendered: 50.0%
      - shift_dim.date_dow:
          value: '2022-05-23'
          html: 'Mon May 23 '
        z_analytics.proficiency_mix_ratio_filled_required_beginner:
          value: 2.2857142857142856
          rendered: 228.6%
          html: 228.6% (16/7.0)
        z_analytics.proficiency_mix_ratio_filled_required_advanced:
          value: 1.4285714285714286
          rendered: 142.9%
          html: 142.9% (10/7.0)
        z_analytics.proficiency_mix_ratio_filled_required_score:
          value: 0.5
          rendered: 50.0%
      - shift_dim.date_dow:
          value: '2022-05-22'
          html: 'Sun May 22 '
        z_analytics.proficiency_mix_ratio_filled_required_beginner:
          value: 1.9310344827586208
          rendered: 193.1%
          html: 193.1% (14/7.3)
        z_analytics.proficiency_mix_ratio_filled_required_advanced:
          value: 1.5172413793103448
          rendered: 151.7%
          html: 151.7% (11/7.3)
        z_analytics.proficiency_mix_ratio_filled_required_score:
          value: 0.5
          rendered: 50.0%
      drill_menu_build_time: 0.033369
      expired: false
      fields:
        measures:
        - align: right
          can_filter: true
          category: measure
          default_filter_value:
          description: ''
          enumerations:
          field_group_label: 2 Proficiency Mix (Beginner)
          fill_style:
          fiscal_month_offset: 0
          has_allowed_values: false
          hidden: false
          is_filter: false
          is_numeric: true
          label: Analytics C Proficiency Mix % (Beginner)
          label_from_parameter:
          label_short: C Proficiency Mix % (Beginner)
          map_layer:
          name: z_analytics.proficiency_mix_ratio_filled_required_beginner
          strict_value_format: false
          requires_refresh_on_sort: false
          sortable: true
          suggestions:
          tags: []
          type: number
          user_attribute_filter_types:
          - number
          - advanced_filter_number
          value_format: "#,##0.0%"
          view: z_analytics
          view_label: Analytics
          dynamic: false
          week_start_day: monday
          original_view: z_analytics
          dimension_group:
          error:
          field_group_variant: C Proficiency Mix % (Beginner)
          measure: true
          parameter: false
          primary_key: false
          project_name: cti-schedule-solver
          scope: z_analytics
          suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_beginner
          suggest_explore: shift_staff_fact
          suggestable: false
          is_fiscal: false
          is_timeframe: false
          can_time_filter: false
          time_interval:
          lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=161"
          permanent:
          source_file: solver_views/v_00_analytics.view.lkml
          source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
          sql: "${sum_proficiency_mix_filled_beginner} / nullif(${sum_proficiency_mix_required_beginner},0) "
          sql_case:
          filters:
          times_used: 0
        - align: right
          can_filter: true
          category: measure
          default_filter_value:
          description: ''
          enumerations:
          field_group_label: 2 Proficiency Mix (Advanced)
          fill_style:
          fiscal_month_offset: 0
          has_allowed_values: false
          hidden: false
          is_filter: false
          is_numeric: true
          label: Analytics C Proficiency Mix % (Advanced)
          label_from_parameter:
          label_short: C Proficiency Mix % (Advanced)
          map_layer:
          name: z_analytics.proficiency_mix_ratio_filled_required_advanced
          strict_value_format: false
          requires_refresh_on_sort: false
          sortable: true
          suggestions:
          tags: []
          type: number
          user_attribute_filter_types:
          - number
          - advanced_filter_number
          value_format: "#,##0.0%"
          view: z_analytics
          view_label: Analytics
          dynamic: false
          week_start_day: monday
          original_view: z_analytics
          dimension_group:
          error:
          field_group_variant: C Proficiency Mix % (Advanced)
          measure: true
          parameter: false
          primary_key: false
          project_name: cti-schedule-solver
          scope: z_analytics
          suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_advanced
          suggest_explore: shift_staff_fact
          suggestable: false
          is_fiscal: false
          is_timeframe: false
          can_time_filter: false
          time_interval:
          lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=109"
          permanent:
          source_file: solver_views/v_00_analytics.view.lkml
          source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
          sql: "${sum_proficiency_mix_filled_advanced} / nullif(${sum_proficiency_mix_required_advanced},0) "
          sql_case:
          filters:
          times_used: 0
        - align: right
          can_filter: true
          category: measure
          default_filter_value:
          description: ''
          enumerations:
          field_group_label: 0 Overall Score
          fill_style:
          fiscal_month_offset: 0
          has_allowed_values: false
          hidden: false
          is_filter: false
          is_numeric: true
          label: Analytics 2 Proficiency Mix Score
          label_from_parameter:
          label_short: 2 Proficiency Mix Score
          map_layer:
          name: z_analytics.proficiency_mix_ratio_filled_required_score
          strict_value_format: false
          requires_refresh_on_sort: false
          sortable: true
          suggestions:
          tags: []
          type: number
          user_attribute_filter_types:
          - number
          - advanced_filter_number
          value_format: "#,##0.0%"
          view: z_analytics
          view_label: Analytics
          dynamic: false
          week_start_day: monday
          original_view: z_analytics
          dimension_group:
          error:
          field_group_variant: 2 Proficiency Mix Score
          measure: true
          parameter: false
          primary_key: false
          project_name: cti-schedule-solver
          scope: z_analytics
          suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_score
          suggest_explore: shift_staff_fact
          suggestable: false
          is_fiscal: false
          is_timeframe: false
          can_time_filter: false
          time_interval:
          lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=186"
          permanent:
          source_file: solver_views/v_00_analytics.view.lkml
          source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
          sql: "(\n        -- This is the score for advanced -- not the arrow b/c\
            \ we don't mind too many\n        case\n          when ${sum_proficiency_mix_filled_advanced}\
            \ > ${sum_proficiency_mix_required_advanced} then 1\n          else ${sum_proficiency_mix_filled_advanced}\
            \ / nullif(${sum_proficiency_mix_required_advanced},0)\n        end\n\
            \        +\n        -- This is the score for beginner -- not the arrow\
            \ b/c we don't mind too few\n        case\n          when ${sum_proficiency_mix_filled_beginner}\
            \ <= ${sum_proficiency_mix_required_beginner} then 1\n          else 0\n\
            \        end\n      )\n      -- Then take a straight average\n       \
            \ / 2\n      "
          sql_case:
          filters:
          times_used: 0
        dimensions:
        - align: left
          can_filter: true
          category: dimension
          default_filter_value:
          description: ''
          enumerations:
          field_group_label: Shift
          fill_style: range
          fiscal_month_offset: 0
          has_allowed_values: false
          hidden: false
          is_filter: false
          is_numeric: false
          label: Analytics Date Dow
          label_from_parameter:
          label_short: Date Dow
          map_layer:
          name: shift_dim.date_dow
          strict_value_format: false
          requires_refresh_on_sort: false
          sortable: true
          suggestions:
          tags: []
          type: date
          user_attribute_filter_types:
          - datetime
          - advanced_filter_datetime
          value_format:
          view: shift_dim
          view_label: Analytics
          dynamic: false
          week_start_day: monday
          original_view: shift_dim
          dimension_group:
          error:
          field_group_variant: Date Dow
          measure: false
          parameter: false
          primary_key: false
          project_name: cti-schedule-solver
          scope: shift_dim
          suggest_dimension: shift_dim.date_dow
          suggest_explore: shift_staff_fact
          suggestable: false
          is_fiscal: false
          is_timeframe: true
          can_time_filter: false
          time_interval:
            name: day
            count: 1
          lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_02_shift_dim.view.lkml?line=90"
          permanent:
          source_file: solver_views/v_02_shift_dim.view.lkml
          source_file_path: cti-schedule-solver/solver_views/v_02_shift_dim.view.lkml
          sql: "${shift_date} "
          sql_case:
          filters:
          times_used: 0
          sorted:
            desc: true
            sort_index: 0
        table_calculations: []
        pivots: []
        measure_like:
        - align: right
          can_filter: true
          category: measure
          default_filter_value:
          description: ''
          enumerations:
          field_group_label: 2 Proficiency Mix (Beginner)
          fill_style:
          fiscal_month_offset: 0
          has_allowed_values: false
          hidden: false
          is_filter: false
          is_numeric: true
          label: Analytics C Proficiency Mix % (Beginner)
          label_from_parameter:
          label_short: C Proficiency Mix % (Beginner)
          map_layer:
          name: z_analytics.proficiency_mix_ratio_filled_required_beginner
          strict_value_format: false
          requires_refresh_on_sort: false
          sortable: true
          suggestions:
          tags: []
          type: number
          user_attribute_filter_types:
          - number
          - advanced_filter_number
          value_format: "#,##0.0%"
          view: z_analytics
          view_label: Analytics
          dynamic: false
          week_start_day: monday
          original_view: z_analytics
          dimension_group:
          error:
          field_group_variant: C Proficiency Mix % (Beginner)
          measure: true
          parameter: false
          primary_key: false
          project_name: cti-schedule-solver
          scope: z_analytics
          suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_beginner
          suggest_explore: shift_staff_fact
          suggestable: false
          is_fiscal: false
          is_timeframe: false
          can_time_filter: false
          time_interval:
          lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=161"
          permanent:
          source_file: solver_views/v_00_analytics.view.lkml
          source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
          sql: "${sum_proficiency_mix_filled_beginner} / nullif(${sum_proficiency_mix_required_beginner},0) "
          sql_case:
          filters:
          times_used: 0
        - align: right
          can_filter: true
          category: measure
          default_filter_value:
          description: ''
          enumerations:
          field_group_label: 2 Proficiency Mix (Advanced)
          fill_style:
          fiscal_month_offset: 0
          has_allowed_values: false
          hidden: false
          is_filter: false
          is_numeric: true
          label: Analytics C Proficiency Mix % (Advanced)
          label_from_parameter:
          label_short: C Proficiency Mix % (Advanced)
          map_layer:
          name: z_analytics.proficiency_mix_ratio_filled_required_advanced
          strict_value_format: false
          requires_refresh_on_sort: false
          sortable: true
          suggestions:
          tags: []
          type: number
          user_attribute_filter_types:
          - number
          - advanced_filter_number
          value_format: "#,##0.0%"
          view: z_analytics
          view_label: Analytics
          dynamic: false
          week_start_day: monday
          original_view: z_analytics
          dimension_group:
          error:
          field_group_variant: C Proficiency Mix % (Advanced)
          measure: true
          parameter: false
          primary_key: false
          project_name: cti-schedule-solver
          scope: z_analytics
          suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_advanced
          suggest_explore: shift_staff_fact
          suggestable: false
          is_fiscal: false
          is_timeframe: false
          can_time_filter: false
          time_interval:
          lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=109"
          permanent:
          source_file: solver_views/v_00_analytics.view.lkml
          source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
          sql: "${sum_proficiency_mix_filled_advanced} / nullif(${sum_proficiency_mix_required_advanced},0) "
          sql_case:
          filters:
          times_used: 0
        - align: right
          can_filter: true
          category: measure
          default_filter_value:
          description: ''
          enumerations:
          field_group_label: 0 Overall Score
          fill_style:
          fiscal_month_offset: 0
          has_allowed_values: false
          hidden: false
          is_filter: false
          is_numeric: true
          label: Analytics 2 Proficiency Mix Score
          label_from_parameter:
          label_short: 2 Proficiency Mix Score
          map_layer:
          name: z_analytics.proficiency_mix_ratio_filled_required_score
          strict_value_format: false
          requires_refresh_on_sort: false
          sortable: true
          suggestions:
          tags: []
          type: number
          user_attribute_filter_types:
          - number
          - advanced_filter_number
          value_format: "#,##0.0%"
          view: z_analytics
          view_label: Analytics
          dynamic: false
          week_start_day: monday
          original_view: z_analytics
          dimension_group:
          error:
          field_group_variant: 2 Proficiency Mix Score
          measure: true
          parameter: false
          primary_key: false
          project_name: cti-schedule-solver
          scope: z_analytics
          suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_score
          suggest_explore: shift_staff_fact
          suggestable: false
          is_fiscal: false
          is_timeframe: false
          can_time_filter: false
          time_interval:
          lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=186"
          permanent:
          source_file: solver_views/v_00_analytics.view.lkml
          source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
          sql: "(\n        -- This is the score for advanced -- not the arrow b/c\
            \ we don't mind too many\n        case\n          when ${sum_proficiency_mix_filled_advanced}\
            \ > ${sum_proficiency_mix_required_advanced} then 1\n          else ${sum_proficiency_mix_filled_advanced}\
            \ / nullif(${sum_proficiency_mix_required_advanced},0)\n        end\n\
            \        +\n        -- This is the score for beginner -- not the arrow\
            \ b/c we don't mind too few\n        case\n          when ${sum_proficiency_mix_filled_beginner}\
            \ <= ${sum_proficiency_mix_required_beginner} then 1\n          else 0\n\
            \        end\n      )\n      -- Then take a straight average\n       \
            \ / 2\n      "
          sql_case:
          filters:
          times_used: 0
        dimension_like:
        - align: left
          can_filter: true
          category: dimension
          default_filter_value:
          description: ''
          enumerations:
          field_group_label: Shift
          fill_style: range
          fiscal_month_offset: 0
          has_allowed_values: false
          hidden: false
          is_filter: false
          is_numeric: false
          label: Analytics Date Dow
          label_from_parameter:
          label_short: Date Dow
          map_layer:
          name: shift_dim.date_dow
          strict_value_format: false
          requires_refresh_on_sort: false
          sortable: true
          suggestions:
          tags: []
          type: date
          user_attribute_filter_types:
          - datetime
          - advanced_filter_datetime
          value_format:
          view: shift_dim
          view_label: Analytics
          dynamic: false
          week_start_day: monday
          original_view: shift_dim
          dimension_group:
          error:
          field_group_variant: Date Dow
          measure: false
          parameter: false
          primary_key: false
          project_name: cti-schedule-solver
          scope: shift_dim
          suggest_dimension: shift_dim.date_dow
          suggest_explore: shift_staff_fact
          suggestable: false
          is_fiscal: false
          is_timeframe: true
          can_time_filter: false
          time_interval:
            name: day
            count: 1
          lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_02_shift_dim.view.lkml?line=90"
          permanent:
          source_file: solver_views/v_02_shift_dim.view.lkml
          source_file_path: cti-schedule-solver/solver_views/v_02_shift_dim.view.lkml
          sql: "${shift_date} "
          sql_case:
          filters:
          times_used: 0
          sorted:
            desc: true
            sort_index: 0
      fill_fields:
      - shift_dim.date_dow
      forecast_result:
      has_row_totals: false
      has_totals: false
      id: query-result-93:{}
      null_sort_treatment: low
      number_format: '1,234.56'
      ran_at: '2022-05-12T15:44:45+00:00'
      runtime: '1.463'
      sql: |-
        -- raw sql results do not include filled-in values for 'shift_dim.date_dow'


        SELECT
            (DATE(shift_dim.shift_date )) AS shift_dim_date_dow,
            COUNT(DISTINCT CASE WHEN staff_competency_dim.overall_proficiency = 'Beginner' and shift_staff_fact.is_scheduled  THEN ( shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  )  ELSE NULL END) AS z_analytics_sum_proficiency_mix_filled_beginner,
                COUNT(DISTINCT CASE WHEN shift_staff_fact.is_scheduled  THEN shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  ELSE NULL END) * 0.25 AS z_analytics_sum_proficiency_mix_required_beginner,
                COUNT(DISTINCT CASE WHEN staff_competency_dim.overall_proficiency = 'Beginner' and shift_staff_fact.is_scheduled  THEN ( shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  )  ELSE NULL END) / nullif(COUNT(DISTINCT CASE WHEN shift_staff_fact.is_scheduled  THEN shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  ELSE NULL END) * 0.25, 0) AS z_analytics_proficiency_mix_ratio_filled_required_beginner,
            COUNT(DISTINCT CASE WHEN staff_competency_dim.overall_proficiency = 'Advanced' and shift_staff_fact.is_scheduled  THEN ( shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  )  ELSE NULL END) AS z_analytics_sum_proficiency_mix_filled_advanced,
                COUNT(DISTINCT CASE WHEN shift_staff_fact.is_scheduled  THEN shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  ELSE NULL END) * 0.25 AS z_analytics_sum_proficiency_mix_required_advanced,
                COUNT(DISTINCT CASE WHEN staff_competency_dim.overall_proficiency = 'Advanced' and shift_staff_fact.is_scheduled  THEN ( shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  )  ELSE NULL END) / nullif(COUNT(DISTINCT CASE WHEN shift_staff_fact.is_scheduled  THEN shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  ELSE NULL END) * 0.25, 0) AS z_analytics_proficiency_mix_ratio_filled_required_advanced,
                    (CASE WHEN COUNT(DISTINCT CASE WHEN staff_competency_dim.overall_proficiency = 'Advanced' and shift_staff_fact.is_scheduled  THEN ( shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  )  ELSE NULL END) > COUNT(DISTINCT CASE WHEN shift_staff_fact.is_scheduled  THEN shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  ELSE NULL END) * 0.25 THEN 1 ELSE COUNT(DISTINCT CASE WHEN staff_competency_dim.overall_proficiency = 'Advanced' and shift_staff_fact.is_scheduled  THEN ( shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  )  ELSE NULL END) / nullif(COUNT(DISTINCT CASE WHEN shift_staff_fact.is_scheduled  THEN shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  ELSE NULL END) * 0.25, 0) END + CASE WHEN COUNT(DISTINCT CASE WHEN staff_competency_dim.overall_proficiency = 'Beginner' and shift_staff_fact.is_scheduled  THEN ( shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  )  ELSE NULL END) <= COUNT(DISTINCT CASE WHEN shift_staff_fact.is_scheduled  THEN shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  ELSE NULL END) * 0.25 THEN 1 ELSE 0 END) / 2 AS z_analytics_proficiency_mix_ratio_filled_required_score
        FROM optimizer.analytics_table_01_shift_staff_fact
             AS shift_staff_fact
        LEFT JOIN optimizer.analytics_table_02_shift_dim
             AS shift_dim ON shift_staff_fact.run_name_id = shift_dim.run_name_id
              AND shift_staff_fact.shift_id = shift_dim.shift_id

        LEFT JOIN optimizer.analytics_table_05_staff_dim
             AS staff_dim ON shift_staff_fact.run_name_id = staff_dim.run_name_id
            AND shift_staff_fact.staff_id = staff_dim.staff_id

        LEFT JOIN optimizer.analytics_table_07_staff_competency_dim
             AS staff_competency_dim ON staff_dim.run_name_id = staff_competency_dim.run_name_id
            AND staff_dim.staff_id = staff_competency_dim.staff_id

        LEFT JOIN (SELECT 'x' as x)  AS z_analytics ON 1 = 1
        WHERE (shift_staff_fact.run_name_id ) = '9'
        GROUP BY
            1
        ORDER BY
            1 DESC
        LIMIT 500
      sql_explain:
      supports_pivot_in_db: true
      timezone: America/Chicago
      is_local: true
      table_calcs_complete: true
      tracked_attributes:
        result.drill_menu_build_time: 0.033369
        result.from_cache: false
        result.runtime: '1.463'
        result.sql.length: 4465
        result.supports_pivot_in_db: true
      sorts:
      - name: shift_dim.date_dow
        desc: true
    config:
      show_view_names: false
      show_row_numbers: true
      transpose: true
      truncate_text: true
      hide_totals: false
      hide_row_totals: false
      size_to_fit: true
      table_theme: white
      limit_displayed_rows: false
      enable_conditional_formatting: true
      header_text_alignment: left
      header_font_size: '12'
      rows_font_size: '12'
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      show_sql_query_menu_options: false
      column_order: {}
      show_totals: true
      show_row_totals: true
      truncate_header: false
      series_labels:
        z_analytics.proficiency_mix_ratio_filled_required_beginner: "% of Beginners\
          \ Scheduled"
        z_analytics.proficiency_mix_ratio_filled_required_advanced: "% of Advanced\
          \ Scheduled"
        z_analytics.proficiency_mix_ratio_filled_required_score: Overall Score
      series_column_widths:
        shift_dim.day_number: 104
        z_analytics.proficiency_mix_ratio_filled_required_beginner: 191
        z_analytics.proficiency_mix_ratio_filled_required_advanced: 164
        z_analytics.proficiency_mix_ratio_filled_required_score: 93
      series_cell_visualizations:
        z_analytics.proficiency_mix_ratio_filled_required_beginner:
          is_active: false
      conditional_formatting:
      - type: along a scale...
        value:
        background_color: "#1A73E8"
        font_color:
        color_application:
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
          custom:
            id: 9d37feff-c18e-3683-158f-529295caca83
            label: Custom
            type: continuous
            stops:
            - color: green
              offset: 0
            - color: red
              offset: 100
          options:
            steps: 5
            constraints:
              min:
                type: number
                value: 0.5
              mid:
                type: number
                value: 1
              max:
                type: number
                value: 1.25
        bold: false
        italic: false
        strikethrough: false
        fields:
        - z_analytics.proficiency_mix_ratio_filled_required_beginner
      - type: along a scale...
        value:
        background_color: "#1A73E8"
        font_color:
        color_application:
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
          custom:
            id: 70fd814a-a067-2070-99ae-d6928930ab61
            label: Custom
            type: continuous
            stops:
            - color: red
              offset: 0
            - color: green
              offset: 100
          options:
            steps: 5
            constraints:
              min:
                type: number
                value: 0.75
              mid:
                type: number
                value: 1
              max:
                type: number
                value: 1.1
        bold: false
        italic: false
        strikethrough: false
        fields:
        - z_analytics.proficiency_mix_ratio_filled_required_advanced
      - type: along a scale...
        value:
        background_color: "#1A73E8"
        font_color:
        color_application:
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
          custom:
            id: 655732e7-cb5d-30af-ff27-50a273b2848f
            label: Custom
            type: continuous
            stops:
            - color: red
              offset: 0
            - color: green
              offset: 100
          options:
            steps: 5
            constraints:
              min:
                type: number
                value: 0.5
              mid:
                type: number
                value: 1
              max:
                type: number
                value: 1.1
        bold: false
        italic: false
        strikethrough: false
        fields:
        - z_analytics.proficiency_mix_ratio_filled_required_score
      type: looker_grid
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ''
      stacking: ''
      legend_position: center
      point_style: none
      show_value_labels: false
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      show_null_points: true
      interpolation: linear
      defaults_version: 1
      series_types: {}
      query_fields:
        measures:
        - align: right
          can_filter: true
          category: measure
          default_filter_value:
          description: ''
          enumerations:
          field_group_label: 2 Proficiency Mix (Beginner)
          fill_style:
          fiscal_month_offset: 0
          has_allowed_values: false
          hidden: false
          is_filter: false
          is_numeric: true
          label: Analytics C Proficiency Mix % (Beginner)
          label_from_parameter:
          label_short: C Proficiency Mix % (Beginner)
          map_layer:
          name: z_analytics.proficiency_mix_ratio_filled_required_beginner
          strict_value_format: false
          requires_refresh_on_sort: false
          sortable: true
          suggestions:
          tags: []
          type: number
          user_attribute_filter_types:
          - number
          - advanced_filter_number
          value_format: "#,##0.0%"
          view: z_analytics
          view_label: Analytics
          dynamic: false
          week_start_day: monday
          original_view: z_analytics
          dimension_group:
          error:
          field_group_variant: C Proficiency Mix % (Beginner)
          measure: true
          parameter: false
          primary_key: false
          project_name: cti-schedule-solver
          scope: z_analytics
          suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_beginner
          suggest_explore: shift_staff_fact
          suggestable: false
          is_fiscal: false
          is_timeframe: false
          can_time_filter: false
          time_interval:
          lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=161"
          permanent:
          source_file: solver_views/v_00_analytics.view.lkml
          source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
          sql: "${sum_proficiency_mix_filled_beginner} / nullif(${sum_proficiency_mix_required_beginner},0) "
          sql_case:
          filters:
          times_used: 0
        - align: right
          can_filter: true
          category: measure
          default_filter_value:
          description: ''
          enumerations:
          field_group_label: 2 Proficiency Mix (Advanced)
          fill_style:
          fiscal_month_offset: 0
          has_allowed_values: false
          hidden: false
          is_filter: false
          is_numeric: true
          label: Analytics C Proficiency Mix % (Advanced)
          label_from_parameter:
          label_short: C Proficiency Mix % (Advanced)
          map_layer:
          name: z_analytics.proficiency_mix_ratio_filled_required_advanced
          strict_value_format: false
          requires_refresh_on_sort: false
          sortable: true
          suggestions:
          tags: []
          type: number
          user_attribute_filter_types:
          - number
          - advanced_filter_number
          value_format: "#,##0.0%"
          view: z_analytics
          view_label: Analytics
          dynamic: false
          week_start_day: monday
          original_view: z_analytics
          dimension_group:
          error:
          field_group_variant: C Proficiency Mix % (Advanced)
          measure: true
          parameter: false
          primary_key: false
          project_name: cti-schedule-solver
          scope: z_analytics
          suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_advanced
          suggest_explore: shift_staff_fact
          suggestable: false
          is_fiscal: false
          is_timeframe: false
          can_time_filter: false
          time_interval:
          lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=109"
          permanent:
          source_file: solver_views/v_00_analytics.view.lkml
          source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
          sql: "${sum_proficiency_mix_filled_advanced} / nullif(${sum_proficiency_mix_required_advanced},0) "
          sql_case:
          filters:
          times_used: 0
        - align: right
          can_filter: true
          category: measure
          default_filter_value:
          description: ''
          enumerations:
          field_group_label: 0 Overall Score
          fill_style:
          fiscal_month_offset: 0
          has_allowed_values: false
          hidden: false
          is_filter: false
          is_numeric: true
          label: Analytics 2 Proficiency Mix Score
          label_from_parameter:
          label_short: 2 Proficiency Mix Score
          map_layer:
          name: z_analytics.proficiency_mix_ratio_filled_required_score
          strict_value_format: false
          requires_refresh_on_sort: false
          sortable: true
          suggestions:
          tags: []
          type: number
          user_attribute_filter_types:
          - number
          - advanced_filter_number
          value_format: "#,##0.0%"
          view: z_analytics
          view_label: Analytics
          dynamic: false
          week_start_day: monday
          original_view: z_analytics
          dimension_group:
          error:
          field_group_variant: 2 Proficiency Mix Score
          measure: true
          parameter: false
          primary_key: false
          project_name: cti-schedule-solver
          scope: z_analytics
          suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_score
          suggest_explore: shift_staff_fact
          suggestable: false
          is_fiscal: false
          is_timeframe: false
          can_time_filter: false
          time_interval:
          lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=186"
          permanent:
          source_file: solver_views/v_00_analytics.view.lkml
          source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
          sql: "(\n        -- This is the score for advanced -- not the arrow b/c\
            \ we don't mind too many\n        case\n          when ${sum_proficiency_mix_filled_advanced}\
            \ > ${sum_proficiency_mix_required_advanced} then 1\n          else ${sum_proficiency_mix_filled_advanced}\
            \ / nullif(${sum_proficiency_mix_required_advanced},0)\n        end\n\
            \        +\n        -- This is the score for beginner -- not the arrow\
            \ b/c we don't mind too few\n        case\n          when ${sum_proficiency_mix_filled_beginner}\
            \ <= ${sum_proficiency_mix_required_beginner} then 1\n          else 0\n\
            \        end\n      )\n      -- Then take a straight average\n       \
            \ / 2\n      "
          sql_case:
          filters:
          times_used: 0
        dimensions:
        - align: left
          can_filter: true
          category: dimension
          default_filter_value:
          description: ''
          enumerations:
          field_group_label: Shift
          fill_style: range
          fiscal_month_offset: 0
          has_allowed_values: false
          hidden: false
          is_filter: false
          is_numeric: false
          label: Analytics Date Dow
          label_from_parameter:
          label_short: Date Dow
          map_layer:
          name: shift_dim.date_dow
          strict_value_format: false
          requires_refresh_on_sort: false
          sortable: true
          suggestions:
          tags: []
          type: date
          user_attribute_filter_types:
          - datetime
          - advanced_filter_datetime
          value_format:
          view: shift_dim
          view_label: Analytics
          dynamic: false
          week_start_day: monday
          original_view: shift_dim
          dimension_group:
          error:
          field_group_variant: Date Dow
          measure: false
          parameter: false
          primary_key: false
          project_name: cti-schedule-solver
          scope: shift_dim
          suggest_dimension: shift_dim.date_dow
          suggest_explore: shift_staff_fact
          suggestable: false
          is_fiscal: false
          is_timeframe: true
          can_time_filter: false
          time_interval:
            name: day
            count: 1
          lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_02_shift_dim.view.lkml?line=90"
          permanent:
          source_file: solver_views/v_02_shift_dim.view.lkml
          source_file_path: cti-schedule-solver/solver_views/v_02_shift_dim.view.lkml
          sql: "${shift_date} "
          sql_case:
          filters:
          times_used: 0
          sorted:
            desc: true
            sort_index: 0
        table_calculations: []
        pivots: []
      queryResponse:
        parent_id: 848154b55b0ccb2e0e46e7fe6c181184
        sql_changed: true
        aggregate_table_used_info:
        added_params:
        data:
        - shift_dim.day_number:
            value: 1
          z_analytics.proficiency_mix_ratio_filled_required_beginner:
            value: 1.9310344827586208
            rendered: 193.1%
            html: 193.1% (14/7.3)
          z_analytics.proficiency_mix_ratio_filled_required_advanced:
            value: 1.5172413793103448
            rendered: 151.7%
            html: 151.7% (11/7.3)
          z_analytics.proficiency_mix_ratio_filled_required_score:
            value: 0.5
            rendered: 50.0%
        - shift_dim.day_number:
            value: 2
          z_analytics.proficiency_mix_ratio_filled_required_beginner:
            value: 2.2857142857142856
            rendered: 228.6%
            html: 228.6% (16/7.0)
          z_analytics.proficiency_mix_ratio_filled_required_advanced:
            value: 1.4285714285714286
            rendered: 142.9%
            html: 142.9% (10/7.0)
          z_analytics.proficiency_mix_ratio_filled_required_score:
            value: 0.5
            rendered: 50.0%
        - shift_dim.day_number:
            value: 3
          z_analytics.proficiency_mix_ratio_filled_required_beginner:
            value: 2
            rendered: 200.0%
            filterable_value: '2.0'
            html: 200.0% (15/7.5)
          z_analytics.proficiency_mix_ratio_filled_required_advanced:
            value: 1.3333333333333333
            rendered: 133.3%
            html: 133.3% (10/7.5)
          z_analytics.proficiency_mix_ratio_filled_required_score:
            value: 0.5
            rendered: 50.0%
        - shift_dim.day_number:
            value: 4
          z_analytics.proficiency_mix_ratio_filled_required_beginner:
            value: 2
            rendered: 200.0%
            filterable_value: '2.0'
            html: 200.0% (8/4.0)
          z_analytics.proficiency_mix_ratio_filled_required_advanced:
            value: 1.25
            rendered: 125.0%
            html: 125.0% (5/4.0)
          z_analytics.proficiency_mix_ratio_filled_required_score:
            value: 0.5
            rendered: 50.0%
        - shift_dim.day_number:
            value: 5
          z_analytics.proficiency_mix_ratio_filled_required_beginner:
            value: 2.75
            rendered: 275.0%
            html: 275.0% (11/4.0)
          z_analytics.proficiency_mix_ratio_filled_required_advanced:
            value: 0.5
            rendered: 50.0%
            html: 50.0% (2/4.0)
          z_analytics.proficiency_mix_ratio_filled_required_score:
            value: 0.25
            rendered: 25.0%
        - shift_dim.day_number:
            value: 6
          z_analytics.proficiency_mix_ratio_filled_required_beginner:
            value: 1.75
            rendered: 175.0%
            html: 175.0% (7/4.0)
          z_analytics.proficiency_mix_ratio_filled_required_advanced:
            value: 1.5
            rendered: 150.0%
            html: 150.0% (6/4.0)
          z_analytics.proficiency_mix_ratio_filled_required_score:
            value: 0.5
            rendered: 50.0%
        - shift_dim.day_number:
            value: 7
          z_analytics.proficiency_mix_ratio_filled_required_beginner:
            value: 1.7777777777777777
            rendered: 177.8%
            html: 177.8% (4/2.3)
          z_analytics.proficiency_mix_ratio_filled_required_advanced:
            value: 1.3333333333333333
            rendered: 133.3%
            html: 133.3% (3/2.3)
          z_analytics.proficiency_mix_ratio_filled_required_score:
            value: 0.5
            rendered: 50.0%
        - shift_dim.day_number:
            value: 8
          z_analytics.proficiency_mix_ratio_filled_required_beginner:
            value: 2.4761904761904763
            rendered: 247.6%
            html: 247.6% (13/5.3)
          z_analytics.proficiency_mix_ratio_filled_required_advanced:
            value: 1.3333333333333333
            rendered: 133.3%
            html: 133.3% (7/5.3)
          z_analytics.proficiency_mix_ratio_filled_required_score:
            value: 0.5
            rendered: 50.0%
        - shift_dim.day_number:
            value: 9
          z_analytics.proficiency_mix_ratio_filled_required_beginner:
            value: 2
            rendered: 200.0%
            filterable_value: '2.0'
            html: 200.0% (12/6.0)
          z_analytics.proficiency_mix_ratio_filled_required_advanced:
            value: 1.3333333333333333
            rendered: 133.3%
            html: 133.3% (8/6.0)
          z_analytics.proficiency_mix_ratio_filled_required_score:
            value: 0.5
            rendered: 50.0%
        - shift_dim.day_number:
            value: 10
          z_analytics.proficiency_mix_ratio_filled_required_beginner:
            value: 2.933333333333333
            rendered: 293.3%
            html: 293.3% (11/3.8)
          z_analytics.proficiency_mix_ratio_filled_required_advanced:
            value: 0.26666666666666666
            rendered: 26.7%
            html: 26.7% (1/3.8)
          z_analytics.proficiency_mix_ratio_filled_required_score:
            value: 0.13333333333333333
            rendered: 13.3%
        - shift_dim.day_number:
            value: 11
          z_analytics.proficiency_mix_ratio_filled_required_beginner:
            value: 2.1538461538461537
            rendered: 215.4%
            html: 215.4% (7/3.3)
          z_analytics.proficiency_mix_ratio_filled_required_advanced:
            value: 1.2307692307692308
            rendered: 123.1%
            html: 123.1% (4/3.3)
          z_analytics.proficiency_mix_ratio_filled_required_score:
            value: 0.5
            rendered: 50.0%
        - shift_dim.day_number:
            value: 12
          z_analytics.proficiency_mix_ratio_filled_required_beginner:
            value: 2.24
            rendered: 224.0%
            html: 224.0% (14/6.3)
          z_analytics.proficiency_mix_ratio_filled_required_advanced:
            value: 1.44
            rendered: 144.0%
            html: 144.0% (9/6.3)
          z_analytics.proficiency_mix_ratio_filled_required_score:
            value: 0.5
            rendered: 50.0%
        - shift_dim.day_number:
            value: 13
          z_analytics.proficiency_mix_ratio_filled_required_beginner:
            value: 1.8181818181818181
            rendered: 181.8%
            html: 181.8% (10/5.5)
          z_analytics.proficiency_mix_ratio_filled_required_advanced:
            value: 1.4545454545454546
            rendered: 145.5%
            html: 145.5% (8/5.5)
          z_analytics.proficiency_mix_ratio_filled_required_score:
            value: 0.5
            rendered: 50.0%
        - shift_dim.day_number:
            value: 14
          z_analytics.proficiency_mix_ratio_filled_required_beginner:
            value: 2.0869565217391304
            rendered: 208.7%
            html: 208.7% (12/5.8)
          z_analytics.proficiency_mix_ratio_filled_required_advanced:
            value: 1.391304347826087
            rendered: 139.1%
            html: 139.1% (8/5.8)
          z_analytics.proficiency_mix_ratio_filled_required_score:
            value: 0.5
            rendered: 50.0%
        - shift_dim.day_number:
            value: 15
          z_analytics.proficiency_mix_ratio_filled_required_beginner:
            value: 2.1333333333333333
            rendered: 213.3%
            html: 213.3% (8/3.8)
          z_analytics.proficiency_mix_ratio_filled_required_advanced:
            value: 1.6
            rendered: 160.0%
            html: 160.0% (6/3.8)
          z_analytics.proficiency_mix_ratio_filled_required_score:
            value: 0.5
            rendered: 50.0%
        - shift_dim.day_number:
            value: 16
          z_analytics.proficiency_mix_ratio_filled_required_beginner:
            value: 2.4
            rendered: 240.0%
            html: 240.0% (12/5.0)
          z_analytics.proficiency_mix_ratio_filled_required_advanced:
            value: 1.4
            rendered: 140.0%
            html: 140.0% (7/5.0)
          z_analytics.proficiency_mix_ratio_filled_required_score:
            value: 0.5
            rendered: 50.0%
        - shift_dim.day_number:
            value: 17
          z_analytics.proficiency_mix_ratio_filled_required_beginner:
            value: 2.5454545454545454
            rendered: 254.5%
            html: 254.5% (14/5.5)
          z_analytics.proficiency_mix_ratio_filled_required_advanced:
            value: 1.0909090909090908
            rendered: 109.1%
            html: 109.1% (6/5.5)
          z_analytics.proficiency_mix_ratio_filled_required_score:
            value: 0.5
            rendered: 50.0%
        - shift_dim.day_number:
            value: 18
          z_analytics.proficiency_mix_ratio_filled_required_beginner:
            value: 2.2222222222222223
            rendered: 222.2%
            html: 222.2% (10/4.5)
          z_analytics.proficiency_mix_ratio_filled_required_advanced:
            value: 0.8888888888888888
            rendered: 88.9%
            html: 88.9% (4/4.5)
          z_analytics.proficiency_mix_ratio_filled_required_score:
            value: 0.4444444444444444
            rendered: 44.4%
        - shift_dim.day_number:
            value: 19
          z_analytics.proficiency_mix_ratio_filled_required_beginner:
            value: 1.8
            rendered: 180.0%
            html: 180.0% (9/5.0)
          z_analytics.proficiency_mix_ratio_filled_required_advanced:
            value: 1.6
            rendered: 160.0%
            html: 160.0% (8/5.0)
          z_analytics.proficiency_mix_ratio_filled_required_score:
            value: 0.5
            rendered: 50.0%
        - shift_dim.day_number:
            value: 20
          z_analytics.proficiency_mix_ratio_filled_required_beginner:
            value: 1.9259259259259258
            rendered: 192.6%
            html: 192.6% (13/6.8)
          z_analytics.proficiency_mix_ratio_filled_required_advanced:
            value: 1.3333333333333333
            rendered: 133.3%
            html: 133.3% (9/6.8)
          z_analytics.proficiency_mix_ratio_filled_required_score:
            value: 0.5
            rendered: 50.0%
        - shift_dim.day_number:
            value: 21
          z_analytics.proficiency_mix_ratio_filled_required_beginner:
            value: 1.7391304347826086
            rendered: 173.9%
            html: 173.9% (10/5.8)
          z_analytics.proficiency_mix_ratio_filled_required_advanced:
            value: 1.565217391304348
            rendered: 156.5%
            html: 156.5% (9/5.8)
          z_analytics.proficiency_mix_ratio_filled_required_score:
            value: 0.5
            rendered: 50.0%
        - shift_dim.day_number:
            value: 22
          z_analytics.proficiency_mix_ratio_filled_required_beginner:
            value: 2.769230769230769
            rendered: 276.9%
            html: 276.9% (9/3.3)
          z_analytics.proficiency_mix_ratio_filled_required_advanced:
            value: 0.9230769230769231
            rendered: 92.3%
            html: 92.3% (3/3.3)
          z_analytics.proficiency_mix_ratio_filled_required_score:
            value: 0.46153846153846156
            rendered: 46.2%
        - shift_dim.day_number:
            value: 23
          z_analytics.proficiency_mix_ratio_filled_required_beginner:
            value: 2
            rendered: 200.0%
            filterable_value: '2.0'
            html: 200.0% (6/3.0)
          z_analytics.proficiency_mix_ratio_filled_required_advanced:
            value: 1
            rendered: 100.0%
            filterable_value: '1.0'
            html: 100.0% (3/3.0)
          z_analytics.proficiency_mix_ratio_filled_required_score:
            value: 0.5
            rendered: 50.0%
        - shift_dim.day_number:
            value: 24
          z_analytics.proficiency_mix_ratio_filled_required_beginner:
            value: 2.6666666666666665
            rendered: 266.7%
            html: 266.7% (8/3.0)
          z_analytics.proficiency_mix_ratio_filled_required_advanced:
            value: 1
            rendered: 100.0%
            filterable_value: '1.0'
            html: 100.0% (3/3.0)
          z_analytics.proficiency_mix_ratio_filled_required_score:
            value: 0.5
            rendered: 50.0%
        - shift_dim.day_number:
            value: 25
          z_analytics.proficiency_mix_ratio_filled_required_beginner:
            value: 2
            rendered: 200.0%
            filterable_value: '2.0'
            html: 200.0% (7/3.5)
          z_analytics.proficiency_mix_ratio_filled_required_advanced:
            value: 0.8571428571428571
            rendered: 85.7%
            html: 85.7% (3/3.5)
          z_analytics.proficiency_mix_ratio_filled_required_score:
            value: 0.42857142857142855
            rendered: 42.9%
        - shift_dim.day_number:
            value: 26
          z_analytics.proficiency_mix_ratio_filled_required_beginner:
            value: 2
            rendered: 200.0%
            filterable_value: '2.0'
            html: 200.0% (14/7.0)
          z_analytics.proficiency_mix_ratio_filled_required_advanced:
            value: 1.4285714285714286
            rendered: 142.9%
            html: 142.9% (10/7.0)
          z_analytics.proficiency_mix_ratio_filled_required_score:
            value: 0.5
            rendered: 50.0%
        - shift_dim.day_number:
            value: 27
          z_analytics.proficiency_mix_ratio_filled_required_beginner:
            value: 1.9310344827586208
            rendered: 193.1%
            html: 193.1% (14/7.3)
          z_analytics.proficiency_mix_ratio_filled_required_advanced:
            value: 1.3793103448275863
            rendered: 137.9%
            html: 137.9% (10/7.3)
          z_analytics.proficiency_mix_ratio_filled_required_score:
            value: 0.5
            rendered: 50.0%
        - shift_dim.day_number:
            value: 28
          z_analytics.proficiency_mix_ratio_filled_required_beginner:
            value: 2.08
            rendered: 208.0%
            html: 208.0% (13/6.3)
          z_analytics.proficiency_mix_ratio_filled_required_advanced:
            value: 1.6
            rendered: 160.0%
            html: 160.0% (10/6.3)
          z_analytics.proficiency_mix_ratio_filled_required_score:
            value: 0.5
            rendered: 50.0%
        drill_menu_build_time: 0.034293000000000004
        expired: false
        fields:
          measures:
          - align: right
            can_filter: true
            category: measure
            default_filter_value:
            description: ''
            enumerations:
            field_group_label: 2 Proficiency Mix (Beginner)
            fill_style:
            fiscal_month_offset: 0
            has_allowed_values: false
            hidden: false
            is_filter: false
            is_numeric: true
            label: Analytics C Proficiency Mix % (Beginner)
            label_from_parameter:
            label_short: C Proficiency Mix % (Beginner)
            map_layer:
            name: z_analytics.proficiency_mix_ratio_filled_required_beginner
            strict_value_format: false
            requires_refresh_on_sort: false
            sortable: true
            suggestions:
            tags: []
            type: number
            user_attribute_filter_types:
            - number
            - advanced_filter_number
            value_format: "#,##0.0%"
            view: z_analytics
            view_label: Analytics
            dynamic: false
            week_start_day: monday
            original_view: z_analytics
            dimension_group:
            error:
            field_group_variant: C Proficiency Mix % (Beginner)
            measure: true
            parameter: false
            primary_key: false
            project_name: cti-schedule-solver
            scope: z_analytics
            suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_beginner
            suggest_explore: shift_staff_fact
            suggestable: false
            is_fiscal: false
            is_timeframe: false
            can_time_filter: false
            time_interval:
            lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=161"
            permanent:
            source_file: solver_views/v_00_analytics.view.lkml
            source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
            sql: "${sum_proficiency_mix_filled_beginner} / nullif(${sum_proficiency_mix_required_beginner},0) "
            sql_case:
            filters:
            times_used: 0
          - align: right
            can_filter: true
            category: measure
            default_filter_value:
            description: ''
            enumerations:
            field_group_label: 2 Proficiency Mix (Advanced)
            fill_style:
            fiscal_month_offset: 0
            has_allowed_values: false
            hidden: false
            is_filter: false
            is_numeric: true
            label: Analytics C Proficiency Mix % (Advanced)
            label_from_parameter:
            label_short: C Proficiency Mix % (Advanced)
            map_layer:
            name: z_analytics.proficiency_mix_ratio_filled_required_advanced
            strict_value_format: false
            requires_refresh_on_sort: false
            sortable: true
            suggestions:
            tags: []
            type: number
            user_attribute_filter_types:
            - number
            - advanced_filter_number
            value_format: "#,##0.0%"
            view: z_analytics
            view_label: Analytics
            dynamic: false
            week_start_day: monday
            original_view: z_analytics
            dimension_group:
            error:
            field_group_variant: C Proficiency Mix % (Advanced)
            measure: true
            parameter: false
            primary_key: false
            project_name: cti-schedule-solver
            scope: z_analytics
            suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_advanced
            suggest_explore: shift_staff_fact
            suggestable: false
            is_fiscal: false
            is_timeframe: false
            can_time_filter: false
            time_interval:
            lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=109"
            permanent:
            source_file: solver_views/v_00_analytics.view.lkml
            source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
            sql: "${sum_proficiency_mix_filled_advanced} / nullif(${sum_proficiency_mix_required_advanced},0) "
            sql_case:
            filters:
            times_used: 0
          - align: right
            can_filter: true
            category: measure
            default_filter_value:
            description: ''
            enumerations:
            field_group_label: 0 Overall Score
            fill_style:
            fiscal_month_offset: 0
            has_allowed_values: false
            hidden: false
            is_filter: false
            is_numeric: true
            label: Analytics 2 Proficiency Mix Score
            label_from_parameter:
            label_short: 2 Proficiency Mix Score
            map_layer:
            name: z_analytics.proficiency_mix_ratio_filled_required_score
            strict_value_format: false
            requires_refresh_on_sort: false
            sortable: true
            suggestions:
            tags: []
            type: number
            user_attribute_filter_types:
            - number
            - advanced_filter_number
            value_format: "#,##0.0%"
            view: z_analytics
            view_label: Analytics
            dynamic: false
            week_start_day: monday
            original_view: z_analytics
            dimension_group:
            error:
            field_group_variant: 2 Proficiency Mix Score
            measure: true
            parameter: false
            primary_key: false
            project_name: cti-schedule-solver
            scope: z_analytics
            suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_score
            suggest_explore: shift_staff_fact
            suggestable: false
            is_fiscal: false
            is_timeframe: false
            can_time_filter: false
            time_interval:
            lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=186"
            permanent:
            source_file: solver_views/v_00_analytics.view.lkml
            source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
            sql: "(\n        -- This is the score for advanced -- not the arrow b/c\
              \ we don't mind too many\n        case\n          when ${sum_proficiency_mix_filled_advanced}\
              \ > ${sum_proficiency_mix_required_advanced} then 1\n          else\
              \ ${sum_proficiency_mix_filled_advanced} / nullif(${sum_proficiency_mix_required_advanced},0)\n\
              \        end\n        +\n        -- This is the score for beginner --\
              \ not the arrow b/c we don't mind too few\n        case\n          when\
              \ ${sum_proficiency_mix_filled_beginner} <= ${sum_proficiency_mix_required_beginner}\
              \ then 1\n          else 0\n        end\n      )\n      -- Then take\
              \ a straight average\n        / 2\n      "
            sql_case:
            filters:
            times_used: 0
          dimensions:
          - align: right
            can_filter: true
            category: dimension
            default_filter_value:
            description: ''
            enumerations:
            field_group_label: Shift
            fill_style:
            fiscal_month_offset: 0
            has_allowed_values: false
            hidden: false
            is_filter: false
            is_numeric: true
            label: Analytics Day Number
            label_from_parameter:
            label_short: Day Number
            map_layer:
            name: shift_dim.day_number
            strict_value_format: false
            requires_refresh_on_sort: false
            sortable: true
            suggestions:
            tags: []
            type: number
            user_attribute_filter_types:
            - number
            - advanced_filter_number
            value_format:
            view: shift_dim
            view_label: Analytics
            dynamic: false
            week_start_day: monday
            original_view: shift_dim
            dimension_group:
            error:
            field_group_variant: Day Number
            measure: false
            parameter: false
            primary_key: false
            project_name: cti-schedule-solver
            scope: shift_dim
            suggest_dimension: shift_dim.day_number
            suggest_explore: shift_staff_fact
            suggestable: false
            is_fiscal: false
            is_timeframe: false
            can_time_filter: false
            time_interval:
            lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_02_shift_dim.view.lkml?line=16"
            permanent:
            source_file: solver_views/v_02_shift_dim.view.lkml
            source_file_path: cti-schedule-solver/solver_views/v_02_shift_dim.view.lkml
            sql: "${TABLE}.day_number "
            sql_case:
            filters:
            times_used: 0
            sorted:
              desc: false
              sort_index: 0
          table_calculations: []
          pivots: []
          measure_like:
          - align: right
            can_filter: true
            category: measure
            default_filter_value:
            description: ''
            enumerations:
            field_group_label: 2 Proficiency Mix (Beginner)
            fill_style:
            fiscal_month_offset: 0
            has_allowed_values: false
            hidden: false
            is_filter: false
            is_numeric: true
            label: Analytics C Proficiency Mix % (Beginner)
            label_from_parameter:
            label_short: C Proficiency Mix % (Beginner)
            map_layer:
            name: z_analytics.proficiency_mix_ratio_filled_required_beginner
            strict_value_format: false
            requires_refresh_on_sort: false
            sortable: true
            suggestions:
            tags: []
            type: number
            user_attribute_filter_types:
            - number
            - advanced_filter_number
            value_format: "#,##0.0%"
            view: z_analytics
            view_label: Analytics
            dynamic: false
            week_start_day: monday
            original_view: z_analytics
            dimension_group:
            error:
            field_group_variant: C Proficiency Mix % (Beginner)
            measure: true
            parameter: false
            primary_key: false
            project_name: cti-schedule-solver
            scope: z_analytics
            suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_beginner
            suggest_explore: shift_staff_fact
            suggestable: false
            is_fiscal: false
            is_timeframe: false
            can_time_filter: false
            time_interval:
            lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=161"
            permanent:
            source_file: solver_views/v_00_analytics.view.lkml
            source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
            sql: "${sum_proficiency_mix_filled_beginner} / nullif(${sum_proficiency_mix_required_beginner},0) "
            sql_case:
            filters:
            times_used: 0
          - align: right
            can_filter: true
            category: measure
            default_filter_value:
            description: ''
            enumerations:
            field_group_label: 2 Proficiency Mix (Advanced)
            fill_style:
            fiscal_month_offset: 0
            has_allowed_values: false
            hidden: false
            is_filter: false
            is_numeric: true
            label: Analytics C Proficiency Mix % (Advanced)
            label_from_parameter:
            label_short: C Proficiency Mix % (Advanced)
            map_layer:
            name: z_analytics.proficiency_mix_ratio_filled_required_advanced
            strict_value_format: false
            requires_refresh_on_sort: false
            sortable: true
            suggestions:
            tags: []
            type: number
            user_attribute_filter_types:
            - number
            - advanced_filter_number
            value_format: "#,##0.0%"
            view: z_analytics
            view_label: Analytics
            dynamic: false
            week_start_day: monday
            original_view: z_analytics
            dimension_group:
            error:
            field_group_variant: C Proficiency Mix % (Advanced)
            measure: true
            parameter: false
            primary_key: false
            project_name: cti-schedule-solver
            scope: z_analytics
            suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_advanced
            suggest_explore: shift_staff_fact
            suggestable: false
            is_fiscal: false
            is_timeframe: false
            can_time_filter: false
            time_interval:
            lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=109"
            permanent:
            source_file: solver_views/v_00_analytics.view.lkml
            source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
            sql: "${sum_proficiency_mix_filled_advanced} / nullif(${sum_proficiency_mix_required_advanced},0) "
            sql_case:
            filters:
            times_used: 0
          - align: right
            can_filter: true
            category: measure
            default_filter_value:
            description: ''
            enumerations:
            field_group_label: 0 Overall Score
            fill_style:
            fiscal_month_offset: 0
            has_allowed_values: false
            hidden: false
            is_filter: false
            is_numeric: true
            label: Analytics 2 Proficiency Mix Score
            label_from_parameter:
            label_short: 2 Proficiency Mix Score
            map_layer:
            name: z_analytics.proficiency_mix_ratio_filled_required_score
            strict_value_format: false
            requires_refresh_on_sort: false
            sortable: true
            suggestions:
            tags: []
            type: number
            user_attribute_filter_types:
            - number
            - advanced_filter_number
            value_format: "#,##0.0%"
            view: z_analytics
            view_label: Analytics
            dynamic: false
            week_start_day: monday
            original_view: z_analytics
            dimension_group:
            error:
            field_group_variant: 2 Proficiency Mix Score
            measure: true
            parameter: false
            primary_key: false
            project_name: cti-schedule-solver
            scope: z_analytics
            suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_score
            suggest_explore: shift_staff_fact
            suggestable: false
            is_fiscal: false
            is_timeframe: false
            can_time_filter: false
            time_interval:
            lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=186"
            permanent:
            source_file: solver_views/v_00_analytics.view.lkml
            source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
            sql: "(\n        -- This is the score for advanced -- not the arrow b/c\
              \ we don't mind too many\n        case\n          when ${sum_proficiency_mix_filled_advanced}\
              \ > ${sum_proficiency_mix_required_advanced} then 1\n          else\
              \ ${sum_proficiency_mix_filled_advanced} / nullif(${sum_proficiency_mix_required_advanced},0)\n\
              \        end\n        +\n        -- This is the score for beginner --\
              \ not the arrow b/c we don't mind too few\n        case\n          when\
              \ ${sum_proficiency_mix_filled_beginner} <= ${sum_proficiency_mix_required_beginner}\
              \ then 1\n          else 0\n        end\n      )\n      -- Then take\
              \ a straight average\n        / 2\n      "
            sql_case:
            filters:
            times_used: 0
          dimension_like:
          - align: right
            can_filter: true
            category: dimension
            default_filter_value:
            description: ''
            enumerations:
            field_group_label: Shift
            fill_style:
            fiscal_month_offset: 0
            has_allowed_values: false
            hidden: false
            is_filter: false
            is_numeric: true
            label: Analytics Day Number
            label_from_parameter:
            label_short: Day Number
            map_layer:
            name: shift_dim.day_number
            strict_value_format: false
            requires_refresh_on_sort: false
            sortable: true
            suggestions:
            tags: []
            type: number
            user_attribute_filter_types:
            - number
            - advanced_filter_number
            value_format:
            view: shift_dim
            view_label: Analytics
            dynamic: false
            week_start_day: monday
            original_view: shift_dim
            dimension_group:
            error:
            field_group_variant: Day Number
            measure: false
            parameter: false
            primary_key: false
            project_name: cti-schedule-solver
            scope: shift_dim
            suggest_dimension: shift_dim.day_number
            suggest_explore: shift_staff_fact
            suggestable: false
            is_fiscal: false
            is_timeframe: false
            can_time_filter: false
            time_interval:
            lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_02_shift_dim.view.lkml?line=16"
            permanent:
            source_file: solver_views/v_02_shift_dim.view.lkml
            source_file_path: cti-schedule-solver/solver_views/v_02_shift_dim.view.lkml
            sql: "${TABLE}.day_number "
            sql_case:
            filters:
            times_used: 0
            sorted:
              desc: false
              sort_index: 0
        fill_fields: []
        forecast_result:
        has_row_totals: false
        has_totals: false
        id: query-result-91:{}
        null_sort_treatment: low
        number_format: '1,234.56'
        ran_at: '2022-05-12T15:42:52+00:00'
        runtime: '1.357'
        sql: |-
          SELECT
              shift_dim.day_number  AS shift_dim_day_number,
              COUNT(DISTINCT CASE WHEN staff_competency_dim.overall_proficiency = 'Beginner' and shift_staff_fact.is_scheduled  THEN ( shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  )  ELSE NULL END) AS z_analytics_sum_proficiency_mix_filled_beginner,
                  COUNT(DISTINCT CASE WHEN shift_staff_fact.is_scheduled  THEN shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  ELSE NULL END) * 0.25 AS z_analytics_sum_proficiency_mix_required_beginner,
                  COUNT(DISTINCT CASE WHEN staff_competency_dim.overall_proficiency = 'Beginner' and shift_staff_fact.is_scheduled  THEN ( shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  )  ELSE NULL END) / nullif(COUNT(DISTINCT CASE WHEN shift_staff_fact.is_scheduled  THEN shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  ELSE NULL END) * 0.25, 0) AS z_analytics_proficiency_mix_ratio_filled_required_beginner,
              COUNT(DISTINCT CASE WHEN staff_competency_dim.overall_proficiency = 'Advanced' and shift_staff_fact.is_scheduled  THEN ( shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  )  ELSE NULL END) AS z_analytics_sum_proficiency_mix_filled_advanced,
                  COUNT(DISTINCT CASE WHEN shift_staff_fact.is_scheduled  THEN shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  ELSE NULL END) * 0.25 AS z_analytics_sum_proficiency_mix_required_advanced,
                  COUNT(DISTINCT CASE WHEN staff_competency_dim.overall_proficiency = 'Advanced' and shift_staff_fact.is_scheduled  THEN ( shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  )  ELSE NULL END) / nullif(COUNT(DISTINCT CASE WHEN shift_staff_fact.is_scheduled  THEN shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  ELSE NULL END) * 0.25, 0) AS z_analytics_proficiency_mix_ratio_filled_required_advanced,
                      (CASE WHEN COUNT(DISTINCT CASE WHEN staff_competency_dim.overall_proficiency = 'Advanced' and shift_staff_fact.is_scheduled  THEN ( shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  )  ELSE NULL END) > COUNT(DISTINCT CASE WHEN shift_staff_fact.is_scheduled  THEN shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  ELSE NULL END) * 0.25 THEN 1 ELSE COUNT(DISTINCT CASE WHEN staff_competency_dim.overall_proficiency = 'Advanced' and shift_staff_fact.is_scheduled  THEN ( shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  )  ELSE NULL END) / nullif(COUNT(DISTINCT CASE WHEN shift_staff_fact.is_scheduled  THEN shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  ELSE NULL END) * 0.25, 0) END + CASE WHEN COUNT(DISTINCT CASE WHEN staff_competency_dim.overall_proficiency = 'Beginner' and shift_staff_fact.is_scheduled  THEN ( shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  )  ELSE NULL END) <= COUNT(DISTINCT CASE WHEN shift_staff_fact.is_scheduled  THEN shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  ELSE NULL END) * 0.25 THEN 1 ELSE 0 END) / 2 AS z_analytics_proficiency_mix_ratio_filled_required_score
          FROM optimizer.analytics_table_01_shift_staff_fact
               AS shift_staff_fact
          LEFT JOIN optimizer.analytics_table_02_shift_dim
               AS shift_dim ON shift_staff_fact.run_name_id = shift_dim.run_name_id
                AND shift_staff_fact.shift_id = shift_dim.shift_id

          LEFT JOIN optimizer.analytics_table_05_staff_dim
               AS staff_dim ON shift_staff_fact.run_name_id = staff_dim.run_name_id
              AND shift_staff_fact.staff_id = staff_dim.staff_id

          LEFT JOIN optimizer.analytics_table_07_staff_competency_dim
               AS staff_competency_dim ON staff_dim.run_name_id = staff_competency_dim.run_name_id
              AND staff_dim.staff_id = staff_competency_dim.staff_id

          LEFT JOIN (SELECT 'x' as x)  AS z_analytics ON 1 = 1
          WHERE (shift_staff_fact.run_name_id ) = '9'
          GROUP BY
              1
          ORDER BY
              1
          LIMIT 500
        sql_explain:
        supports_pivot_in_db: true
        timezone: America/Chicago
        is_local: true
        table_calcs_complete: true
        tracked_attributes:
          result.drill_menu_build_time: 0.034293000000000004
          result.from_cache: true
          result.runtime: '1.357'
          result.sql.length: 4376
          result.supports_pivot_in_db: true
        sorts: []
      config:
        show_view_names: false
        show_row_numbers: true
        transpose: true
        truncate_text: true
        hide_totals: false
        hide_row_totals: false
        size_to_fit: true
        table_theme: white
        limit_displayed_rows: false
        enable_conditional_formatting: true
        header_text_alignment: left
        header_font_size: '12'
        rows_font_size: '12'
        conditional_formatting_include_totals: false
        conditional_formatting_include_nulls: false
        show_sql_query_menu_options: false
        column_order: {}
        show_totals: true
        show_row_totals: true
        truncate_header: false
        series_labels:
          z_analytics.proficiency_mix_ratio_filled_required_beginner: "% of Beginners\
            \ Scheduled"
          z_analytics.proficiency_mix_ratio_filled_required_advanced: "% of Advanced\
            \ Scheduled"
          z_analytics.proficiency_mix_ratio_filled_required_score: Overall Score
        series_column_widths:
          shift_dim.day_number: 104
          z_analytics.proficiency_mix_ratio_filled_required_beginner: 191
          z_analytics.proficiency_mix_ratio_filled_required_advanced: 164
          z_analytics.proficiency_mix_ratio_filled_required_score: 93
        series_cell_visualizations:
          z_analytics.proficiency_mix_ratio_filled_required_beginner:
            is_active: false
        conditional_formatting:
        - type: along a scale...
          value:
          background_color: "#1A73E8"
          font_color:
          color_application:
            collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
            custom:
              id: 9d37feff-c18e-3683-158f-529295caca83
              label: Custom
              type: continuous
              stops:
              - color: green
                offset: 0
              - color: red
                offset: 100
            options:
              steps: 5
              constraints:
                min:
                  type: number
                  value: 0.5
                mid:
                  type: number
                  value: 1
                max:
                  type: number
                  value: 1.25
          bold: false
          italic: false
          strikethrough: false
          fields:
          - z_analytics.proficiency_mix_ratio_filled_required_beginner
        - type: along a scale...
          value:
          background_color: "#1A73E8"
          font_color:
          color_application:
            collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
            custom:
              id: 70fd814a-a067-2070-99ae-d6928930ab61
              label: Custom
              type: continuous
              stops:
              - color: red
                offset: 0
              - color: green
                offset: 100
            options:
              steps: 5
              constraints:
                min:
                  type: number
                  value: 0.75
                mid:
                  type: number
                  value: 1
                max:
                  type: number
                  value: 1.1
          bold: false
          italic: false
          strikethrough: false
          fields:
          - z_analytics.proficiency_mix_ratio_filled_required_advanced
        - type: along a scale...
          value:
          background_color: "#1A73E8"
          font_color:
          color_application:
            collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
            custom:
              id: 655732e7-cb5d-30af-ff27-50a273b2848f
              label: Custom
              type: continuous
              stops:
              - color: red
                offset: 0
              - color: green
                offset: 100
            options:
              steps: 5
              constraints:
                min:
                  type: number
                  value: 0.5
                mid:
                  type: number
                  value: 1
                max:
                  type: number
                  value: 1.1
          bold: false
          italic: false
          strikethrough: false
          fields:
          - z_analytics.proficiency_mix_ratio_filled_required_score
        type: looker_grid
        x_axis_gridlines: false
        y_axis_gridlines: true
        show_y_axis_labels: true
        show_y_axis_ticks: true
        y_axis_tick_density: default
        y_axis_tick_density_custom: 5
        show_x_axis_label: true
        show_x_axis_ticks: true
        y_axis_scale_mode: linear
        x_axis_reversed: false
        y_axis_reversed: false
        plot_size_by_field: false
        trellis: ''
        stacking: ''
        legend_position: center
        point_style: none
        show_value_labels: false
        label_density: 25
        x_axis_scale: auto
        y_axis_combined: true
        show_null_points: true
        interpolation: linear
        defaults_version: 1
        series_types: {}
        query_fields:
          measures:
          - align: right
            can_filter: true
            category: measure
            default_filter_value:
            description: ''
            enumerations:
            field_group_label: 2 Proficiency Mix (Beginner)
            fill_style:
            fiscal_month_offset: 0
            has_allowed_values: false
            hidden: false
            is_filter: false
            is_numeric: true
            label: Analytics C Proficiency Mix % (Beginner)
            label_from_parameter:
            label_short: C Proficiency Mix % (Beginner)
            map_layer:
            name: z_analytics.proficiency_mix_ratio_filled_required_beginner
            strict_value_format: false
            requires_refresh_on_sort: false
            sortable: true
            suggestions:
            tags: []
            type: number
            user_attribute_filter_types:
            - number
            - advanced_filter_number
            value_format: "#,##0.0%"
            view: z_analytics
            view_label: Analytics
            dynamic: false
            week_start_day: monday
            original_view: z_analytics
            dimension_group:
            error:
            field_group_variant: C Proficiency Mix % (Beginner)
            measure: true
            parameter: false
            primary_key: false
            project_name: cti-schedule-solver
            scope: z_analytics
            suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_beginner
            suggest_explore: shift_staff_fact
            suggestable: false
            is_fiscal: false
            is_timeframe: false
            can_time_filter: false
            time_interval:
            lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=161"
            permanent:
            source_file: solver_views/v_00_analytics.view.lkml
            source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
            sql: "${sum_proficiency_mix_filled_beginner} / nullif(${sum_proficiency_mix_required_beginner},0) "
            sql_case:
            filters:
            times_used: 0
          - align: right
            can_filter: true
            category: measure
            default_filter_value:
            description: ''
            enumerations:
            field_group_label: 2 Proficiency Mix (Advanced)
            fill_style:
            fiscal_month_offset: 0
            has_allowed_values: false
            hidden: false
            is_filter: false
            is_numeric: true
            label: Analytics C Proficiency Mix % (Advanced)
            label_from_parameter:
            label_short: C Proficiency Mix % (Advanced)
            map_layer:
            name: z_analytics.proficiency_mix_ratio_filled_required_advanced
            strict_value_format: false
            requires_refresh_on_sort: false
            sortable: true
            suggestions:
            tags: []
            type: number
            user_attribute_filter_types:
            - number
            - advanced_filter_number
            value_format: "#,##0.0%"
            view: z_analytics
            view_label: Analytics
            dynamic: false
            week_start_day: monday
            original_view: z_analytics
            dimension_group:
            error:
            field_group_variant: C Proficiency Mix % (Advanced)
            measure: true
            parameter: false
            primary_key: false
            project_name: cti-schedule-solver
            scope: z_analytics
            suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_advanced
            suggest_explore: shift_staff_fact
            suggestable: false
            is_fiscal: false
            is_timeframe: false
            can_time_filter: false
            time_interval:
            lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=109"
            permanent:
            source_file: solver_views/v_00_analytics.view.lkml
            source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
            sql: "${sum_proficiency_mix_filled_advanced} / nullif(${sum_proficiency_mix_required_advanced},0) "
            sql_case:
            filters:
            times_used: 0
          - align: right
            can_filter: true
            category: measure
            default_filter_value:
            description: ''
            enumerations:
            field_group_label: 0 Overall Score
            fill_style:
            fiscal_month_offset: 0
            has_allowed_values: false
            hidden: false
            is_filter: false
            is_numeric: true
            label: Analytics 2 Proficiency Mix Score
            label_from_parameter:
            label_short: 2 Proficiency Mix Score
            map_layer:
            name: z_analytics.proficiency_mix_ratio_filled_required_score
            strict_value_format: false
            requires_refresh_on_sort: false
            sortable: true
            suggestions:
            tags: []
            type: number
            user_attribute_filter_types:
            - number
            - advanced_filter_number
            value_format: "#,##0.0%"
            view: z_analytics
            view_label: Analytics
            dynamic: false
            week_start_day: monday
            original_view: z_analytics
            dimension_group:
            error:
            field_group_variant: 2 Proficiency Mix Score
            measure: true
            parameter: false
            primary_key: false
            project_name: cti-schedule-solver
            scope: z_analytics
            suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_score
            suggest_explore: shift_staff_fact
            suggestable: false
            is_fiscal: false
            is_timeframe: false
            can_time_filter: false
            time_interval:
            lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=186"
            permanent:
            source_file: solver_views/v_00_analytics.view.lkml
            source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
            sql: "(\n        -- This is the score for advanced -- not the arrow b/c\
              \ we don't mind too many\n        case\n          when ${sum_proficiency_mix_filled_advanced}\
              \ > ${sum_proficiency_mix_required_advanced} then 1\n          else\
              \ ${sum_proficiency_mix_filled_advanced} / nullif(${sum_proficiency_mix_required_advanced},0)\n\
              \        end\n        +\n        -- This is the score for beginner --\
              \ not the arrow b/c we don't mind too few\n        case\n          when\
              \ ${sum_proficiency_mix_filled_beginner} <= ${sum_proficiency_mix_required_beginner}\
              \ then 1\n          else 0\n        end\n      )\n      -- Then take\
              \ a straight average\n        / 2\n      "
            sql_case:
            filters:
            times_used: 0
          dimensions:
          - align: left
            can_filter: true
            category: dimension
            default_filter_value:
            description: ''
            enumerations:
            field_group_label: Shift
            fill_style: range
            fiscal_month_offset: 0
            has_allowed_values: false
            hidden: false
            is_filter: false
            is_numeric: false
            label: Analytics Date Dow
            label_from_parameter:
            label_short: Date Dow
            map_layer:
            name: shift_dim.date_dow
            strict_value_format: false
            requires_refresh_on_sort: false
            sortable: true
            suggestions:
            tags: []
            type: date
            user_attribute_filter_types:
            - datetime
            - advanced_filter_datetime
            value_format:
            view: shift_dim
            view_label: Analytics
            dynamic: false
            week_start_day: monday
            original_view: shift_dim
            dimension_group:
            error:
            field_group_variant: Date Dow
            measure: false
            parameter: false
            primary_key: false
            project_name: cti-schedule-solver
            scope: shift_dim
            suggest_dimension: shift_dim.date_dow
            suggest_explore: shift_staff_fact
            suggestable: false
            is_fiscal: false
            is_timeframe: true
            can_time_filter: false
            time_interval:
              name: day
              count: 1
            lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_02_shift_dim.view.lkml?line=90"
            permanent:
            source_file: solver_views/v_02_shift_dim.view.lkml
            source_file_path: cti-schedule-solver/solver_views/v_02_shift_dim.view.lkml
            sql: "${shift_date} "
            sql_case:
            filters:
            times_used: 0
            sorted:
              sort_index: 0
              desc: true
          table_calculations: []
          pivots: []
        queryResponse:
          parent_id: 848154b55b0ccb2e0e46e7fe6c181184
          sql_changed: true
          aggregate_table_used_info:
          added_params:
          data:
          - shift_dim.day_number:
              value: 1
            z_analytics.proficiency_mix_ratio_filled_required_beginner:
              value: 1.9310344827586208
              rendered: 193.1%
              html: 193.1% (14/7.3)
            z_analytics.proficiency_mix_ratio_filled_required_advanced:
              value: 1.5172413793103448
              rendered: 151.7%
              html: 151.7% (11/7.3)
            z_analytics.proficiency_mix_ratio_filled_required_score:
              value: 0.5
              rendered: 50.0%
          - shift_dim.day_number:
              value: 2
            z_analytics.proficiency_mix_ratio_filled_required_beginner:
              value: 2.2857142857142856
              rendered: 228.6%
              html: 228.6% (16/7.0)
            z_analytics.proficiency_mix_ratio_filled_required_advanced:
              value: 1.4285714285714286
              rendered: 142.9%
              html: 142.9% (10/7.0)
            z_analytics.proficiency_mix_ratio_filled_required_score:
              value: 0.5
              rendered: 50.0%
          - shift_dim.day_number:
              value: 3
            z_analytics.proficiency_mix_ratio_filled_required_beginner:
              value: 2
              rendered: 200.0%
              filterable_value: '2.0'
              html: 200.0% (15/7.5)
            z_analytics.proficiency_mix_ratio_filled_required_advanced:
              value: 1.3333333333333333
              rendered: 133.3%
              html: 133.3% (10/7.5)
            z_analytics.proficiency_mix_ratio_filled_required_score:
              value: 0.5
              rendered: 50.0%
          - shift_dim.day_number:
              value: 4
            z_analytics.proficiency_mix_ratio_filled_required_beginner:
              value: 2
              rendered: 200.0%
              filterable_value: '2.0'
              html: 200.0% (8/4.0)
            z_analytics.proficiency_mix_ratio_filled_required_advanced:
              value: 1.25
              rendered: 125.0%
              html: 125.0% (5/4.0)
            z_analytics.proficiency_mix_ratio_filled_required_score:
              value: 0.5
              rendered: 50.0%
          - shift_dim.day_number:
              value: 5
            z_analytics.proficiency_mix_ratio_filled_required_beginner:
              value: 2.75
              rendered: 275.0%
              html: 275.0% (11/4.0)
            z_analytics.proficiency_mix_ratio_filled_required_advanced:
              value: 0.5
              rendered: 50.0%
              html: 50.0% (2/4.0)
            z_analytics.proficiency_mix_ratio_filled_required_score:
              value: 0.25
              rendered: 25.0%
          - shift_dim.day_number:
              value: 6
            z_analytics.proficiency_mix_ratio_filled_required_beginner:
              value: 1.75
              rendered: 175.0%
              html: 175.0% (7/4.0)
            z_analytics.proficiency_mix_ratio_filled_required_advanced:
              value: 1.5
              rendered: 150.0%
              html: 150.0% (6/4.0)
            z_analytics.proficiency_mix_ratio_filled_required_score:
              value: 0.5
              rendered: 50.0%
          - shift_dim.day_number:
              value: 7
            z_analytics.proficiency_mix_ratio_filled_required_beginner:
              value: 1.7777777777777777
              rendered: 177.8%
              html: 177.8% (4/2.3)
            z_analytics.proficiency_mix_ratio_filled_required_advanced:
              value: 1.3333333333333333
              rendered: 133.3%
              html: 133.3% (3/2.3)
            z_analytics.proficiency_mix_ratio_filled_required_score:
              value: 0.5
              rendered: 50.0%
          - shift_dim.day_number:
              value: 8
            z_analytics.proficiency_mix_ratio_filled_required_beginner:
              value: 2.4761904761904763
              rendered: 247.6%
              html: 247.6% (13/5.3)
            z_analytics.proficiency_mix_ratio_filled_required_advanced:
              value: 1.3333333333333333
              rendered: 133.3%
              html: 133.3% (7/5.3)
            z_analytics.proficiency_mix_ratio_filled_required_score:
              value: 0.5
              rendered: 50.0%
          - shift_dim.day_number:
              value: 9
            z_analytics.proficiency_mix_ratio_filled_required_beginner:
              value: 2
              rendered: 200.0%
              filterable_value: '2.0'
              html: 200.0% (12/6.0)
            z_analytics.proficiency_mix_ratio_filled_required_advanced:
              value: 1.3333333333333333
              rendered: 133.3%
              html: 133.3% (8/6.0)
            z_analytics.proficiency_mix_ratio_filled_required_score:
              value: 0.5
              rendered: 50.0%
          - shift_dim.day_number:
              value: 10
            z_analytics.proficiency_mix_ratio_filled_required_beginner:
              value: 2.933333333333333
              rendered: 293.3%
              html: 293.3% (11/3.8)
            z_analytics.proficiency_mix_ratio_filled_required_advanced:
              value: 0.26666666666666666
              rendered: 26.7%
              html: 26.7% (1/3.8)
            z_analytics.proficiency_mix_ratio_filled_required_score:
              value: 0.13333333333333333
              rendered: 13.3%
          - shift_dim.day_number:
              value: 11
            z_analytics.proficiency_mix_ratio_filled_required_beginner:
              value: 2.1538461538461537
              rendered: 215.4%
              html: 215.4% (7/3.3)
            z_analytics.proficiency_mix_ratio_filled_required_advanced:
              value: 1.2307692307692308
              rendered: 123.1%
              html: 123.1% (4/3.3)
            z_analytics.proficiency_mix_ratio_filled_required_score:
              value: 0.5
              rendered: 50.0%
          - shift_dim.day_number:
              value: 12
            z_analytics.proficiency_mix_ratio_filled_required_beginner:
              value: 2.24
              rendered: 224.0%
              html: 224.0% (14/6.3)
            z_analytics.proficiency_mix_ratio_filled_required_advanced:
              value: 1.44
              rendered: 144.0%
              html: 144.0% (9/6.3)
            z_analytics.proficiency_mix_ratio_filled_required_score:
              value: 0.5
              rendered: 50.0%
          - shift_dim.day_number:
              value: 13
            z_analytics.proficiency_mix_ratio_filled_required_beginner:
              value: 1.8181818181818181
              rendered: 181.8%
              html: 181.8% (10/5.5)
            z_analytics.proficiency_mix_ratio_filled_required_advanced:
              value: 1.4545454545454546
              rendered: 145.5%
              html: 145.5% (8/5.5)
            z_analytics.proficiency_mix_ratio_filled_required_score:
              value: 0.5
              rendered: 50.0%
          - shift_dim.day_number:
              value: 14
            z_analytics.proficiency_mix_ratio_filled_required_beginner:
              value: 2.0869565217391304
              rendered: 208.7%
              html: 208.7% (12/5.8)
            z_analytics.proficiency_mix_ratio_filled_required_advanced:
              value: 1.391304347826087
              rendered: 139.1%
              html: 139.1% (8/5.8)
            z_analytics.proficiency_mix_ratio_filled_required_score:
              value: 0.5
              rendered: 50.0%
          - shift_dim.day_number:
              value: 15
            z_analytics.proficiency_mix_ratio_filled_required_beginner:
              value: 2.1333333333333333
              rendered: 213.3%
              html: 213.3% (8/3.8)
            z_analytics.proficiency_mix_ratio_filled_required_advanced:
              value: 1.6
              rendered: 160.0%
              html: 160.0% (6/3.8)
            z_analytics.proficiency_mix_ratio_filled_required_score:
              value: 0.5
              rendered: 50.0%
          - shift_dim.day_number:
              value: 16
            z_analytics.proficiency_mix_ratio_filled_required_beginner:
              value: 2.4
              rendered: 240.0%
              html: 240.0% (12/5.0)
            z_analytics.proficiency_mix_ratio_filled_required_advanced:
              value: 1.4
              rendered: 140.0%
              html: 140.0% (7/5.0)
            z_analytics.proficiency_mix_ratio_filled_required_score:
              value: 0.5
              rendered: 50.0%
          - shift_dim.day_number:
              value: 17
            z_analytics.proficiency_mix_ratio_filled_required_beginner:
              value: 2.5454545454545454
              rendered: 254.5%
              html: 254.5% (14/5.5)
            z_analytics.proficiency_mix_ratio_filled_required_advanced:
              value: 1.0909090909090908
              rendered: 109.1%
              html: 109.1% (6/5.5)
            z_analytics.proficiency_mix_ratio_filled_required_score:
              value: 0.5
              rendered: 50.0%
          - shift_dim.day_number:
              value: 18
            z_analytics.proficiency_mix_ratio_filled_required_beginner:
              value: 2.2222222222222223
              rendered: 222.2%
              html: 222.2% (10/4.5)
            z_analytics.proficiency_mix_ratio_filled_required_advanced:
              value: 0.8888888888888888
              rendered: 88.9%
              html: 88.9% (4/4.5)
            z_analytics.proficiency_mix_ratio_filled_required_score:
              value: 0.4444444444444444
              rendered: 44.4%
          - shift_dim.day_number:
              value: 19
            z_analytics.proficiency_mix_ratio_filled_required_beginner:
              value: 1.8
              rendered: 180.0%
              html: 180.0% (9/5.0)
            z_analytics.proficiency_mix_ratio_filled_required_advanced:
              value: 1.6
              rendered: 160.0%
              html: 160.0% (8/5.0)
            z_analytics.proficiency_mix_ratio_filled_required_score:
              value: 0.5
              rendered: 50.0%
          - shift_dim.day_number:
              value: 20
            z_analytics.proficiency_mix_ratio_filled_required_beginner:
              value: 1.9259259259259258
              rendered: 192.6%
              html: 192.6% (13/6.8)
            z_analytics.proficiency_mix_ratio_filled_required_advanced:
              value: 1.3333333333333333
              rendered: 133.3%
              html: 133.3% (9/6.8)
            z_analytics.proficiency_mix_ratio_filled_required_score:
              value: 0.5
              rendered: 50.0%
          - shift_dim.day_number:
              value: 21
            z_analytics.proficiency_mix_ratio_filled_required_beginner:
              value: 1.7391304347826086
              rendered: 173.9%
              html: 173.9% (10/5.8)
            z_analytics.proficiency_mix_ratio_filled_required_advanced:
              value: 1.565217391304348
              rendered: 156.5%
              html: 156.5% (9/5.8)
            z_analytics.proficiency_mix_ratio_filled_required_score:
              value: 0.5
              rendered: 50.0%
          - shift_dim.day_number:
              value: 22
            z_analytics.proficiency_mix_ratio_filled_required_beginner:
              value: 2.769230769230769
              rendered: 276.9%
              html: 276.9% (9/3.3)
            z_analytics.proficiency_mix_ratio_filled_required_advanced:
              value: 0.9230769230769231
              rendered: 92.3%
              html: 92.3% (3/3.3)
            z_analytics.proficiency_mix_ratio_filled_required_score:
              value: 0.46153846153846156
              rendered: 46.2%
          - shift_dim.day_number:
              value: 23
            z_analytics.proficiency_mix_ratio_filled_required_beginner:
              value: 2
              rendered: 200.0%
              filterable_value: '2.0'
              html: 200.0% (6/3.0)
            z_analytics.proficiency_mix_ratio_filled_required_advanced:
              value: 1
              rendered: 100.0%
              filterable_value: '1.0'
              html: 100.0% (3/3.0)
            z_analytics.proficiency_mix_ratio_filled_required_score:
              value: 0.5
              rendered: 50.0%
          - shift_dim.day_number:
              value: 24
            z_analytics.proficiency_mix_ratio_filled_required_beginner:
              value: 2.6666666666666665
              rendered: 266.7%
              html: 266.7% (8/3.0)
            z_analytics.proficiency_mix_ratio_filled_required_advanced:
              value: 1
              rendered: 100.0%
              filterable_value: '1.0'
              html: 100.0% (3/3.0)
            z_analytics.proficiency_mix_ratio_filled_required_score:
              value: 0.5
              rendered: 50.0%
          - shift_dim.day_number:
              value: 25
            z_analytics.proficiency_mix_ratio_filled_required_beginner:
              value: 2
              rendered: 200.0%
              filterable_value: '2.0'
              html: 200.0% (7/3.5)
            z_analytics.proficiency_mix_ratio_filled_required_advanced:
              value: 0.8571428571428571
              rendered: 85.7%
              html: 85.7% (3/3.5)
            z_analytics.proficiency_mix_ratio_filled_required_score:
              value: 0.42857142857142855
              rendered: 42.9%
          - shift_dim.day_number:
              value: 26
            z_analytics.proficiency_mix_ratio_filled_required_beginner:
              value: 2
              rendered: 200.0%
              filterable_value: '2.0'
              html: 200.0% (14/7.0)
            z_analytics.proficiency_mix_ratio_filled_required_advanced:
              value: 1.4285714285714286
              rendered: 142.9%
              html: 142.9% (10/7.0)
            z_analytics.proficiency_mix_ratio_filled_required_score:
              value: 0.5
              rendered: 50.0%
          - shift_dim.day_number:
              value: 27
            z_analytics.proficiency_mix_ratio_filled_required_beginner:
              value: 1.9310344827586208
              rendered: 193.1%
              html: 193.1% (14/7.3)
            z_analytics.proficiency_mix_ratio_filled_required_advanced:
              value: 1.3793103448275863
              rendered: 137.9%
              html: 137.9% (10/7.3)
            z_analytics.proficiency_mix_ratio_filled_required_score:
              value: 0.5
              rendered: 50.0%
          - shift_dim.day_number:
              value: 28
            z_analytics.proficiency_mix_ratio_filled_required_beginner:
              value: 2.08
              rendered: 208.0%
              html: 208.0% (13/6.3)
            z_analytics.proficiency_mix_ratio_filled_required_advanced:
              value: 1.6
              rendered: 160.0%
              html: 160.0% (10/6.3)
            z_analytics.proficiency_mix_ratio_filled_required_score:
              value: 0.5
              rendered: 50.0%
          drill_menu_build_time: 0.034293000000000004
          expired: false
          fields:
            measures:
            - align: right
              can_filter: true
              category: measure
              default_filter_value:
              description: ''
              enumerations:
              field_group_label: 2 Proficiency Mix (Beginner)
              fill_style:
              fiscal_month_offset: 0
              has_allowed_values: false
              hidden: false
              is_filter: false
              is_numeric: true
              label: Analytics C Proficiency Mix % (Beginner)
              label_from_parameter:
              label_short: C Proficiency Mix % (Beginner)
              map_layer:
              name: z_analytics.proficiency_mix_ratio_filled_required_beginner
              strict_value_format: false
              requires_refresh_on_sort: false
              sortable: true
              suggestions:
              tags: []
              type: number
              user_attribute_filter_types:
              - number
              - advanced_filter_number
              value_format: "#,##0.0%"
              view: z_analytics
              view_label: Analytics
              dynamic: false
              week_start_day: monday
              original_view: z_analytics
              dimension_group:
              error:
              field_group_variant: C Proficiency Mix % (Beginner)
              measure: true
              parameter: false
              primary_key: false
              project_name: cti-schedule-solver
              scope: z_analytics
              suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_beginner
              suggest_explore: shift_staff_fact
              suggestable: false
              is_fiscal: false
              is_timeframe: false
              can_time_filter: false
              time_interval:
              lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=161"
              permanent:
              source_file: solver_views/v_00_analytics.view.lkml
              source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
              sql: "${sum_proficiency_mix_filled_beginner} / nullif(${sum_proficiency_mix_required_beginner},0) "
              sql_case:
              filters:
              times_used: 0
            - align: right
              can_filter: true
              category: measure
              default_filter_value:
              description: ''
              enumerations:
              field_group_label: 2 Proficiency Mix (Advanced)
              fill_style:
              fiscal_month_offset: 0
              has_allowed_values: false
              hidden: false
              is_filter: false
              is_numeric: true
              label: Analytics C Proficiency Mix % (Advanced)
              label_from_parameter:
              label_short: C Proficiency Mix % (Advanced)
              map_layer:
              name: z_analytics.proficiency_mix_ratio_filled_required_advanced
              strict_value_format: false
              requires_refresh_on_sort: false
              sortable: true
              suggestions:
              tags: []
              type: number
              user_attribute_filter_types:
              - number
              - advanced_filter_number
              value_format: "#,##0.0%"
              view: z_analytics
              view_label: Analytics
              dynamic: false
              week_start_day: monday
              original_view: z_analytics
              dimension_group:
              error:
              field_group_variant: C Proficiency Mix % (Advanced)
              measure: true
              parameter: false
              primary_key: false
              project_name: cti-schedule-solver
              scope: z_analytics
              suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_advanced
              suggest_explore: shift_staff_fact
              suggestable: false
              is_fiscal: false
              is_timeframe: false
              can_time_filter: false
              time_interval:
              lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=109"
              permanent:
              source_file: solver_views/v_00_analytics.view.lkml
              source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
              sql: "${sum_proficiency_mix_filled_advanced} / nullif(${sum_proficiency_mix_required_advanced},0) "
              sql_case:
              filters:
              times_used: 0
            - align: right
              can_filter: true
              category: measure
              default_filter_value:
              description: ''
              enumerations:
              field_group_label: 0 Overall Score
              fill_style:
              fiscal_month_offset: 0
              has_allowed_values: false
              hidden: false
              is_filter: false
              is_numeric: true
              label: Analytics 2 Proficiency Mix Score
              label_from_parameter:
              label_short: 2 Proficiency Mix Score
              map_layer:
              name: z_analytics.proficiency_mix_ratio_filled_required_score
              strict_value_format: false
              requires_refresh_on_sort: false
              sortable: true
              suggestions:
              tags: []
              type: number
              user_attribute_filter_types:
              - number
              - advanced_filter_number
              value_format: "#,##0.0%"
              view: z_analytics
              view_label: Analytics
              dynamic: false
              week_start_day: monday
              original_view: z_analytics
              dimension_group:
              error:
              field_group_variant: 2 Proficiency Mix Score
              measure: true
              parameter: false
              primary_key: false
              project_name: cti-schedule-solver
              scope: z_analytics
              suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_score
              suggest_explore: shift_staff_fact
              suggestable: false
              is_fiscal: false
              is_timeframe: false
              can_time_filter: false
              time_interval:
              lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=186"
              permanent:
              source_file: solver_views/v_00_analytics.view.lkml
              source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
              sql: "(\n        -- This is the score for advanced -- not the arrow\
                \ b/c we don't mind too many\n        case\n          when ${sum_proficiency_mix_filled_advanced}\
                \ > ${sum_proficiency_mix_required_advanced} then 1\n          else\
                \ ${sum_proficiency_mix_filled_advanced} / nullif(${sum_proficiency_mix_required_advanced},0)\n\
                \        end\n        +\n        -- This is the score for beginner\
                \ -- not the arrow b/c we don't mind too few\n        case\n     \
                \     when ${sum_proficiency_mix_filled_beginner} <= ${sum_proficiency_mix_required_beginner}\
                \ then 1\n          else 0\n        end\n      )\n      -- Then take\
                \ a straight average\n        / 2\n      "
              sql_case:
              filters:
              times_used: 0
            dimensions:
            - align: right
              can_filter: true
              category: dimension
              default_filter_value:
              description: ''
              enumerations:
              field_group_label: Shift
              fill_style:
              fiscal_month_offset: 0
              has_allowed_values: false
              hidden: false
              is_filter: false
              is_numeric: true
              label: Analytics Day Number
              label_from_parameter:
              label_short: Day Number
              map_layer:
              name: shift_dim.day_number
              strict_value_format: false
              requires_refresh_on_sort: false
              sortable: true
              suggestions:
              tags: []
              type: number
              user_attribute_filter_types:
              - number
              - advanced_filter_number
              value_format:
              view: shift_dim
              view_label: Analytics
              dynamic: false
              week_start_day: monday
              original_view: shift_dim
              dimension_group:
              error:
              field_group_variant: Day Number
              measure: false
              parameter: false
              primary_key: false
              project_name: cti-schedule-solver
              scope: shift_dim
              suggest_dimension: shift_dim.day_number
              suggest_explore: shift_staff_fact
              suggestable: false
              is_fiscal: false
              is_timeframe: false
              can_time_filter: false
              time_interval:
              lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_02_shift_dim.view.lkml?line=16"
              permanent:
              source_file: solver_views/v_02_shift_dim.view.lkml
              source_file_path: cti-schedule-solver/solver_views/v_02_shift_dim.view.lkml
              sql: "${TABLE}.day_number "
              sql_case:
              filters:
              times_used: 0
              sorted:
                desc: false
                sort_index: 0
            table_calculations: []
            pivots: []
            measure_like:
            - align: right
              can_filter: true
              category: measure
              default_filter_value:
              description: ''
              enumerations:
              field_group_label: 2 Proficiency Mix (Beginner)
              fill_style:
              fiscal_month_offset: 0
              has_allowed_values: false
              hidden: false
              is_filter: false
              is_numeric: true
              label: Analytics C Proficiency Mix % (Beginner)
              label_from_parameter:
              label_short: C Proficiency Mix % (Beginner)
              map_layer:
              name: z_analytics.proficiency_mix_ratio_filled_required_beginner
              strict_value_format: false
              requires_refresh_on_sort: false
              sortable: true
              suggestions:
              tags: []
              type: number
              user_attribute_filter_types:
              - number
              - advanced_filter_number
              value_format: "#,##0.0%"
              view: z_analytics
              view_label: Analytics
              dynamic: false
              week_start_day: monday
              original_view: z_analytics
              dimension_group:
              error:
              field_group_variant: C Proficiency Mix % (Beginner)
              measure: true
              parameter: false
              primary_key: false
              project_name: cti-schedule-solver
              scope: z_analytics
              suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_beginner
              suggest_explore: shift_staff_fact
              suggestable: false
              is_fiscal: false
              is_timeframe: false
              can_time_filter: false
              time_interval:
              lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=161"
              permanent:
              source_file: solver_views/v_00_analytics.view.lkml
              source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
              sql: "${sum_proficiency_mix_filled_beginner} / nullif(${sum_proficiency_mix_required_beginner},0) "
              sql_case:
              filters:
              times_used: 0
            - align: right
              can_filter: true
              category: measure
              default_filter_value:
              description: ''
              enumerations:
              field_group_label: 2 Proficiency Mix (Advanced)
              fill_style:
              fiscal_month_offset: 0
              has_allowed_values: false
              hidden: false
              is_filter: false
              is_numeric: true
              label: Analytics C Proficiency Mix % (Advanced)
              label_from_parameter:
              label_short: C Proficiency Mix % (Advanced)
              map_layer:
              name: z_analytics.proficiency_mix_ratio_filled_required_advanced
              strict_value_format: false
              requires_refresh_on_sort: false
              sortable: true
              suggestions:
              tags: []
              type: number
              user_attribute_filter_types:
              - number
              - advanced_filter_number
              value_format: "#,##0.0%"
              view: z_analytics
              view_label: Analytics
              dynamic: false
              week_start_day: monday
              original_view: z_analytics
              dimension_group:
              error:
              field_group_variant: C Proficiency Mix % (Advanced)
              measure: true
              parameter: false
              primary_key: false
              project_name: cti-schedule-solver
              scope: z_analytics
              suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_advanced
              suggest_explore: shift_staff_fact
              suggestable: false
              is_fiscal: false
              is_timeframe: false
              can_time_filter: false
              time_interval:
              lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=109"
              permanent:
              source_file: solver_views/v_00_analytics.view.lkml
              source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
              sql: "${sum_proficiency_mix_filled_advanced} / nullif(${sum_proficiency_mix_required_advanced},0) "
              sql_case:
              filters:
              times_used: 0
            - align: right
              can_filter: true
              category: measure
              default_filter_value:
              description: ''
              enumerations:
              field_group_label: 0 Overall Score
              fill_style:
              fiscal_month_offset: 0
              has_allowed_values: false
              hidden: false
              is_filter: false
              is_numeric: true
              label: Analytics 2 Proficiency Mix Score
              label_from_parameter:
              label_short: 2 Proficiency Mix Score
              map_layer:
              name: z_analytics.proficiency_mix_ratio_filled_required_score
              strict_value_format: false
              requires_refresh_on_sort: false
              sortable: true
              suggestions:
              tags: []
              type: number
              user_attribute_filter_types:
              - number
              - advanced_filter_number
              value_format: "#,##0.0%"
              view: z_analytics
              view_label: Analytics
              dynamic: false
              week_start_day: monday
              original_view: z_analytics
              dimension_group:
              error:
              field_group_variant: 2 Proficiency Mix Score
              measure: true
              parameter: false
              primary_key: false
              project_name: cti-schedule-solver
              scope: z_analytics
              suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_score
              suggest_explore: shift_staff_fact
              suggestable: false
              is_fiscal: false
              is_timeframe: false
              can_time_filter: false
              time_interval:
              lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=186"
              permanent:
              source_file: solver_views/v_00_analytics.view.lkml
              source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
              sql: "(\n        -- This is the score for advanced -- not the arrow\
                \ b/c we don't mind too many\n        case\n          when ${sum_proficiency_mix_filled_advanced}\
                \ > ${sum_proficiency_mix_required_advanced} then 1\n          else\
                \ ${sum_proficiency_mix_filled_advanced} / nullif(${sum_proficiency_mix_required_advanced},0)\n\
                \        end\n        +\n        -- This is the score for beginner\
                \ -- not the arrow b/c we don't mind too few\n        case\n     \
                \     when ${sum_proficiency_mix_filled_beginner} <= ${sum_proficiency_mix_required_beginner}\
                \ then 1\n          else 0\n        end\n      )\n      -- Then take\
                \ a straight average\n        / 2\n      "
              sql_case:
              filters:
              times_used: 0
            dimension_like:
            - align: right
              can_filter: true
              category: dimension
              default_filter_value:
              description: ''
              enumerations:
              field_group_label: Shift
              fill_style:
              fiscal_month_offset: 0
              has_allowed_values: false
              hidden: false
              is_filter: false
              is_numeric: true
              label: Analytics Day Number
              label_from_parameter:
              label_short: Day Number
              map_layer:
              name: shift_dim.day_number
              strict_value_format: false
              requires_refresh_on_sort: false
              sortable: true
              suggestions:
              tags: []
              type: number
              user_attribute_filter_types:
              - number
              - advanced_filter_number
              value_format:
              view: shift_dim
              view_label: Analytics
              dynamic: false
              week_start_day: monday
              original_view: shift_dim
              dimension_group:
              error:
              field_group_variant: Day Number
              measure: false
              parameter: false
              primary_key: false
              project_name: cti-schedule-solver
              scope: shift_dim
              suggest_dimension: shift_dim.day_number
              suggest_explore: shift_staff_fact
              suggestable: false
              is_fiscal: false
              is_timeframe: false
              can_time_filter: false
              time_interval:
              lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_02_shift_dim.view.lkml?line=16"
              permanent:
              source_file: solver_views/v_02_shift_dim.view.lkml
              source_file_path: cti-schedule-solver/solver_views/v_02_shift_dim.view.lkml
              sql: "${TABLE}.day_number "
              sql_case:
              filters:
              times_used: 0
              sorted:
                desc: false
                sort_index: 0
          fill_fields: []
          forecast_result:
          has_row_totals: false
          has_totals: false
          id: query-result-91:{}
          null_sort_treatment: low
          number_format: '1,234.56'
          ran_at: '2022-05-12T15:42:52+00:00'
          runtime: '1.357'
          sql: |-
            SELECT
                shift_dim.day_number  AS shift_dim_day_number,
                COUNT(DISTINCT CASE WHEN staff_competency_dim.overall_proficiency = 'Beginner' and shift_staff_fact.is_scheduled  THEN ( shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  )  ELSE NULL END) AS z_analytics_sum_proficiency_mix_filled_beginner,
                    COUNT(DISTINCT CASE WHEN shift_staff_fact.is_scheduled  THEN shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  ELSE NULL END) * 0.25 AS z_analytics_sum_proficiency_mix_required_beginner,
                    COUNT(DISTINCT CASE WHEN staff_competency_dim.overall_proficiency = 'Beginner' and shift_staff_fact.is_scheduled  THEN ( shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  )  ELSE NULL END) / nullif(COUNT(DISTINCT CASE WHEN shift_staff_fact.is_scheduled  THEN shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  ELSE NULL END) * 0.25, 0) AS z_analytics_proficiency_mix_ratio_filled_required_beginner,
                COUNT(DISTINCT CASE WHEN staff_competency_dim.overall_proficiency = 'Advanced' and shift_staff_fact.is_scheduled  THEN ( shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  )  ELSE NULL END) AS z_analytics_sum_proficiency_mix_filled_advanced,
                    COUNT(DISTINCT CASE WHEN shift_staff_fact.is_scheduled  THEN shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  ELSE NULL END) * 0.25 AS z_analytics_sum_proficiency_mix_required_advanced,
                    COUNT(DISTINCT CASE WHEN staff_competency_dim.overall_proficiency = 'Advanced' and shift_staff_fact.is_scheduled  THEN ( shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  )  ELSE NULL END) / nullif(COUNT(DISTINCT CASE WHEN shift_staff_fact.is_scheduled  THEN shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  ELSE NULL END) * 0.25, 0) AS z_analytics_proficiency_mix_ratio_filled_required_advanced,
                        (CASE WHEN COUNT(DISTINCT CASE WHEN staff_competency_dim.overall_proficiency = 'Advanced' and shift_staff_fact.is_scheduled  THEN ( shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  )  ELSE NULL END) > COUNT(DISTINCT CASE WHEN shift_staff_fact.is_scheduled  THEN shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  ELSE NULL END) * 0.25 THEN 1 ELSE COUNT(DISTINCT CASE WHEN staff_competency_dim.overall_proficiency = 'Advanced' and shift_staff_fact.is_scheduled  THEN ( shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  )  ELSE NULL END) / nullif(COUNT(DISTINCT CASE WHEN shift_staff_fact.is_scheduled  THEN shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  ELSE NULL END) * 0.25, 0) END + CASE WHEN COUNT(DISTINCT CASE WHEN staff_competency_dim.overall_proficiency = 'Beginner' and shift_staff_fact.is_scheduled  THEN ( shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  )  ELSE NULL END) <= COUNT(DISTINCT CASE WHEN shift_staff_fact.is_scheduled  THEN shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  ELSE NULL END) * 0.25 THEN 1 ELSE 0 END) / 2 AS z_analytics_proficiency_mix_ratio_filled_required_score
            FROM optimizer.analytics_table_01_shift_staff_fact
                 AS shift_staff_fact
            LEFT JOIN optimizer.analytics_table_02_shift_dim
                 AS shift_dim ON shift_staff_fact.run_name_id = shift_dim.run_name_id
                  AND shift_staff_fact.shift_id = shift_dim.shift_id

            LEFT JOIN optimizer.analytics_table_05_staff_dim
                 AS staff_dim ON shift_staff_fact.run_name_id = staff_dim.run_name_id
                AND shift_staff_fact.staff_id = staff_dim.staff_id

            LEFT JOIN optimizer.analytics_table_07_staff_competency_dim
                 AS staff_competency_dim ON staff_dim.run_name_id = staff_competency_dim.run_name_id
                AND staff_dim.staff_id = staff_competency_dim.staff_id

            LEFT JOIN (SELECT 'x' as x)  AS z_analytics ON 1 = 1
            WHERE (shift_staff_fact.run_name_id ) = '9'
            GROUP BY
                1
            ORDER BY
                1
            LIMIT 500
          sql_explain:
          supports_pivot_in_db: true
          timezone: America/Chicago
          is_local: true
          table_calcs_complete: true
          tracked_attributes:
            result.drill_menu_build_time: 0.034293000000000004
            result.from_cache: true
            result.runtime: '1.357'
            result.sql.length: 4376
            result.supports_pivot_in_db: true
          sorts:
          - name: shift_dim.day_number
            desc: false
        config:
          show_view_names: false
          show_row_numbers: true
          transpose: true
          truncate_text: true
          hide_totals: false
          hide_row_totals: false
          size_to_fit: true
          table_theme: white
          limit_displayed_rows: false
          enable_conditional_formatting: true
          header_text_alignment: left
          header_font_size: '12'
          rows_font_size: '12'
          conditional_formatting_include_totals: false
          conditional_formatting_include_nulls: false
          show_sql_query_menu_options: false
          column_order: {}
          show_totals: true
          show_row_totals: true
          truncate_header: false
          series_labels:
            z_analytics.proficiency_mix_ratio_filled_required_beginner: "% of Beginners\
              \ Scheduled"
            z_analytics.proficiency_mix_ratio_filled_required_advanced: "% of Advanced\
              \ Scheduled"
            z_analytics.proficiency_mix_ratio_filled_required_score: Overall Score
          series_column_widths:
            shift_dim.day_number: 104
            z_analytics.proficiency_mix_ratio_filled_required_beginner: 191
            z_analytics.proficiency_mix_ratio_filled_required_advanced: 164
            z_analytics.proficiency_mix_ratio_filled_required_score: 93
          series_cell_visualizations:
            z_analytics.proficiency_mix_ratio_filled_required_beginner:
              is_active: false
          conditional_formatting:
          - type: along a scale...
            value:
            background_color: "#1A73E8"
            font_color:
            color_application:
              collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
              custom:
                id: 9d37feff-c18e-3683-158f-529295caca83
                label: Custom
                type: continuous
                stops:
                - color: green
                  offset: 0
                - color: red
                  offset: 100
              options:
                steps: 5
                constraints:
                  min:
                    type: number
                    value: 0.5
                  mid:
                    type: number
                    value: 1
                  max:
                    type: number
                    value: 1.25
            bold: false
            italic: false
            strikethrough: false
            fields:
            - z_analytics.proficiency_mix_ratio_filled_required_beginner
          - type: along a scale...
            value:
            background_color: "#1A73E8"
            font_color:
            color_application:
              collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
              custom:
                id: 70fd814a-a067-2070-99ae-d6928930ab61
                label: Custom
                type: continuous
                stops:
                - color: red
                  offset: 0
                - color: green
                  offset: 100
              options:
                steps: 5
                constraints:
                  min:
                    type: number
                    value: 0.75
                  mid:
                    type: number
                    value: 1
                  max:
                    type: number
                    value: 1.1
            bold: false
            italic: false
            strikethrough: false
            fields:
            - z_analytics.proficiency_mix_ratio_filled_required_advanced
          - type: along a scale...
            value:
            background_color: "#1A73E8"
            font_color:
            color_application:
              collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
              custom:
                id: 655732e7-cb5d-30af-ff27-50a273b2848f
                label: Custom
                type: continuous
                stops:
                - color: red
                  offset: 0
                - color: green
                  offset: 100
              options:
                steps: 5
                constraints:
                  min:
                    type: number
                    value: 0.5
                  mid:
                    type: number
                    value: 1
                  max:
                    type: number
                    value: 1.1
            bold: false
            italic: false
            strikethrough: false
            fields:
            - z_analytics.proficiency_mix_ratio_filled_required_score
          type: looker_grid
          x_axis_gridlines: false
          y_axis_gridlines: true
          show_y_axis_labels: true
          show_y_axis_ticks: true
          y_axis_tick_density: default
          y_axis_tick_density_custom: 5
          show_x_axis_label: true
          show_x_axis_ticks: true
          y_axis_scale_mode: linear
          x_axis_reversed: false
          y_axis_reversed: false
          plot_size_by_field: false
          trellis: ''
          stacking: ''
          legend_position: center
          point_style: none
          show_value_labels: false
          label_density: 25
          x_axis_scale: auto
          y_axis_combined: true
          show_null_points: true
          interpolation: linear
          defaults_version: 1
          series_types: {}
          query_fields:
            measures:
            - align: right
              can_filter: true
              category: measure
              default_filter_value:
              description: ''
              enumerations:
              field_group_label: 2 Proficiency Mix (Beginner)
              fill_style:
              fiscal_month_offset: 0
              has_allowed_values: false
              hidden: false
              is_filter: false
              is_numeric: true
              label: Analytics C Proficiency Mix % (Beginner)
              label_from_parameter:
              label_short: C Proficiency Mix % (Beginner)
              map_layer:
              name: z_analytics.proficiency_mix_ratio_filled_required_beginner
              strict_value_format: false
              requires_refresh_on_sort: false
              sortable: true
              suggestions:
              tags: []
              type: number
              user_attribute_filter_types:
              - number
              - advanced_filter_number
              value_format: "#,##0.0%"
              view: z_analytics
              view_label: Analytics
              dynamic: false
              week_start_day: monday
              original_view: z_analytics
              dimension_group:
              error:
              field_group_variant: C Proficiency Mix % (Beginner)
              measure: true
              parameter: false
              primary_key: false
              project_name: cti-schedule-solver
              scope: z_analytics
              suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_beginner
              suggest_explore: shift_staff_fact
              suggestable: false
              is_fiscal: false
              is_timeframe: false
              can_time_filter: false
              time_interval:
              lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=161"
              permanent:
              source_file: solver_views/v_00_analytics.view.lkml
              source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
              sql: "${sum_proficiency_mix_filled_beginner} / nullif(${sum_proficiency_mix_required_beginner},0) "
              sql_case:
              filters:
              times_used: 0
            - align: right
              can_filter: true
              category: measure
              default_filter_value:
              description: ''
              enumerations:
              field_group_label: 2 Proficiency Mix (Advanced)
              fill_style:
              fiscal_month_offset: 0
              has_allowed_values: false
              hidden: false
              is_filter: false
              is_numeric: true
              label: Analytics C Proficiency Mix % (Advanced)
              label_from_parameter:
              label_short: C Proficiency Mix % (Advanced)
              map_layer:
              name: z_analytics.proficiency_mix_ratio_filled_required_advanced
              strict_value_format: false
              requires_refresh_on_sort: false
              sortable: true
              suggestions:
              tags: []
              type: number
              user_attribute_filter_types:
              - number
              - advanced_filter_number
              value_format: "#,##0.0%"
              view: z_analytics
              view_label: Analytics
              dynamic: false
              week_start_day: monday
              original_view: z_analytics
              dimension_group:
              error:
              field_group_variant: C Proficiency Mix % (Advanced)
              measure: true
              parameter: false
              primary_key: false
              project_name: cti-schedule-solver
              scope: z_analytics
              suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_advanced
              suggest_explore: shift_staff_fact
              suggestable: false
              is_fiscal: false
              is_timeframe: false
              can_time_filter: false
              time_interval:
              lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=109"
              permanent:
              source_file: solver_views/v_00_analytics.view.lkml
              source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
              sql: "${sum_proficiency_mix_filled_advanced} / nullif(${sum_proficiency_mix_required_advanced},0) "
              sql_case:
              filters:
              times_used: 0
            - align: right
              can_filter: true
              category: measure
              default_filter_value:
              description: ''
              enumerations:
              field_group_label: 0 Overall Score
              fill_style:
              fiscal_month_offset: 0
              has_allowed_values: false
              hidden: false
              is_filter: false
              is_numeric: true
              label: Analytics 2 Proficiency Mix Score
              label_from_parameter:
              label_short: 2 Proficiency Mix Score
              map_layer:
              name: z_analytics.proficiency_mix_ratio_filled_required_score
              strict_value_format: false
              requires_refresh_on_sort: false
              sortable: true
              suggestions:
              tags: []
              type: number
              user_attribute_filter_types:
              - number
              - advanced_filter_number
              value_format: "#,##0.0%"
              view: z_analytics
              view_label: Analytics
              dynamic: false
              week_start_day: monday
              original_view: z_analytics
              dimension_group:
              error:
              field_group_variant: 2 Proficiency Mix Score
              measure: true
              parameter: false
              primary_key: false
              project_name: cti-schedule-solver
              scope: z_analytics
              suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_score
              suggest_explore: shift_staff_fact
              suggestable: false
              is_fiscal: false
              is_timeframe: false
              can_time_filter: false
              time_interval:
              lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=186"
              permanent:
              source_file: solver_views/v_00_analytics.view.lkml
              source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
              sql: "(\n        -- This is the score for advanced -- not the arrow\
                \ b/c we don't mind too many\n        case\n          when ${sum_proficiency_mix_filled_advanced}\
                \ > ${sum_proficiency_mix_required_advanced} then 1\n          else\
                \ ${sum_proficiency_mix_filled_advanced} / nullif(${sum_proficiency_mix_required_advanced},0)\n\
                \        end\n        +\n        -- This is the score for beginner\
                \ -- not the arrow b/c we don't mind too few\n        case\n     \
                \     when ${sum_proficiency_mix_filled_beginner} <= ${sum_proficiency_mix_required_beginner}\
                \ then 1\n          else 0\n        end\n      )\n      -- Then take\
                \ a straight average\n        / 2\n      "
              sql_case:
              filters:
              times_used: 0
            dimensions:
            - align: right
              can_filter: true
              category: dimension
              default_filter_value:
              description: ''
              enumerations:
              field_group_label: Shift
              fill_style:
              fiscal_month_offset: 0
              has_allowed_values: false
              hidden: false
              is_filter: false
              is_numeric: true
              label: Analytics Day Number
              label_from_parameter:
              label_short: Day Number
              map_layer:
              name: shift_dim.day_number
              strict_value_format: false
              requires_refresh_on_sort: false
              sortable: true
              suggestions:
              tags: []
              type: number
              user_attribute_filter_types:
              - number
              - advanced_filter_number
              value_format:
              view: shift_dim
              view_label: Analytics
              dynamic: false
              week_start_day: monday
              original_view: shift_dim
              dimension_group:
              error:
              field_group_variant: Day Number
              measure: false
              parameter: false
              primary_key: false
              project_name: cti-schedule-solver
              scope: shift_dim
              suggest_dimension: shift_dim.day_number
              suggest_explore: shift_staff_fact
              suggestable: false
              is_fiscal: false
              is_timeframe: false
              can_time_filter: false
              time_interval:
              lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_02_shift_dim.view.lkml?line=16"
              permanent:
              source_file: solver_views/v_02_shift_dim.view.lkml
              source_file_path: cti-schedule-solver/solver_views/v_02_shift_dim.view.lkml
              sql: "${TABLE}.day_number "
              sql_case:
              filters:
              times_used: 0
              sorted:
                desc: false
                sort_index: 0
            table_calculations: []
            pivots: []
          queryResponse:
            parent_id: 87bae94e9032ce219f4e38263a52241e
            sql_changed: true
            aggregate_table_used_info:
            added_params:
            data:
            - shift_dim.day_number:
                value: 28
              z_analytics.proficiency_mix_ratio_filled_required_beginner:
                value: 2.08
                rendered: 208.0%
                html: 208.0% (13/6.3)
              z_analytics.proficiency_mix_ratio_filled_required_advanced:
                value: 1.6
                rendered: 160.0%
                html: 160.0% (10/6.3)
              z_analytics.proficiency_mix_ratio_filled_required_score:
                value: 0.5
                rendered: 50.0%
            - shift_dim.day_number:
                value: 27
              z_analytics.proficiency_mix_ratio_filled_required_beginner:
                value: 1.9310344827586208
                rendered: 193.1%
                html: 193.1% (14/7.3)
              z_analytics.proficiency_mix_ratio_filled_required_advanced:
                value: 1.3793103448275863
                rendered: 137.9%
                html: 137.9% (10/7.3)
              z_analytics.proficiency_mix_ratio_filled_required_score:
                value: 0.5
                rendered: 50.0%
            - shift_dim.day_number:
                value: 26
              z_analytics.proficiency_mix_ratio_filled_required_beginner:
                value: 2
                rendered: 200.0%
                filterable_value: '2.0'
                html: 200.0% (14/7.0)
              z_analytics.proficiency_mix_ratio_filled_required_advanced:
                value: 1.4285714285714286
                rendered: 142.9%
                html: 142.9% (10/7.0)
              z_analytics.proficiency_mix_ratio_filled_required_score:
                value: 0.5
                rendered: 50.0%
            - shift_dim.day_number:
                value: 25
              z_analytics.proficiency_mix_ratio_filled_required_beginner:
                value: 2
                rendered: 200.0%
                filterable_value: '2.0'
                html: 200.0% (7/3.5)
              z_analytics.proficiency_mix_ratio_filled_required_advanced:
                value: 0.8571428571428571
                rendered: 85.7%
                html: 85.7% (3/3.5)
              z_analytics.proficiency_mix_ratio_filled_required_score:
                value: 0.42857142857142855
                rendered: 42.9%
            - shift_dim.day_number:
                value: 24
              z_analytics.proficiency_mix_ratio_filled_required_beginner:
                value: 2.6666666666666665
                rendered: 266.7%
                html: 266.7% (8/3.0)
              z_analytics.proficiency_mix_ratio_filled_required_advanced:
                value: 1
                rendered: 100.0%
                filterable_value: '1.0'
                html: 100.0% (3/3.0)
              z_analytics.proficiency_mix_ratio_filled_required_score:
                value: 0.5
                rendered: 50.0%
            - shift_dim.day_number:
                value: 23
              z_analytics.proficiency_mix_ratio_filled_required_beginner:
                value: 2
                rendered: 200.0%
                filterable_value: '2.0'
                html: 200.0% (6/3.0)
              z_analytics.proficiency_mix_ratio_filled_required_advanced:
                value: 1
                rendered: 100.0%
                filterable_value: '1.0'
                html: 100.0% (3/3.0)
              z_analytics.proficiency_mix_ratio_filled_required_score:
                value: 0.5
                rendered: 50.0%
            - shift_dim.day_number:
                value: 22
              z_analytics.proficiency_mix_ratio_filled_required_beginner:
                value: 2.769230769230769
                rendered: 276.9%
                html: 276.9% (9/3.3)
              z_analytics.proficiency_mix_ratio_filled_required_advanced:
                value: 0.9230769230769231
                rendered: 92.3%
                html: 92.3% (3/3.3)
              z_analytics.proficiency_mix_ratio_filled_required_score:
                value: 0.46153846153846156
                rendered: 46.2%
            - shift_dim.day_number:
                value: 21
              z_analytics.proficiency_mix_ratio_filled_required_beginner:
                value: 1.7391304347826086
                rendered: 173.9%
                html: 173.9% (10/5.8)
              z_analytics.proficiency_mix_ratio_filled_required_advanced:
                value: 1.565217391304348
                rendered: 156.5%
                html: 156.5% (9/5.8)
              z_analytics.proficiency_mix_ratio_filled_required_score:
                value: 0.5
                rendered: 50.0%
            - shift_dim.day_number:
                value: 20
              z_analytics.proficiency_mix_ratio_filled_required_beginner:
                value: 1.9259259259259258
                rendered: 192.6%
                html: 192.6% (13/6.8)
              z_analytics.proficiency_mix_ratio_filled_required_advanced:
                value: 1.3333333333333333
                rendered: 133.3%
                html: 133.3% (9/6.8)
              z_analytics.proficiency_mix_ratio_filled_required_score:
                value: 0.5
                rendered: 50.0%
            - shift_dim.day_number:
                value: 19
              z_analytics.proficiency_mix_ratio_filled_required_beginner:
                value: 1.8
                rendered: 180.0%
                html: 180.0% (9/5.0)
              z_analytics.proficiency_mix_ratio_filled_required_advanced:
                value: 1.6
                rendered: 160.0%
                html: 160.0% (8/5.0)
              z_analytics.proficiency_mix_ratio_filled_required_score:
                value: 0.5
                rendered: 50.0%
            - shift_dim.day_number:
                value: 18
              z_analytics.proficiency_mix_ratio_filled_required_beginner:
                value: 2.2222222222222223
                rendered: 222.2%
                html: 222.2% (10/4.5)
              z_analytics.proficiency_mix_ratio_filled_required_advanced:
                value: 0.8888888888888888
                rendered: 88.9%
                html: 88.9% (4/4.5)
              z_analytics.proficiency_mix_ratio_filled_required_score:
                value: 0.4444444444444444
                rendered: 44.4%
            - shift_dim.day_number:
                value: 17
              z_analytics.proficiency_mix_ratio_filled_required_beginner:
                value: 2.5454545454545454
                rendered: 254.5%
                html: 254.5% (14/5.5)
              z_analytics.proficiency_mix_ratio_filled_required_advanced:
                value: 1.0909090909090908
                rendered: 109.1%
                html: 109.1% (6/5.5)
              z_analytics.proficiency_mix_ratio_filled_required_score:
                value: 0.5
                rendered: 50.0%
            - shift_dim.day_number:
                value: 16
              z_analytics.proficiency_mix_ratio_filled_required_beginner:
                value: 2.4
                rendered: 240.0%
                html: 240.0% (12/5.0)
              z_analytics.proficiency_mix_ratio_filled_required_advanced:
                value: 1.4
                rendered: 140.0%
                html: 140.0% (7/5.0)
              z_analytics.proficiency_mix_ratio_filled_required_score:
                value: 0.5
                rendered: 50.0%
            - shift_dim.day_number:
                value: 15
              z_analytics.proficiency_mix_ratio_filled_required_beginner:
                value: 2.1333333333333333
                rendered: 213.3%
                html: 213.3% (8/3.8)
              z_analytics.proficiency_mix_ratio_filled_required_advanced:
                value: 1.6
                rendered: 160.0%
                html: 160.0% (6/3.8)
              z_analytics.proficiency_mix_ratio_filled_required_score:
                value: 0.5
                rendered: 50.0%
            - shift_dim.day_number:
                value: 14
              z_analytics.proficiency_mix_ratio_filled_required_beginner:
                value: 2.0869565217391304
                rendered: 208.7%
                html: 208.7% (12/5.8)
              z_analytics.proficiency_mix_ratio_filled_required_advanced:
                value: 1.391304347826087
                rendered: 139.1%
                html: 139.1% (8/5.8)
              z_analytics.proficiency_mix_ratio_filled_required_score:
                value: 0.5
                rendered: 50.0%
            - shift_dim.day_number:
                value: 13
              z_analytics.proficiency_mix_ratio_filled_required_beginner:
                value: 1.8181818181818181
                rendered: 181.8%
                html: 181.8% (10/5.5)
              z_analytics.proficiency_mix_ratio_filled_required_advanced:
                value: 1.4545454545454546
                rendered: 145.5%
                html: 145.5% (8/5.5)
              z_analytics.proficiency_mix_ratio_filled_required_score:
                value: 0.5
                rendered: 50.0%
            - shift_dim.day_number:
                value: 12
              z_analytics.proficiency_mix_ratio_filled_required_beginner:
                value: 2.24
                rendered: 224.0%
                html: 224.0% (14/6.3)
              z_analytics.proficiency_mix_ratio_filled_required_advanced:
                value: 1.44
                rendered: 144.0%
                html: 144.0% (9/6.3)
              z_analytics.proficiency_mix_ratio_filled_required_score:
                value: 0.5
                rendered: 50.0%
            - shift_dim.day_number:
                value: 11
              z_analytics.proficiency_mix_ratio_filled_required_beginner:
                value: 2.1538461538461537
                rendered: 215.4%
                html: 215.4% (7/3.3)
              z_analytics.proficiency_mix_ratio_filled_required_advanced:
                value: 1.2307692307692308
                rendered: 123.1%
                html: 123.1% (4/3.3)
              z_analytics.proficiency_mix_ratio_filled_required_score:
                value: 0.5
                rendered: 50.0%
            - shift_dim.day_number:
                value: 10
              z_analytics.proficiency_mix_ratio_filled_required_beginner:
                value: 2.933333333333333
                rendered: 293.3%
                html: 293.3% (11/3.8)
              z_analytics.proficiency_mix_ratio_filled_required_advanced:
                value: 0.26666666666666666
                rendered: 26.7%
                html: 26.7% (1/3.8)
              z_analytics.proficiency_mix_ratio_filled_required_score:
                value: 0.13333333333333333
                rendered: 13.3%
            - shift_dim.day_number:
                value: 9
              z_analytics.proficiency_mix_ratio_filled_required_beginner:
                value: 2
                rendered: 200.0%
                filterable_value: '2.0'
                html: 200.0% (12/6.0)
              z_analytics.proficiency_mix_ratio_filled_required_advanced:
                value: 1.3333333333333333
                rendered: 133.3%
                html: 133.3% (8/6.0)
              z_analytics.proficiency_mix_ratio_filled_required_score:
                value: 0.5
                rendered: 50.0%
            - shift_dim.day_number:
                value: 8
              z_analytics.proficiency_mix_ratio_filled_required_beginner:
                value: 2.4761904761904763
                rendered: 247.6%
                html: 247.6% (13/5.3)
              z_analytics.proficiency_mix_ratio_filled_required_advanced:
                value: 1.3333333333333333
                rendered: 133.3%
                html: 133.3% (7/5.3)
              z_analytics.proficiency_mix_ratio_filled_required_score:
                value: 0.5
                rendered: 50.0%
            - shift_dim.day_number:
                value: 7
              z_analytics.proficiency_mix_ratio_filled_required_beginner:
                value: 1.7777777777777777
                rendered: 177.8%
                html: 177.8% (4/2.3)
              z_analytics.proficiency_mix_ratio_filled_required_advanced:
                value: 1.3333333333333333
                rendered: 133.3%
                html: 133.3% (3/2.3)
              z_analytics.proficiency_mix_ratio_filled_required_score:
                value: 0.5
                rendered: 50.0%
            - shift_dim.day_number:
                value: 6
              z_analytics.proficiency_mix_ratio_filled_required_beginner:
                value: 1.75
                rendered: 175.0%
                html: 175.0% (7/4.0)
              z_analytics.proficiency_mix_ratio_filled_required_advanced:
                value: 1.5
                rendered: 150.0%
                html: 150.0% (6/4.0)
              z_analytics.proficiency_mix_ratio_filled_required_score:
                value: 0.5
                rendered: 50.0%
            - shift_dim.day_number:
                value: 5
              z_analytics.proficiency_mix_ratio_filled_required_beginner:
                value: 2.75
                rendered: 275.0%
                html: 275.0% (11/4.0)
              z_analytics.proficiency_mix_ratio_filled_required_advanced:
                value: 0.5
                rendered: 50.0%
                html: 50.0% (2/4.0)
              z_analytics.proficiency_mix_ratio_filled_required_score:
                value: 0.25
                rendered: 25.0%
            - shift_dim.day_number:
                value: 4
              z_analytics.proficiency_mix_ratio_filled_required_beginner:
                value: 2
                rendered: 200.0%
                filterable_value: '2.0'
                html: 200.0% (8/4.0)
              z_analytics.proficiency_mix_ratio_filled_required_advanced:
                value: 1.25
                rendered: 125.0%
                html: 125.0% (5/4.0)
              z_analytics.proficiency_mix_ratio_filled_required_score:
                value: 0.5
                rendered: 50.0%
            - shift_dim.day_number:
                value: 3
              z_analytics.proficiency_mix_ratio_filled_required_beginner:
                value: 2
                rendered: 200.0%
                filterable_value: '2.0'
                html: 200.0% (15/7.5)
              z_analytics.proficiency_mix_ratio_filled_required_advanced:
                value: 1.3333333333333333
                rendered: 133.3%
                html: 133.3% (10/7.5)
              z_analytics.proficiency_mix_ratio_filled_required_score:
                value: 0.5
                rendered: 50.0%
            - shift_dim.day_number:
                value: 2
              z_analytics.proficiency_mix_ratio_filled_required_beginner:
                value: 2.2857142857142856
                rendered: 228.6%
                html: 228.6% (16/7.0)
              z_analytics.proficiency_mix_ratio_filled_required_advanced:
                value: 1.4285714285714286
                rendered: 142.9%
                html: 142.9% (10/7.0)
              z_analytics.proficiency_mix_ratio_filled_required_score:
                value: 0.5
                rendered: 50.0%
            - shift_dim.day_number:
                value: 1
              z_analytics.proficiency_mix_ratio_filled_required_beginner:
                value: 1.9310344827586208
                rendered: 193.1%
                html: 193.1% (14/7.3)
              z_analytics.proficiency_mix_ratio_filled_required_advanced:
                value: 1.5172413793103448
                rendered: 151.7%
                html: 151.7% (11/7.3)
              z_analytics.proficiency_mix_ratio_filled_required_score:
                value: 0.5
                rendered: 50.0%
            drill_menu_build_time: 0.03289
            expired: false
            fields:
              measures:
              - align: right
                can_filter: true
                category: measure
                default_filter_value:
                description: ''
                enumerations:
                field_group_label: 2 Proficiency Mix (Beginner)
                fill_style:
                fiscal_month_offset: 0
                has_allowed_values: false
                hidden: false
                is_filter: false
                is_numeric: true
                label: Analytics C Proficiency Mix % (Beginner)
                label_from_parameter:
                label_short: C Proficiency Mix % (Beginner)
                map_layer:
                name: z_analytics.proficiency_mix_ratio_filled_required_beginner
                strict_value_format: false
                requires_refresh_on_sort: false
                sortable: true
                suggestions:
                tags: []
                type: number
                user_attribute_filter_types:
                - number
                - advanced_filter_number
                value_format: "#,##0.0%"
                view: z_analytics
                view_label: Analytics
                dynamic: false
                week_start_day: monday
                original_view: z_analytics
                dimension_group:
                error:
                field_group_variant: C Proficiency Mix % (Beginner)
                measure: true
                parameter: false
                primary_key: false
                project_name: cti-schedule-solver
                scope: z_analytics
                suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_beginner
                suggest_explore: shift_staff_fact
                suggestable: false
                is_fiscal: false
                is_timeframe: false
                can_time_filter: false
                time_interval:
                lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=161"
                permanent:
                source_file: solver_views/v_00_analytics.view.lkml
                source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
                sql: "${sum_proficiency_mix_filled_beginner} / nullif(${sum_proficiency_mix_required_beginner},0) "
                sql_case:
                filters:
                times_used: 0
              - align: right
                can_filter: true
                category: measure
                default_filter_value:
                description: ''
                enumerations:
                field_group_label: 2 Proficiency Mix (Advanced)
                fill_style:
                fiscal_month_offset: 0
                has_allowed_values: false
                hidden: false
                is_filter: false
                is_numeric: true
                label: Analytics C Proficiency Mix % (Advanced)
                label_from_parameter:
                label_short: C Proficiency Mix % (Advanced)
                map_layer:
                name: z_analytics.proficiency_mix_ratio_filled_required_advanced
                strict_value_format: false
                requires_refresh_on_sort: false
                sortable: true
                suggestions:
                tags: []
                type: number
                user_attribute_filter_types:
                - number
                - advanced_filter_number
                value_format: "#,##0.0%"
                view: z_analytics
                view_label: Analytics
                dynamic: false
                week_start_day: monday
                original_view: z_analytics
                dimension_group:
                error:
                field_group_variant: C Proficiency Mix % (Advanced)
                measure: true
                parameter: false
                primary_key: false
                project_name: cti-schedule-solver
                scope: z_analytics
                suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_advanced
                suggest_explore: shift_staff_fact
                suggestable: false
                is_fiscal: false
                is_timeframe: false
                can_time_filter: false
                time_interval:
                lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=109"
                permanent:
                source_file: solver_views/v_00_analytics.view.lkml
                source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
                sql: "${sum_proficiency_mix_filled_advanced} / nullif(${sum_proficiency_mix_required_advanced},0) "
                sql_case:
                filters:
                times_used: 0
              - align: right
                can_filter: true
                category: measure
                default_filter_value:
                description: ''
                enumerations:
                field_group_label: 0 Overall Score
                fill_style:
                fiscal_month_offset: 0
                has_allowed_values: false
                hidden: false
                is_filter: false
                is_numeric: true
                label: Analytics 2 Proficiency Mix Score
                label_from_parameter:
                label_short: 2 Proficiency Mix Score
                map_layer:
                name: z_analytics.proficiency_mix_ratio_filled_required_score
                strict_value_format: false
                requires_refresh_on_sort: false
                sortable: true
                suggestions:
                tags: []
                type: number
                user_attribute_filter_types:
                - number
                - advanced_filter_number
                value_format: "#,##0.0%"
                view: z_analytics
                view_label: Analytics
                dynamic: false
                week_start_day: monday
                original_view: z_analytics
                dimension_group:
                error:
                field_group_variant: 2 Proficiency Mix Score
                measure: true
                parameter: false
                primary_key: false
                project_name: cti-schedule-solver
                scope: z_analytics
                suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_score
                suggest_explore: shift_staff_fact
                suggestable: false
                is_fiscal: false
                is_timeframe: false
                can_time_filter: false
                time_interval:
                lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=186"
                permanent:
                source_file: solver_views/v_00_analytics.view.lkml
                source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
                sql: "(\n        -- This is the score for advanced -- not the arrow\
                  \ b/c we don't mind too many\n        case\n          when ${sum_proficiency_mix_filled_advanced}\
                  \ > ${sum_proficiency_mix_required_advanced} then 1\n          else\
                  \ ${sum_proficiency_mix_filled_advanced} / nullif(${sum_proficiency_mix_required_advanced},0)\n\
                  \        end\n        +\n        -- This is the score for beginner\
                  \ -- not the arrow b/c we don't mind too few\n        case\n   \
                  \       when ${sum_proficiency_mix_filled_beginner} <= ${sum_proficiency_mix_required_beginner}\
                  \ then 1\n          else 0\n        end\n      )\n      -- Then\
                  \ take a straight average\n        / 2\n      "
                sql_case:
                filters:
                times_used: 0
              dimensions:
              - align: right
                can_filter: true
                category: dimension
                default_filter_value:
                description: ''
                enumerations:
                field_group_label: Shift
                fill_style:
                fiscal_month_offset: 0
                has_allowed_values: false
                hidden: false
                is_filter: false
                is_numeric: true
                label: Analytics Day Number
                label_from_parameter:
                label_short: Day Number
                map_layer:
                name: shift_dim.day_number
                strict_value_format: false
                requires_refresh_on_sort: false
                sortable: true
                suggestions:
                tags: []
                type: number
                user_attribute_filter_types:
                - number
                - advanced_filter_number
                value_format:
                view: shift_dim
                view_label: Analytics
                dynamic: false
                week_start_day: monday
                original_view: shift_dim
                dimension_group:
                error:
                field_group_variant: Day Number
                measure: false
                parameter: false
                primary_key: false
                project_name: cti-schedule-solver
                scope: shift_dim
                suggest_dimension: shift_dim.day_number
                suggest_explore: shift_staff_fact
                suggestable: false
                is_fiscal: false
                is_timeframe: false
                can_time_filter: false
                time_interval:
                lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_02_shift_dim.view.lkml?line=16"
                permanent:
                source_file: solver_views/v_02_shift_dim.view.lkml
                source_file_path: cti-schedule-solver/solver_views/v_02_shift_dim.view.lkml
                sql: "${TABLE}.day_number "
                sql_case:
                filters:
                times_used: 0
                sorted:
                  desc: true
                  sort_index: 0
              table_calculations: []
              pivots: []
              measure_like:
              - align: right
                can_filter: true
                category: measure
                default_filter_value:
                description: ''
                enumerations:
                field_group_label: 2 Proficiency Mix (Beginner)
                fill_style:
                fiscal_month_offset: 0
                has_allowed_values: false
                hidden: false
                is_filter: false
                is_numeric: true
                label: Analytics C Proficiency Mix % (Beginner)
                label_from_parameter:
                label_short: C Proficiency Mix % (Beginner)
                map_layer:
                name: z_analytics.proficiency_mix_ratio_filled_required_beginner
                strict_value_format: false
                requires_refresh_on_sort: false
                sortable: true
                suggestions:
                tags: []
                type: number
                user_attribute_filter_types:
                - number
                - advanced_filter_number
                value_format: "#,##0.0%"
                view: z_analytics
                view_label: Analytics
                dynamic: false
                week_start_day: monday
                original_view: z_analytics
                dimension_group:
                error:
                field_group_variant: C Proficiency Mix % (Beginner)
                measure: true
                parameter: false
                primary_key: false
                project_name: cti-schedule-solver
                scope: z_analytics
                suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_beginner
                suggest_explore: shift_staff_fact
                suggestable: false
                is_fiscal: false
                is_timeframe: false
                can_time_filter: false
                time_interval:
                lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=161"
                permanent:
                source_file: solver_views/v_00_analytics.view.lkml
                source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
                sql: "${sum_proficiency_mix_filled_beginner} / nullif(${sum_proficiency_mix_required_beginner},0) "
                sql_case:
                filters:
                times_used: 0
              - align: right
                can_filter: true
                category: measure
                default_filter_value:
                description: ''
                enumerations:
                field_group_label: 2 Proficiency Mix (Advanced)
                fill_style:
                fiscal_month_offset: 0
                has_allowed_values: false
                hidden: false
                is_filter: false
                is_numeric: true
                label: Analytics C Proficiency Mix % (Advanced)
                label_from_parameter:
                label_short: C Proficiency Mix % (Advanced)
                map_layer:
                name: z_analytics.proficiency_mix_ratio_filled_required_advanced
                strict_value_format: false
                requires_refresh_on_sort: false
                sortable: true
                suggestions:
                tags: []
                type: number
                user_attribute_filter_types:
                - number
                - advanced_filter_number
                value_format: "#,##0.0%"
                view: z_analytics
                view_label: Analytics
                dynamic: false
                week_start_day: monday
                original_view: z_analytics
                dimension_group:
                error:
                field_group_variant: C Proficiency Mix % (Advanced)
                measure: true
                parameter: false
                primary_key: false
                project_name: cti-schedule-solver
                scope: z_analytics
                suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_advanced
                suggest_explore: shift_staff_fact
                suggestable: false
                is_fiscal: false
                is_timeframe: false
                can_time_filter: false
                time_interval:
                lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=109"
                permanent:
                source_file: solver_views/v_00_analytics.view.lkml
                source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
                sql: "${sum_proficiency_mix_filled_advanced} / nullif(${sum_proficiency_mix_required_advanced},0) "
                sql_case:
                filters:
                times_used: 0
              - align: right
                can_filter: true
                category: measure
                default_filter_value:
                description: ''
                enumerations:
                field_group_label: 0 Overall Score
                fill_style:
                fiscal_month_offset: 0
                has_allowed_values: false
                hidden: false
                is_filter: false
                is_numeric: true
                label: Analytics 2 Proficiency Mix Score
                label_from_parameter:
                label_short: 2 Proficiency Mix Score
                map_layer:
                name: z_analytics.proficiency_mix_ratio_filled_required_score
                strict_value_format: false
                requires_refresh_on_sort: false
                sortable: true
                suggestions:
                tags: []
                type: number
                user_attribute_filter_types:
                - number
                - advanced_filter_number
                value_format: "#,##0.0%"
                view: z_analytics
                view_label: Analytics
                dynamic: false
                week_start_day: monday
                original_view: z_analytics
                dimension_group:
                error:
                field_group_variant: 2 Proficiency Mix Score
                measure: true
                parameter: false
                primary_key: false
                project_name: cti-schedule-solver
                scope: z_analytics
                suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_score
                suggest_explore: shift_staff_fact
                suggestable: false
                is_fiscal: false
                is_timeframe: false
                can_time_filter: false
                time_interval:
                lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=186"
                permanent:
                source_file: solver_views/v_00_analytics.view.lkml
                source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
                sql: "(\n        -- This is the score for advanced -- not the arrow\
                  \ b/c we don't mind too many\n        case\n          when ${sum_proficiency_mix_filled_advanced}\
                  \ > ${sum_proficiency_mix_required_advanced} then 1\n          else\
                  \ ${sum_proficiency_mix_filled_advanced} / nullif(${sum_proficiency_mix_required_advanced},0)\n\
                  \        end\n        +\n        -- This is the score for beginner\
                  \ -- not the arrow b/c we don't mind too few\n        case\n   \
                  \       when ${sum_proficiency_mix_filled_beginner} <= ${sum_proficiency_mix_required_beginner}\
                  \ then 1\n          else 0\n        end\n      )\n      -- Then\
                  \ take a straight average\n        / 2\n      "
                sql_case:
                filters:
                times_used: 0
              dimension_like:
              - align: right
                can_filter: true
                category: dimension
                default_filter_value:
                description: ''
                enumerations:
                field_group_label: Shift
                fill_style:
                fiscal_month_offset: 0
                has_allowed_values: false
                hidden: false
                is_filter: false
                is_numeric: true
                label: Analytics Day Number
                label_from_parameter:
                label_short: Day Number
                map_layer:
                name: shift_dim.day_number
                strict_value_format: false
                requires_refresh_on_sort: false
                sortable: true
                suggestions:
                tags: []
                type: number
                user_attribute_filter_types:
                - number
                - advanced_filter_number
                value_format:
                view: shift_dim
                view_label: Analytics
                dynamic: false
                week_start_day: monday
                original_view: shift_dim
                dimension_group:
                error:
                field_group_variant: Day Number
                measure: false
                parameter: false
                primary_key: false
                project_name: cti-schedule-solver
                scope: shift_dim
                suggest_dimension: shift_dim.day_number
                suggest_explore: shift_staff_fact
                suggestable: false
                is_fiscal: false
                is_timeframe: false
                can_time_filter: false
                time_interval:
                lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_02_shift_dim.view.lkml?line=16"
                permanent:
                source_file: solver_views/v_02_shift_dim.view.lkml
                source_file_path: cti-schedule-solver/solver_views/v_02_shift_dim.view.lkml
                sql: "${TABLE}.day_number "
                sql_case:
                filters:
                times_used: 0
                sorted:
                  desc: true
                  sort_index: 0
            fill_fields: []
            forecast_result:
            has_row_totals: false
            has_totals: false
            id: query-result-80:{}
            null_sort_treatment: low
            number_format: '1,234.56'
            ran_at: '2022-05-12T15:40:27+00:00'
            runtime: '1.504'
            sql: |-
              SELECT
                  shift_dim.day_number  AS shift_dim_day_number,
                  COUNT(DISTINCT CASE WHEN staff_competency_dim.overall_proficiency = 'Beginner' and shift_staff_fact.is_scheduled  THEN ( shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  )  ELSE NULL END) AS z_analytics_sum_proficiency_mix_filled_beginner,
                      COUNT(DISTINCT CASE WHEN shift_staff_fact.is_scheduled  THEN shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  ELSE NULL END) * 0.25 AS z_analytics_sum_proficiency_mix_required_beginner,
                      COUNT(DISTINCT CASE WHEN staff_competency_dim.overall_proficiency = 'Beginner' and shift_staff_fact.is_scheduled  THEN ( shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  )  ELSE NULL END) / nullif(COUNT(DISTINCT CASE WHEN shift_staff_fact.is_scheduled  THEN shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  ELSE NULL END) * 0.25, 0) AS z_analytics_proficiency_mix_ratio_filled_required_beginner,
                  COUNT(DISTINCT CASE WHEN staff_competency_dim.overall_proficiency = 'Advanced' and shift_staff_fact.is_scheduled  THEN ( shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  )  ELSE NULL END) AS z_analytics_sum_proficiency_mix_filled_advanced,
                      COUNT(DISTINCT CASE WHEN shift_staff_fact.is_scheduled  THEN shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  ELSE NULL END) * 0.25 AS z_analytics_sum_proficiency_mix_required_advanced,
                      COUNT(DISTINCT CASE WHEN staff_competency_dim.overall_proficiency = 'Advanced' and shift_staff_fact.is_scheduled  THEN ( shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  )  ELSE NULL END) / nullif(COUNT(DISTINCT CASE WHEN shift_staff_fact.is_scheduled  THEN shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  ELSE NULL END) * 0.25, 0) AS z_analytics_proficiency_mix_ratio_filled_required_advanced,
                          (CASE WHEN COUNT(DISTINCT CASE WHEN staff_competency_dim.overall_proficiency = 'Advanced' and shift_staff_fact.is_scheduled  THEN ( shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  )  ELSE NULL END) > COUNT(DISTINCT CASE WHEN shift_staff_fact.is_scheduled  THEN shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  ELSE NULL END) * 0.25 THEN 1 ELSE COUNT(DISTINCT CASE WHEN staff_competency_dim.overall_proficiency = 'Advanced' and shift_staff_fact.is_scheduled  THEN ( shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  )  ELSE NULL END) / nullif(COUNT(DISTINCT CASE WHEN shift_staff_fact.is_scheduled  THEN shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  ELSE NULL END) * 0.25, 0) END + CASE WHEN COUNT(DISTINCT CASE WHEN staff_competency_dim.overall_proficiency = 'Beginner' and shift_staff_fact.is_scheduled  THEN ( shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  )  ELSE NULL END) <= COUNT(DISTINCT CASE WHEN shift_staff_fact.is_scheduled  THEN shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  ELSE NULL END) * 0.25 THEN 1 ELSE 0 END) / 2 AS z_analytics_proficiency_mix_ratio_filled_required_score
              FROM optimizer.analytics_table_01_shift_staff_fact
                   AS shift_staff_fact
              LEFT JOIN optimizer.analytics_table_02_shift_dim
                   AS shift_dim ON shift_staff_fact.run_name_id = shift_dim.run_name_id
                    AND shift_staff_fact.shift_id = shift_dim.shift_id

              LEFT JOIN optimizer.analytics_table_05_staff_dim
                   AS staff_dim ON shift_staff_fact.run_name_id = staff_dim.run_name_id
                  AND shift_staff_fact.staff_id = staff_dim.staff_id

              LEFT JOIN optimizer.analytics_table_07_staff_competency_dim
                   AS staff_competency_dim ON staff_dim.run_name_id = staff_competency_dim.run_name_id
                  AND staff_dim.staff_id = staff_competency_dim.staff_id

              LEFT JOIN (SELECT 'x' as x)  AS z_analytics ON 1 = 1
              WHERE (shift_staff_fact.run_name_id ) = '9'
              GROUP BY
                  1
              ORDER BY
                  4 DESC
              LIMIT 500
            sql_explain:
            supports_pivot_in_db: true
            timezone: America/Chicago
            is_local: true
            table_calcs_complete: true
            tracked_attributes:
              result.drill_menu_build_time: 0.03289
              result.from_cache: true
              result.runtime: '1.504'
              result.sql.length: 4381
              result.supports_pivot_in_db: true
            sorts:
            - name: shift_dim.day_number
              desc: true
          config:
            show_view_names: false
            show_row_numbers: true
            transpose: true
            truncate_text: true
            hide_totals: false
            hide_row_totals: false
            size_to_fit: true
            table_theme: white
            limit_displayed_rows: false
            enable_conditional_formatting: true
            header_text_alignment: left
            header_font_size: '12'
            rows_font_size: '12'
            conditional_formatting_include_totals: false
            conditional_formatting_include_nulls: false
            show_sql_query_menu_options: false
            column_order: {}
            show_totals: true
            show_row_totals: true
            truncate_header: false
            series_labels:
              z_analytics.proficiency_mix_ratio_filled_required_beginner: "% of Beginners\
                \ Scheduled"
              z_analytics.proficiency_mix_ratio_filled_required_advanced: "% of Advanced\
                \ Scheduled"
              z_analytics.proficiency_mix_ratio_filled_required_score: Overall Score
            series_column_widths:
              shift_dim.day_number: 104
              z_analytics.proficiency_mix_ratio_filled_required_beginner: 191
              z_analytics.proficiency_mix_ratio_filled_required_advanced: 164
              z_analytics.proficiency_mix_ratio_filled_required_score: 93
            series_cell_visualizations:
              z_analytics.proficiency_mix_ratio_filled_required_beginner:
                is_active: false
            conditional_formatting:
            - type: along a scale...
              value:
              background_color: "#1A73E8"
              font_color:
              color_application:
                collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
                custom:
                  id: 9d37feff-c18e-3683-158f-529295caca83
                  label: Custom
                  type: continuous
                  stops:
                  - color: green
                    offset: 0
                  - color: red
                    offset: 100
                options:
                  steps: 5
                  constraints:
                    min:
                      type: number
                      value: 0.5
                    mid:
                      type: number
                      value: 1
                    max:
                      type: number
                      value: 1.25
              bold: false
              italic: false
              strikethrough: false
              fields:
              - z_analytics.proficiency_mix_ratio_filled_required_beginner
            - type: along a scale...
              value:
              background_color: "#1A73E8"
              font_color:
              color_application:
                collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
                custom:
                  id: 70fd814a-a067-2070-99ae-d6928930ab61
                  label: Custom
                  type: continuous
                  stops:
                  - color: red
                    offset: 0
                  - color: green
                    offset: 100
                options:
                  steps: 5
                  constraints:
                    min:
                      type: number
                      value: 0.75
                    mid:
                      type: number
                      value: 1
                    max:
                      type: number
                      value: 1.1
              bold: false
              italic: false
              strikethrough: false
              fields:
              - z_analytics.proficiency_mix_ratio_filled_required_advanced
            - type: along a scale...
              value:
              background_color: "#1A73E8"
              font_color:
              color_application:
                collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
                custom:
                  id: 655732e7-cb5d-30af-ff27-50a273b2848f
                  label: Custom
                  type: continuous
                  stops:
                  - color: red
                    offset: 0
                  - color: green
                    offset: 100
                options:
                  steps: 5
                  constraints:
                    min:
                      type: number
                      value: 0.5
                    mid:
                      type: number
                      value: 1
                    max:
                      type: number
                      value: 1.1
              bold: false
              italic: false
              strikethrough: false
              fields:
              - z_analytics.proficiency_mix_ratio_filled_required_score
            type: looker_grid
            x_axis_gridlines: false
            y_axis_gridlines: true
            show_y_axis_labels: true
            show_y_axis_ticks: true
            y_axis_tick_density: default
            y_axis_tick_density_custom: 5
            show_x_axis_label: true
            show_x_axis_ticks: true
            y_axis_scale_mode: linear
            x_axis_reversed: false
            y_axis_reversed: false
            plot_size_by_field: false
            trellis: ''
            stacking: ''
            legend_position: center
            point_style: none
            show_value_labels: false
            label_density: 25
            x_axis_scale: auto
            y_axis_combined: true
            show_null_points: true
            interpolation: linear
            defaults_version: 1
            series_types: {}
            query_fields:
              measures:
              - align: right
                can_filter: true
                category: measure
                default_filter_value:
                description: ''
                enumerations:
                field_group_label: 2 Proficiency Mix (Beginner)
                fill_style:
                fiscal_month_offset: 0
                has_allowed_values: false
                hidden: false
                is_filter: false
                is_numeric: true
                label: Analytics C Proficiency Mix % (Beginner)
                label_from_parameter:
                label_short: C Proficiency Mix % (Beginner)
                map_layer:
                name: z_analytics.proficiency_mix_ratio_filled_required_beginner
                strict_value_format: false
                requires_refresh_on_sort: false
                sortable: true
                suggestions:
                tags: []
                type: number
                user_attribute_filter_types:
                - number
                - advanced_filter_number
                value_format: "#,##0.0%"
                view: z_analytics
                view_label: Analytics
                dynamic: false
                week_start_day: monday
                original_view: z_analytics
                dimension_group:
                error:
                field_group_variant: C Proficiency Mix % (Beginner)
                measure: true
                parameter: false
                primary_key: false
                project_name: cti-schedule-solver
                scope: z_analytics
                suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_beginner
                suggest_explore: shift_staff_fact
                suggestable: false
                is_fiscal: false
                is_timeframe: false
                can_time_filter: false
                time_interval:
                lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=161"
                permanent:
                source_file: solver_views/v_00_analytics.view.lkml
                source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
                sql: "${sum_proficiency_mix_filled_beginner} / nullif(${sum_proficiency_mix_required_beginner},0) "
                sql_case:
                filters:
                times_used: 0
              - align: right
                can_filter: true
                category: measure
                default_filter_value:
                description: ''
                enumerations:
                field_group_label: 2 Proficiency Mix (Advanced)
                fill_style:
                fiscal_month_offset: 0
                has_allowed_values: false
                hidden: false
                is_filter: false
                is_numeric: true
                label: Analytics C Proficiency Mix % (Advanced)
                label_from_parameter:
                label_short: C Proficiency Mix % (Advanced)
                map_layer:
                name: z_analytics.proficiency_mix_ratio_filled_required_advanced
                strict_value_format: false
                requires_refresh_on_sort: false
                sortable: true
                suggestions:
                tags: []
                type: number
                user_attribute_filter_types:
                - number
                - advanced_filter_number
                value_format: "#,##0.0%"
                view: z_analytics
                view_label: Analytics
                dynamic: false
                week_start_day: monday
                original_view: z_analytics
                dimension_group:
                error:
                field_group_variant: C Proficiency Mix % (Advanced)
                measure: true
                parameter: false
                primary_key: false
                project_name: cti-schedule-solver
                scope: z_analytics
                suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_advanced
                suggest_explore: shift_staff_fact
                suggestable: false
                is_fiscal: false
                is_timeframe: false
                can_time_filter: false
                time_interval:
                lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=109"
                permanent:
                source_file: solver_views/v_00_analytics.view.lkml
                source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
                sql: "${sum_proficiency_mix_filled_advanced} / nullif(${sum_proficiency_mix_required_advanced},0) "
                sql_case:
                filters:
                times_used: 0
              - align: right
                can_filter: true
                category: measure
                default_filter_value:
                description: ''
                enumerations:
                field_group_label: 0 Overall Score
                fill_style:
                fiscal_month_offset: 0
                has_allowed_values: false
                hidden: false
                is_filter: false
                is_numeric: true
                label: Analytics 2 Proficiency Mix Score
                label_from_parameter:
                label_short: 2 Proficiency Mix Score
                map_layer:
                name: z_analytics.proficiency_mix_ratio_filled_required_score
                strict_value_format: false
                requires_refresh_on_sort: false
                sortable: true
                suggestions:
                tags: []
                type: number
                user_attribute_filter_types:
                - number
                - advanced_filter_number
                value_format: "#,##0.0%"
                view: z_analytics
                view_label: Analytics
                dynamic: false
                week_start_day: monday
                original_view: z_analytics
                dimension_group:
                error:
                field_group_variant: 2 Proficiency Mix Score
                measure: true
                parameter: false
                primary_key: false
                project_name: cti-schedule-solver
                scope: z_analytics
                suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_score
                suggest_explore: shift_staff_fact
                suggestable: false
                is_fiscal: false
                is_timeframe: false
                can_time_filter: false
                time_interval:
                lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=186"
                permanent:
                source_file: solver_views/v_00_analytics.view.lkml
                source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
                sql: "(\n        -- This is the score for advanced -- not the arrow\
                  \ b/c we don't mind too many\n        case\n          when ${sum_proficiency_mix_filled_advanced}\
                  \ > ${sum_proficiency_mix_required_advanced} then 1\n          else\
                  \ ${sum_proficiency_mix_filled_advanced} / nullif(${sum_proficiency_mix_required_advanced},0)\n\
                  \        end\n        +\n        -- This is the score for beginner\
                  \ -- not the arrow b/c we don't mind too few\n        case\n   \
                  \       when ${sum_proficiency_mix_filled_beginner} <= ${sum_proficiency_mix_required_beginner}\
                  \ then 1\n          else 0\n        end\n      )\n      -- Then\
                  \ take a straight average\n        / 2\n      "
                sql_case:
                filters:
                times_used: 0
              dimensions:
              - align: right
                can_filter: true
                category: dimension
                default_filter_value:
                description: ''
                enumerations:
                field_group_label: Shift
                fill_style:
                fiscal_month_offset: 0
                has_allowed_values: false
                hidden: false
                is_filter: false
                is_numeric: true
                label: Analytics Day Number
                label_from_parameter:
                label_short: Day Number
                map_layer:
                name: shift_dim.day_number
                strict_value_format: false
                requires_refresh_on_sort: false
                sortable: true
                suggestions:
                tags: []
                type: number
                user_attribute_filter_types:
                - number
                - advanced_filter_number
                value_format:
                view: shift_dim
                view_label: Analytics
                dynamic: false
                week_start_day: monday
                original_view: shift_dim
                dimension_group:
                error:
                field_group_variant: Day Number
                measure: false
                parameter: false
                primary_key: false
                project_name: cti-schedule-solver
                scope: shift_dim
                suggest_dimension: shift_dim.day_number
                suggest_explore: shift_staff_fact
                suggestable: false
                is_fiscal: false
                is_timeframe: false
                can_time_filter: false
                time_interval:
                lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_02_shift_dim.view.lkml?line=16"
                permanent:
                source_file: solver_views/v_02_shift_dim.view.lkml
                source_file_path: cti-schedule-solver/solver_views/v_02_shift_dim.view.lkml
                sql: "${TABLE}.day_number "
                sql_case:
                filters:
                times_used: 0
                sorted:
                  desc: true
                  sort_index: 0
              table_calculations: []
              pivots: []
            queryResponse:
              parent_id: 87bae94e9032ce219f4e38263a52241e
              sql_changed: true
              aggregate_table_used_info:
              added_params:
              data:
              - shift_dim.day_number:
                  value: 10
                z_analytics.proficiency_mix_ratio_filled_required_beginner:
                  value: 2.933333333333333
                  rendered: 293.3%
                  html: 293.3% (11/3.8)
                z_analytics.proficiency_mix_ratio_filled_required_advanced:
                  value: 0.26666666666666666
                  rendered: 26.7%
                  html: 26.7% (1/3.8)
                z_analytics.proficiency_mix_ratio_filled_required_score:
                  value: 0.13333333333333333
                  rendered: 13.3%
              - shift_dim.day_number:
                  value: 22
                z_analytics.proficiency_mix_ratio_filled_required_beginner:
                  value: 2.769230769230769
                  rendered: 276.9%
                  html: 276.9% (9/3.3)
                z_analytics.proficiency_mix_ratio_filled_required_advanced:
                  value: 0.9230769230769231
                  rendered: 92.3%
                  html: 92.3% (3/3.3)
                z_analytics.proficiency_mix_ratio_filled_required_score:
                  value: 0.46153846153846156
                  rendered: 46.2%
              - shift_dim.day_number:
                  value: 5
                z_analytics.proficiency_mix_ratio_filled_required_beginner:
                  value: 2.75
                  rendered: 275.0%
                  html: 275.0% (11/4.0)
                z_analytics.proficiency_mix_ratio_filled_required_advanced:
                  value: 0.5
                  rendered: 50.0%
                  html: 50.0% (2/4.0)
                z_analytics.proficiency_mix_ratio_filled_required_score:
                  value: 0.25
                  rendered: 25.0%
              - shift_dim.day_number:
                  value: 24
                z_analytics.proficiency_mix_ratio_filled_required_beginner:
                  value: 2.6666666666666665
                  rendered: 266.7%
                  html: 266.7% (8/3.0)
                z_analytics.proficiency_mix_ratio_filled_required_advanced:
                  value: 1
                  rendered: 100.0%
                  filterable_value: '1.0'
                  html: 100.0% (3/3.0)
                z_analytics.proficiency_mix_ratio_filled_required_score:
                  value: 0.5
                  rendered: 50.0%
              - shift_dim.day_number:
                  value: 17
                z_analytics.proficiency_mix_ratio_filled_required_beginner:
                  value: 2.5454545454545454
                  rendered: 254.5%
                  html: 254.5% (14/5.5)
                z_analytics.proficiency_mix_ratio_filled_required_advanced:
                  value: 1.0909090909090908
                  rendered: 109.1%
                  html: 109.1% (6/5.5)
                z_analytics.proficiency_mix_ratio_filled_required_score:
                  value: 0.5
                  rendered: 50.0%
              - shift_dim.day_number:
                  value: 8
                z_analytics.proficiency_mix_ratio_filled_required_beginner:
                  value: 2.4761904761904763
                  rendered: 247.6%
                  html: 247.6% (13/5.3)
                z_analytics.proficiency_mix_ratio_filled_required_advanced:
                  value: 1.3333333333333333
                  rendered: 133.3%
                  html: 133.3% (7/5.3)
                z_analytics.proficiency_mix_ratio_filled_required_score:
                  value: 0.5
                  rendered: 50.0%
              - shift_dim.day_number:
                  value: 16
                z_analytics.proficiency_mix_ratio_filled_required_beginner:
                  value: 2.4
                  rendered: 240.0%
                  html: 240.0% (12/5.0)
                z_analytics.proficiency_mix_ratio_filled_required_advanced:
                  value: 1.4
                  rendered: 140.0%
                  html: 140.0% (7/5.0)
                z_analytics.proficiency_mix_ratio_filled_required_score:
                  value: 0.5
                  rendered: 50.0%
              - shift_dim.day_number:
                  value: 2
                z_analytics.proficiency_mix_ratio_filled_required_beginner:
                  value: 2.2857142857142856
                  rendered: 228.6%
                  html: 228.6% (16/7.0)
                z_analytics.proficiency_mix_ratio_filled_required_advanced:
                  value: 1.4285714285714286
                  rendered: 142.9%
                  html: 142.9% (10/7.0)
                z_analytics.proficiency_mix_ratio_filled_required_score:
                  value: 0.5
                  rendered: 50.0%
              - shift_dim.day_number:
                  value: 12
                z_analytics.proficiency_mix_ratio_filled_required_beginner:
                  value: 2.24
                  rendered: 224.0%
                  html: 224.0% (14/6.3)
                z_analytics.proficiency_mix_ratio_filled_required_advanced:
                  value: 1.44
                  rendered: 144.0%
                  html: 144.0% (9/6.3)
                z_analytics.proficiency_mix_ratio_filled_required_score:
                  value: 0.5
                  rendered: 50.0%
              - shift_dim.day_number:
                  value: 18
                z_analytics.proficiency_mix_ratio_filled_required_beginner:
                  value: 2.2222222222222223
                  rendered: 222.2%
                  html: 222.2% (10/4.5)
                z_analytics.proficiency_mix_ratio_filled_required_advanced:
                  value: 0.8888888888888888
                  rendered: 88.9%
                  html: 88.9% (4/4.5)
                z_analytics.proficiency_mix_ratio_filled_required_score:
                  value: 0.4444444444444444
                  rendered: 44.4%
              - shift_dim.day_number:
                  value: 11
                z_analytics.proficiency_mix_ratio_filled_required_beginner:
                  value: 2.1538461538461537
                  rendered: 215.4%
                  html: 215.4% (7/3.3)
                z_analytics.proficiency_mix_ratio_filled_required_advanced:
                  value: 1.2307692307692308
                  rendered: 123.1%
                  html: 123.1% (4/3.3)
                z_analytics.proficiency_mix_ratio_filled_required_score:
                  value: 0.5
                  rendered: 50.0%
              - shift_dim.day_number:
                  value: 15
                z_analytics.proficiency_mix_ratio_filled_required_beginner:
                  value: 2.1333333333333333
                  rendered: 213.3%
                  html: 213.3% (8/3.8)
                z_analytics.proficiency_mix_ratio_filled_required_advanced:
                  value: 1.6
                  rendered: 160.0%
                  html: 160.0% (6/3.8)
                z_analytics.proficiency_mix_ratio_filled_required_score:
                  value: 0.5
                  rendered: 50.0%
              - shift_dim.day_number:
                  value: 14
                z_analytics.proficiency_mix_ratio_filled_required_beginner:
                  value: 2.0869565217391304
                  rendered: 208.7%
                  html: 208.7% (12/5.8)
                z_analytics.proficiency_mix_ratio_filled_required_advanced:
                  value: 1.391304347826087
                  rendered: 139.1%
                  html: 139.1% (8/5.8)
                z_analytics.proficiency_mix_ratio_filled_required_score:
                  value: 0.5
                  rendered: 50.0%
              - shift_dim.day_number:
                  value: 28
                z_analytics.proficiency_mix_ratio_filled_required_beginner:
                  value: 2.08
                  rendered: 208.0%
                  html: 208.0% (13/6.3)
                z_analytics.proficiency_mix_ratio_filled_required_advanced:
                  value: 1.6
                  rendered: 160.0%
                  html: 160.0% (10/6.3)
                z_analytics.proficiency_mix_ratio_filled_required_score:
                  value: 0.5
                  rendered: 50.0%
              - shift_dim.day_number:
                  value: 23
                z_analytics.proficiency_mix_ratio_filled_required_beginner:
                  value: 2
                  rendered: 200.0%
                  filterable_value: '2.0'
                  html: 200.0% (6/3.0)
                z_analytics.proficiency_mix_ratio_filled_required_advanced:
                  value: 1
                  rendered: 100.0%
                  filterable_value: '1.0'
                  html: 100.0% (3/3.0)
                z_analytics.proficiency_mix_ratio_filled_required_score:
                  value: 0.5
                  rendered: 50.0%
              - shift_dim.day_number:
                  value: 25
                z_analytics.proficiency_mix_ratio_filled_required_beginner:
                  value: 2
                  rendered: 200.0%
                  filterable_value: '2.0'
                  html: 200.0% (7/3.5)
                z_analytics.proficiency_mix_ratio_filled_required_advanced:
                  value: 0.8571428571428571
                  rendered: 85.7%
                  html: 85.7% (3/3.5)
                z_analytics.proficiency_mix_ratio_filled_required_score:
                  value: 0.42857142857142855
                  rendered: 42.9%
              - shift_dim.day_number:
                  value: 9
                z_analytics.proficiency_mix_ratio_filled_required_beginner:
                  value: 2
                  rendered: 200.0%
                  filterable_value: '2.0'
                  html: 200.0% (12/6.0)
                z_analytics.proficiency_mix_ratio_filled_required_advanced:
                  value: 1.3333333333333333
                  rendered: 133.3%
                  html: 133.3% (8/6.0)
                z_analytics.proficiency_mix_ratio_filled_required_score:
                  value: 0.5
                  rendered: 50.0%
              - shift_dim.day_number:
                  value: 4
                z_analytics.proficiency_mix_ratio_filled_required_beginner:
                  value: 2
                  rendered: 200.0%
                  filterable_value: '2.0'
                  html: 200.0% (8/4.0)
                z_analytics.proficiency_mix_ratio_filled_required_advanced:
                  value: 1.25
                  rendered: 125.0%
                  html: 125.0% (5/4.0)
                z_analytics.proficiency_mix_ratio_filled_required_score:
                  value: 0.5
                  rendered: 50.0%
              - shift_dim.day_number:
                  value: 3
                z_analytics.proficiency_mix_ratio_filled_required_beginner:
                  value: 2
                  rendered: 200.0%
                  filterable_value: '2.0'
                  html: 200.0% (15/7.5)
                z_analytics.proficiency_mix_ratio_filled_required_advanced:
                  value: 1.3333333333333333
                  rendered: 133.3%
                  html: 133.3% (10/7.5)
                z_analytics.proficiency_mix_ratio_filled_required_score:
                  value: 0.5
                  rendered: 50.0%
              - shift_dim.day_number:
                  value: 26
                z_analytics.proficiency_mix_ratio_filled_required_beginner:
                  value: 2
                  rendered: 200.0%
                  filterable_value: '2.0'
                  html: 200.0% (14/7.0)
                z_analytics.proficiency_mix_ratio_filled_required_advanced:
                  value: 1.4285714285714286
                  rendered: 142.9%
                  html: 142.9% (10/7.0)
                z_analytics.proficiency_mix_ratio_filled_required_score:
                  value: 0.5
                  rendered: 50.0%
              - shift_dim.day_number:
                  value: 1
                z_analytics.proficiency_mix_ratio_filled_required_beginner:
                  value: 1.9310344827586208
                  rendered: 193.1%
                  html: 193.1% (14/7.3)
                z_analytics.proficiency_mix_ratio_filled_required_advanced:
                  value: 1.5172413793103448
                  rendered: 151.7%
                  html: 151.7% (11/7.3)
                z_analytics.proficiency_mix_ratio_filled_required_score:
                  value: 0.5
                  rendered: 50.0%
              - shift_dim.day_number:
                  value: 27
                z_analytics.proficiency_mix_ratio_filled_required_beginner:
                  value: 1.9310344827586208
                  rendered: 193.1%
                  html: 193.1% (14/7.3)
                z_analytics.proficiency_mix_ratio_filled_required_advanced:
                  value: 1.3793103448275863
                  rendered: 137.9%
                  html: 137.9% (10/7.3)
                z_analytics.proficiency_mix_ratio_filled_required_score:
                  value: 0.5
                  rendered: 50.0%
              - shift_dim.day_number:
                  value: 20
                z_analytics.proficiency_mix_ratio_filled_required_beginner:
                  value: 1.9259259259259258
                  rendered: 192.6%
                  html: 192.6% (13/6.8)
                z_analytics.proficiency_mix_ratio_filled_required_advanced:
                  value: 1.3333333333333333
                  rendered: 133.3%
                  html: 133.3% (9/6.8)
                z_analytics.proficiency_mix_ratio_filled_required_score:
                  value: 0.5
                  rendered: 50.0%
              - shift_dim.day_number:
                  value: 13
                z_analytics.proficiency_mix_ratio_filled_required_beginner:
                  value: 1.8181818181818181
                  rendered: 181.8%
                  html: 181.8% (10/5.5)
                z_analytics.proficiency_mix_ratio_filled_required_advanced:
                  value: 1.4545454545454546
                  rendered: 145.5%
                  html: 145.5% (8/5.5)
                z_analytics.proficiency_mix_ratio_filled_required_score:
                  value: 0.5
                  rendered: 50.0%
              - shift_dim.day_number:
                  value: 19
                z_analytics.proficiency_mix_ratio_filled_required_beginner:
                  value: 1.8
                  rendered: 180.0%
                  html: 180.0% (9/5.0)
                z_analytics.proficiency_mix_ratio_filled_required_advanced:
                  value: 1.6
                  rendered: 160.0%
                  html: 160.0% (8/5.0)
                z_analytics.proficiency_mix_ratio_filled_required_score:
                  value: 0.5
                  rendered: 50.0%
              - shift_dim.day_number:
                  value: 7
                z_analytics.proficiency_mix_ratio_filled_required_beginner:
                  value: 1.7777777777777777
                  rendered: 177.8%
                  html: 177.8% (4/2.3)
                z_analytics.proficiency_mix_ratio_filled_required_advanced:
                  value: 1.3333333333333333
                  rendered: 133.3%
                  html: 133.3% (3/2.3)
                z_analytics.proficiency_mix_ratio_filled_required_score:
                  value: 0.5
                  rendered: 50.0%
              - shift_dim.day_number:
                  value: 6
                z_analytics.proficiency_mix_ratio_filled_required_beginner:
                  value: 1.75
                  rendered: 175.0%
                  html: 175.0% (7/4.0)
                z_analytics.proficiency_mix_ratio_filled_required_advanced:
                  value: 1.5
                  rendered: 150.0%
                  html: 150.0% (6/4.0)
                z_analytics.proficiency_mix_ratio_filled_required_score:
                  value: 0.5
                  rendered: 50.0%
              - shift_dim.day_number:
                  value: 21
                z_analytics.proficiency_mix_ratio_filled_required_beginner:
                  value: 1.7391304347826086
                  rendered: 173.9%
                  html: 173.9% (10/5.8)
                z_analytics.proficiency_mix_ratio_filled_required_advanced:
                  value: 1.565217391304348
                  rendered: 156.5%
                  html: 156.5% (9/5.8)
                z_analytics.proficiency_mix_ratio_filled_required_score:
                  value: 0.5
                  rendered: 50.0%
              drill_menu_build_time: 0.03289
              expired: false
              fields:
                measures:
                - align: right
                  can_filter: true
                  category: measure
                  default_filter_value:
                  description: ''
                  enumerations:
                  field_group_label: 2 Proficiency Mix (Beginner)
                  fill_style:
                  fiscal_month_offset: 0
                  has_allowed_values: false
                  hidden: false
                  is_filter: false
                  is_numeric: true
                  label: Analytics C Proficiency Mix % (Beginner)
                  label_from_parameter:
                  label_short: C Proficiency Mix % (Beginner)
                  map_layer:
                  name: z_analytics.proficiency_mix_ratio_filled_required_beginner
                  strict_value_format: false
                  requires_refresh_on_sort: false
                  sortable: true
                  suggestions:
                  tags: []
                  type: number
                  user_attribute_filter_types:
                  - number
                  - advanced_filter_number
                  value_format: "#,##0.0%"
                  view: z_analytics
                  view_label: Analytics
                  dynamic: false
                  week_start_day: monday
                  original_view: z_analytics
                  dimension_group:
                  error:
                  field_group_variant: C Proficiency Mix % (Beginner)
                  measure: true
                  parameter: false
                  primary_key: false
                  project_name: cti-schedule-solver
                  scope: z_analytics
                  suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_beginner
                  suggest_explore: shift_staff_fact
                  suggestable: false
                  is_fiscal: false
                  is_timeframe: false
                  can_time_filter: false
                  time_interval:
                  lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=161"
                  permanent:
                  source_file: solver_views/v_00_analytics.view.lkml
                  source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
                  sql: "${sum_proficiency_mix_filled_beginner} / nullif(${sum_proficiency_mix_required_beginner},0) "
                  sql_case:
                  filters:
                  times_used: 0
                  sorted:
                    desc: true
                    sort_index: 0
                - align: right
                  can_filter: true
                  category: measure
                  default_filter_value:
                  description: ''
                  enumerations:
                  field_group_label: 2 Proficiency Mix (Advanced)
                  fill_style:
                  fiscal_month_offset: 0
                  has_allowed_values: false
                  hidden: false
                  is_filter: false
                  is_numeric: true
                  label: Analytics C Proficiency Mix % (Advanced)
                  label_from_parameter:
                  label_short: C Proficiency Mix % (Advanced)
                  map_layer:
                  name: z_analytics.proficiency_mix_ratio_filled_required_advanced
                  strict_value_format: false
                  requires_refresh_on_sort: false
                  sortable: true
                  suggestions:
                  tags: []
                  type: number
                  user_attribute_filter_types:
                  - number
                  - advanced_filter_number
                  value_format: "#,##0.0%"
                  view: z_analytics
                  view_label: Analytics
                  dynamic: false
                  week_start_day: monday
                  original_view: z_analytics
                  dimension_group:
                  error:
                  field_group_variant: C Proficiency Mix % (Advanced)
                  measure: true
                  parameter: false
                  primary_key: false
                  project_name: cti-schedule-solver
                  scope: z_analytics
                  suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_advanced
                  suggest_explore: shift_staff_fact
                  suggestable: false
                  is_fiscal: false
                  is_timeframe: false
                  can_time_filter: false
                  time_interval:
                  lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=109"
                  permanent:
                  source_file: solver_views/v_00_analytics.view.lkml
                  source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
                  sql: "${sum_proficiency_mix_filled_advanced} / nullif(${sum_proficiency_mix_required_advanced},0) "
                  sql_case:
                  filters:
                  times_used: 0
                - align: right
                  can_filter: true
                  category: measure
                  default_filter_value:
                  description: ''
                  enumerations:
                  field_group_label: 0 Overall Score
                  fill_style:
                  fiscal_month_offset: 0
                  has_allowed_values: false
                  hidden: false
                  is_filter: false
                  is_numeric: true
                  label: Analytics 2 Proficiency Mix Score
                  label_from_parameter:
                  label_short: 2 Proficiency Mix Score
                  map_layer:
                  name: z_analytics.proficiency_mix_ratio_filled_required_score
                  strict_value_format: false
                  requires_refresh_on_sort: false
                  sortable: true
                  suggestions:
                  tags: []
                  type: number
                  user_attribute_filter_types:
                  - number
                  - advanced_filter_number
                  value_format: "#,##0.0%"
                  view: z_analytics
                  view_label: Analytics
                  dynamic: false
                  week_start_day: monday
                  original_view: z_analytics
                  dimension_group:
                  error:
                  field_group_variant: 2 Proficiency Mix Score
                  measure: true
                  parameter: false
                  primary_key: false
                  project_name: cti-schedule-solver
                  scope: z_analytics
                  suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_score
                  suggest_explore: shift_staff_fact
                  suggestable: false
                  is_fiscal: false
                  is_timeframe: false
                  can_time_filter: false
                  time_interval:
                  lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=186"
                  permanent:
                  source_file: solver_views/v_00_analytics.view.lkml
                  source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
                  sql: "(\n        -- This is the score for advanced -- not the arrow\
                    \ b/c we don't mind too many\n        case\n          when ${sum_proficiency_mix_filled_advanced}\
                    \ > ${sum_proficiency_mix_required_advanced} then 1\n        \
                    \  else ${sum_proficiency_mix_filled_advanced} / nullif(${sum_proficiency_mix_required_advanced},0)\n\
                    \        end\n        +\n        -- This is the score for beginner\
                    \ -- not the arrow b/c we don't mind too few\n        case\n \
                    \         when ${sum_proficiency_mix_filled_beginner} <= ${sum_proficiency_mix_required_beginner}\
                    \ then 1\n          else 0\n        end\n      )\n      -- Then\
                    \ take a straight average\n        / 2\n      "
                  sql_case:
                  filters:
                  times_used: 0
                dimensions:
                - align: right
                  can_filter: true
                  category: dimension
                  default_filter_value:
                  description: ''
                  enumerations:
                  field_group_label: Shift
                  fill_style:
                  fiscal_month_offset: 0
                  has_allowed_values: false
                  hidden: false
                  is_filter: false
                  is_numeric: true
                  label: Analytics Day Number
                  label_from_parameter:
                  label_short: Day Number
                  map_layer:
                  name: shift_dim.day_number
                  strict_value_format: false
                  requires_refresh_on_sort: false
                  sortable: true
                  suggestions:
                  tags: []
                  type: number
                  user_attribute_filter_types:
                  - number
                  - advanced_filter_number
                  value_format:
                  view: shift_dim
                  view_label: Analytics
                  dynamic: false
                  week_start_day: monday
                  original_view: shift_dim
                  dimension_group:
                  error:
                  field_group_variant: Day Number
                  measure: false
                  parameter: false
                  primary_key: false
                  project_name: cti-schedule-solver
                  scope: shift_dim
                  suggest_dimension: shift_dim.day_number
                  suggest_explore: shift_staff_fact
                  suggestable: false
                  is_fiscal: false
                  is_timeframe: false
                  can_time_filter: false
                  time_interval:
                  lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_02_shift_dim.view.lkml?line=16"
                  permanent:
                  source_file: solver_views/v_02_shift_dim.view.lkml
                  source_file_path: cti-schedule-solver/solver_views/v_02_shift_dim.view.lkml
                  sql: "${TABLE}.day_number "
                  sql_case:
                  filters:
                  times_used: 0
                table_calculations: []
                pivots: []
                measure_like:
                - align: right
                  can_filter: true
                  category: measure
                  default_filter_value:
                  description: ''
                  enumerations:
                  field_group_label: 2 Proficiency Mix (Beginner)
                  fill_style:
                  fiscal_month_offset: 0
                  has_allowed_values: false
                  hidden: false
                  is_filter: false
                  is_numeric: true
                  label: Analytics C Proficiency Mix % (Beginner)
                  label_from_parameter:
                  label_short: C Proficiency Mix % (Beginner)
                  map_layer:
                  name: z_analytics.proficiency_mix_ratio_filled_required_beginner
                  strict_value_format: false
                  requires_refresh_on_sort: false
                  sortable: true
                  suggestions:
                  tags: []
                  type: number
                  user_attribute_filter_types:
                  - number
                  - advanced_filter_number
                  value_format: "#,##0.0%"
                  view: z_analytics
                  view_label: Analytics
                  dynamic: false
                  week_start_day: monday
                  original_view: z_analytics
                  dimension_group:
                  error:
                  field_group_variant: C Proficiency Mix % (Beginner)
                  measure: true
                  parameter: false
                  primary_key: false
                  project_name: cti-schedule-solver
                  scope: z_analytics
                  suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_beginner
                  suggest_explore: shift_staff_fact
                  suggestable: false
                  is_fiscal: false
                  is_timeframe: false
                  can_time_filter: false
                  time_interval:
                  lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=161"
                  permanent:
                  source_file: solver_views/v_00_analytics.view.lkml
                  source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
                  sql: "${sum_proficiency_mix_filled_beginner} / nullif(${sum_proficiency_mix_required_beginner},0) "
                  sql_case:
                  filters:
                  times_used: 0
                  sorted:
                    desc: true
                    sort_index: 0
                - align: right
                  can_filter: true
                  category: measure
                  default_filter_value:
                  description: ''
                  enumerations:
                  field_group_label: 2 Proficiency Mix (Advanced)
                  fill_style:
                  fiscal_month_offset: 0
                  has_allowed_values: false
                  hidden: false
                  is_filter: false
                  is_numeric: true
                  label: Analytics C Proficiency Mix % (Advanced)
                  label_from_parameter:
                  label_short: C Proficiency Mix % (Advanced)
                  map_layer:
                  name: z_analytics.proficiency_mix_ratio_filled_required_advanced
                  strict_value_format: false
                  requires_refresh_on_sort: false
                  sortable: true
                  suggestions:
                  tags: []
                  type: number
                  user_attribute_filter_types:
                  - number
                  - advanced_filter_number
                  value_format: "#,##0.0%"
                  view: z_analytics
                  view_label: Analytics
                  dynamic: false
                  week_start_day: monday
                  original_view: z_analytics
                  dimension_group:
                  error:
                  field_group_variant: C Proficiency Mix % (Advanced)
                  measure: true
                  parameter: false
                  primary_key: false
                  project_name: cti-schedule-solver
                  scope: z_analytics
                  suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_advanced
                  suggest_explore: shift_staff_fact
                  suggestable: false
                  is_fiscal: false
                  is_timeframe: false
                  can_time_filter: false
                  time_interval:
                  lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=109"
                  permanent:
                  source_file: solver_views/v_00_analytics.view.lkml
                  source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
                  sql: "${sum_proficiency_mix_filled_advanced} / nullif(${sum_proficiency_mix_required_advanced},0) "
                  sql_case:
                  filters:
                  times_used: 0
                - align: right
                  can_filter: true
                  category: measure
                  default_filter_value:
                  description: ''
                  enumerations:
                  field_group_label: 0 Overall Score
                  fill_style:
                  fiscal_month_offset: 0
                  has_allowed_values: false
                  hidden: false
                  is_filter: false
                  is_numeric: true
                  label: Analytics 2 Proficiency Mix Score
                  label_from_parameter:
                  label_short: 2 Proficiency Mix Score
                  map_layer:
                  name: z_analytics.proficiency_mix_ratio_filled_required_score
                  strict_value_format: false
                  requires_refresh_on_sort: false
                  sortable: true
                  suggestions:
                  tags: []
                  type: number
                  user_attribute_filter_types:
                  - number
                  - advanced_filter_number
                  value_format: "#,##0.0%"
                  view: z_analytics
                  view_label: Analytics
                  dynamic: false
                  week_start_day: monday
                  original_view: z_analytics
                  dimension_group:
                  error:
                  field_group_variant: 2 Proficiency Mix Score
                  measure: true
                  parameter: false
                  primary_key: false
                  project_name: cti-schedule-solver
                  scope: z_analytics
                  suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_score
                  suggest_explore: shift_staff_fact
                  suggestable: false
                  is_fiscal: false
                  is_timeframe: false
                  can_time_filter: false
                  time_interval:
                  lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=186"
                  permanent:
                  source_file: solver_views/v_00_analytics.view.lkml
                  source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
                  sql: "(\n        -- This is the score for advanced -- not the arrow\
                    \ b/c we don't mind too many\n        case\n          when ${sum_proficiency_mix_filled_advanced}\
                    \ > ${sum_proficiency_mix_required_advanced} then 1\n        \
                    \  else ${sum_proficiency_mix_filled_advanced} / nullif(${sum_proficiency_mix_required_advanced},0)\n\
                    \        end\n        +\n        -- This is the score for beginner\
                    \ -- not the arrow b/c we don't mind too few\n        case\n \
                    \         when ${sum_proficiency_mix_filled_beginner} <= ${sum_proficiency_mix_required_beginner}\
                    \ then 1\n          else 0\n        end\n      )\n      -- Then\
                    \ take a straight average\n        / 2\n      "
                  sql_case:
                  filters:
                  times_used: 0
                dimension_like:
                - align: right
                  can_filter: true
                  category: dimension
                  default_filter_value:
                  description: ''
                  enumerations:
                  field_group_label: Shift
                  fill_style:
                  fiscal_month_offset: 0
                  has_allowed_values: false
                  hidden: false
                  is_filter: false
                  is_numeric: true
                  label: Analytics Day Number
                  label_from_parameter:
                  label_short: Day Number
                  map_layer:
                  name: shift_dim.day_number
                  strict_value_format: false
                  requires_refresh_on_sort: false
                  sortable: true
                  suggestions:
                  tags: []
                  type: number
                  user_attribute_filter_types:
                  - number
                  - advanced_filter_number
                  value_format:
                  view: shift_dim
                  view_label: Analytics
                  dynamic: false
                  week_start_day: monday
                  original_view: shift_dim
                  dimension_group:
                  error:
                  field_group_variant: Day Number
                  measure: false
                  parameter: false
                  primary_key: false
                  project_name: cti-schedule-solver
                  scope: shift_dim
                  suggest_dimension: shift_dim.day_number
                  suggest_explore: shift_staff_fact
                  suggestable: false
                  is_fiscal: false
                  is_timeframe: false
                  can_time_filter: false
                  time_interval:
                  lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_02_shift_dim.view.lkml?line=16"
                  permanent:
                  source_file: solver_views/v_02_shift_dim.view.lkml
                  source_file_path: cti-schedule-solver/solver_views/v_02_shift_dim.view.lkml
                  sql: "${TABLE}.day_number "
                  sql_case:
                  filters:
                  times_used: 0
              fill_fields: []
              forecast_result:
              has_row_totals: false
              has_totals: false
              id: query-result-71:{}
              null_sort_treatment: low
              number_format: '1,234.56'
              ran_at: '2022-05-12T15:40:27+00:00'
              runtime: '1.504'
              sql: |-
                SELECT
                    shift_dim.day_number  AS shift_dim_day_number,
                    COUNT(DISTINCT CASE WHEN staff_competency_dim.overall_proficiency = 'Beginner' and shift_staff_fact.is_scheduled  THEN ( shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  )  ELSE NULL END) AS z_analytics_sum_proficiency_mix_filled_beginner,
                        COUNT(DISTINCT CASE WHEN shift_staff_fact.is_scheduled  THEN shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  ELSE NULL END) * 0.25 AS z_analytics_sum_proficiency_mix_required_beginner,
                        COUNT(DISTINCT CASE WHEN staff_competency_dim.overall_proficiency = 'Beginner' and shift_staff_fact.is_scheduled  THEN ( shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  )  ELSE NULL END) / nullif(COUNT(DISTINCT CASE WHEN shift_staff_fact.is_scheduled  THEN shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  ELSE NULL END) * 0.25, 0) AS z_analytics_proficiency_mix_ratio_filled_required_beginner,
                    COUNT(DISTINCT CASE WHEN staff_competency_dim.overall_proficiency = 'Advanced' and shift_staff_fact.is_scheduled  THEN ( shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  )  ELSE NULL END) AS z_analytics_sum_proficiency_mix_filled_advanced,
                        COUNT(DISTINCT CASE WHEN shift_staff_fact.is_scheduled  THEN shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  ELSE NULL END) * 0.25 AS z_analytics_sum_proficiency_mix_required_advanced,
                        COUNT(DISTINCT CASE WHEN staff_competency_dim.overall_proficiency = 'Advanced' and shift_staff_fact.is_scheduled  THEN ( shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  )  ELSE NULL END) / nullif(COUNT(DISTINCT CASE WHEN shift_staff_fact.is_scheduled  THEN shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  ELSE NULL END) * 0.25, 0) AS z_analytics_proficiency_mix_ratio_filled_required_advanced,
                            (CASE WHEN COUNT(DISTINCT CASE WHEN staff_competency_dim.overall_proficiency = 'Advanced' and shift_staff_fact.is_scheduled  THEN ( shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  )  ELSE NULL END) > COUNT(DISTINCT CASE WHEN shift_staff_fact.is_scheduled  THEN shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  ELSE NULL END) * 0.25 THEN 1 ELSE COUNT(DISTINCT CASE WHEN staff_competency_dim.overall_proficiency = 'Advanced' and shift_staff_fact.is_scheduled  THEN ( shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  )  ELSE NULL END) / nullif(COUNT(DISTINCT CASE WHEN shift_staff_fact.is_scheduled  THEN shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  ELSE NULL END) * 0.25, 0) END + CASE WHEN COUNT(DISTINCT CASE WHEN staff_competency_dim.overall_proficiency = 'Beginner' and shift_staff_fact.is_scheduled  THEN ( shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  )  ELSE NULL END) <= COUNT(DISTINCT CASE WHEN shift_staff_fact.is_scheduled  THEN shift_staff_fact.run_name_id || '|' || shift_staff_fact.shift_id || '|' || shift_staff_fact.staff_id  ELSE NULL END) * 0.25 THEN 1 ELSE 0 END) / 2 AS z_analytics_proficiency_mix_ratio_filled_required_score
                FROM optimizer.analytics_table_01_shift_staff_fact
                     AS shift_staff_fact
                LEFT JOIN optimizer.analytics_table_02_shift_dim
                     AS shift_dim ON shift_staff_fact.run_name_id = shift_dim.run_name_id
                      AND shift_staff_fact.shift_id = shift_dim.shift_id

                LEFT JOIN optimizer.analytics_table_05_staff_dim
                     AS staff_dim ON shift_staff_fact.run_name_id = staff_dim.run_name_id
                    AND shift_staff_fact.staff_id = staff_dim.staff_id

                LEFT JOIN optimizer.analytics_table_07_staff_competency_dim
                     AS staff_competency_dim ON staff_dim.run_name_id = staff_competency_dim.run_name_id
                    AND staff_dim.staff_id = staff_competency_dim.staff_id

                LEFT JOIN (SELECT 'x' as x)  AS z_analytics ON 1 = 1
                WHERE (shift_staff_fact.run_name_id ) = '9'
                GROUP BY
                    1
                ORDER BY
                    4 DESC
                LIMIT 500
              sql_explain:
              supports_pivot_in_db: true
              timezone: America/Chicago
              is_local: true
              table_calcs_complete: true
              tracked_attributes:
                result.drill_menu_build_time: 0.03289
                result.from_cache: true
                result.runtime: '1.504'
                result.sql.length: 4381
                result.supports_pivot_in_db: true
              sorts:
              - name: z_analytics.proficiency_mix_ratio_filled_required_beginner
                desc: true
            config:
              show_view_names: false
              show_row_numbers: true
              transpose: true
              truncate_text: true
              hide_totals: false
              hide_row_totals: false
              size_to_fit: true
              table_theme: white
              limit_displayed_rows: false
              enable_conditional_formatting: true
              header_text_alignment: left
              header_font_size: '12'
              rows_font_size: '12'
              conditional_formatting_include_totals: false
              conditional_formatting_include_nulls: false
              show_sql_query_menu_options: false
              show_totals: true
              show_row_totals: true
              truncate_header: false
              series_labels:
                z_analytics.proficiency_mix_ratio_filled_required_beginner: "% of\
                  \ Beginners Scheduled"
                z_analytics.proficiency_mix_ratio_filled_required_advanced: "% of\
                  \ Advanced Scheduled"
                z_analytics.proficiency_mix_ratio_filled_required_score: Overall Score
              series_column_widths:
                shift_dim.day_number: 104
                z_analytics.proficiency_mix_ratio_filled_required_beginner: 191
                z_analytics.proficiency_mix_ratio_filled_required_advanced: 164
                z_analytics.proficiency_mix_ratio_filled_required_score: 93
              series_cell_visualizations:
                z_analytics.proficiency_mix_ratio_filled_required_beginner:
                  is_active: false
              conditional_formatting:
              - type: along a scale...
                value:
                background_color: "#1A73E8"
                font_color:
                color_application:
                  collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
                  custom:
                    id: 9d37feff-c18e-3683-158f-529295caca83
                    label: Custom
                    type: continuous
                    stops:
                    - color: green
                      offset: 0
                    - color: red
                      offset: 100
                  options:
                    steps: 5
                    constraints:
                      min:
                        type: number
                        value: 0.5
                      mid:
                        type: number
                        value: 1
                      max:
                        type: number
                        value: 1.25
                bold: false
                italic: false
                strikethrough: false
                fields:
                - z_analytics.proficiency_mix_ratio_filled_required_beginner
              - type: along a scale...
                value:
                background_color: "#1A73E8"
                font_color:
                color_application:
                  collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
                  custom:
                    id: 70fd814a-a067-2070-99ae-d6928930ab61
                    label: Custom
                    type: continuous
                    stops:
                    - color: red
                      offset: 0
                    - color: green
                      offset: 100
                  options:
                    steps: 5
                    constraints:
                      min:
                        type: number
                        value: 0.75
                      mid:
                        type: number
                        value: 1
                      max:
                        type: number
                        value: 1.1
                bold: false
                italic: false
                strikethrough: false
                fields:
                - z_analytics.proficiency_mix_ratio_filled_required_advanced
              - type: along a scale...
                value:
                background_color: "#1A73E8"
                font_color:
                color_application:
                  collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
                  custom:
                    id: 655732e7-cb5d-30af-ff27-50a273b2848f
                    label: Custom
                    type: continuous
                    stops:
                    - color: red
                      offset: 0
                    - color: green
                      offset: 100
                  options:
                    steps: 5
                    constraints:
                      min:
                        type: number
                        value: 0.5
                      mid:
                        type: number
                        value: 1
                      max:
                        type: number
                        value: 1.1
                bold: false
                italic: false
                strikethrough: false
                fields:
                - z_analytics.proficiency_mix_ratio_filled_required_score
              type: looker_grid
              x_axis_gridlines: false
              y_axis_gridlines: true
              show_y_axis_labels: true
              show_y_axis_ticks: true
              y_axis_tick_density: default
              y_axis_tick_density_custom: 5
              show_x_axis_label: true
              show_x_axis_ticks: true
              y_axis_scale_mode: linear
              x_axis_reversed: false
              y_axis_reversed: false
              plot_size_by_field: false
              trellis: ''
              stacking: ''
              legend_position: center
              point_style: none
              show_value_labels: false
              label_density: 25
              x_axis_scale: auto
              y_axis_combined: true
              show_null_points: true
              interpolation: linear
              defaults_version: 1
              series_types: {}
              query_fields:
                measures:
                - align: right
                  can_filter: true
                  category: measure
                  default_filter_value:
                  description: ''
                  enumerations:
                  field_group_label: 2 Proficiency Mix (Beginner)
                  fill_style:
                  fiscal_month_offset: 0
                  has_allowed_values: false
                  hidden: false
                  is_filter: false
                  is_numeric: true
                  label: Analytics C Proficiency Mix % (Beginner)
                  label_from_parameter:
                  label_short: C Proficiency Mix % (Beginner)
                  map_layer:
                  name: z_analytics.proficiency_mix_ratio_filled_required_beginner
                  strict_value_format: false
                  requires_refresh_on_sort: false
                  sortable: true
                  suggestions:
                  tags: []
                  type: number
                  user_attribute_filter_types:
                  - number
                  - advanced_filter_number
                  value_format: "#,##0.0%"
                  view: z_analytics
                  view_label: Analytics
                  dynamic: false
                  week_start_day: monday
                  original_view: z_analytics
                  dimension_group:
                  error:
                  field_group_variant: C Proficiency Mix % (Beginner)
                  measure: true
                  parameter: false
                  primary_key: false
                  project_name: cti-schedule-solver
                  scope: z_analytics
                  suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_beginner
                  suggest_explore: shift_staff_fact
                  suggestable: false
                  is_fiscal: false
                  is_timeframe: false
                  can_time_filter: false
                  time_interval:
                  lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=161"
                  permanent:
                  source_file: solver_views/v_00_analytics.view.lkml
                  source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
                  sql: "${sum_proficiency_mix_filled_beginner} / nullif(${sum_proficiency_mix_required_beginner},0) "
                  sql_case:
                  filters:
                  times_used: 0
                  sorted:
                    desc: true
                    sort_index: 0
                - align: right
                  can_filter: true
                  category: measure
                  default_filter_value:
                  description: ''
                  enumerations:
                  field_group_label: 2 Proficiency Mix (Advanced)
                  fill_style:
                  fiscal_month_offset: 0
                  has_allowed_values: false
                  hidden: false
                  is_filter: false
                  is_numeric: true
                  label: Analytics C Proficiency Mix % (Advanced)
                  label_from_parameter:
                  label_short: C Proficiency Mix % (Advanced)
                  map_layer:
                  name: z_analytics.proficiency_mix_ratio_filled_required_advanced
                  strict_value_format: false
                  requires_refresh_on_sort: false
                  sortable: true
                  suggestions:
                  tags: []
                  type: number
                  user_attribute_filter_types:
                  - number
                  - advanced_filter_number
                  value_format: "#,##0.0%"
                  view: z_analytics
                  view_label: Analytics
                  dynamic: false
                  week_start_day: monday
                  original_view: z_analytics
                  dimension_group:
                  error:
                  field_group_variant: C Proficiency Mix % (Advanced)
                  measure: true
                  parameter: false
                  primary_key: false
                  project_name: cti-schedule-solver
                  scope: z_analytics
                  suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_advanced
                  suggest_explore: shift_staff_fact
                  suggestable: false
                  is_fiscal: false
                  is_timeframe: false
                  can_time_filter: false
                  time_interval:
                  lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=109"
                  permanent:
                  source_file: solver_views/v_00_analytics.view.lkml
                  source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
                  sql: "${sum_proficiency_mix_filled_advanced} / nullif(${sum_proficiency_mix_required_advanced},0) "
                  sql_case:
                  filters:
                  times_used: 0
                - align: right
                  can_filter: true
                  category: measure
                  default_filter_value:
                  description: ''
                  enumerations:
                  field_group_label: 0 Overall Score
                  fill_style:
                  fiscal_month_offset: 0
                  has_allowed_values: false
                  hidden: false
                  is_filter: false
                  is_numeric: true
                  label: Analytics 2 Proficiency Mix Score
                  label_from_parameter:
                  label_short: 2 Proficiency Mix Score
                  map_layer:
                  name: z_analytics.proficiency_mix_ratio_filled_required_score
                  strict_value_format: false
                  requires_refresh_on_sort: false
                  sortable: true
                  suggestions:
                  tags: []
                  type: number
                  user_attribute_filter_types:
                  - number
                  - advanced_filter_number
                  value_format: "#,##0.0%"
                  view: z_analytics
                  view_label: Analytics
                  dynamic: false
                  week_start_day: monday
                  original_view: z_analytics
                  dimension_group:
                  error:
                  field_group_variant: 2 Proficiency Mix Score
                  measure: true
                  parameter: false
                  primary_key: false
                  project_name: cti-schedule-solver
                  scope: z_analytics
                  suggest_dimension: z_analytics.proficiency_mix_ratio_filled_required_score
                  suggest_explore: shift_staff_fact
                  suggestable: false
                  is_fiscal: false
                  is_timeframe: false
                  can_time_filter: false
                  time_interval:
                  lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_00_analytics.view.lkml?line=186"
                  permanent:
                  source_file: solver_views/v_00_analytics.view.lkml
                  source_file_path: cti-schedule-solver/solver_views/v_00_analytics.view.lkml
                  sql: "(\n        -- This is the score for advanced -- not the arrow\
                    \ b/c we don't mind too many\n        case\n          when ${sum_proficiency_mix_filled_advanced}\
                    \ > ${sum_proficiency_mix_required_advanced} then 1\n        \
                    \  else ${sum_proficiency_mix_filled_advanced} / nullif(${sum_proficiency_mix_required_advanced},0)\n\
                    \        end\n        +\n        -- This is the score for beginner\
                    \ -- not the arrow b/c we don't mind too few\n        case\n \
                    \         when ${sum_proficiency_mix_filled_beginner} <= ${sum_proficiency_mix_required_beginner}\
                    \ then 1\n          else 0\n        end\n      )\n      -- Then\
                    \ take a straight average\n        / 2\n      "
                  sql_case:
                  filters:
                  times_used: 0
                dimensions:
                - align: right
                  can_filter: true
                  category: dimension
                  default_filter_value:
                  description: ''
                  enumerations:
                  field_group_label: Shift
                  fill_style:
                  fiscal_month_offset: 0
                  has_allowed_values: false
                  hidden: false
                  is_filter: false
                  is_numeric: true
                  label: Analytics Day Number
                  label_from_parameter:
                  label_short: Day Number
                  map_layer:
                  name: shift_dim.day_number
                  strict_value_format: false
                  requires_refresh_on_sort: false
                  sortable: true
                  suggestions:
                  tags: []
                  type: number
                  user_attribute_filter_types:
                  - number
                  - advanced_filter_number
                  value_format:
                  view: shift_dim
                  view_label: Analytics
                  dynamic: false
                  week_start_day: monday
                  original_view: shift_dim
                  dimension_group:
                  error:
                  field_group_variant: Day Number
                  measure: false
                  parameter: false
                  primary_key: false
                  project_name: cti-schedule-solver
                  scope: shift_dim
                  suggest_dimension: shift_dim.day_number
                  suggest_explore: shift_staff_fact
                  suggestable: false
                  is_fiscal: false
                  is_timeframe: false
                  can_time_filter: false
                  time_interval:
                  lookml_link: "/projects/cti-schedule-solver/files/solver_views%2Fv_02_shift_dim.view.lkml?line=16"
                  permanent:
                  source_file: solver_views/v_02_shift_dim.view.lkml
                  source_file_path: cti-schedule-solver/solver_views/v_02_shift_dim.view.lkml
                  sql: "${TABLE}.day_number "
                  sql_case:
                  filters:
                  times_used: 0
                table_calculations: []
                pivots: []
            overlay: true
            mapperOptions: {}
          overlay: true
          mapperOptions: {}
        overlay: true
        mapperOptions: {}
      overlay: true
      mapperOptions: {}
    overlay: true
    mapperOptions: {}
    listen:
      Facility: run_name_dim.facility
      Department: run_name_dim.department
      Period Start Date: run_name_dim.period_start_string
      Latest Run: run_name_dim.is_latest_run
      Run Name ID: shift_staff_fact.run_name_id
    row: 24
    col: 0
    width: 24
    height: 5
  - title: Run Name
    name: Run Name
    model: cti_schedule_solver
    explore: shift_staff_fact
    type: single_value
    fields: [shift_staff_fact.run_name_id]
    filters: {}
    sorts: [shift_staff_fact.run_name_id]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    listen:
      Run Name ID: shift_staff_fact.run_name_id
    row: 0
    col: 0
    width: 5
    height: 4
  filters:
  - name: Time of Day
    title: Time of Day
    type: field_filter
    default_value: AM
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
      options: []
    model: cti_schedule_solver
    explore: shift_staff_fact
    listens_to_filters: []
    field: shift_dim.time_of_day
  - name: Facility
    title: Facility
    type: field_filter
    default_value: COCULN
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
      options: []
    model: cti_schedule_solver
    explore: shift_staff_fact
    listens_to_filters: [Period Start Date, Department]
    field: run_name_dim.facility
  - name: Department
    title: Department
    type: field_filter
    default_value: '70710'
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
      options: []
    model: cti_schedule_solver
    explore: shift_staff_fact
    listens_to_filters: [Facility, Period Start Date]
    field: run_name_dim.department
  - name: Period Start Date
    title: Period Start Date
    type: field_filter
    default_value: '2022-05-22'
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
      options: []
    model: cti_schedule_solver
    explore: shift_staff_fact
    listens_to_filters: [Facility, Department]
    field: run_name_dim.period_start_string
  - name: Latest Run
    title: Latest Run
    type: field_filter
    default_value: 'Yes'
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_toggles
      display: inline
      options: []
    model: cti_schedule_solver
    explore: shift_staff_fact
    listens_to_filters: []
    field: run_name_dim.is_latest_run
  - name: Run Name ID
    title: Run Name ID
    type: field_filter
    default_value: "-NULL"
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: cti_schedule_solver
    explore: shift_staff_fact
    listens_to_filters: [Facility, Period Start Date, Department]
    field: shift_staff_fact.run_name_id

- dashboard: 2__inputs_
  title: '2 - Inputs '
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: Skill Mix
    name: Skill Mix
    model: cti_schedule_solver
    explore: shift_staff_fact
    type: looker_column
    fields: [shift_target_dim.skill_mix_name, z_analytics.sum_skill_mix_available,
      z_analytics.sum_skill_mix_required, z_analytics.skill_mix_ratio_available_required]
    filters: {}
    sorts: [z_analytics.sum_skill_mix_available desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: z_analytics.sum_skill_mix_available,
            id: z_analytics.sum_skill_mix_available, name: Shifts Available}, {axisId: z_analytics.sum_skill_mix_required,
            id: z_analytics.sum_skill_mix_required, name: Shifts Required}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: z_analytics.skill_mix_ratio_available_required,
            id: z_analytics.skill_mix_ratio_available_required, name: Ratio}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    hidden_series: [z_analytics.skill_mix_ratio_available_required]
    series_types: {}
    series_colors:
      1 - Weekend On - staff_preferences_dim.count: darkgreen
      Prefer - staff_preferences_dim.count: green
      Prefer not - staff_preferences_dim.count: orange
      shift_staff_fact.preference___null - staff_preferences_dim.count: red
    series_labels:
      staff_dim.staff_name_34_id: Staff Name - 3/4 ID
      z_analytics.fte_min_ratio: "%"
      shift_dim.shift_week_num: Shift Week
      z_analytics.staff_satisfaction_ratio: "%"
      shift_staff_fact.preference___null - staff_preferences_dim.count: X
      1 - Weekend On - staff_preferences_dim.count: Weekend On
      z_analytics.sum_skill_mix_filled: Skill Mix Filled
      z_analytics.sum_skill_mix_required: Shifts Required
      z_analytics.skill_mix_ratio_available_required: Ratio
      z_analytics.sum_skill_mix_available: Shifts Available
    show_sql_query_menu_options: false
    column_order: []
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    series_cell_visualizations:
      shift_staff_fact.count_scheduled:
        is_active: false
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: 1, background_color: "#0a0b73",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          custom: {id: 3fcd2814-c212-184f-6f2f-e72528f9130b, label: Custom, type: continuous,
            stops: [{color: Red, offset: 0}, {color: yellow, offset: 50}, {color: green,
                offset: 100}]}, options: {steps: 5, constraints: {min: {type: number,
                value: 0.75}, mid: {type: number, value: 0.9}, max: {type: number,
                value: 1}}, mirror: false, reverse: false, stepped: false}}, bold: false,
        italic: false, strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hide_totals: false
    hide_row_totals: false
    defaults_version: 1
    listen:
      Run Name ID: shift_staff_fact.run_name_id
      Time of Day: shift_dim.time_of_day
    row: 0
    col: 0
    width: 11
    height: 8
  - title: Competency Mix
    name: Competency Mix
    model: cti_schedule_solver
    explore: shift_staff_fact
    type: looker_column
    fields: [shift_competency_dim.competency_mix_name, z_analytics.sum_competency_mix_available,
      z_analytics.sum_competency_mix_required, z_analytics.competency_mix_ratio_available_required]
    filters:
      shift_dim.time_of_day: AM
    sorts: [shift_competency_dim.competency_mix_name]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: z_analytics.sum_competency_mix_available,
            id: z_analytics.sum_competency_mix_available, name: Shifts Available},
          {axisId: z_analytics.sum_competency_mix_required, id: z_analytics.sum_competency_mix_required,
            name: Shifts Required}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: z_analytics.competency_mix_ratio_available_required,
            id: z_analytics.competency_mix_ratio_available_required, name: Ratio}],
        showLabels: false, showValues: false, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    hidden_series: [z_analytics.competency_mix_ratio_available_required]
    series_types: {}
    series_colors:
      1 - Weekend On - staff_preferences_dim.count: darkgreen
      Prefer - staff_preferences_dim.count: green
      Prefer not - staff_preferences_dim.count: orange
      shift_staff_fact.preference___null - staff_preferences_dim.count: red
    series_labels:
      staff_dim.staff_name_34_id: Staff Name - 3/4 ID
      z_analytics.fte_min_ratio: "%"
      shift_dim.shift_week_num: Shift Week
      z_analytics.staff_satisfaction_ratio: "%"
      shift_staff_fact.preference___null - staff_preferences_dim.count: X
      1 - Weekend On - staff_preferences_dim.count: Weekend On
      z_analytics.sum_skill_mix_filled: Skill Mix Filled
      z_analytics.sum_skill_mix_required: Skill Mix Required
      z_analytics.skill_mix_ratio_available_required: Skill Mix % Available
      z_analytics.sum_competency_mix_available: Shifts Available
      z_analytics.sum_competency_mix_required: Shifts Required
      z_analytics.competency_mix_ratio_available_required: Ratio
    show_sql_query_menu_options: false
    column_order: []
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    series_cell_visualizations:
      shift_staff_fact.count_scheduled:
        is_active: false
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: 1, background_color: "#0a0b73",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          custom: {id: 3fcd2814-c212-184f-6f2f-e72528f9130b, label: Custom, type: continuous,
            stops: [{color: Red, offset: 0}, {color: yellow, offset: 50}, {color: green,
                offset: 100}]}, options: {steps: 5, constraints: {min: {type: number,
                value: 0.75}, mid: {type: number, value: 0.9}, max: {type: number,
                value: 1}}, mirror: false, reverse: false, stepped: false}}, bold: false,
        italic: false, strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hide_totals: false
    hide_row_totals: false
    defaults_version: 1
    listen:
      Run Name ID: shift_staff_fact.run_name_id
    row: 0
    col: 11
    width: 13
    height: 8
  - title: Staff Satisfaction (by Day)
    name: Staff Satisfaction (by Day)
    model: cti_schedule_solver
    explore: shift_staff_fact
    type: looker_column
    fields: [z_analytics.count_available, z_analytics.sum_skill_mix_required, z_analytics.staff_satisfaction_ratio_available,
      shift_dim.date_dow]
    fill_fields: [shift_dim.date_dow]
    filters:
      shift_dim.time_of_day: AM
    sorts: [shift_dim.date_dow desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: hca-branding
      palette_id: hca-branding-categorical-0
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: z_analytics.count_available,
            id: z_analytics.count_available, name: Shift Available}, {axisId: z_analytics.sum_skill_mix_required,
            id: z_analytics.sum_skill_mix_required, name: Shift Required}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: z_analytics.staff_satisfaction_ratio_available,
            id: z_analytics.staff_satisfaction_ratio_available, name: Ratio}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    hidden_series: [z_analytics.staff_satisfaction_ratio_available]
    series_types: {}
    series_colors: {}
    series_labels:
      staff_dim.staff_name_34_id: Staff Name - 3/4 ID
      z_analytics.fte_min_ratio: "%"
      shift_dim.shift_week_num: Shift Week
      z_analytics.staff_satisfaction_ratio: "%"
      shift_staff_fact.preference___null - staff_preferences_dim.count: X
      1 - Weekend On - staff_preferences_dim.count: Weekend On
      z_analytics.sum_skill_mix_filled: Skill Mix Filled
      z_analytics.sum_skill_mix_required: Shift Required
      z_analytics.skill_mix_ratio_available_required: Skill Mix % Available
      z_analytics.count_available: Shift Available
      z_analytics.staff_satisfaction_ratio_available: Ratio
    show_sql_query_menu_options: false
    column_order: []
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    series_cell_visualizations:
      shift_staff_fact.count_scheduled:
        is_active: false
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: 1, background_color: "#0a0b73",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          custom: {id: 3fcd2814-c212-184f-6f2f-e72528f9130b, label: Custom, type: continuous,
            stops: [{color: Red, offset: 0}, {color: yellow, offset: 50}, {color: green,
                offset: 100}]}, options: {steps: 5, constraints: {min: {type: number,
                value: 0.75}, mid: {type: number, value: 0.9}, max: {type: number,
                value: 1}}, mirror: false, reverse: false, stepped: false}}, bold: false,
        italic: false, strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hide_totals: false
    hide_row_totals: false
    defaults_version: 1
    listen:
      Run Name ID: shift_staff_fact.run_name_id
    row: 8
    col: 0
    width: 24
    height: 10
  filters:
  - name: Run Name ID
    title: Run Name ID
    type: field_filter
    default_value: '1'
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: cti_schedule_solver
    explore: shift_staff_fact
    listens_to_filters: []
    field: shift_staff_fact.run_name_id
  - name: Time of Day
    title: Time of Day
    type: field_filter
    default_value: AM
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: cti_schedule_solver
    explore: shift_staff_fact
    listens_to_filters: []
    field: shift_dim.time_of_day


- dashboard: staffing_app
  title: Staffing App
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: Skill Mix
    name: Skill Mix
    model: cti_schedule_solver
    explore: shift_staff_fact
    type: looker_grid
    fields: [shift_target_dim.skill_mix_name, z_analytics.skill_mix_ratio_filled_required]
    filters: {}
    sorts: [shift_target_dim.skill_mix_name]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      z_analytics.skill_mix_ratio_filled_required: "%"
    series_cell_visualizations:
      z_analytics.skill_mix_ratio_filled_required:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#03173E",
        font_color: !!null '', color_application: {collection_id: hca, custom: {id: db444d18-1b37-3d35-a351-30c65d4445ca,
            label: Custom, type: continuous, stops: [{color: red, offset: 0}, {color: green,
                offset: 50}, {color: yellow, offset: 100}]}, options: {steps: 5, constraints: {
              mid: {type: number, value: 1}}}}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    defaults_version: 1
    listen:
      Day Number Time of Day: shift_dim.day_number_time_of_day
      Run Name ID: shift_staff_fact.run_name_id
    row: 0
    col: 0
    width: 8
    height: 6
  - title: Competency Mix
    name: Competency Mix
    model: cti_schedule_solver
    explore: shift_staff_fact
    type: looker_grid
    fields: [shift_competency_dim.competency_mix_name, z_analytics.competency_mix_ratio_filled_required]
    filters: {}
    sorts: [shift_competency_dim.competency_mix_name]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      z_analytics.competency_mix_ratio_filled_required: "%"
    series_cell_visualizations:
      z_analytics.competency_mix_ratio_filled_required:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#03173E",
        font_color: !!null '', color_application: {collection_id: hca, custom: {id: 9db7684c-a01e-c25d-5a66-70cf0099b3f5,
            label: Custom, type: continuous, stops: [{color: red, offset: 0}, {color: yellow,
                offset: 50}, {color: green, offset: 100}]}, options: {steps: 5, constraints: {
              mid: {type: number, value: 0.9}, max: {type: number, value: 1.5}, min: {
                type: number, value: 0.6}}}}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    defaults_version: 1
    listen:
      Day Number Time of Day: shift_dim.day_number_time_of_day
      Run Name ID: shift_staff_fact.run_name_id
    row: 0
    col: 8
    width: 8
    height: 6
  - title: Proficiency Mix
    name: Proficiency Mix
    model: cti_schedule_solver
    explore: shift_staff_fact
    type: looker_grid
    fields: [z_analytics.proficiency_mix_ratio_filled_required_advanced, z_analytics.proficiency_mix_ratio_filled_required_beginner]
    filters: {}
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      z_analytics.proficiency_mix_ratio_filled_required_advanced: Advanced
      z_analytics.proficiency_mix_ratio_filled_required_beginner: Beginner
    series_cell_visualizations:
      z_analytics.proficiency_mix_ratio_filled_required_advanced:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#03173E",
        font_color: !!null '', color_application: {collection_id: hca, custom: {id: b4274a10-5949-37fa-0101-4fd86b58f066,
            label: Custom, type: continuous, stops: [{color: red, offset: 0}, {color: green,
                offset: 50}, {color: red, offset: 100}]}, options: {steps: 5, constraints: {
              mid: {type: number, value: 1}, min: {type: number, value: 0.75}, max: {
                type: number, value: 1.25}}}}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Day Number Time of Day: shift_dim.day_number_time_of_day
      Run Name ID: shift_staff_fact.run_name_id
    row: 0
    col: 16
    width: 8
    height: 6
  - title: Staffing App
    name: Staffing App
    model: cti_schedule_solver
    explore: shift_staff_fact
    type: looker_grid
    fields: [staff_dim.staff_name_34_id, staffing_app_table.score_total, staffing_app_table.text_fte_min,
      staffing_app_table.text_position, staffing_app_table.text_day_night_switching,
      staffing_app_table.text_proficiency, staffing_app_table.text_competency, staffing_app_table.text_7_days_before_after,
      staffing_app_staff_competency_filter.text_nice_to_have, staffing_app_staff_competency_filter.text_required]
    filters:
      staffing_app_table.is_available: 'Yes'
    sorts: [staffing_app_table.score_total desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#03173E",
        font_color: !!null '', color_application: {collection_id: hca, custom: {id: 1f5c8e9d-1121-1b91-04c2-42153636c047,
            label: Custom, type: continuous, stops: [{color: red, offset: 0}, {color: "#FFFFFF",
                offset: 50}, {color: green, offset: 100}]}, options: {steps: 5}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    hidden_fields: [staffing_app_staff_competency_filter.text_nice_to_have, staffing_app_staff_competency_filter.text_required]
    defaults_version: 1
    listen:
      Competency Nice to Have: staffing_app_table.competency_nice_to_have
      Competency Required: staffing_app_table.competency_required
      Position to Fill: staffing_app_table.position_to_fill
      Proficiency to Fill: staffing_app_table.proficiency_to_fill
      Day Number Time of Day: shift_dim.day_number_time_of_day
      Run Name ID: shift_staff_fact.run_name_id
    row: 6
    col: 0
    width: 24
    height: 12
  filters:
  - name: Run Name ID
    title: Run Name ID
    type: field_filter
    default_value: '"hill_climber_henrico_0424period_2022-04-02_v1"'
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: cti_schedule_solver
    explore: shift_staff_fact
    listens_to_filters: []
    field: shift_staff_fact.run_name_id
  - name: Day Number Time of Day
    title: Day Number Time of Day
    type: field_filter
    default_value: Day 09 PM
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: cti_schedule_solver
    explore: shift_staff_fact
    listens_to_filters: [Run Name ID]
    field: shift_dim.day_number_time_of_day
  - name: Position to Fill
    title: Position to Fill
    type: field_filter
    default_value: CNC
    allow_multiple_values: true
    required: false
    ui_config:
      type: radio_buttons
      display: inline
      options: []
    model: cti_schedule_solver
    explore: shift_staff_fact
    listens_to_filters: []
    field: staffing_app_table.position_to_fill
  - name: Proficiency to Fill
    title: Proficiency to Fill
    type: field_filter
    default_value: Advanced
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: cti_schedule_solver
    explore: shift_staff_fact
    listens_to_filters: []
    field: staffing_app_table.proficiency_to_fill
  - name: Competency Required
    title: Competency Required
    type: field_filter
    default_value: Complex Shoulder
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: cti_schedule_solver
    explore: shift_staff_fact
    listens_to_filters: [Run Name ID]
    field: staffing_app_table.competency_required
  - name: Competency Nice to Have
    title: Competency Nice to Have
    type: field_filter
    default_value: PACU
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: cti_schedule_solver
    explore: shift_staff_fact
    listens_to_filters: [Run Name ID]
    field: staffing_app_table.competency_nice_to_have
