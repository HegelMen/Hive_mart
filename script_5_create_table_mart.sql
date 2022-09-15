-- СОЗДАНИЕ ТАБЛИЦЫ ВИТРИНЫ ДАННЫХ
create external table if not exists taxi.taxi_mart
(
payment_type string,
date_trip date,
tips_average_amount double,
passengers_total int
)
stored as parquet;