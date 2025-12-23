SELECT c."entityName",
       c."time",
       c.latitude,
       c.longitude,
       c.altitude
FROM collar AS c
JOIN (
    SELECT "entityName", MAX("time") AS latest_time
    FROM collar
    GROUP BY "entityName"
) AS t
    ON c."entityName" = t."entityName"
   AND c."time" = t.latest_time;