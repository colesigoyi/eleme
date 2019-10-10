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