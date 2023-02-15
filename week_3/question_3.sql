-- question 3
SELECt
    count(1)
FROM
    `nytaxi.fhv_nonpartitioned_tripdata`
WHERE
    PUlocationID IS NULL
    AND DOlocationID IS NULL
