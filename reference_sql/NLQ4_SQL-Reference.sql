SELECT DISTINCT ON ("entityName")
"entityName", "time"
FROM collar
WHERE "positionAnomaly" = TRUE 
   OR "locationAnomaly" = TRUE 
   OR "distanceAnomaly" = TRUE 
   OR "activityAnomaly" = TRUE
 ORDER BY "entityName", "time" DESC;