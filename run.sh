#!/usr/bin/env bash

hive -f /root/scripts/script_0_set_drop_create_DB.sql -v && \
hive -f /root/scripts/script_1_create_tables_stg_fact.sql -v && \
hive --hiveconf hive.exec.dynamic.partition.mode=nonstrict -f /root/scripts/script_2_insert_table_fact.sql -v && \
hive -f /root/scripts/script_3_create_tables_dimention.sql -v && \
hive -f /root/scripts/script_4_create_view_table_mart.sql -v && \
hive -f /root/scripts/script_5_create_table_mart.sql -v && \
hive -f /root/scripts/script_6_insert_table_mart.sql -v




