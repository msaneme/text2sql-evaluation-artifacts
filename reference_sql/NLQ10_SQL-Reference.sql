WITH movement_analysis AS (
    SELECT 
        "entityName",
        COUNT(*) AS movement_count,
        AVG(ABS("accX") + ABS("accY") + ABS("accZ")) AS avg_activity_level
    FROM collar
    WHERE "activityAnomaly" IS TRUE -- Exclude anomalous activity readings
    GROUP BY "entityName"
)
SELECT "entityName", avg_activity_level
FROM movement_analysis
WHERE avg_activity_level < (
    SELECT AVG(avg_activity_level) FROM movement_analysis
)
ORDER BY avg_activity_level ASC;