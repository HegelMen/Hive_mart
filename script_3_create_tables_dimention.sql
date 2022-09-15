-- СОЗДАНИЕ ТАБЛИЦ СПРАВОЧНИКОВ И ЗАЛИВКА ДАННЫХ

-- Создание таблицы измерений taxi_vendor
create external table if not exists taxi.taxi_vendor
(id int, name string)
stored as parquet;

-- Создание таблицы измерений rate
create external table if not exists taxi.taxi_rate
(id int, name string)
stored as parquet;

-- Создание таблицы измерений store_and_fwd_flag
create external table if not exists taxi.taxi_store_and_fwd_flag
(id int, name string)
stored as parquet;

-- Создание таблицы измерений payment_type
create external table if not exists taxi.taxi_payment_type
(id int, name string)
stored as parquet;

-- Заполнение таблицы измерений taxi_vendor_id
insert into taxi.taxi_vendor values
(1, 'Creative Mobile Technologies'),
(2, 'VeriFone Inc');

-- Заполнение таблицы измерений rate
insert into taxi.taxi_rate
select 1, 'Standard rate'
union all
select 2, 'JFK'
union all
select 3, 'Newark'
union all
select 4, 'Nassau or Westchester'
union all
select 5, 'Negotiated fare'
union all
select 6, 'Group ride';

-- Заполнение таблицы измерений store_and_fwd_flag
insert into taxi.taxi_store_and_fwd_flag values
('Y', 'store and forward trip'),
('N', 'not a store and forward trip');

-- Заполнение таблицы измерений payment_type
with t as (select 1, 'Credit card'
union all
select 2, 'Cash'
union all
select 3, 'No charge'
union all
select 4, 'Dispute'
union all
select 5, 'Unknown'
union all
select 6, 'Voided trip')
insert into taxi.taxi_payment_type select * from t;
