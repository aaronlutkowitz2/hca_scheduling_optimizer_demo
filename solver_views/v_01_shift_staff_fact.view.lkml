view: shift_staff_fact {
  sql_table_name: optimizer.analytics_table_01_shift_staff_fact
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

  dimension: day_night_switching {
    type: yesno
    sql: ${TABLE}.day_night_switching ;;
  }

  dimension: extra_hours_wanted {
    type: number
    sql: ${TABLE}.extra_hours_wanted ;;
  }

  dimension: extra_hours_willing {
    type: number
    sql: ${TABLE}.extra_hours_willing ;;
  }

  dimension: is_scheduled {
    type: yesno
    sql: ${TABLE}.is_scheduled ;;
  }

  dimension: is_scheduled_24_hours {
    type: yesno
    sql: ${TABLE}.is_scheduled_24_hours ;;
  }

  dimension: is_scheduled_htf_prefer_not {
    type: yesno
    sql: ${TABLE}.is_scheduled_htf_prefer_not ;;
  }

  dimension: is_scheduled_on_holiday_off {
    type: yesno
    sql: ${TABLE}.is_scheduled_on_holiday_off ;;
  }

  dimension: is_scheduled_ot {
    type: yesno
    ### NOTE: ZACH, KATIE, ALEXA - PLEASE CHANGE THIS COLUMN BACK TO THE PHYSICAL TABLE NAME ONCE IT'S READY!!
    sql: False ;;
    # sql: ${TABLE}.is_scheduled_ot ;;
  }

  dimension: is_scheduled_prefer {
    type: yesno
    sql: ${TABLE}.is_scheduled_prefer ;;
  }

  dimension: is_scheduled_prefer_not {
    type: yesno
    sql: ${TABLE}.is_scheduled_prefer_not ;;
  }

  dimension: is_scheduled_pto {
    type: yesno
    sql: ${TABLE}.is_scheduled_pto ;;
  }

  dimension: is_scheduled_weekend_off {
    type: yesno
    sql: ${TABLE}.is_scheduled_weekend_off ;;
  }

  dimension: is_scheduled_weekend_on {
    type: yesno
    sql: ${TABLE}.is_scheduled_weekend_on ;;
  }

  dimension: is_scheduled_x {
    type: yesno
    sql: ${TABLE}.is_scheduled_x ;;
  }

  dimension: labor_type {
    label: "Labor Type"
    type: string
    sql: ${TABLE}.labor_type ;;
  }

  dimension: preference {
    label: "preference_pre"
    hidden:  yes
    type: string
    sql: ${TABLE}.preference ;;
  }

  dimension: preference_number {
    hidden:  yes
    type: string
    sql: COALESCE(${TABLE}.preference_number,'3') ;;
  }

  dimension: run_name_id {
    view_label: "Analytics"
    type: number
    sql: ${TABLE}.run_name_id ;;
    link: {
      label: "#1 Overall - Run Number {{ value }}"
      url: "/dashboards-next/27?Time+of+Day=AM&Department=&Facility=&Period+Start+Date=&Latest+Run=No&Run+Name+ID={{value}}"
      icon_url: "http://www.google.com/s2/favicons?domain=www.looker.com"
    }
    link: {
      label: "#2 Inputs - Run Number {{ value }}"
      url: "/dashboards-next/30?Run+Name+ID={{value}}"
      icon_url: "http://www.google.com/s2/favicons?domain=www.looker.com"
    }
  }

  dimension: shift_id {
    view_label: "Analytics"
    group_label: "Shift"
    type: number
    sql: ${TABLE}.shift_id ;;
  }

  dimension: staff_id {
    view_label: "Analytics"
    group_label: "Staff"
    type: number
    sql: ${TABLE}.staff_id ;;
  }

  dimension: staff_satisfaction_score {
    type: number
    # sql: ${TABLE}.staff_satisfaction_score ;;
    sql:10;;
  }

#######################
### Derived Dimensions
#######################

  ## ASW - AZ: create a column called "position_acting_as" that Ray & Ayo will populate with who's acting as their backup position
  # For now we are incorrectly assuming this is equal to someone's position
  dimension: position_acting_as {
    type: string
    sql: ${staff_dim.position} ;;
  }

  ## This is for our "input data" dashboard
  dimension: is_available {
    type: yesno
    sql: ${preference} in ('1 - Weekend On', 'Prefer', 'Neutral');;
  }

### Skill Mix

  dimension: is_same_position_and_scheduled {
    type: yesno
    sql: ${position_acting_as} = ${shift_target_dim.skill_mix_name} and ${is_scheduled} ;;
  }

  dimension: is_same_position_and_available {
    type: yesno
    sql: ${position_acting_as} = ${shift_target_dim.skill_mix_name} and ${is_available} ;;
  }

### Proficiency

  dimension: is_advanced_and_scheduled {
    type: yesno
    sql: ${staff_competency_dim.overall_proficiency} = 'Advanced' and ${is_scheduled} ;;
  }

  dimension: is_advanced_and_available {
    type: yesno
    sql: ${staff_competency_dim.overall_proficiency} = 'Advanced' and ${is_available} ;;
  }

  dimension: is_beginner_and_scheduled {
    type: yesno
    sql: ${staff_competency_dim.overall_proficiency} = 'Beginner' and ${is_scheduled} ;;
  }

  dimension: is_beginner_and_available {
    type: yesno
    sql: ${staff_competency_dim.overall_proficiency} = 'Beginner' and ${is_available} ;;
  }

### Competency

  dimension: is_competent_and_scheduled {
    type: yesno
    sql: ${staff_competency_dim.staff_competency_name} = ${shift_competency_dim.competency_mix_name} AND ${staff_competency_dim.staff_competency_answer} and ${is_scheduled} ;;
  }

  dimension: is_competent_and_available {
    type: yesno
    sql: ${staff_competency_dim.staff_competency_name} = ${shift_competency_dim.competency_mix_name} AND ${staff_competency_dim.staff_competency_answer} and ${is_available} ;;
  }

### Staff Satisfaction

  dimension: is_satisfied_and_scheduled {
    type: yesno
    # sql: ${staff_satisfaction_score} > -1 and ${is_scheduled} ;;
    sql: ${staff_satisfaction_dim.shift_score} > -1 and ${is_scheduled} ;;
  }

  dimension: preference_text {
    label: "Preference"
    type: string
    # sql: Case when ${preference} IS NULL then 'Neutral'ELSE ${preference} END ;;
    sql: Case when length(${preference})=0 then 'Neutral' ELSE coalesce(${preference}, 'Neutral') END ;;
    order_by_field: preference_number
  }

### Cost

  dimension: is_core_non_ot_and_scheduled {
    type: yesno
    sql: ${staff_dim.job_status} = 'Core' and CASE WHEN ${is_scheduled_ot} THEN 1 ELSE 0 END = 0 and ${is_scheduled} ;;
  }

  dimension: is_core_non_ot_and_available {
    type: yesno
    sql: ${staff_dim.job_status} = 'Core' and CASE WHEN ${is_scheduled_ot} THEN 1 ELSE 0 END = 0 and ${is_available} ;;
  }
    # sql: ${staff_dim.job_status} = 'Core'
    # and CASE WHEN ${is_scheduled_ot} THEN 1 ELSE 0 END = 0
    # and ${is_available} ;;}

### Help on HTML for count scheduled

  dimension: is_scheduled_ot_easier_logic {
    hidden: yes
    type: number
    sql: CASE WHEN ${is_scheduled_ot} THEN 1 ELSE 0 END ;;
  }

  dimension: is_scheduled_easier_logic {
    hidden: yes
    type: number
    sql: CASE WHEN ${is_scheduled} THEN 1 ELSE 0 END ;;
  }

  dimension: is_scheduled_combined_easier_logic {
    hidden: yes
    type: number
    sql:
        case
          when ${is_scheduled_easier_logic} = 1 and ${is_scheduled_ot_easier_logic} = 0 then 2 -- is scheduled but not OT
          when ${is_scheduled_easier_logic} = 1 and ${is_scheduled_ot_easier_logic} = 1 then 1 -- is scheduled and OT
          when ${is_scheduled_easier_logic} = 0 then 0 -- is not scheduled
        end ;;
  }

#######################
### Measures
#######################

  measure: count {
    type: count
    drill_fields: [staff_id, shift_id, staff_dim.staff_name_34_id, shift_dim.date_dow]
  }

  measure: count_pk {
    type: count_distinct
    sql: ${pk} ;;
    drill_fields: [staff_id, shift_id, staff_dim.staff_name_34_id, shift_dim.date_dow]
  }
  dimension: current_time {
    hidden: yes
    type: date_time
    sql: current_datetime() ;;
  }

  measure: count_scheduled {
    type: count
    filters: [is_scheduled: "Yes"]
  }

  measure: count_scheduled_action_html {
    description: "This is the same thing as count scheduled but it has an action form + colored HTML for OT"
    type: count
    filters: [is_scheduled: "Yes"]
    html:
      <a href="#drillmenu" target="_self">
      {% if    is_scheduled_combined_easier_logic._value == 2 %} <p style="color: black; background-color: lightgreen; font-size:100%; text-align:center">{{ rendered_value }}</p>
      {% elsif is_scheduled_combined_easier_logic._value == 1 %} <p style="color: black; background-color: red; font-size:100%; text-align:center">{{ rendered_value }}</p>
      {% else %} <font color="grey">{{ rendered_value }}</font>
      {% endif %}
      </a>
    ;;
    action: {
      label: "Comment on this shift"
      url: "https://hooks.zapier.com/hooks/catch/4965389/ogxjw5d/"
      icon_url: "http://www.google.com/s2/favicons?domain=www.looker.com"
      form_param: {
        name: "Submitter Name"
        type: string
        default: "{{ _user_attributes['name'] }}"
      }
      form_param: {
        name: "Submitter Email"
        type: string
        default: "{{ _user_attributes['email'] }}"
      }
      form_param: {
        name: "Time Submitted"
        type: string
        default: "{{ current_time._value }}"
      }
      form_param: {
        name: "Run Name"
        type: string
        default: "{{ run_name_id._value }}"
      }
      form_param: {
        name: "How good is this selection?"
        type: select
        default: "good_choice"
        option: { name: "great_choice" label: "Great Choice" }
        option: { name: "good_choice" label: "Good Choice" }
        option: { name: "bad_choice" label: "Bad Choice" }
        option: { name: "terrible_choice" label: "Terrible Choice" }
      }
      form_param: {
        name: "Thoughts?"
        type: textarea
      }
    }
  }

  measure: count_available {
    type: count
    filters: [is_available: "Yes"]
  }
}


# ## We made this b/c we were hitting a PK error on staff_week_dim joining to shift_dim
# dimension: week_num {
#   type: number
#   sql:
#       case
#         when ${shift_id} between 1 and 14 then 1
#         when ${shift_id} between 15 and 28 then 2
#         when ${shift_id} between 29 and 42 then 3
#         when ${shift_id} between 43 and 56 then 4
#         else 9
#       end
#     ;;
# }
