--Создание таблицы с исходными данными Taxi 2020
create external table if not exists taxi.taxi_stg
(
vendor_id string,
tpep_pickup_datetime timestamp,
tpep_dropoff_datetime timestamp,
passenger_count int,
trip_distance double,
ratecode_id int,
store_and_fwd_flag string,
pulocation_id int,
dolocation_id int,
payment_type int,
fare_amount double,
extra double,
mta_tax double,
tip_amount double,
tolls_amount double,
improvement_surcharge double,
total_amount double,
congestion_surcharge double
)
row format delimited
fields terminated by ','
lines terminated by '\n'
location '/user/root/2020'
TBLPROPERTIES ("skip.header.line.count"="1");

-- Создание таблицы фактов trip_fact_part партицированной по дням
create external table if not exists taxi.taxi_fact
(
vendor_id string,
tpep_pickup_datetime timestamp,
tpep_dropoff_datetime timestamp,
passenger_count int,
trip_distance double,
ratecode_id int,
store_and_fwd_flag string,
pulocation_id int,
dolocation_id int,
payment_type int,
fare_amount double,
extra double,
mta_tax double,
tip_amount double,
tolls_amount double,
improvement_surcharge double,
total_amount double,
congestion_surcharge double
)
partitioned by (dt date)
stored as parquet;