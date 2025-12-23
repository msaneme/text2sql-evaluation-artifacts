SELECT DISTINCT ON ("entityName")
"entityName", "time", temperature
FROM collar
WHERE "temperatureAnomaly" = TRUE
 ORDER BY "entityName", "time" DESC;