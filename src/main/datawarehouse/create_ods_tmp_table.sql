drop database if exists hzbbp_ods_tmp cascade;
create database if not exists hzbbp_ods_tmp;
use hzbbp_ods_tmp;

-------------------------------------------------------------------------------
--------------------            导入临时增量数据           ----------------------
-------------------------------------------------------------------------------

------------------------------ us_order ------------------------------
CREATE TABLE if not exists `hzbbp_ods_tmp.us_order_tmp` (
  `order_id` bigint,
  `order_no`  string,
  `order_date` timestamp,
  `user_id` bigint,
  `user_name`  string,
  `order_money` decimal(18,2 ,
  `order_type` int,
  `order_status` int,
  `pay_status` int,
  `pay_type` int,
  `order_source`  string,
  `update_time` timestamp
);

CREATE TABLE if not exists `hzbbp_ods_tmp.biz_trade_tmp` (
  `trade_id` bigint,
  `order_id` bigint,
  `user_id` bigint,
  `amount` float,
  `trade_type` int,
  `trade_time` timestamp
);

CREATE TABLE if not exists `hzbbp_ods_tmp.cart_tmp` (
  `cart_id` bigint,
  `session_id` string,
  `user_id` bigint,
  `goods_id` bigint,
  `goods_num` int,
  `add_time` timestamp,
  `cancle_time` timestamp,
  `sumbit_time` timestamp,
  `create_date` timestamp
);

CREATE TABLE if not exists `hzbbp_ods_tmp.order_delivery_tmp` (
  `order_id` bigint,
  `order_no` string,
  `consignee` string,
  `area_id` bigint,
  `area_name` string,
  `address` string,
  `mobile` bigint,
  `phone` string,
  `coupon_id` bigint,
  `coupon_money` decimal(18,2 ,
  `carriage_money` decimal(18,2 ,
  `create_time` timestamp,
  `update_time` timestamp,
  `addr_id` bigint
);


CREATE TABLE if not exists `hzbbp_ods_tmp.order_item_tmp` (
  `user_id` bigint,
  `order_id` bigint,
  `order_no` string,
  `goods_id` bigint,
  `goods_no` string,
  `goods_name` string,
  `goods_amount` int,
  `shop_id` bigint,
  `shop_name` string,
  `curr_price` decimal(18,2 ,
  `market_price` decimal(18,2 ,
  `discount` decimal(18,2 ,
  `cost_price` decimal(18,2 ,
  `first_cart` bigint,
  `first_cart_name` string,
  `second_cart` bigint,
  `second_cart_name` string,
  `third_cart` bigint,
  `third_cart_name` string,
  `goods_desc` string,
  `update_time` timestamp
);


--
-- CREATE TABLE if not exists `hzbbp_ods_tmp.user_tmp` (
--   `user_id` bigint,
--   `user_name` string,
--   `user_gender` int,
--   `user_birthday` timestamp,
--   `user_age` int,
--   `constellation` string,
--   `province` string,
--   `city` string,
--   `city_level` int,
--   `e_mail` string,
--   `op_mail` string,
--   `mobile` bigint,
--   `num_seg_mobile` int,
--   `op_Mobile` string,
--   `register_time` timestamp,
--   `login_ip` string,
--   `login_source` string,
--   `request_user` string,
--   `total_score` decimal(18,2 ,
--   `used_score` decimal(18,2 ,
--   `is_blacklist` int,
--   `is_married` int,
--   `education` string,
--   `monthly_income` decimal(18,2 ,
--   `profession` string,
--   `create_date` timestamp
-- );

-- CREATE TABLE if not exists `hzbbp_ods_tmp.user_addr_tmp` (
--   `user_id` bigint,
--   `order_addr` string,
--   `user_order_flag` int,
--   `addr_id` bigint,
--   `arear_id` int
-- );

CREATE TABLE if not exists `hzbbp_ods_tmp.user_app_click_log_tmp` (
  `log_id` bigint,
  `user_id` bigint,
  `imei` string,
  `log_time` string,
  `visit_os` string,
  `os_version` string,
  `app_name` string,
  `app_version` string,
  `device_token` string,
  `visit_ip` string,
  `province` string,
  `city` string
);

-- CREATE TABLE if not exists `hzbbp_ods_tmp.user_extend_tmp` (
--   `user_id` bigint,
--   `user_gender` bigint,
--   `is_pregnant_woman` int,
--   `is_have_children` int,
--   `is_have_car` int,
--   `phone_brand` string,
--   `phone_brand_level` string,
--   `phone_cnt` int,
--   `change_phone_cnt` int,
--   `is_maja` int,
--   `majia_account_cnt` int,
--   `loyal_model` string,
--   `shopping_type_model` string,
--   `weight` int,
--   `height` int
-- );

CREATE TABLE if not exists `hzbbp_ods_tmp.user_pc_click_log_tmp` (
  `log_id` bigint,
  `user_id` bigint,
  `session_id` string,
  `cookie_id` string,
  `visit_time` string,
  `visit_url` string,
  `visit_os` string,
  `browser_name` string,
  `visit_ip` string,
  `province` string,
  `city` string,
  `page_id` int,
  `goods_id` bigint,
  `shop_id` bigint
);

-- drop table hzbbp_ods.ods_biz_trade;
-- drop table hzbbp_ods.ods_cart;
-- drop table hzbbp_ods.ods_order_delivery;
-- drop table hzbbp_ods.ods_order_item;
-- drop table hzbbp_ods.ods_us_order;
-- drop table hzbbp_ods.ods_user;
-- drop table hzbbp_ods.ods_user_addr;
-- drop table hzbbp_ods.ods_user_app_click_log;
-- drop table hzbbp_ods.ods_user_extend;
-- drop table hzbbp_ods.ods_user_pc_click_log;
--
-- drop table hzbbp_ods_tmp.biz_trade_tmp;
-- drop table hzbbp_ods_tmp.cart_tmp;
-- drop table hzbbp_ods_tmp.order_delivery_tmp;
-- drop table hzbbp_ods_tmp.order_item_tmp;
-- drop table hzbbp_ods_tmp.us_order_tmp;
-- drop table hzbbp_ods_tmp.user_addr_tmp;
-- drop table hzbbp_ods_tmp.user_app_click_log_tmp;
-- drop table hzbbp_ods_tmp.user_extend_tmp;
-- drop table hzbbp_ods_tmp.user_pc_click_log_tmp;
-- drop table hzbbp_ods_tmp.user_tmp;
--
-- drop table hzbbp_ods.ods_user;
-- drop table hzbbp_ods.ods_user_addr;
-- drop table hzbbp_ods.ods_user_extend;
-- drop table hzbbp_ods_tmp.user_tmp;
-- drop table hzbbp_ods_tmp.user_addr_tmp;
-- drop table hzbbp_ods_tmp.user_extend_tmp;
--------------------------临时--------------------------------
select
duo.order_id user_id,

max(address.common_addr)

from
hzbbp_dwd.dwd_us_order duo
left join hzbbp_dwd.dwd_order_delivery dod on duo.order_id = dod.order_id
left join hzbbp_dwd.dwd_biz_trade dbt on dod.order_id = dbt.order_id
group by duo.order_id,duo.order_date,dod.address
limit 10;


-------------------------------------------------------------
select
duo.order_id user_id,
min(duo.order_date) first_order_time,
max(duo.order_date) last_order_time,
max(datediff( current_timestamp , duo.order_date)) first_to_now,
min(datediff( current_timestamp , duo.order_date)) last_to_now,
sum((case when datediff( current_timestamp , duo.order_date)<=30 and dbt.trade_type = 1  then 1 else 0 end))  without_30_orders,
sum((case when datediff( current_timestamp , duo.order_date)<=30 and dbt.trade_type = 1 then duo.order_money else 0 end))  without_30_amounts,
sum((case when datediff( current_timestamp , duo.order_date)<=60 and dbt.trade_type = 1 then 1 else 0 end))  without_60_orders,
sum((case when datediff( current_timestamp , duo.order_date)<=60 and dbt.trade_type = 1 then duo.order_money else 0 end))  without_60_amounts,
sum((case when datediff( current_timestamp , duo.order_date)<=90 and dbt.trade_type = 1 then 1 else 0 end))  without_90_orders,
sum((case when datediff( current_timestamp , duo.order_date)<=90 and dbt.trade_type = 1 then duo.order_money else 0 end))  without_90_amounts,
sum((case when datediff( current_timestamp , duo.order_date)<=30 then 1 else 0 end))  30_orders,
sum((case when datediff( current_timestamp , duo.order_date)<=30 then duo.order_money else 0 end))  30_amounts,
sum((case when datediff( current_timestamp , duo.order_date)<=60 then 1 else 0 end))  60_orders,
sum((case when datediff( current_timestamp , duo.order_date)<=60 then duo.order_money else 0 end))  60_amounts,
sum((case when datediff( current_timestamp , duo.order_date)<=90 then 1 else 0 end))  90_orders,
sum((case when datediff( current_timestamp , duo.order_date)<=90 then duo.order_money else 0 end))  90_amounts,
sum((case when datediff( current_timestamp , duo.order_date)<=90 then duo.order_money else 0 end))/sum((case when datediff( current_timestamp , duo.order_date)<=90 then 1 else 0 end)) 90_avg_amount,
max(duo.order_money) max_amounts,
min(duo.order_money) min_amounts,
count(distinct duo.order_id, dbt.trade_type = 1) without_total_orders,
sum(case when dbt.trade_type = 1 then duo.order_money else 0 end) without_total_amounts,
sum(case when dbt.trade_type = 1 then duo.order_money else 0 end)/count(distinct duo.order_id, dbt.trade_type = 1) avg_amount,
 common_addr,
 common_pay,
sum(CASE WHEN dbt.trade_type = -1 THEN 1 ELSE 0 END) repay_goods,
sum(case when dbt.trade_type = -1 then duo.order_money else 0 end) repay_amount,
sum(CASE WHEN dbt.trade_type = 0 THEN 1 ELSE 0 END) refuse_goods,
sum(case when dbt.trade_type = 0 then duo.order_money else 0 end) refuse_good_amounts,
max(case when dbt.trade_type = -1 then duo.order_date else null end) last_repay_good_time,
 dm_date

from
hzbbp_dwd.dwd_us_order duo
left join hzbbp_dwd.dwd_order_delivery dod on duo.order_id = dod.order_id
left join hzbbp_dwd.dwd_biz_trade dbt on dod.order_id = dbt.order_id
group by duo.order_id,duo.order_date

--select order_id,min(order_date ,max(order_date) from hzbbp_dwd.dwd_us_order group by order_id limit 10;
-- select
-- order_id,
-- max(
-- datediff( current_timestamp , order_date))
-- from hzbbp_dwd.dwd_us_order group by order_id,order_date limit 10;

