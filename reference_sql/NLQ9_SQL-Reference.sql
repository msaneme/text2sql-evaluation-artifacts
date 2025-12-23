WITH temp_changes AS (
  SELECT 
    "entityName",
    "time",
    temperature,
    LAG(temperature) OVER (
      PARTITION BY "entityName" ORDER BY "time"
    ) AS prev_temperature
  FROM collar
)
SELECT 
  "entityName",
  "time",
  temperature,
  prev_temperature,
  (prev_temperature - temperature) AS temp_drop
FROM temp_changes
WHERE prev_temperature IS NOT NULL 
AND (prev_temperature - temperature) > 5; -- Threshold for "sudden" drop, adjust as needed