SELECT 
	COUNT(1)
FROM green_taxi_trips
WHERE date(lpep_pickup_datetime) = '2019-01-15'
AND date(lpep_dropoff_datetime) = '2019-01-15'
