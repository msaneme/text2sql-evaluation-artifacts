SELECT 
  "entityName", 
  COUNT(*) AS detected_anomalies
FROM collar
WHERE 
  "activityAnomaly" = TRUE 
  OR "distanceAnomaly" = TRUE 
  OR "positionAnomaly" = TRUE 
  OR "locationAnomaly" = TRUE 
  OR "temperatureAnomaly" = TRUE 
GROUP BY "entityName";