SELECT 
	SUM(CASE WHEN passenger_count = 2 THEN 1 ELSE 0 END) AS passenger_2,
	SUM(CASE WHEN passenger_count = 3 THEN 1 ELSE 0 END) AS passenger_3
FROM green_taxi_trips
WHERE date(lpep_pickup_datetime) = '2019-01-01'
