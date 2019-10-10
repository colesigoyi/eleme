-------------------------------------------------------------------------------
--------------------            创建维度数据库          -------------------------
-------------------------------------------------------------------------------
drop database if exists hzbbp_dim cascade;
create database if not exists hzbbp_dim;
use hzbbp_dim;
-------------------------------------------------------------------------------
--------------------            导入维度数据           -------------------------
-------------------------------------------------------------------------------

------------------------------ dim_code_category ------------------------------
CREATE TABLE if not exists `hzbbp_dim.dim_code_category` (
  `first_category_id` int,
  `first_category_name` string,
  `second_category_id` int,
  `second_catery_name` string,
  `third_category_id` int,
  `third_category_name` string,
  `category_id` int
);
------------------------------ dim_code_city ----------------------------------
CREATE TABLE if not exists `hzbbp_dim.dim_code_city` (
  `id` int,
  `city` string,
  `province` string
);
------------------------------ dim_code_education -----------------------------
CREATE TABLE if not exists `hzbbp_dim.dim_code_education` (
  `id` int,
  `edu_name` string
);
------------------------------ dim_code_email_suffix --------------------------
CREATE TABLE if not exists `hzbbp_dim.dim_code_email_suffix` (
  `id` int,
  `suffix` string,
  `op_mail` string
);
------------------------------ dim_code_goods ---------------------------------
CREATE TABLE if not exists `hzbbp_dim.dim_code_goods` (
  `first_category_id` int,
  `first_category_name` string,
  `second_category_id` int,
  `second_catery_name` string,
  `third_category_id` int,
  `third_category_name` string,
  `goods_id` int,
  `goods_name` string,
  `goods_no` int,
  `seller_id` int,
  `seller_name` string,
  `food_price` decimal(18,2)
);
------------------------------ dim_code_profession ----------------------------
CREATE TABLE if not exists `hzbbp_dim.dim_code_profession` (
  `id` int,
  `pro_name` string
);
------------------------------ dim_code_shop ----------------------------------
CREATE TABLE if not exists `hzbbp_dim.dim_code_shop` (
  `seller_id` int,
  `seller_name` string,
  `category_id` int
);
--------------------------------   dim_user     ---------------
CREATE TABLE if not exists `hzbbp_dim.dim_user` (
  `user_id` bigint,
  `user_name` string,
  `user_gender` int,
  `user_birthday` timestamp,
  `user_age` int,
  `constellation` string,
  `province` string,
  `city` string,
  `city_level` int,
  `e_mail` string,
  `op_mail` string,
  `mobile` bigint,
  `num_seg_mobile` int,
  `op_Mobile` string,
  `register_time` timestamp,
  `login_ip` string,
  `login_source` string,
  `request_user` string,
  `total_score` decimal(18,2),
  `used_score` decimal(18,2),
  `is_blacklist` int,
  `is_married` int,
  `education` string,
  `monthly_income` decimal(18,2),
  `profession` string,
  `create_date` timestamp
);

-----------------------------------   dim_user_addr    ------------
CREATE TABLE if not exists `hzbbp_dim.dim_user_addr` (
  `user_id` bigint,
  `order_addr` string,
  `user_order_flag` int,
  `addr_id` bigint,
  `arear_id` int
);

-----------------------------------   dim_user_extend    ------------
CREATE TABLE if not exists `hzbbp_dim.dim_user_extend` (
  `user_id` bigint,
  `user_gender` bigint,
  `is_pregnant_woman` int,
  `is_have_children` int,
  `is_have_car` int,
  `phone_brand` string,
  `phone_brand_level` string,
  `phone_cnt` int,
  `change_phone_cnt` int,
  `is_maja` int,
  `majia_account_cnt` int,
  `loyal_model` string,
  `shopping_type_model` string,
  `weight` int,
  `height` int
);