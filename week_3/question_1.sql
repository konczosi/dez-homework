-- question 1
CREATE OR REPLACE EXTERNAL TABLE `nytaxi.fhv_tripdata`
OPTIONS (
  format = 'CSV',
  uris = ['gs://dtc_data_lake_sage-nucleus-376020/data/fhv/fhv_tripdata_2019-*.csv.gz']
);

CREATE OR REPLACE TABLE `nytaxi.fhv_nonpartitioned_tripdata`
AS SELECT * FROM `nytaxi.fhv_tripdata`;

select count(1) from `nytaxi.fhv_tripdata`;

select count(1) from `nytaxi.fhv_nonpartitioned_tripdata`;
