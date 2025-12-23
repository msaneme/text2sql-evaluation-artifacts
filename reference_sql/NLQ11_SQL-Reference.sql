SELECT DISTINCT ON ("entityName")
"entityName", "time", "activityAnomaly", "distanceAnomaly", 
       "positionAnomaly", "locationAnomaly", "temperatureAnomaly", "resourceAlarm"
FROM collar
WHERE "activityAnomaly" = TRUE 
   OR "distanceAnomaly" = TRUE 
   OR "positionAnomaly" = TRUE 
   OR "locationAnomaly" = TRUE 
   OR "temperatureAnomaly" = TRUE 
   OR "resourceAlarm" = TRUE
ORDER BY "entityName", "time" DESC;