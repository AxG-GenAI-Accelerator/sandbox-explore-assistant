view: s_o_campaign_data {
  sql_table_name: `oxjytxr-mss-mkt-genai-accel.looker_sandbox.s_o_campaign_data` ;;

  # Dimensions
  dimension: account_region {
    type: string
    sql: ${TABLE}.account_region ;;
    label: "Account Region"
    description: "The geographic region where the booking took place."
    tags: ["region", "location", "geography"]
  }

  dimension: attributed_booking_amount {
    type: number
    sql: ${TABLE}.attributed_booking_amount ;;
    label: "Attributed Booking Amount"
    description: "The total monetary value attributed to a booking."
    tags: ["amount", "monetary", "booking"]
  }

  measure: total_Revenue  {
    type: sum
    sql: ${attributed_booking_amount} ;;
    label: "Total Attributed Booking Amount"
    description: "The total revenue generated."
    tags: ["amount", "booking", "sum", "financial","Revenue"]
  }
  measure: average_attributed_booking_amount {
    type: average
    sql: ${attributed_booking_amount} ;;
    label: "Average Attributed Booking Amount"
    description: "The average monetary value attributed to bookings."
    tags: ["amount", "average", "booking", "financial"]
  }

  dimension: booking_amount {
    type: number
    sql: ${TABLE}.booking_amount ;;
    label: "Booking Amount"
    description: "The monetary value of each booking."
    tags: ["amount", "booking", "financial"]
  }

  dimension_group: booking {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.booking_date ;;
    label: "Booking Date"
    description: "The date and time of the booking."
    tags: ["date", "booking", "time"]
  }

  dimension: booking_id {
    type: string
    sql: ${TABLE}.booking_id ;;
    label: "Booking ID"
    description: "A unique identifier for each booking transaction."
    tags: ["id", "booking"]
  }

  dimension: booking_product_group {
    type: string
    sql: ${TABLE}.booking_product_group ;;
    label: "Booking Product Group"
    description: "The product group associated with the booking."
    tags: ["product", "group", "booking"]
  }

  dimension: booking_type {
    type: string
    sql: ${TABLE}.booking_type ;;
    label: "Booking Type"
    description: "The type or classification of the booking."
    tags: ["type", "classification", "booking"]
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
    label: "Campaign ID"
    description: "A unique identifier for the marketing campaign."
    tags: ["id", "campaign"]
  }

  dimension_group: campaign_launch {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.campaign_launch_date ;;
    label: "Campaign Launch Date"
    description: "The launch date of the marketing campaign."
    tags: ["campaign", "launch"]
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
    label: "Campaign Name"
    description: "The name of the marketing campaign."
    tags: ["name", "campaign"]
  }

  measure: total_campaigns {
    type: count_distinct
    sql: ${campaign_name} ;;
    label: "Total Campaigns"
    description: "The total number of unique campaigns."
    tags: ["campaign", "count", "distinct"]
  }

  dimension: campaign_product_group {
    type: string
    sql: ${TABLE}.campaign_product_group ;;
    label: "Campaign Product Group"
    description: "The product group targeted by the marketing campaign."
    tags: ["product", "group", "campaign"]
  }

  dimension: campaign_region {
    type: string
    sql: ${TABLE}.campaign_region ;;
    label: "Campaign Region"
    description: "The geographic region targeted by the marketing campaign."
    tags: ["region", "location", "campaign", "geography"]
  }

  dimension: campaign_type {
    type: string
    sql: ${TABLE}.campaign_type ;;
    label: "Campaign Type"
    description: "The type or classification of the marketing campaign."
    tags: ["type", "classification", "campaign"]
  }

  dimension: domain {
    type: string
    sql: ${TABLE}.domain ;;
    label: "Domain"
    description: "The domain associated with the booking."
    tags: ["domain", "booking"]
  }

  dimension: email_campaign_count {
    type: number
    sql: ${TABLE}.email_campaign_count ;;
    label: "Email Campaign Count"
    description: "The count of email campaigns related to the booking."
    tags: ["email", "campaign", "count"]
  }

  dimension: engaged {
    type: yesno
    sql: ${TABLE}.engaged ;;
    label: "Engaged"
    description: "Indicates whether the account was engaged."
    tags: ["engagement", "account", "status"]
  }

  dimension_group: engagement {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.engagement_date ;;
    label: "Engagement Date"
    description: "The date and time of the engagement."
    tags: ["engagement"]
  }

  dimension: engagement_id {
    type: string
    sql: ${TABLE}.engagement_id ;;
    label: "Engagement ID"
    description: "A unique identifier for the engagement."
    tags: ["engagement", "id"]
  }

  dimension: is_sql {
    type: number
    sql: ${TABLE}.is_SQL ;;
    label: "SQL (Sales Qualified Lead)"
    description: "Indicates if the lead is an SQL (Sales Qualified Lead)."
    tags: ["lead", "sql", "status"]
  }

  dimension_group: member_response {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.member_response_date ;;
    label: "Member Response Date"
    description: "The date when the member responded."
    tags: ["response", "member"]
  }

  dimension_group: member_added {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.member_added_date ;;
    label: "Member added Date"
    description: "The date when the member is added."
    tags: ["added", "member"]
  }

  dimension: mql_is_routed {
    type: number
    sql: ${TABLE}.mql_is_routed ;;
    label: "MQL Routed"
    description: "Indicates if the MQL was routed."
    tags: ["mql", "routing", "status"]
  }

  dimension: new_lead_flag {
    type: yesno
    sql: ${TABLE}.new_lead_flag ;;
    label: "New Lead Flag"
    description: "Indicates if the lead is a new lead."
    tags: ["lead", "new", "status"]
  }

  dimension: non_email_campaign_count {
    type: number
    sql: ${TABLE}.non_email_campaign_count ;;
    label: "Non-Email Campaign Count"
    description: "The count of non-email campaigns related to the booking."
    tags: ["campaign", "non_email", "count"]
  }

  dimension: person_id {
    type: string
    sql: ${TABLE}.person_id ;;
    label: "Person ID"
    description: "A unique identifier for the person associated with the engagement."
    tags: ["person", "id", "engagement"]
  }

  dimension: product {
    type: string
    sql: ${TABLE}.product ;;
    label: "Product"
    description: "The product associated with the booking."
    tags: ["product", "booking"]
  }

  dimension: program {
    type: string
    sql: ${TABLE}.program ;;
    label: "Program"
    description: "The program associated with the booking."
    tags: ["program", "booking"]
  }

  dimension: quarter {
    type: string
    sql: ${TABLE}.Quarter ;;
    label: "Quarter"
    description: "The fiscal quarter associated with the booking."
    tags: ["quarter", "time", "booking"]
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
    label: "Region"
    description: "The region associated with the booking."
    tags: ["region", "location", "booking"]
  }

  dimension: sfdc_account_id {
    type: string
    sql: ${TABLE}.sfdc_account_id ;;
    label: "SFDC Account ID"
    description: "The Salesforce account ID associated with the booking."
    tags: ["sfdc", "account", "id"]
  }

  dimension: unique_engaged_account_flag {
    type: number
    sql: ${TABLE}.unique_engaged_account_flag ;;
    label: "Unique Engaged Account"
    description: "Indicates if the account was uniquely engaged."
    tags: ["engagement", "account", "status"]
  }
  # Measures
  measure: count {
    type: count
    drill_fields: [campaign_name]
    label: "Count of Campaigns"
    description: "The count of campaigns associated with the booking."
    tags: ["count", "campaign"]
  }

  measure: percentage_accounts_per_lead {
    type: number
    label: "% of Accounts per Lead"
    sql: SAFE_DIVIDE(
          COUNT(DISTINCT ${sfdc_account_id}),
          COUNT(DISTINCT CASE WHEN ${new_lead_flag} THEN ${person_id} END)
        ) ;;
    value_format_name: percent_2
    description: "The percentage of accounts per lead."
    tags: ["accounts", "lead"]
  }

  measure: percentage_accounts_engaged_per_mql {
    type: number
    label: "% of Accounts Engaged per MQL"
    sql: SAFE_DIVIDE(
          COUNT(DISTINCT CASE WHEN ${unique_engaged_account_flag} = 1 THEN ${sfdc_account_id} END),
          COUNT(DISTINCT CASE WHEN ${mql_is_routed} = 1 THEN ${engagement_id} END)
        ) ;;
    value_format_name: percent_2
    description: "The percentage of accounts engaged per MQL."
    tags: ["accounts", "engaged", "mql"]
  }

  measure: percentage_mqls_to_mib {
    type: number
    label: "% of MQLs to MIB"
    sql: SAFE_DIVIDE(
          COUNT(DISTINCT CASE WHEN ${attributed_booking_amount} > 0 THEN ${engagement_id} END),
          COUNT(DISTINCT CASE WHEN ${mql_is_routed} = 1 THEN ${engagement_id} END)
        ) ;;
    value_format_name: percent_2
    description: "The percentage of MQLs that converted to MIB."
    tags: ["mql", "mib"]
  }

  measure: percentage_engaged_accounts_to_mib {
    type: number
    label: "% of Engaged Accounts to MIB"
    sql: SAFE_DIVIDE(
          COUNT(DISTINCT CASE WHEN ${attributed_booking_amount} > 0 THEN ${sfdc_account_id} END),
          COUNT(DISTINCT CASE WHEN ${unique_engaged_account_flag} = 1 THEN ${sfdc_account_id} END)
        ) ;;
    value_format_name: percent_2
    description: "The percentage of engaged accounts that converted to MIB."
    tags: ["engaged", "accounts", "mib"]
  }

  dimension_group: average_time_mql_to_booking {
    type: duration
    intervals: [day, week, month, year]
    sql_start: ${TABLE}.engagement;;
    sql_end: ${TABLE}.booking;;
    label: "MQL to Booking Duration"
    description: "The time duration between MQL engagement and booking."
    tags: ["duration", "mql", "booking", "time"]
  }


  # Filters
  filter: year_filter_previous {
    type: number
    sql: ${TABLE}.Year = (EXTRACT(YEAR FROM CURRENT_DATE()) - 1) ;;
    description: "Filters data to show results for the previous year."
    label: "Previous/last Year Filter"
    tags: ["filter", "previous_year", "time", "last_year"]
  }
}
