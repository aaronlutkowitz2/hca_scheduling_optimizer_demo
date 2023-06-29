view: staffing_app_table {
  sql_table_name: optimizer.analytics_table_11_staffing_app_table
    ;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${run_name_id} || '|' || ${shift_id} || '|' || ${staff_id} ;;
  }

#######################
### Original Dimensions
#######################

### Section 1: Is Scheduled

  ### Part A: 14 Shifts Before, 14 Shifts After

  dimension: is_scheduled { hidden: yes }
  dimension: is_scheduled_shift_neg_01 { hidden: yes }
  dimension: is_scheduled_shift_neg_02 { hidden: yes }
  dimension: is_scheduled_shift_neg_03 { hidden: yes }
  dimension: is_scheduled_shift_neg_04 { hidden: yes }
  dimension: is_scheduled_shift_neg_05 { hidden: yes }
  dimension: is_scheduled_shift_neg_06 { hidden: yes }
  dimension: is_scheduled_shift_neg_07 { hidden: yes }
  dimension: is_scheduled_shift_neg_08 { hidden: yes }
  dimension: is_scheduled_shift_neg_09 { hidden: yes }
  dimension: is_scheduled_shift_neg_10 { hidden: yes }
  dimension: is_scheduled_shift_neg_11 { hidden: yes }
  dimension: is_scheduled_shift_neg_12 { hidden: yes }
  dimension: is_scheduled_shift_neg_13 { hidden: yes }
  dimension: is_scheduled_shift_neg_14 { hidden: yes }
  dimension: is_scheduled_shift_pos_01 { hidden: yes }
  dimension: is_scheduled_shift_pos_02 { hidden: yes }
  dimension: is_scheduled_shift_pos_03 { hidden: yes }
  dimension: is_scheduled_shift_pos_04 { hidden: yes }
  dimension: is_scheduled_shift_pos_05 { hidden: yes }
  dimension: is_scheduled_shift_pos_06 { hidden: yes }
  dimension: is_scheduled_shift_pos_07 { hidden: yes }
  dimension: is_scheduled_shift_pos_08 { hidden: yes }
  dimension: is_scheduled_shift_pos_09 { hidden: yes }
  dimension: is_scheduled_shift_pos_10 { hidden: yes }
  dimension: is_scheduled_shift_pos_11 { hidden: yes }
  dimension: is_scheduled_shift_pos_12 { hidden: yes }
  dimension: is_scheduled_shift_pos_13 { hidden: yes }
  dimension: is_scheduled_shift_pos_14 { hidden: yes }

  ### Part B: 14 7 Days Before, 7 Days After

  dimension: is_scheduled_day_neg_01 { hidden: yes }
  dimension: is_scheduled_day_neg_02 { hidden: yes }
  dimension: is_scheduled_day_neg_03 { hidden: yes }
  dimension: is_scheduled_day_neg_04 { hidden: yes }
  dimension: is_scheduled_day_neg_05 { hidden: yes }
  dimension: is_scheduled_day_neg_06 { hidden: yes }
  dimension: is_scheduled_day_neg_07 { hidden: yes }
  dimension: is_scheduled_day_pos_01 { hidden: yes }
  dimension: is_scheduled_day_pos_02 { hidden: yes }
  dimension: is_scheduled_day_pos_03 { hidden: yes }
  dimension: is_scheduled_day_pos_04 { hidden: yes }
  dimension: is_scheduled_day_pos_05 { hidden: yes }
  dimension: is_scheduled_day_pos_06 { hidden: yes }
  dimension: is_scheduled_day_pos_07 { hidden: yes }

### Section 2: Preference Number (1 = on, 2 = prefer, 3 = neutral, 4 = prefer not, 5 = X, 6 = PTO)

  ### Part A: 14 Shifts Before, 14 Shifts After

  dimension: preference { hidden: yes }

  dimension: preference_num { hidden: yes type:number sql: safe_cast(${TABLE}.preference_num as float64);;} #Z.P. update for variable fix
  dimension: preference_num_shift_neg_01 { hidden: yes }
  dimension: preference_num_shift_neg_02 { hidden: yes }
  dimension: preference_num_shift_neg_03 { hidden: yes }
  dimension: preference_num_shift_neg_04 { hidden: yes }
  dimension: preference_num_shift_neg_05 { hidden: yes }
  dimension: preference_num_shift_neg_06 { hidden: yes }
  dimension: preference_num_shift_neg_07 { hidden: yes }
  dimension: preference_num_shift_neg_08 { hidden: yes }
  dimension: preference_num_shift_neg_09 { hidden: yes }
  dimension: preference_num_shift_neg_10 { hidden: yes }
  dimension: preference_num_shift_neg_11 { hidden: yes }
  dimension: preference_num_shift_neg_12 { hidden: yes }
  dimension: preference_num_shift_neg_13 { hidden: yes }
  dimension: preference_num_shift_neg_14 { hidden: yes }
  dimension: preference_num_shift_pos_01 { hidden: yes }
  dimension: preference_num_shift_pos_02 { hidden: yes }
  dimension: preference_num_shift_pos_03 { hidden: yes }
  dimension: preference_num_shift_pos_04 { hidden: yes }
  dimension: preference_num_shift_pos_05 { hidden: yes }
  dimension: preference_num_shift_pos_06 { hidden: yes }
  dimension: preference_num_shift_pos_07 { hidden: yes }
  dimension: preference_num_shift_pos_08 { hidden: yes }
  dimension: preference_num_shift_pos_09 { hidden: yes }
  dimension: preference_num_shift_pos_10 { hidden: yes }
  dimension: preference_num_shift_pos_11 { hidden: yes }
  dimension: preference_num_shift_pos_12 { hidden: yes }
  dimension: preference_num_shift_pos_13 { hidden: yes }
  dimension: preference_num_shift_pos_14 { hidden: yes }

  ### Part B: 14 7 Days Before, 7 Days After

  dimension: preference_num_day_neg_01 { hidden: yes }
  dimension: preference_num_day_neg_02 { hidden: yes }
  dimension: preference_num_day_neg_03 { hidden: yes }
  dimension: preference_num_day_neg_04 { hidden: yes }
  dimension: preference_num_day_neg_05 { hidden: yes }
  dimension: preference_num_day_neg_06 { hidden: yes }
  dimension: preference_num_day_neg_07 { hidden: yes }
  dimension: preference_num_day_pos_01 { hidden: yes }
  dimension: preference_num_day_pos_02 { hidden: yes }
  dimension: preference_num_day_pos_03 { hidden: yes }
  dimension: preference_num_day_pos_04 { hidden: yes }
  dimension: preference_num_day_pos_05 { hidden: yes }
  dimension: preference_num_day_pos_06 { hidden: yes }
  dimension: preference_num_day_pos_07 { hidden: yes }

### Other Dimensions

  dimension: run_name_id { hidden: yes }
  dimension: shift_id { hidden: yes }
  dimension: staff_id { hidden: yes }

#######################
### Derived Dimensions
#######################

###### Is Available ######

  dimension: is_available1 {
    hidden: yes
    type: number
    sql: case when ${is_scheduled} then 1 else 0 end ;;
  }
  dimension: is_available2 {
    hidden: yes
    type: number
    sql: case when ${is_scheduled_shift_neg_01} then 1 else 0 end ;;
  }
  dimension: is_available3 {
    hidden: yes
    type: number
    sql: case when ${is_scheduled_shift_pos_01} then 1 else 0 end ;;
  }

  dimension: is_available {
    view_label: "Analytics (Staffing)"
    type: yesno
    sql: ${is_available1} + ${is_available2} + ${is_available3} = 0 ;;
  }

  # use for overstaffing
  dimension: is_working {
    view_label: "Analytics (Staffing)"
    type: yesno
    sql: ${is_available1} = 1 ;;
  }

###### Preference ######

  dimension: score_preference {
    view_label: "Analytics (Staffing)"
    group_label: "Score"
    type: number
    sql: pow(3 - ${preference_num},3)*1000 ;;
  }



  dimension: text_preference {
    view_label: "Analytics (Staffing)"
    group_label: "Text"
    type: string
    sql: ${preference} ;;
    html:
    {%    if preference_num._value == 1 %} <font color="darkgreen"> {{value}} </font>
    {% elsif preference_num._value == 2 %} <font color="green">     {{value}} </font>
    {% elsif preference_num._value == 3 %} <font color="orange">    {{value}} </font>
    {% elsif preference_num._value == 4 %} <font color="orange">    {{value}} </font>
    {% elsif preference_num._value == 5 %} <font color="red">       {{value}} </font>
    {% elsif preference_num._value == 6 %} <font color="red">       {{value}} </font>
    {% endif %}
    ;;
  }

  # use for overstaffing
  dimension: score_preference_overstaffing {
    view_label: "Analytics (Staffing)"
    group_label: "Score (Overstaffing)"
    type: number
    sql: ${score_preference} * -1  ;;
  }

  dimension: text_preference_overstaffing  {
    view_label: "Analytics (Staffing)"
    group_label: "Text (Overstaffing)"
    type: string
    sql: ${preference} ;;
    html:
    {%    if preference_num._value == 1 %} <font color="red"> {{value}} </font>
    {% elsif preference_num._value == 2 %} <font color="red">     {{value}} </font>
    {% elsif preference_num._value == 3 %} <font color="orange">    {{value}} </font>
    {% elsif preference_num._value == 4 %} <font color="orange">    {{value}} </font>
    {% elsif preference_num._value == 5 %} <font color="green">       {{value}} </font>
    {% elsif preference_num._value == 6 %} <font color="darkgreen">       {{value}} </font>
    {% endif %}
    ;;
  }

###### FTE Min ######

  dimension: score_fte_min {
    view_label: "Analytics (Staffing)"
    group_label: "Score"
    sql:
      case
        when ${staff_week_dim.diff_scheduled_required} < 0 then 100000
        when ${staff_week_dim.diff_scheduled_required} = 0 then -1000
        when ${staff_week_dim.diff_scheduled_required} <= 1 then -10000
        when ${staff_week_dim.diff_scheduled_required} <= 2 then -100000
        else -1000000
      end
    ;;
  }

  dimension: text_fte_min {
    view_label: "Analytics (Staffing)"
    group_label: "Text"
    type: string
    sql:
      case
        when ${staff_week_dim.diff_scheduled_required} < 0 then 'Has Shifts'
        when ${staff_week_dim.diff_scheduled_required} = 0 then 'At Capacity'
        when ${staff_week_dim.diff_scheduled_required} <= 1 then '1 shift over'
        when ${staff_week_dim.diff_scheduled_required} <= 2 then '2 shift over'
        else '3+ shift over'
      end
    ;;
    html:
      {%    if staff_week_dim.diff_scheduled_required._value < 0 %} <font color="green">{{ rendered_value }}</font>
      {% elsif staff_week_dim.diff_scheduled_required._value == 0 %} <font color="orange">{{ rendered_value }}</font>
      {% elsif staff_week_dim.diff_scheduled_required._value <= 1 %} <font color="red">{{ rendered_value }}</font>
      {% else %} <font color="darkred">{{ rendered_value }}</font>
      {% endif %}
    ;;
  }

  # use for overstaffing
  dimension: score_fte_min_overstaffing {
    view_label: "Analytics (Staffing)"
    group_label: "Score (Overstaffing)"
    sql: ${score_fte_min} * -1 ;;
  }

  dimension: text_fte_min_overstaffing {
    view_label: "Analytics (Staffing)"
    group_label: "Text (Overstaffing)"
    type: string
    sql: ${text_fte_min} ;;
    html:
      {%    if staff_week_dim.diff_scheduled_required._value < 0 %} <font color="darkred">{{ rendered_value }}</font>
      {% elsif staff_week_dim.diff_scheduled_required._value == 0 %} <font color="red">{{ rendered_value }}</font>
      {% elsif staff_week_dim.diff_scheduled_required._value <= 1 %} <font color="orange">{{ rendered_value }}</font>
      {% else %} <font color="green">{{ rendered_value }}</font>
      {% endif %}
    ;;
  }

###### Position ######

  ## Parameter
  parameter: position_to_fill {
    view_label: "Analytics (Staffing)"
    type: string
    default_value: "CNC"
    allowed_value: {label: "CNC" value: "CNC"}
    allowed_value: {label: "RN" value: "RN"}
  }

  ## Score
  dimension: score_position {
    view_label: "Analytics (Staffing)"
    group_label: "Score"
    sql:
      case
        when {% parameter position_to_fill %} = ${staff_dim.position} then 5000
        when {% parameter position_to_fill %} = ${backup_position_mapping.backup_position} AND ${staff_dim.position} = ${backup_position_mapping.position} then 1000
        else -500000
      end
      ;;
  }

  ## Text
  dimension: text_position {
    view_label: "Analytics (Staffing)"
    group_label: "Text"
    type: string
    sql:
        case
          when ${score_position} > 2500 then ${staff_dim.position}
          when ${score_position} > 0 then '*' || ${backup_position_mapping.backup_position} || ' (' || ${staff_dim.position} || ')'
        else ${staff_dim.position}
        END ;;
    html:
      {%    if score_position._value > 2500 %} <font color="darkgreen">{{ rendered_value }}</font>
      {% elsif score_position._value > 0 %} <font color="orange">{{ rendered_value }}</font>
      {% else %} <font color="darkred">{{ rendered_value }}</font>
      {% endif %}
    ;;
  }

  # use for overstaffing (note: you may want to change the label of "Position to Fill" with "Position" b/c overstaffing assumes it's position to get rid of, not to fill)

  ## Score
  dimension: score_position_overstaffing {
    view_label: "Analytics (Staffing)"
    group_label: "Score (Overstaffing)"
    sql: ${score_position} ;;
  }

  ## Text
  dimension: text_position_overstaffing {
    view_label: "Analytics (Staffing)"
    group_label: "Text (Overstaffing)"
    type: string
    sql: ${text_position} ;;
    html:
      {%    if score_position._value > 2500 %} <font color="darkgreen">{{ rendered_value }}</font>
      {% elsif score_position._value > 0 %} <font color="orange">{{ rendered_value }}</font>
      {% else %} <font color="darkred">{{ rendered_value }}</font>
      {% endif %}
    ;;
  }

###### Day Night Switching ######

  ## Score
  dimension: score_day_night_switching {
    view_label: "Analytics (Staffing)"
    group_label: "Score"
    type: number
    sql:
        case
          when
               (${shift_dim.time_of_day} = 'AM' and ${staff_dim.day_night} = 'Night')
            OR (${shift_dim.time_of_day} = 'PM' and ${staff_dim.day_night} = 'Day')
          then -10000
          else 300
        end ;;
  }

  ## Text
  dimension: text_day_night_switching {
    view_label: "Analytics (Staffing)"
    group_label: "Text"
    type: string
    sql: ${staff_dim.day_night} ;;
    html:
    {% if score_day_night_switching._value > 0 %} <font color="darkgreen">{{ rendered_value }}</font>
    {% else %} <font color="darkred">{{ rendered_value }}</font>
    {% endif %}
    ;;
  }

  # use for overstaffing

  ## Score
  dimension: score_day_night_switching_overstaffing {
    view_label: "Analytics (Staffing)"
    group_label: "Score (Overstaffing)"
    type: number
    sql: ${score_day_night_switching} * -1 ;;
  }

  ## Text
  dimension: text_day_night_switching_overstaffing {
    view_label: "Analytics (Staffing)"
    group_label: "Text (Overstaffing)"
    type: string
    sql: ${staff_dim.day_night} ;;
    html:
    {% if score_day_night_switching_overstaffing._value > 0 %} <font color="darkgreen">{{ rendered_value }}</font>
    {% else %} <font color="darkred">{{ rendered_value }}</font>
    {% endif %}
    ;;
  }

###### Proficiency ######

  ## Parameter
  parameter: proficiency_to_fill {
    view_label: "Analytics (Staffing)"
    type: string
    default_value: "do_not_care"
    allowed_value: {label: "Advanced" value: "Advanced"}
    allowed_value: {label: "Proficienct" value: "Proficient"}
    allowed_value: {label: "Beginner" value: "Beginner"}
    allowed_value: {label: "Do Not Care" value: "do_not_care"}
  }

  ## Score
  dimension: score_proficiency {
    view_label: "Analytics (Staffing)"
    group_label: "Score"
    sql:
      case
        when {% parameter proficiency_to_fill %} = ${staff_competency_dim.overall_proficiency} then 10000
        when {% parameter proficiency_to_fill %} = 'Beginner' and ${staff_competency_dim.overall_proficiency} in ('Proficient', 'Advanced') then 3000
        when {% parameter proficiency_to_fill %} = 'Proficient' and ${staff_competency_dim.overall_proficiency} in ('Advanced') then 3000
        when {% parameter proficiency_to_fill %} = 'do_not_care' then 0
        else -50000
      end
      ;;
  }

  ## Text
  dimension: text_proficiency {
    view_label: "Analytics (Staffing)"
    group_label: "Text"
    type: string
    sql:
        case
          when ${score_proficiency} > 5000 then ${staff_competency_dim.overall_proficiency}
          when ${score_proficiency} > 0 then '*' || ${staff_competency_dim.overall_proficiency}
        else ${staff_competency_dim.overall_proficiency}
        END ;;
    html:
      {%    if score_proficiency._value > 5000 %} <font color="darkgreen">{{ rendered_value }}</font>
      {% elsif score_proficiency._value > 2000 %} <font color="orange">{{ rendered_value }}</font>
      {% elsif score_proficiency._value == 0 %}    <font color="black">{{ rendered_value }}</font>
      {% else %}                                  <font color="darkred">{{ rendered_value }}</font>
      {% endif %}
    ;;
  }

  # use for overstaffing (note: you may want to change the label of "Proficiency to Fill" with "Position" b/c overstaffing assumes it's position to get rid of, not to fill)

  ## Score
  dimension: score_proficiency_overstaffing {
    view_label: "Analytics (Staffing)"
    group_label: "Score (Overstaffing)"
    sql: ${score_proficiency} ;;
  }

  ## Text
  dimension: text_proficiency_overstaffing {
    view_label: "Analytics (Staffing)"
    group_label: "Text (Overstaffing)"
    type: string
    sql: ${text_proficiency} ;;
    html:
      {%    if score_proficiency._value > 5000 %} <font color="darkgreen">{{ rendered_value }}</font>
      {% elsif score_proficiency._value > 2000 %} <font color="orange">{{ rendered_value }}</font>
      {% elsif score_proficiency._value == 0 %}    <font color="black">{{ rendered_value }}</font>
      {% else %}                                  <font color="darkred">{{ rendered_value }}</font>
      {% endif %}
    ;;
  }


###### Competency ######

  ## Parameter
  filter: competency_required {
    view_label: "Analytics (Staffing)"
    type: string
    suggest_dimension: staff_competency_dim.staff_competency_name
    default_value: "Complex Shoulder"
  }

  filter: competency_nice_to_have {
    view_label: "Analytics (Staffing)"
    type: string
    suggest_dimension: staff_competency_dim.staff_competency_name
    default_value: "PACU"
  }

  ## Score
  dimension: score_competency {
    view_label: "Analytics (Staffing)"
    group_label: "Score"
    # for every competency we have, +3000 (if required) or +300 (if nice to have)
    # for every competency we don't have, -10000 (if required) or -1000 (if nice to have)
    sql:
      (${staffing_app_staff_competency_filter.count_comptency_required_staff} * 3000)
    + (${staffing_app_staff_competency_filter.count_comptency_required_missing} * -10000)
    + (${staffing_app_staff_competency_filter.count_comptency_nice_to_have_staff} * 300)
    + (${staffing_app_staff_competency_filter.count_comptency_nice_to_have_missing} * -1000)

    ;;
  }

  ## Text
  dimension: text_competency {
    view_label: "Analytics (Staffing)"
    group_label: "Text"
    type: string
    sql: 'x' ;;
    html:
    {% if staffing_app_staff_competency_filter.percent_hit._value > 0.9 %}
      <font color="darkgreen">
      Required: {{ staffing_app_staff_competency_filter.text_required._rendered_value }} |
      Nice to have: {{ staffing_app_staff_competency_filter.text_nice_to_have._rendered_value }}
      </font>
    {% elsif staffing_app_staff_competency_filter.percent_hit._value > 0.7 %}
      <font color="green">
      Required: {{ staffing_app_staff_competency_filter.text_required._rendered_value }} |
      Nice to have: {{ staffing_app_staff_competency_filter.text_nice_to_have._rendered_value }}
      </font>
    {% elsif staffing_app_staff_competency_filter.percent_hit._value > 0.5 %}
      <font color="orange">
      Required: {{ staffing_app_staff_competency_filter.text_required._rendered_value }} |
      Nice to have: {{ staffing_app_staff_competency_filter.text_nice_to_have._rendered_value }}
      </font>
    {% else %}
      <font color="red">
      Required: {{ staffing_app_staff_competency_filter.text_required._rendered_value }} |
      Nice to have: {{ staffing_app_staff_competency_filter.text_nice_to_have._rendered_value }}
      </font>
    {% endif %}
    ;;
  }

  # use for staffing (note: this uses same filters as understaffing)

  ## Score
  dimension: score_competency_overstaffing {
    view_label: "Analytics (Staffing)"
    group_label: "Score (Overstaffing)"
    sql: ${score_competency} ;;
  }

  ## Text
  dimension: text_competency_overstaffing {
    view_label: "Analytics (Staffing)"
    group_label: "Text (Overstaffing)"
    type: string
    sql: 'x' ;;
    html:
    {% if staffing_app_staff_competency_filter.percent_hit._value > 0.9 %}
      <font color="darkgreen">
      Required: {{ staffing_app_staff_competency_filter.text_required._rendered_value }} |
      Nice to have: {{ staffing_app_staff_competency_filter.text_nice_to_have._rendered_value }}
      </font>
    {% elsif staffing_app_staff_competency_filter.percent_hit._value > 0.7 %}
      <font color="green">
      Required: {{ staffing_app_staff_competency_filter.text_required._rendered_value }} |
      Nice to have: {{ staffing_app_staff_competency_filter.text_nice_to_have._rendered_value }}
      </font>
    {% elsif staffing_app_staff_competency_filter.percent_hit._value > 0.5 %}
      <font color="orange">
      Required: {{ staffing_app_staff_competency_filter.text_required._rendered_value }} |
      Nice to have: {{ staffing_app_staff_competency_filter.text_nice_to_have._rendered_value }}
      </font>
    {% else %}
      <font color="red">
      Required: {{ staffing_app_staff_competency_filter.text_required._rendered_value }} |
      Nice to have: {{ staffing_app_staff_competency_filter.text_nice_to_have._rendered_value }}
      </font>
    {% endif %}
    ;;
  }

###### 14 Days Pre/Post ######

  dimension: text_is_scheduled_day_neg_07 { hidden:yes type: string sql: case when ${is_scheduled_day_neg_07} then cast(${preference_num_day_neg_07} as string) else 'O'   end ;; }
  dimension: text_is_scheduled_day_neg_06 { hidden:yes type: string sql: case when ${is_scheduled_day_neg_06} then cast(${preference_num_day_neg_06} as string) else 'O'   end ;; }
  dimension: text_is_scheduled_day_neg_05 { hidden:yes type: string sql: case when ${is_scheduled_day_neg_05} then cast(${preference_num_day_neg_05} as string) else 'O'   end ;; }
  dimension: text_is_scheduled_day_neg_04 { hidden:yes type: string sql: case when ${is_scheduled_day_neg_04} then cast(${preference_num_day_neg_04} as string) else 'O'   end ;; }
  dimension: text_is_scheduled_day_neg_03 { hidden:yes type: string sql: case when ${is_scheduled_day_neg_03} then cast(${preference_num_day_neg_03} as string) else 'O'   end ;; }
  dimension: text_is_scheduled_day_neg_02 { hidden:yes type: string sql: case when ${is_scheduled_day_neg_02} then cast(${preference_num_day_neg_02} as string) else 'O'   end ;; }
  dimension: text_is_scheduled_day_neg_01 { hidden:yes type: string sql: case when ${is_scheduled_day_neg_01} then cast(${preference_num_day_neg_01} as string) else 'O'   end ;; }
  dimension: text_is_scheduled {            hidden:yes type: string sql: case when ${is_scheduled}            then cast(${preference_num}            as string) else 'T'   end ;; }
  dimension: text_is_scheduled_day_pos_07 { hidden:yes type: string sql: case when ${is_scheduled_day_pos_07} then cast(${preference_num_day_pos_07} as string) else 'O'   end ;; }
  dimension: text_is_scheduled_day_pos_06 { hidden:yes type: string sql: case when ${is_scheduled_day_pos_06} then cast(${preference_num_day_pos_06} as string) else 'O'   end ;; }
  dimension: text_is_scheduled_day_pos_05 { hidden:yes type: string sql: case when ${is_scheduled_day_pos_05} then cast(${preference_num_day_pos_05} as string) else 'O'   end ;; }
  dimension: text_is_scheduled_day_pos_04 { hidden:yes type: string sql: case when ${is_scheduled_day_pos_04} then cast(${preference_num_day_pos_04} as string) else 'O'   end ;; }
  dimension: text_is_scheduled_day_pos_03 { hidden:yes type: string sql: case when ${is_scheduled_day_pos_03} then cast(${preference_num_day_pos_03} as string) else 'O'   end ;; }
  dimension: text_is_scheduled_day_pos_02 { hidden:yes type: string sql: case when ${is_scheduled_day_pos_02} then cast(${preference_num_day_pos_02} as string) else 'O'   end ;; }
  dimension: text_is_scheduled_day_pos_01 { hidden:yes type: string sql: case when ${is_scheduled_day_pos_01} then cast(${preference_num_day_pos_01} as string) else 'O'   end ;; }

  dimension: text_7_days_before_after {
    view_label: "Analytics (Staffing)"
    group_label: "Text"
    type: string
    sql: ${text_is_scheduled_day_neg_07} || ${text_is_scheduled_day_neg_06} || ${text_is_scheduled_day_neg_05} || ${text_is_scheduled_day_neg_04} || ${text_is_scheduled_day_neg_03} || ${text_is_scheduled_day_neg_02} || ${text_is_scheduled_day_neg_01} || ${text_is_scheduled} || ${text_is_scheduled_day_pos_07} || ${text_is_scheduled_day_pos_06} || ${text_is_scheduled_day_pos_05} || ${text_is_scheduled_day_pos_04} || ${text_is_scheduled_day_pos_03} || ${text_is_scheduled_day_pos_02} || ${text_is_scheduled_day_pos_01} ;;
    html:
      {% if text_is_scheduled_day_neg_07._value == '1' or text_is_scheduled_day_neg_07._value == '2' %} <font color="darkgreen">X</font>             {% elsif text_is_scheduled_day_neg_07._value == '3' or text_is_scheduled_day_neg_07._value == '4' %} <font color="orange">X</font>             {% elsif text_is_scheduled_day_neg_07._value == '5' or text_is_scheduled_day_neg_07._value == '6' %} <font color="red">X</font>             {% else %}  <font color="lightblue">O</font>           {% endif %}
      {% if text_is_scheduled_day_neg_06._value == '1' or text_is_scheduled_day_neg_06._value == '2' %} <font color="darkgreen">X</font>             {% elsif text_is_scheduled_day_neg_06._value == '3' or text_is_scheduled_day_neg_06._value == '4' %} <font color="orange">X</font>             {% elsif text_is_scheduled_day_neg_06._value == '5' or text_is_scheduled_day_neg_06._value == '6' %} <font color="red">X</font>             {% else %}  <font color="lightblue">O</font>           {% endif %}
      {% if text_is_scheduled_day_neg_05._value == '1' or text_is_scheduled_day_neg_05._value == '2' %} <font color="darkgreen">X</font>             {% elsif text_is_scheduled_day_neg_05._value == '3' or text_is_scheduled_day_neg_05._value == '4' %} <font color="orange">X</font>             {% elsif text_is_scheduled_day_neg_05._value == '5' or text_is_scheduled_day_neg_05._value == '6' %} <font color="red">X</font>             {% else %}  <font color="lightblue">O</font>           {% endif %}
      {% if text_is_scheduled_day_neg_04._value == '1' or text_is_scheduled_day_neg_04._value == '2' %} <font color="darkgreen">X</font>             {% elsif text_is_scheduled_day_neg_04._value == '3' or text_is_scheduled_day_neg_04._value == '4' %} <font color="orange">X</font>             {% elsif text_is_scheduled_day_neg_04._value == '5' or text_is_scheduled_day_neg_04._value == '6' %} <font color="red">X</font>             {% else %}  <font color="lightblue">O</font>           {% endif %}
      {% if text_is_scheduled_day_neg_03._value == '1' or text_is_scheduled_day_neg_03._value == '2' %} <font color="darkgreen">X</font>             {% elsif text_is_scheduled_day_neg_03._value == '3' or text_is_scheduled_day_neg_03._value == '4' %} <font color="orange">X</font>             {% elsif text_is_scheduled_day_neg_03._value == '5' or text_is_scheduled_day_neg_03._value == '6' %} <font color="red">X</font>             {% else %}  <font color="lightblue">O</font>           {% endif %}
      {% if text_is_scheduled_day_neg_02._value == '1' or text_is_scheduled_day_neg_02._value == '2' %} <font color="darkgreen">X</font>             {% elsif text_is_scheduled_day_neg_02._value == '3' or text_is_scheduled_day_neg_02._value == '4' %} <font color="orange">X</font>             {% elsif text_is_scheduled_day_neg_02._value == '5' or text_is_scheduled_day_neg_02._value == '6' %} <font color="red">X</font>             {% else %}  <font color="lightblue">O</font>           {% endif %}
      {% if text_is_scheduled_day_neg_01._value == '1' or text_is_scheduled_day_neg_01._value == '2' %} <font color="darkgreen">X</font>             {% elsif text_is_scheduled_day_neg_01._value == '3' or text_is_scheduled_day_neg_01._value == '4' %} <font color="orange">X</font>             {% elsif text_is_scheduled_day_neg_01._value == '5' or text_is_scheduled_day_neg_01._value == '6' %} <font color="red">X</font>             {% else %}  <font color="lightblue">O</font>           {% endif %}
      {% if text_is_scheduled._value            == '1' or text_is_scheduled._value            == '2' %} <font color="darkgreen">&nbsp;T&nbsp;</font> {% elsif text_is_scheduled._value            == '3' or text_is_scheduled._value            == '4' %} <font color="orange">&nbsp;T&nbsp;</font> {%  elsif text_is_scheduled._value           == '5' or text_is_scheduled._value            == '6' %} <font color="red">&nbsp;T&nbsp;</font> {% else %}  <font color="black">&nbsp;T&nbsp;</font>   {% endif %}
      {% if text_is_scheduled_day_pos_01._value == '1' or text_is_scheduled_day_pos_01._value == '2' %} <font color="darkgreen">X</font>             {% elsif text_is_scheduled_day_pos_01._value == '3' or text_is_scheduled_day_pos_01._value == '4' %} <font color="orange">X</font>             {% elsif text_is_scheduled_day_pos_01._value == '5' or text_is_scheduled_day_pos_01._value == '6' %} <font color="red">X</font>             {% else %}  <font color="lightblue">O</font>           {% endif %}
      {% if text_is_scheduled_day_pos_02._value == '1' or text_is_scheduled_day_pos_02._value == '2' %} <font color="darkgreen">X</font>             {% elsif text_is_scheduled_day_pos_02._value == '3' or text_is_scheduled_day_pos_02._value == '4' %} <font color="orange">X</font>             {% elsif text_is_scheduled_day_pos_02._value == '5' or text_is_scheduled_day_pos_02._value == '6' %} <font color="red">X</font>             {% else %}  <font color="lightblue">O</font>           {% endif %}
      {% if text_is_scheduled_day_pos_03._value == '1' or text_is_scheduled_day_pos_03._value == '2' %} <font color="darkgreen">X</font>             {% elsif text_is_scheduled_day_pos_03._value == '3' or text_is_scheduled_day_pos_03._value == '4' %} <font color="orange">X</font>             {% elsif text_is_scheduled_day_pos_03._value == '5' or text_is_scheduled_day_pos_03._value == '6' %} <font color="red">X</font>             {% else %}  <font color="lightblue">O</font>           {% endif %}
      {% if text_is_scheduled_day_pos_04._value == '1' or text_is_scheduled_day_pos_04._value == '2' %} <font color="darkgreen">X</font>             {% elsif text_is_scheduled_day_pos_04._value == '3' or text_is_scheduled_day_pos_04._value == '4' %} <font color="orange">X</font>             {% elsif text_is_scheduled_day_pos_04._value == '5' or text_is_scheduled_day_pos_04._value == '6' %} <font color="red">X</font>             {% else %}  <font color="lightblue">O</font>           {% endif %}
      {% if text_is_scheduled_day_pos_05._value == '1' or text_is_scheduled_day_pos_05._value == '2' %} <font color="darkgreen">X</font>             {% elsif text_is_scheduled_day_pos_05._value == '3' or text_is_scheduled_day_pos_05._value == '4' %} <font color="orange">X</font>             {% elsif text_is_scheduled_day_pos_05._value == '5' or text_is_scheduled_day_pos_05._value == '6' %} <font color="red">X</font>             {% else %}  <font color="lightblue">O</font>           {% endif %}
      {% if text_is_scheduled_day_pos_06._value == '1' or text_is_scheduled_day_pos_06._value == '2' %} <font color="darkgreen">X</font>             {% elsif text_is_scheduled_day_pos_06._value == '3' or text_is_scheduled_day_pos_06._value == '4' %} <font color="orange">X</font>             {% elsif text_is_scheduled_day_pos_06._value == '5' or text_is_scheduled_day_pos_06._value == '6' %} <font color="red">X</font>             {% else %}  <font color="lightblue">O</font>           {% endif %}
      {% if text_is_scheduled_day_pos_07._value == '1' or text_is_scheduled_day_pos_07._value == '2' %} <font color="darkgreen">X</font>             {% elsif text_is_scheduled_day_pos_07._value == '3' or text_is_scheduled_day_pos_07._value == '4' %} <font color="orange">X</font>             {% elsif text_is_scheduled_day_pos_07._value == '5' or text_is_scheduled_day_pos_07._value == '6' %} <font color="red">X</font>             {% else %}  <font color="lightblue">O</font>           {% endif %}
    ;;
  }

### Total Score

  dimension: score_total {
    view_label: "Analytics (Staffing)"
    group_label: "Score"
    type: number
    sql:
        ${score_fte_min}
      + ${score_preference}
      + ${score_day_night_switching}
      + ${score_position}
      + ${score_proficiency}
      + ${score_competency}
    ;;
  }

  dimension: score_total_overstaffing {
    view_label: "Analytics (Staffing)"
    group_label: "Score (Overstaffing)"
    type: number
    sql:
        ${score_fte_min_overstaffing}
      + ${score_preference_overstaffing}
      + ${score_day_night_switching_overstaffing}
      + ${score_position_overstaffing}
      + ${score_proficiency_overstaffing}
      + ${score_competency_overstaffing}
    ;;
  }

#######################
### Measures
#######################

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}

### Position mapping
view: backup_position_mapping {
  derived_table: {
    sql:
      SELECT 'CNC' as position, 'RN' as backup_position
    ;;
  }
  dimension: position {}
  dimension: backup_position {}
}

### List of competencies

view: staffing_app_staff_competency_filter {
  derived_table: {
    sql:
      with all_rows as (
        SELECT
            run_name_id
          , staff_id
        FROM optimizer.analytics_table_07_staff_competency_dim
        GROUP BY 1,2
      )
      , required_run_staff as (
        SELECT
            run_name_id
          , staff_id
          , staff_competency_name
        FROM optimizer.analytics_table_07_staff_competency_dim
        WHERE {% condition staffing_app_table.competency_required %} staff_competency_name {% endcondition %}
        AND staff_competency_answer
        GROUP BY 1,2,3
      )
      , nice_to_have_run_staff as (
        SELECT
            run_name_id
          , staff_id
          , staff_competency_name
        FROM optimizer.analytics_table_07_staff_competency_dim
        WHERE {% condition staffing_app_table.competency_nice_to_have %} staff_competency_name {% endcondition %}
        AND staff_competency_answer
        GROUP BY 1,2,3
      )
      , required_num_comp as (
        SELECT
            run_name_id
          , staff_competency_name
        FROM optimizer.analytics_table_07_staff_competency_dim
        WHERE {% condition staffing_app_table.competency_required %} staff_competency_name {% endcondition %}
        GROUP BY 1,2
      )
      , nice_to_have_num_comp as (
        SELECT
            run_name_id
          , staff_competency_name
        FROM optimizer.analytics_table_07_staff_competency_dim
        WHERE {% condition staffing_app_table.competency_nice_to_have %} staff_competency_name {% endcondition %}
        GROUP BY 1,2
      )
      SELECT
          a.run_name_id
        , a.staff_id
        , STRING_AGG(distinct b.staff_competency_name ORDER BY b.staff_competency_name) AS text_required
        , STRING_AGG(distinct c.staff_competency_name ORDER BY c.staff_competency_name) AS text_nice_to_have
        , count(distinct b.staff_competency_name) as count_comptency_required_staff
        , count(distinct c.staff_competency_name) as count_comptency_nice_to_have_staff
        , count(distinct d.staff_competency_name) as count_comptency_required_total
        , count(distinct e.staff_competency_name) as count_comptency_nice_to_have_total
      FROM all_rows a
      LEFT JOIN required_run_staff b
        ON a.run_name_id = b.run_name_id
        AND a.staff_id = b.staff_id
      LEFT JOIN nice_to_have_run_staff c
        ON a.run_name_id = c.run_name_id
        AND a.staff_id = c.staff_id
      LEFT JOIN required_num_comp d
        ON a.run_name_id = d.run_name_id
      LEFT JOIN nice_to_have_num_comp e
        ON a.run_name_id = e.run_name_id
      GROUP BY 1,2
    ;;
  }

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${run_name_id} || '|' || ${staff_id} ;;
  }

#######################
### Original Dimensions
#######################

  dimension: run_name_id {
    hidden: yes
    type: string
  }
  dimension: staff_id {
    hidden: yes
    type: string
  }
  dimension: text_required {
    hidden: no
    type: string
  }
  dimension: text_nice_to_have {
    hidden: no
    type: string
  }
  dimension: count_comptency_required_staff {
    hidden: yes
    type: number
  }
  dimension: count_comptency_nice_to_have_staff {
    hidden: yes
    type: number
  }
  dimension: count_comptency_required_total {
    hidden: yes
    type: number
  }
  dimension: count_comptency_nice_to_have_total {
    hidden: yes
    type: number
  }

#######################
### Derived Dimensions
#######################

  dimension: count_comptency_required_missing {
    hidden: yes
    type: number
    sql: ${count_comptency_required_total} - ${count_comptency_required_staff} ;;
  }

  dimension: count_comptency_nice_to_have_missing {
    hidden: yes
    type: number
    sql: ${count_comptency_nice_to_have_total} - ${count_comptency_nice_to_have_staff} ;;
  }

  dimension: count_hit {
    hidden: yes
    type: number
    sql: ${count_comptency_required_staff} + ${count_comptency_nice_to_have_staff} ;;
  }

  dimension: count_total {
    hidden: yes
    type: number
    sql: ${count_comptency_required_total} + ${count_comptency_nice_to_have_total} ;;
  }

  dimension: percent_hit {
    hidden: yes
    type: number
    sql: ${count_hit} / nullif(${count_total},0) ;;
    value_format_name: percent_1
  }


#######################
### Measures
#######################
}
