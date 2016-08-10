- view: match_table_ad_placement_assignments
  sql_table_name: | 
        (SELECT * FROM TABLE_QUERY(
        [ekoblov-test:dcm1684], 
        'table_id= (Select MAX(table_id) 
                              FROM [ekoblov-test:dcm1684.__TABLES__]
                              where table_id contains "match_table_ad_placement_assignments_1684_")'
        )
        )
  fields:

  - dimension: ad_id
    type: string
    sql: ${TABLE}.Ad_ID

  - dimension: placement_id
    type: string
    sql: ${TABLE}.Placement_ID

  - dimension: pk
    hidden: true
    primary_key: true
    sql: CONCAT(${ad_id},'-',${placement_id})
    
  - measure: count
    type: count
    approximate_threshold: 100000
    drill_fields: []

