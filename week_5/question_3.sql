-- dbt fhv model
{{ config(materialized='view') }}

select
   -- fhv
   dispatching_base_num as dispatching_base_num,
   cast(pickup_datetime as timestamp) as pickup_datetime,
   cast(dropOff_datetime as timestamp) as dropoff_datetime,
   cast(PUlocationID as integer) as pickup_locationid,
   cast(DOlocationID as integer) as dropoff_locationid,
   cast(SR_Flag as numeric) as sr_flag,
   Affiliated_base_number as affiliated_base_number

from {{ source('staging','fhv_tripdata') }}

-- dbt build --m <model.sql> --var 'is_test_run: false'
{% if var('is_test_run', default=true) %}

  limit 100

{% endif %}

-- BigQuery query
SELECT 
  count(*) 
FROM `sage-nucleus-376020.dbt_konczosi.stg_fhv_tripdata`
WHERE 
  CAST(EXTRACT(YEAR from pickup_datetime) as string) = '2019';
