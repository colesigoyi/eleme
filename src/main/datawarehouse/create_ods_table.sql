drop database if exists hzbbp_ods cascade;
create database if not exists hzbbp_ods;
create database if not exists hzbbp_dwd;
create database if not exists hzbbp_dws;
create database if not exists hzbbp_dm;
use hzbbp_ods;

-------------------------------------------------------------------------------
--------------------            导入ods增量数据           -------------------------
-------------------------------------------------------------------------------

------------------------------ us_order ------------------------------
CREATE TABLE if not exists `hzbbp_ods.ods_us_order` (
  `order_id` bigint,
  `order_no`  string,
  `order_date` timestamp,
  `user_id` bigint,
  `user_name`  string,
  `order_money` decimal(18,2),
  `order_type` int,
  `order_status` int,
  `pay_status` int,
  `pay_type` int,
  `order_source`  string,
  `update_time` timestamp
)
partitioned by (dt string);

CREATE TABLE if not exists `hzbbp_ods.ods_biz_trade` (
  `trade_id` bigint,
  `order_id` bigint,
  `user_id` bigint,
  `amount` float,
  `trade_type` int,
  `trade_time` timestamp
)
partitioned by (dt string);

CREATE TABLE if not exists `hzbbp_ods.ods_cart` (
  `cart_id` bigint,
  `session_id` string,
  `user_id` bigint,
  `goods_id` bigint,
  `goods_num` int,
  `add_time` timestamp,
  `cancle_time` timestamp,
  `sumbit_time` timestamp,
  `create_date` timestamp
)
partitioned by (dt string);

CREATE TABLE if not exists `hzbbp_ods.ods_order_delivery` (
  `order_id` bigint,
  `order_no` string,
  `consignee` string,
  `area_id` bigint,
  `area_name` string,
  `address` string,
  `mobile` bigint,
  `phone` string,
  `coupon_id` bigint,
  `coupon_money` decimal(18,2),
  `carriage_money` decimal(18,2),
  `create_time` timestamp,
  `update_time` timestamp,
  `addr_id` bigint
)
partitioned by (dt string);


CREATE TABLE if not exists `hzbbp_ods.ods_order_item` (
  `user_id` bigint,
  `order_id` bigint,
  `order_no` string,
  `goods_id` bigint,
  `goods_no` string,
  `goods_name` string,
  `goods_amount` int,
  `shop_id` bigint,
  `shop_name` string,
  `curr_price` decimal(18,2),
  `market_price` decimal(18,2),
  `discount` decimal(18,2),
  `cost_price` decimal(18,2),
  `first_cart` bigint,
  `first_cart_name` string,
  `second_cart` bigint,
  `second_cart_name` string,
  `third_cart` bigint,
  `third_cart_name` string,
  `goods_desc` string,
  `update_time` timestamp
)
partitioned by (dt string);





CREATE TABLE if not exists `hzbbp_ods.ods_user_app_click_log` (
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
)
partitioned by (dt string);



CREATE TABLE if not exists `hzbbp_ods.ods_user_pc_click_log` (
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
)
partitioned by (dt string);