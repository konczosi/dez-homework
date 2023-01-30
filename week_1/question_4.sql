SELECT
	date(lpep_dropoff_datetime),
	MAX(trip_distance)
FROM green_taxi_trips
GROUP BY date(lpep_dropoff_datetime)
ORDER BY 2 DESC
LIMIT 1
