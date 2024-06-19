# The name of this view in Looker is "Sanbox Sales Data"
view: sanbox_sales_data {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `oxjytxr-mss-mkt-genai-accel.looker_sandbox.sanbox_sales_data` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Date ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Payment Method" in Explore.

  dimension: payment_method {
    type: string
    sql: ${TABLE}.`Payment Method` ;;
  }

  dimension: product_category {
    type: string
    sql: ${TABLE}.`Product Category` ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.`Product Name` ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.Region ;;
  }

  dimension: total_revenue {
    type: number
    sql: ${TABLE}.`Total Revenue` ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_total_revenue {
    type: sum
    sql: ${total_revenue} ;;  }
  measure: average_total_revenue {
    type: average
    sql: ${total_revenue} ;;  }

  dimension: transaction_id {
    type: number
    sql: ${TABLE}.`Transaction ID` ;;
  }

  dimension: unit_price {
    type: number
    sql: ${TABLE}.`Unit Price` ;;
  }

  dimension: units_sold {
    type: number
    sql: ${TABLE}.`Units Sold` ;;
  }
  measure: count {
    type: count
    drill_fields: [product_name]
  }
}
