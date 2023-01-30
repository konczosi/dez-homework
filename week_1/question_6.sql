SELECT
	gt."PULocationID",
	gt."DOLocationID",
	puz."Zone" as pickup,
	doz."Zone" as dropoff,
	MAX(gt.tip_amount)
FROM green_taxi_trips gt
LEFt JOIN zones puz ON gt."PULocationID" = puz."LocationID"
LEFT JOIN zones doz ON gt."DOLocationID" = doz."LocationID"
WHERE puz."Zone" = 'Astoria'
GROUP BY 1,2,3,4
ORDER BY 5 DESC
