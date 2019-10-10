#!/bin/bash

######################## 订单分布 ##############################
sqoop export \
--connect jdbc:mysql://10.211.55.42:3306/hzbap_dm \
--username root \
--password 123456 \
--table dm_order_distribute \
--export-dir hdfs://10.211.55.42:9000/home/apps/hive-1.1.0-cdh5.5.6/warehouse/hzbbp_dm.db/dm_order_distribute/* \
--input-fields-terminated-by '\001' \
-m 1