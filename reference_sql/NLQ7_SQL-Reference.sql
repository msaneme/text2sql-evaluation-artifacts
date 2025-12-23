SELECT DISTINCT ON ("entityName")
 "entityName",
    COUNT(*) > 0 AS any_alarm_triggered
FROM collar
WHERE 
    "activityAnomaly" = TRUE OR
    "distanceAnomaly" = TRUE OR
    "positionAnomaly" = TRUE OR
    "locationAnomaly" = TRUE OR
    "temperatureAnomaly" = TRUE OR
    "resourceAlarm" = TRUE
 GROUP BY "entityName";