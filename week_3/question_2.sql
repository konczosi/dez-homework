-- question 2

SELECT COUNT(DISTINCT(affiliated_base_number)) FROM `nytaxi.fhv_tripdata`;

SELECT COUNT(DISTINCT(affiliated_base_number)) FROM `nytaxi.fhv_nonpartitioned_tripdata`;
