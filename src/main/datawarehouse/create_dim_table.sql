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
