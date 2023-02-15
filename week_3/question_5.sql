-- question 5
CREATE OR REPLACE TABLE `nytaxi.fhv_partitioned_tripdata`
PARTITION BY DATE(pickup_datetime)
CLUSTER BY affiliated_base_number AS (
  SELECT * FROM `taxi-rides-ny.nytaxi.fhv_tripdata`
);

SELECT DISTINCT affiliated_base_number from `nytaxi.fhv_partitioned_tripdata`
where pickup_datetime >= "2019-03-01"
and pickup_datetime <= "2019-03-31";

SELECT DISTINCT affiliated_base_number from `nytaxi.fhv_nonpartitioned_tripdata`
where pickup_datetime >= "2019-03-01"
and pickup_datetime <= "2019-03-31";
