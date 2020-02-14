view: sql_runner_query {
  derived_table: {
    sql: SELECT
        products.id  AS `products.id`,
        products.rank  AS `products.rank`
      FROM demo_db.products  AS products

      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: products_id {
    type: number
    sql: ${TABLE}.`products.id` ;;
  }

  dimension: products_rank {
    type: number
    sql: ${TABLE}.`products.rank` ;;
  }

  set: detail {
    fields: [products_id, products_rank]
  }
}
