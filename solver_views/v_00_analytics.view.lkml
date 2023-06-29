view: z_analytics {
  sql_table_name: (SELECT 'x' as x) ;;

  dimension: x {
    primary_key: yes
    hidden: yes
  }

#######################
### 1. Skill Mix
#######################

  ## Available
  measure: sum_skill_mix_available {
    view_label: "Analytics"
    group_label: "1 Skill Mix"
    label: "D Skill Mix Available"
    type: count_distinct
    sql: ${shift_staff_fact.pk} ;;
    filters: [shift_staff_fact.is_same_position_and_available: "Yes"]
  }

  ## Filled
  measure: sum_skill_mix_filled {
    view_label: "Analytics"
    group_label: "1 Skill Mix"
    label: "A Skill Mix Filled"
    type: count_distinct
    sql: ${shift_staff_fact.pk} ;;
    filters: [shift_staff_fact.is_same_position_and_scheduled: "Yes"]
  }

  ## Required
  measure: sum_skill_mix_required {
    view_label: "Analytics"
    group_label: "1 Skill Mix"
    label: "B Skill Mix Required"
    type: number
    sql: ${shift_target_dim.sum_skill_mix_target} ;;
  }

  ## Ratio
  measure: skill_mix_ratio_filled_required {
    view_label: "Analytics"
    group_label: "1 Skill Mix"
    label: "C Skill Mix %"
    type: number
    sql: ${sum_skill_mix_filled} / nullif(${sum_skill_mix_required},0) ;;
    value_format_name: percent_1
    html: {{rendered_value }} ({{ sum_skill_mix_filled._rendered_value }}/{{ sum_skill_mix_required._rendered_value }});;
  }

  ## Ratio used for score (it forced higher # at bottom, lower # at top) -- this forces the value to be btwn 0 and 100%
  measure: skill_mix_ratio_filled_required_score {
    view_label: "Analytics"
    group_label: "0 Overall Score"
    label: "1 Skill Mix Score"
    type: number
    sql: case when ${sum_skill_mix_filled} < ${sum_skill_mix_required} then ${skill_mix_ratio_filled_required} else 1 / ${skill_mix_ratio_filled_required} end ;;
    value_format_name: percent_1
  }

  ## Ratio Available (input only)
  measure: skill_mix_ratio_available_required {
    view_label: "Analytics"
    group_label: "1 Skill Mix"
    label: "E Skill Mix % Available (Input Only)"
    type: number
    sql: ${sum_skill_mix_available} / nullif(${sum_skill_mix_required},0) ;;
    value_format_name: percent_1
  }

#######################
### 2. Proficiency Mix
#######################

### Advanced

  ## Available
  measure: sum_proficiency_mix_available_advanced {
    view_label: "Analytics"
    group_label: "2 Proficiency Mix (Advanced)"
    label: "D Proficiency Mix Available (Advanced)"
    type: count_distinct
    sql: ${shift_staff_fact.pk} ;;
    filters: [shift_staff_fact.is_advanced_and_available: "Yes"]
  }

  ## Filled
  measure: sum_proficiency_mix_filled_advanced {
    view_label: "Analytics"
    group_label: "2 Proficiency Mix (Advanced)"
    label: "A Proficiency Mix Filled (Advanced)"
    type: count_distinct
    sql: ${shift_staff_fact.pk} ;;
    filters: [shift_staff_fact.is_advanced_and_scheduled: "Yes"]
  }

  measure: sum_proficiency_mix_required_advanced {
    view_label: "Analytics"
    group_label: "2 Proficiency Mix (Advanced)"
    label: "B Proficiency Mix Required (Advanced)"
    type: number
    sql: ${shift_staff_fact.count_scheduled} * 0.25 ;;
    value_format_name: decimal_1
  }

  ## Ratio
  measure: proficiency_mix_ratio_filled_required_advanced {
    view_label: "Analytics"
    group_label: "2 Proficiency Mix (Advanced)"
    label: "C Proficiency Mix % (Advanced)"
    type: number
    sql: ${sum_proficiency_mix_filled_advanced} / nullif(${sum_proficiency_mix_required_advanced},0) ;;
    value_format_name: percent_1
    html: {{rendered_value }} ({{ sum_proficiency_mix_filled_advanced._rendered_value }}/{{ sum_proficiency_mix_required_advanced._rendered_value }});;
  }

  ## Ratio Available (input only)
  measure: proficiency_mix_ratio_available_required_advanced {
    view_label: "Analytics"
    group_label: "2 Proficiency Mix (Advanced)"
    label: "E Proficiency Mix % Available (Input Only) (Advanced)"
    type: number
    sql: ${sum_proficiency_mix_available_advanced} / nullif(${sum_proficiency_mix_required_advanced},0) ;;
    value_format_name: percent_1
  }

### Beginner

  ## Available
  measure: sum_proficiency_mix_available_beginner {
    view_label: "Analytics"
    group_label: "2 Proficiency Mix (Beginner)"
    label: "D Proficiency Mix Available (Beginner)"
    type: count_distinct
    sql: ${shift_staff_fact.pk} ;;
    filters: [shift_staff_fact.is_beginner_and_available: "Yes"]
  }

  ## Filled
  measure: sum_proficiency_mix_filled_beginner {
    view_label: "Analytics"
    group_label: "2 Proficiency Mix (Beginner)"
    label: "A Proficiency Mix Filled (Beginner)"
    type: count_distinct
    sql: ${shift_staff_fact.pk} ;;
    filters: [shift_staff_fact.is_beginner_and_scheduled: "Yes"]
  }

  measure: sum_proficiency_mix_required_beginner {
    view_label: "Analytics"
    group_label: "2 Proficiency Mix (Beginner)"
    label: "B Proficiency Mix Required (Beginner)"
    type: number
    sql: ${shift_staff_fact.count_scheduled} * 0.25 ;;
    value_format_name: decimal_1
  }

  ## Ratio
  measure: proficiency_mix_ratio_filled_required_beginner {
    view_label: "Analytics"
    group_label: "2 Proficiency Mix (Beginner)"
    label: "C Proficiency Mix % (Beginner)"
    type: number
    sql: ${sum_proficiency_mix_filled_beginner} / nullif(${sum_proficiency_mix_required_beginner},0) ;;
    value_format_name: percent_1
    html: {{rendered_value }} ({{ sum_proficiency_mix_filled_beginner._rendered_value }}/{{ sum_proficiency_mix_required_beginner._rendered_value }});;
  }

  ## Ratio Available (input only)
  measure: proficiency_mix_ratio_available_required_beginner {
    view_label: "Analytics"
    group_label: "2 Proficiency Mix (Beginner)"
    label: "E Proficiency Mix % Available (Input Only) (Beginner)"
    type: number
    sql: ${sum_proficiency_mix_available_beginner} / nullif(${sum_proficiency_mix_required_beginner},0) ;;
    value_format_name: percent_1
  }

### Final Score combining them

  ## If we have too many advanced people, great - call it 100% covered; If we have too few, then use the ratio
  ## If we have too few novices, great - call it 100% covered; If we have too many, then use the ratio
  ## Then take the straight average of both
  measure: proficiency_mix_ratio_filled_required_score {
    view_label: "Analytics"
    group_label: "0 Overall Score"
    label: "2 Proficiency Mix Score"
    type: number
    sql:
      (
        -- This is the score for advanced -- not the arrow b/c we don't mind too many
        case
          when ${sum_proficiency_mix_filled_advanced} > ${sum_proficiency_mix_required_advanced} then 1
          else ${sum_proficiency_mix_filled_advanced} / nullif(${sum_proficiency_mix_required_advanced},0)
        end
        +
        -- This is the score for beginner -- not the arrow b/c we don't mind too few
        case
          when ${sum_proficiency_mix_filled_beginner} <= ${sum_proficiency_mix_required_beginner} then 1
          else 0
        end
      )
      -- Then take a straight average
        / 2
      ;;
    value_format_name: percent_1
  }

  # #
  # sql:
  #     case
  #       when ${sum_proficiency_mix_filled_advanced} > ${sum_proficiency_mix_required_advanced} then 1
  #       else ${sum_proficiency_mix_filled} / nullif(${sum_proficiency_mix_required},0)
  #     end ;;


#######################
### 3. FTE Min
#######################

  ## Met FTE Min
  measure: count_met_fte_min {
     view_label: "Analytics"
     group_label: "3 FTE Min"
     label: "A Met FTE Min"
    # view_label: "Apple"
    # group_label: "Banana"
    # label: "Carrot"
    type: number
    sql: ${staff_week_dim.count_met_fte_min} ;;
  }

  ## Total Number
  measure: count_fte_min_total {
    view_label: "Analytics"
    group_label: "3 FTE Min"
    label: "B FTE Min Total"
    type: number
    sql: ${staff_week_dim.count} ;;
  }

  ## Ratio
  measure: fte_min_ratio {
    view_label: "Analytics"
    group_label: "3 FTE Min"
    label: "C FTE Min %"
    type: number
    sql: ${count_met_fte_min} / nullif(${count_fte_min_total},0) ;;
    value_format_name: percent_1
  }

  ## Ratio used for score -- same as one above
  measure: fte_min_ratio_score {
    view_label: "Analytics"
    group_label: "0 Overall Score"
    label: "3 FTE Min Score"
    type: number
    sql: ${fte_min_ratio} ;;
    value_format_name: percent_1
  }

  ## Magnitude of the FTE min - not just a binary or hit or not
  measure: average_fte_scheduled {
    view_label: "Analytics"
    group_label: "3 FTE Min"
    label: "D FTE Min Avg Magnitude"
    type: number
    ## numerator: sum of actually scheduled shifts -- shift_staff_fact.count_scheduled
    ## denominator: sum of FTE min -- # required shifts / week minus # PTO shifts / week -- staff_week_dim.sum_fte_shifts_required_after_pto
    sql: ${shift_staff_fact.count_scheduled} / nullif(${staff_week_dim.sum_fte_shifts_required_after_pto},0) ;;
    value_format_name: percent_1
    html: {{rendered_value}} ({{ shift_staff_fact.count_scheduled._rendered_value }} / {{ staff_week_dim.sum_fte_shifts_required_after_pto._rendered_value }}) ;;
  }

#######################
### 4. Staff Satisfaction
#######################

  ## Available
  measure: count_available {
    view_label: "Analytics"
    group_label: "4 Staff Satisfaction"
    label: "D Proficiency Mix Available"
    type: number
    sql: ${shift_staff_fact.count_available} ;;
  }

  ## Count Satisfied & Scheduled
  measure: count_satisfied_scheduled {
    view_label: "Analytics"
    group_label: "4 Staff Satisfaction"
    label: "A Count Satisfied"
    type: count_distinct
    sql: ${shift_staff_fact.pk} ;;
    filters: [shift_staff_fact.is_satisfied_and_scheduled: "Yes"]
  }

  ## Count Scheduled
  measure: count_scheduled {
    view_label: "Analytics"
    group_label: "4 Staff Satisfaction"
    label: "B Count Total"
    type: number
    sql: ${shift_staff_fact.count_scheduled} ;;
  }

  ## Ratio
  measure: staff_satisfaction_ratio {
    view_label: "Analytics"
    group_label: "4 Staff Satisfaction"
    label: "C Staff Satisfaction %"
    type: number
    sql: ${count_satisfied_scheduled} / nullif(${count_scheduled},0) ;;
    value_format_name: percent_1
  }

  ## Ratio again - this time for the score
  measure: staff_satisfaction_ratio_score {
    view_label: "Analytics"
    group_label: "0 Overall Score"
    label: "4 Staff Satisfaction Score"
    type: number
    sql: ${staff_satisfaction_ratio} ;;
    value_format_name: percent_1
  }

  ## Ratio Available (input only)
  measure: staff_satisfaction_ratio_available {
    view_label: "Analytics"
    group_label: "4 Staff Satisfaction"
    label: "E Staff Satisfaction % Available (Input Only)"
    type: number
    sql: ${count_available} / nullif(${sum_skill_mix_required},0) ;;
    value_format_name: percent_1
  }

  ## Actual Score
  measure: average_satisfaction_score {
    view_label: "Analytics"
    group_label: "4 Staff Satisfaction"
    label: "F Avg Staff Satisfaction Score"
    type: average
    sql: ${staff_satisfaction_dim.shift_score} ;;
    drill_fields: [
        staff_satisfaction_dim.rule
      , staff_satisfaction_dim.penalty_or_bonus
      , staff_satisfaction_dim.average_score
    ]
  }

#######################
### 5. Cost
#######################

  ## Available
  measure: sum_core_non_ot_labor_available {
    view_label: "Analytics"
    group_label: "5 Cost"
    label: "D Core Non-OT Labor Available"
    type: count_distinct
    sql: ${shift_staff_fact.pk} ;;
    filters: [shift_staff_fact.is_core_non_ot_and_available: "Yes"]
  }

  ## Filled
  measure: sum_core_non_ot_labor_filled {
    view_label: "Analytics"
    group_label: "5 Cost"
    label: "A Core Non-OT Labor Filled"
    type: count_distinct
    sql: ${shift_staff_fact.pk} ;;
    filters: [shift_staff_fact.is_core_non_ot_and_scheduled: "Yes"]
  }

  ## Required
  measure: sum_total_labor_required {
    view_label: "Analytics"
    group_label: "5 Cost"
    label: "B Total Labor Required"
    type: number
    sql: ${shift_target_dim.sum_skill_mix_target} ;;
  }

  ## Ratio
  measure: cost_ratio_filled_required {
    view_label: "Analytics"
    group_label: "5 Cost"
    label: "C Core Non-OT %"
    type: number
    sql: ${sum_core_non_ot_labor_filled} / nullif(${sum_total_labor_required},0) ;;
    value_format_name: percent_1
    html: {{rendered_value }} ({{ sum_core_non_ot_labor_filled._rendered_value }}/{{ sum_total_labor_required._rendered_value }});;
  }

  ## Ratio used for score (it forced higher # at bottom, lower # at top) -- this forces the value to be btwn 0 and 100%
  measure: cost_ratio_filled_required_score {
    view_label: "Analytics"
    group_label: "0 Overall Score"
    label: "5 Cost Score"
    type: number
    sql: case when ${sum_core_non_ot_labor_filled} < ${sum_total_labor_required} then ${cost_ratio_filled_required} else 1 / ${cost_ratio_filled_required} end ;;
    value_format_name: percent_1
  }

  ## Ratio Available (input only)
  measure: cost_mix_ratio_available_required {
    view_label: "Analytics"
    group_label: "5 Cost"
    label: "E Core Non-OT % Available (Input Only)"
    type: number
    sql: ${sum_core_non_ot_labor_available} / nullif(${sum_total_labor_required},0) ;;
    value_format_name: percent_1
  }

#######################
### Overall Score
#######################

  ## Let users pick weights
  parameter: weight_skill_mix {
    view_label: "Analytics"
    group_label: "0 Overall Score"
    label: "1 Skill Mix Weight"
    type:  unquoted
    default_value: "High"
    allowed_value: { label: "High" value: "High" }
    allowed_value: { label: "Medium" value: "Medium" }
    allowed_value: { label: "Low" value: "Low" }
  }

  parameter: weight_competency_mix {
    view_label: "Analytics"
    group_label: "0 Overall Score"
    label: "2 Competency Mix Weight"
    type:  unquoted
    default_value: "Medium"
    allowed_value: { label: "High" value: "High" }
    allowed_value: { label: "Medium" value: "Medium" }
    allowed_value: { label: "Low" value: "Low" }
  }

  parameter: weight_fte_requirements {
    view_label: "Analytics"
    group_label: "0 Overall Score"
    label: "3 FTE Hours Weight"
    type:  unquoted
    default_value: "High"
    allowed_value: { label: "High" value: "High" }
    allowed_value: { label: "Medium" value: "Medium" }
    allowed_value: { label: "Low" value: "Low" }
  }

  parameter: weight_staff_satisfaction {
    view_label: "Analytics"
    group_label: "0 Overall Score"
    label: "4 Staff Satisfaction Weight"
    type:  unquoted
    default_value: "Low"
    allowed_value: { label: "High" value: "High" }
    allowed_value: { label: "Medium" value: "Medium" }
    allowed_value: { label: "Low" value: "Low" }
  }

  parameter: weight_cost {
    view_label: "Analytics"
    group_label: "0 Overall Score"
    label: "5 Cost Weight"
    type:  unquoted
    default_value: "Medium"
    allowed_value: { label: "High" value: "High" }
    allowed_value: { label: "Medium" value: "Medium" }
    allowed_value: { label: "Low" value: "Low" }
  }

  ## Convert weights to numbers
  dimension: weight_skill_mix_dim {
    hidden: yes
    type: string
    sql:
      {% if weight_skill_mix._parameter_value == 'High' %} 3
      {% elsif weight_skill_mix._parameter_value == 'Medium' %} 2
      {% else %} 1
      {% endif %}
    ;;
  }

  dimension: weight_competency_mix_dim {
    hidden: yes
    type: string
    sql:
      {% if weight_competency_mix._parameter_value == 'High' %} 3
      {% elsif weight_competency_mix._parameter_value == 'Medium' %} 2
      {% else %} 1
      {% endif %}
    ;;
  }

  dimension: weight_fte_requirements_dim {
    hidden: yes
    type: string
    sql:
      {% if weight_fte_requirements._parameter_value == 'High' %} 3
      {% elsif weight_fte_requirements._parameter_value == 'Medium' %} 2
      {% else %} 1
      {% endif %}
    ;;
  }

  dimension: weight_staff_satisfaction_dim {
    hidden: yes
    type: string
    sql:
      {% if weight_staff_satisfaction._parameter_value == 'High' %} 3
      {% elsif weight_staff_satisfaction._parameter_value == 'Medium' %} 2
      {% else %} 1
      {% endif %}
    ;;
  }

  dimension: weight_cost_dim {
    hidden: yes
    type: string
    sql:
      {% if weight_cost._parameter_value == 'High' %} 3
      {% elsif weight_cost._parameter_value == 'Medium' %} 2
      {% else %} 1
      {% endif %}
    ;;
  }

  measure: overall_score {
    view_label: "Analytics"
    group_label: "0 Overall Score"
    label: "0 Overall Score"
    type: number
    value_format_name: percent_1
    sql:
          (
            ${skill_mix_ratio_filled_required_score} * ${weight_skill_mix_dim}
        +   ${proficiency_mix_ratio_filled_required_score} * ${weight_competency_mix_dim}
        +   ${fte_min_ratio_score} * ${weight_fte_requirements_dim}
        +   ${staff_satisfaction_ratio_score} * ${weight_staff_satisfaction_dim}
        +   ${cost_ratio_filled_required_score} * ${weight_cost_dim}
      ) /
      nullif((${weight_skill_mix_dim} + ${weight_competency_mix_dim} + ${weight_fte_requirements_dim} + ${weight_staff_satisfaction_dim} + ${weight_cost_dim}),0)
    ;;
  }

  measure: grade {
    view_label: "Analytics"
    group_label: "0 Overall Score"
    label: "Grade"
    type: string
    sql:
      case
        when ${overall_score} > 0.9 then 'A'
        when ${overall_score} > 0.8 then 'B'
        when ${overall_score} > 0.7 then 'C'
        else 'F'
      end
        ;;
    html:
      {% if value == "A" %}
        <font color="green">{{ value }}</font>
      {% elsif value == "B" %}
        <font color="orange">{{ value }}</font>
      {% elsif value == "C" %}
        <font color="orange">{{ value }}</font>
      {% else %}
        <font color="red">{{ value }}</font>
      {% endif %} ;;
  }

#######################
### Competency Mix
#######################

### # Avalable -- for that competency
  measure: sum_competency_mix_available {
    view_label: "Analytics"
    group_label: "9 Competency Mix"
    label: "D Competency Mix Available"
    type: count_distinct
    sql: ${shift_staff_fact.pk} ;;
    filters: [shift_staff_fact.is_competent_and_available: "Yes"]
  }

### Numerator: # scheduled for that competency
  measure: sum_competency_mix_filled {
    view_label: "Analytics"
    group_label: "9 Competency Mix"
    label: "A Competency Mix Filled"
    type: count_distinct
    sql: ${shift_staff_fact.pk} ;;
    filters: [shift_staff_fact.is_competent_and_scheduled: "Yes"]
  }

### Denom: # required for that competency (based on our old rules)
  measure: sum_competency_mix_required {
    view_label: "Analytics"
    group_label: "9 Competency Mix"
    label: "B Competency Mix Required"
    type: number
    sql: ${shift_competency_dim.sum_competency_mix_target} ;;
    value_format_name: decimal_1
  }

### Ratio of two values
  measure: competency_mix_ratio_filled_required {
    view_label: "Analytics"
    group_label: "9 Competency Mix"
    label: "C Competency Mix %"
    type: number
    sql: ${sum_competency_mix_filled} / nullif(${sum_competency_mix_required},0) ;;
    value_format_name: percent_1
    html: {{rendered_value }} ({{ sum_competency_mix_filled._rendered_value }}/{{ sum_competency_mix_required._rendered_value }});;
  }

### Ratio Available (input only)
  measure: competency_mix_ratio_available_required {
    view_label: "Analytics"
    group_label: "9 Competency Mix"
    label: "E Competency Mix % Available (Input Only)"
    type: number
    sql: ${sum_competency_mix_available} / nullif(${sum_competency_mix_required},0) ;;
    value_format_name: percent_1
  }


  # ## Filled




}
























################### GRAVEYARD ###################


# join: z_analytics_shift_target_dim {
#   relationship: one_to_one
#   sql_on:
#         ${shift_target_dim.run_name_id} = ${z_analytics_shift_target_dim.run_name_id}
#     AND ${shift_target_dim.shift_id} = ${z_analytics_shift_target_dim.shift_id}
#     AND ${shift_target_dim.skill_mix_name} = ${z_analytics_shift_target_dim.skill_mix_name}
#   ;;
# }

# ### Table that summarizes run_name + shift_id

# view: z_analytics_shift_target_dim {
#   derived_table: {
#     explore_source: shift_staff_fact {
#       column: shift_id {}
#       column: run_name_id {}
#       column: skill_mix_name { field: shift_target_dim.skill_mix_name }
#       column: distance_from_perfect { field: z_analytics.distance_from_perfect }
#     }
#   }
#   dimension: pk {
#     primary_key: yes
#     type: string
#     sql: ${run_name_id} || '|' || ${shift_id} ;;
#   }
#   dimension: run_name_id {
#     hidden: yes
#   }
#   dimension: shift_id {
#     hidden: yes
#     type: number
#   }
#   dimension: skill_mix_name {
#     hidden: yes
#     type: number
#   }
#   dimension: distance_from_perfect {
#     hidden: yes
#     type: number
#   }
#   measure: average_distance_from_perfect {
#     view_label: "Analytics"
#     group_label: "Overall Score"
#     label: "(1) Skill Mix"
#     type: average
#     sql: abs(1 - ${distance_from_perfect}) ;;
#     value_format_name: percent_1
#   }
# }




  # ## Available
  # measure: sum_proficiency_mix_available {
  #   view_label: "Analytics"
  #   group_label: "2 Proficiency Mix"
  #   label: "D Proficiency Mix Available"
  #   type: count_distinct
  #   sql: ${shift_staff_fact.pk} ;;
  #   filters: [shift_staff_fact.is_proficient_and_available: "Yes"]
  # }

  # ## Filled
  # measure: sum_proficiency_mix_filled {
  #   view_label: "Analytics"
  #   group_label: "2 Proficiency Mix"
  #   label: "A Proficiency Mix Filled"
  #   type: count_distinct
  #   sql: ${shift_staff_fact.pk} ;;
  #   filters: [shift_staff_fact.is_proficient_and_scheduled: "Yes"]
  # }

# ## Required -- 20% of all people scheduled must be experienced
# measure: sum_proficiency_mix_required {
#   view_label: "Analytics"
#   group_label: "2 Proficiency Mix"
#   label: "B Proficiency Mix Required"
#   type: number
#   sql: ${shift_staff_fact.count_scheduled} * 0.2 ;;
#   value_format_name: decimal_1
# }

# ## Ratio
# measure: proficiency_mix_ratio_filled_required {
#   view_label: "Analytics"
#   group_label: "2 Proficiency Mix"
#   label: "C Proficiency Mix %"
#   type: number
#   sql: ${sum_proficiency_mix_filled} / nullif(${sum_proficiency_mix_required},0) ;;
#   value_format_name: percent_1
#   html: {{rendered_value }} ({{ sum_proficiency_mix_filled._rendered_value }}/{{ sum_proficiency_mix_required._rendered_value }});;
# }

# ## Ratio used for score (it forced higher # at bottom, lower # at top) -- this forces the value to be btwn 0 and 100%
# measure: proficiency_mix_ratio_filled_required_score {
#   view_label: "Analytics"
#   group_label: "0 Overall Score"
#   label: "2 Proficiency Mix Score"
#   type: number
#   sql: case when ${sum_proficiency_mix_filled} < ${sum_proficiency_mix_required} then ${proficiency_mix_ratio_filled_required} else 1/${proficiency_mix_ratio_filled_required} end ;;
#   value_format_name: percent_1
# }

# ## Ratio Available (input only)
# measure: proficiency_mix_ratio_available_required {
#   view_label: "Analytics"
#   group_label: "2 Proficiency Mix"
#   label: "E Proficiency Mix % Available (Input Only)"
#   type: number
#   sql: ${sum_proficiency_mix_available} / nullif(${sum_proficiency_mix_required},0) ;;
#   value_format_name: percent_1
# }
