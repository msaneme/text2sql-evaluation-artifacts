SELECT "entityName", AVG(SQRT(POWER("accX", 2) + POWER("accY", 2) + POWER("accZ", 2))) AS avg_activity
FROM collar
GROUP BY "entityName"
ORDER BY avg_activity ASC
LIMIT 10;