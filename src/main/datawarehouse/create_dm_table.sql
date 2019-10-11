drop database if exists hzbbp_dm CASCADE;
create database if not exists hzbbp_dm;
use hzbbp_dm;

-------------------   dm_order_distribute ----------------------
create table if not exists hzbbp_dm.dm_order_distribute(
user_id bigint,
school_orders int,
company_order int,
home_order int,
hour0_5_order int,
hour6_12_order int,
hour13_15_order int,
hour16_20_order int,
hour21_24_order int,
dm_date string
)
partitioned by(dt string)
;

-------------------   dm_order_info ----------------------
create table if not exists hzbbp_dm.dm_order_info(
user_id bigint,
first_order_time string,
last_order_time string,
first_to_now int,
last_to_now int,
without_30_orders int,
without_30_amounts double,
without_60_orders int,
without_60_amounts double,
without_90_orders int,
without_90_amounts double,
30_orders int,
30_amounts double,
60_orders int,
60_amounts double,
90_orders int,
90_amounts double,
90_avg_amount double,
max_amounts double,
min_amounts double,
without_total_orders int,
without_total_amounts double,
avg_amount double,
common_addr string,
common_pay string,
repay_goods int,
repay_amount double,
refuse_goods int,
refuse_good_amounts double,
last_repay_good_time string,
dm_date string
)
partitioned by(dt string)
;