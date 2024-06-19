view: sanbox_sales_data {
  sql_table_name: `oxjytxr-mss-mkt-genai-accel.looker_sandbox.sanbox_sales_data` ;;

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Date ;;
    description: "The date of the sales transaction"
    label: "Transaction Date"
    tags: ["date", "transaction"]
  }

  dimension: payment_method {
    type: string
    sql: ${TABLE}.`Payment Method` ;;
    description: "The payment method used for the transaction"
    label: "Payment Method"
    tags: ["payment", "transaction"]
  }

  dimension: product_category {
    type: string
    sql: ${TABLE}.`Product Category` ;;
    description: "The category of the product sold"
    label: "Product Category"
    tags: ["product"]
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.`Product Name` ;;
    description: "The name of the product sold"
    label: "Product Name"
    tags: ["product"]
  }

  dimension: region {
    type: string
    sql: ${TABLE}.Region ;;
    description: "The region where the sales transaction occurred"
    label: "Region"
    tags: ["location", "geography"]
  }

  dimension: total_revenue {
    type: number
    sql: ${TABLE}.`Total Revenue` ;;
    description: "The total revenue generated from the sales transaction"
    label: "Total Revenue"
    tags: ["revenue", "financial"]
  }

  measure: total_total_revenue {
    type: sum
    sql: ${total_revenue} ;;
    description: "The sum of total revenue across all transactions"
    label: "Total Revenue (Sum)"
    tags: ["revenue", "financial", "sum"]
  }

  measure: average_total_revenue {
    type: average
    sql: ${total_revenue} ;;
    description: "The average total revenue per transaction"
    label: "Average Total Revenue"
    tags: ["revenue", "financial", "average"]
  }

  dimension: transaction_id {
    type: number
    sql: ${TABLE}.`Transaction ID` ;;
    description: "The unique identifier for the sales transaction"
    label: "Transaction ID"
    tags: ["transaction"]
  }

  dimension: unit_price {
    type: number
    sql: ${TABLE}.`Unit Price` ;;
    description: "The price per unit of the product sold"
    label: "Unit Price"
    tags: ["price", "product"]
  }

  dimension: units_sold {
    type: number
    sql: ${TABLE}.`Units Sold` ;;
    description: "The number of units sold in the transaction"
    label: "Units Sold"
    tags: ["quantity", "product"]
  }

  measure: total_units_sold {
    type: sum
    sql: ${units_sold} ;;
    description: "The total number of units sold across all transactions"
    label: "Total Units Sold"
    tags: ["quantity", "product", "sum"]
  }

  measure: average_units_sold {
    type: average
    sql: ${units_sold} ;;
    description: "The average number of units sold per transaction"
    label: "Average Units Sold"
    tags: ["quantity", "product", "average"]
  }

  measure: count {
    type: count
    drill_fields: [product_name]
    description: "The count of sales transactions"
    label: "Transaction Count"
    tags: ["count", "transaction"]
  }

  measure: revenue_per_unit {
    type: number
    sql: ${total_total_revenue} / NULLIF(${total_units_sold}, 0) ;;
    description: "The revenue generated per unit sold"
    label: "Revenue per Unit"
    value_format_name: usd
    tags: ["revenue", "product", "kpi"]
  }
}
