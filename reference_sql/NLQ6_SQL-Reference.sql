WITH distance_calculations AS (
  SELECT
    "entityName",
    DATE("time") AS day,
    RADIANS(latitude) AS lat_rad,
    RADIANS(longitude) AS lon_rad,
    LAG(RADIANS(latitude)) OVER (PARTITION BY "entityName", DATE("time") ORDER BY "time") AS prev_lat_rad,
    LAG(RADIANS(longitude)) OVER (PARTITION BY "entityName", DATE("time") ORDER BY "time") AS prev_lon_rad
  FROM collar
  WHERE latitude IS NOT NULL AND longitude IS NOT NULL
)
SELECT
  "entityName",
  day,
  SUM(
    6371 * 2 * ASIN(SQRT(
      POWER(SIN((lat_rad - prev_lat_rad) / 2), 2) +
      COS(lat_rad) * COS(prev_lat_rad) * POWER(SIN((lon_rad - prev_lon_rad) / 2), 2)
    ))
  ) AS total_distance_km
FROM distance_calculations
WHERE prev_lat_rad IS NOT NULL AND prev_lon_rad IS NOT NULL
GROUP BY "entityName", day
ORDER BY "entityName", day;