view: miig_synth_sales {
  sql_table_name: `oxjytxr-mss-mkt-genai-accel.looker_sandbox.miig_store_synth_data` ;;
  dimension: ice_store_id {
    type: string
    description: "Unique identifier for each store"
    sql: ${TABLE}.ice_store_id ;;
    label: "ICE Store ID"
    tags: ["store"]
  }
  dimension: store_location {
    type: location
    description: "Combined latitude and longitude coordinates of the store location"
    sql_latitude:${TABLE}.latitude ;;
    sql_longitude:${TABLE}.longitude ;;
    label: "Store Location"
    tags: ["geography", "store", "map", "coordinates"]
  }
  dimension: store_overall_rating {
    type: number
    description: "Overall Google review rating score for the store out of 5"
    sql: ${TABLE}.rating_overall_5 ;;
    label: "Store Rating"
    tags: ["rating","store"]
  }
  dimension: store_city {
    type: string
    description: "City the store is located in"
    sql: ${TABLE}.store_city ;;
    label: "City"
  }
  dimension: store_state {
    type: string
    description: "State the store is located in. Only valid for US and India"
    sql: ${TABLE}.store_state ;;
    label: "State"
  }
  dimension: postal_code {
    type: zipcode
    description: "Postal code of the store's location"
    sql: ${TABLE}.postal_code ;;
    label: "postal_code"
    tags: ["geography", "store"]
  }
  dimension: state {
    type: string
    description: "Abbreviated State the store is located in. Only for US"
    sql: ${TABLE}.state ;;
    label: "State"
    tags: ["geography", "store"]
  }
  dimension: store_address {
    type: string
    description: "Street address of the store"
    sql: ${TABLE}.store_address ;;
    label: "Address"
    tags: ["geography","store"]
  }
  dimension: footfall {
    type: number
    description: "Foot traffic in the store"
    sql: ${TABLE}.footfall_scaled ;;
    label: "Footfall"
    tags: ["footfall"]
  }
  measure: footfall_avg {
    type: average
    sql: ${footfall} ;;
    description: "Average footfall scaled"
    label: "Footfall Average"
    tags: ["footfall", "average"]
  }
  dimension: footfall_percentile {
    type: number
    description: "Foot traffic in the store, percentiled within the country"
    sql: ${TABLE}.footfall_scaled_percentile ;;
    label: "Footfall Percentile"
    tags: ["footfall"]
  }
  dimension: partner {
    type: string
    description: "Name of the carrier or retailer partner"
    sql: ${TABLE}.partner;;
    label: "Partner"
    tags: ["partner"]
  }
  dimension: chain {
    type: string
    description: "Name of the store chain"
    sql: ${TABLE}.chain_name ;;
    label: "Chain"
    tags: ["chain"]
  }
  dimension: chain_type {
    type: string
    description: "Type of store (dealer or corporate)"
    sql: ${TABLE}.chain_type ;;
    label: "Chain Type"
    tags: ["chain"]
  }
  dimension: cluster_name {
    type: string
    description: "Name of the tier the store falls into (e.g. No Regret +, Monitor, etc.)"
    sql:${TABLE}.cluster_name ;;
    label: "Cluster Name"
    tags: ["store", "tier"]
  }

  dimension: store_sales_merged {
    type: number
    sql: ${TABLE}.store_sales_merged ;;
    description: "Pixel units sold, including stores without reported sales"
    label: "Sales"
    tags: ["pixel", "sales"]
  }
  measure: sales_merged_sum {
    type: sum
    sql: ${store_sales_merged};;
    description: "Sum of all Pixel units sold, including stores without reported sales"
    value_format_name: decimal_0
    label: "Sales Sum"
    tags: ["pixel", "sales", "sum"]
  }
  measure: sales_merged_average {
    type: average
    sql: ${store_sales_merged};;
    value_format_name: decimal_0
    description: "Average of all Pixel units sold, including stores without reported sales"
    label: "Sales Average"
    tags: ["pixel", "sales", "average"]
  }
  dimension: growth_potential_by_store {
    type: number
    description: "Growth potential per store"
    sql: ${TABLE}.pixel_growth_potential ;;
    value_format_name: percent_0
    label: "Growth Potential"
    tags: ["pixel", "growth_potential","by store", "percentile"]
  }
  measure: growth_potential_average{
    type: average
    sql: ${TABLE}.pixel_growth_potential ;;
    description: "Average growth percentage used when stating the growth potential for a group of entire"
    value_format_name: percent_0
    label: "Growth Percentage Average"
    tags: ["pixel", "growth_potential", "average"]
  }
  measure: count {
    type: count
    description: "Count of stores, can be used to get the number of stores in a tier, partner, etc."
    label: "Count"
    tags: ["count", "store"]
  }
  measure: count_true{
    type: sum
    description: "Count of stores that are covered"
    sql: CASE WHEN ${TABLE}.field_team_coverage = 'Covered' THEN 1 ELSE 0 END ;;
    label: "Count True"
    tags: ["count"]
  }
  dimension: is_covered {
    type: string
    description: "String which represents a boolean if each store is covered or not"
    sql: ${TABLE}.field_team_coverage ;;
    label: "Covered"
    tags: ["coverage", "boolean"]
  }
  measure: coverage_percentage{
    type: number
    sql: ${count_true}/ ${count};;
    description: "Percentage of stores that are covered out of all the entries being looked at"
    value_format_name: percent_0
    label: "Coverage Percentage"
    tags: ["percentage", "coverage"]
  }
}
