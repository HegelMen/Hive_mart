-- Создание view стейджинговых данных + атрибутhive для динамических партиций
create view if not exists taxi.v_taxi_stg as
    select
    vendor_id,
    tpep_pickup_datetime,
    tpep_dropoff_datetime,
    passenger_count,
    trip_distance,
    ratecode_id,
    store_and_fwd_flag,
    pulocation_id,
    dolocation_id,
    payment_type,
    fare_amount,
    extra,
    mta_tax,
    tip_amount,
    tolls_amount,
    improvement_surcharge,
    total_amount,
    congestion_surcharge,
    to_date(tpep_pickup_datetime) as dt
    from taxi.taxi_stg;

-- Заполнение таблицы фактов trip_fact_part
insert into taxi.taxi_fact partition(dt)
select * from taxi.v_taxi_stg distribute by dt;