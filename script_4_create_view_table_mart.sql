-- СОЗДАНИЕ VIEW ДЛЯ ВЫЧИСЛЕНИЯ ВИТРИНЫ
create view taxi.v_taxi_mart as
    select
    tp.name as payment_type,
    to_date(tf.tpep_pickup_datetime) as date_trip,
    avg(tf.tip_amount) as tips_average_amount,
    sum(passenger_count)as passengers_total
    from taxi.taxi_fact tf
    join taxi.taxi_payment_type tp
        on tf.payment_type = tp.id
    --where to_date(tf.tpep_pickup_datetime) = '2020-12-24'
    --and tp.name = 'Credit card'
    group by tp.name, to_date(tf.tpep_pickup_datetime);