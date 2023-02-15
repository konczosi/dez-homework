-- question 2

SELECT COUNT(DISTINCT(dispatching_base_num)) FROM `nytaxi.fhv_tripdata`;

SELECT COUNT(DISTINCT(dispatching_base_num)) FROM `nytaxi.fhv_nonpartitioned_tripdata`;
