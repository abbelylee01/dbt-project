-- USE the `ref` FUNCTION to SELECT FROM other models

SELECT *
FROM {{ ref('my_first_dbt_model') }}
WHERE ID = 1
