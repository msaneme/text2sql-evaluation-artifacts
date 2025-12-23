WITH herd_dispersion AS (
  SELECT 
    "time",
    COUNT(DISTINCT "entityName") AS total_cows,
    MAX(latitude) AS max_lat,
    MIN(latitude) AS min_lat,
    MAX(longitude) AS max_lon,
    MIN(longitude) AS min_lon
  FROM collar
  WHERE latitude IS NOT NULL AND longitude IS NOT NULL
  GROUP BY "time"
),
dispersion_calc AS (
  SELECT 
    "time",
    total_cows,
    max_lat - min_lat AS lat_range,
    max_lon - min_lon AS lon_range,
    6371 * 2 * ASIN(SQRT(
      POWER(SIN(RADIANS((max_lat - min_lat) / 2)), 2) +
      COS(RADIANS(min_lat)) * COS(RADIANS(max_lat)) *
      POWER(SIN(RADIANS((max_lon - min_lon) / 2)), 2)
    )) AS dispersion_distance_km
  FROM herd_dispersion
)
SELECT 
  "time",
  total_cows,
  lat_range,
  lon_range,
  dispersion_distance_km,
  CASE 
    WHEN dispersion_distance_km < 0.1 THEN 'Bunched Up'  -- 100 metros
    ELSE 'Spread Out'
  END AS herd_status
FROM dispersion_calc
WHERE total_cows > 2
ORDER BY "time" DESC;