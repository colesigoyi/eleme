#!/bin/bash

###############################################################################
####################            导入维度数据           #########################
###############################################################################

############################## code_category ##################################

hadoop fs -rm -r /user/root/code_category

sqoop import \
--connect jdbc:mysql://10.211.55.42:3306/hzbap_ods \
--username root \
--password 123456 \
--table code_category \
--hive-import \
--hive-overwrite \
--hive-table hzbbp_dim.dim_code_category \
-m 1
############################## code_city ##################################

hadoop fs -rm -r /user/root/code_city

sqoop import \
--connect jdbc:mysql://10.211.55.42:3306/hzbap_ods \
--username root \
--password 123456 \
--table code_city \
--hive-import \
--hive-overwrite \
--hive-table hzbbp_dim.dim_code_city \
-m 1
############################## code_education ##################################

hadoop fs -rm -r /user/root/code_education

sqoop import \
--connect jdbc:mysql://10.211.55.42:3306/hzbap_ods \
--username root \
--password 123456 \
--table code_education \
--hive-import \
--hive-overwrite \
--hive-table hzbbp_dim.dim_code_education \
-m 1
############################## code_email_suffix ##################################

hadoop fs -rm -r /user/root/code_email_suffix

sqoop import \
--connect jdbc:mysql://10.211.55.42:3306/hzbap_ods \
--username root \
--password 123456 \
--table code_email_suffix \
--hive-import \
--hive-overwrite \
--hive-table hzbbp_dim.dim_code_email_suffix \
-m 1
############################## code_goods ##################################

hadoop fs -rm -r /user/root/code_goods

sqoop import \
--connect jdbc:mysql://10.211.55.42:3306/hzbap_ods \
--username root \
--password 123456 \
--table code_goods \
--hive-import \
--hive-overwrite \
--hive-table hzbbp_dim.dim_code_goods \
-m 1
############################## code_profession ##################################

hadoop fs -rm -r /user/root/code_profession

sqoop import \
--connect jdbc:mysql://10.211.55.42:3306/hzbap_ods \
--username root \
--password 123456 \
--table code_profession \
--hive-import \
--hive-overwrite \
--hive-table hzbbp_dim.dim_code_profession \
-m 1
############################## code_shop ##################################

hadoop fs -rm -r /user/root/code_shop

sqoop import \
--connect jdbc:mysql://10.211.55.42:3306/hzbap_ods \
--username root \
--password 123456 \
--table code_shop \
--hive-import \
--hive-overwrite \
--hive-table hzbbp_dim.dim_code_shop \
-m 1