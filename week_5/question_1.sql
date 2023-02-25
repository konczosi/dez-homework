SELECT 
  count(*)
FROM `sage-nucleus-376020.production.fact_trips` 
WHERE
  CAST(EXTRACT(YEAR from pickup_datetime) as string) between '2019' and '2020'
