{{ config(materialized='table') }}

WITH source_data AS (
    SELECT 1 AS ID
    UNION all
    SELECT NULL AS ID
)

SELECT *
FROM source_data
