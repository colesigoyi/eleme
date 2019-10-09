#!/bin/bash

###############################################################################
####################            导入ods层数据 临时表           #########################
###############################################################################

############################## us_order_tmp ##################################

#hadoop fs -rm -r /user/root/us_order

sqoop import \
--connect jdbc:mysql://10.211.55.42:3306/hzbap_ods \
--username root \
--password 123456 \
--table us_order \
--target-dir /home/apps/hive-1.1.0-cdh5.5.6/warehouse/hzbbp_ods_tmp.db/us_order_tmp \
--fields-terminated-by '\001' \
--check-column order_date \
--incremental lastmodified \
--last-value 0 \
-m 1 \
--append
hive -e "from hzbbp_ods_tmp.us_order_tmp insert overwrite table \
hzbbp_ods.ods_us_order partition(dt) select *, date(order_date) dt "

#hadoop fs -rm -r /user/root/biz_trade

sqoop import \
--connect jdbc:mysql://10.211.55.42:3306/hzbap_ods \
--username root \
--password 123456 \
--table biz_trade \
--target-dir /home/apps/hive-1.1.0-cdh5.5.6/warehouse/hzbbp_ods_tmp.db/biz_trade_tmp \
--fields-terminated-by '\001' \
--check-column trade_time \
--incremental lastmodified \
--last-value 0 \
-m 1 \
--append
hive -e "from hzbbp_ods_tmp.biz_trade_tmp insert overwrite table \
hzbbp_ods.ods_biz_trade partition(dt) select *, date(trade_time) dt "

#hadoop fs -rm -r /user/root/cart

sqoop import \
--connect jdbc:mysql://10.211.55.42:3306/hzbap_ods \
--username root \
--password 123456 \
--table cart \
--target-dir /home/apps/hive-1.1.0-cdh5.5.6/warehouse/hzbbp_ods_tmp.db/cart_tmp \
--fields-terminated-by '\001' \
--check-column sumbit_time \
--incremental lastmodified \
--last-value 0 \
-m 1 \
--append
hive -e "from hzbbp_ods_tmp.cart_tmp insert overwrite table \
hzbbp_ods.ods_cart partition(dt) select *, date(sumbit_time) dt "

#hadoop fs -rm -r /user/root/order_delivery

sqoop import \
--connect jdbc:mysql://10.211.55.42:3306/hzbap_ods \
--username root \
--password 123456 \
--table order_delivery \
--target-dir /home/apps/hive-1.1.0-cdh5.5.6/warehouse/hzbbp_ods_tmp.db/order_delivery_tmp \
--fields-terminated-by '\001' \
--check-column update_time \
--incremental lastmodified \
--last-value 0 \
-m 1 \
--append
hive -e "from hzbbp_ods_tmp.order_delivery_tmp insert overwrite table \
hzbbp_ods.ods_order_delivery partition(dt) select *, date(update_time) dt "

#hadoop fs -rm -r /user/root/order_item

sqoop import \
--connect jdbc:mysql://10.211.55.42:3306/hzbap_ods \
--username root \
--password 123456 \
--table order_item \
--target-dir /home/apps/hive-1.1.0-cdh5.5.6/warehouse/hzbbp_ods_tmp.db/order_item_tmp \
--fields-terminated-by '\001' \
--check-column update_time \
--incremental lastmodified \
--last-value 0 \
-m 1 \
--append
hive -e "from hzbbp_ods_tmp.order_item_tmp insert overwrite table \
hzbbp_ods.ods_order_item partition(dt) select *, date(update_time) dt "

#hadoop fs -rm -r /user/root/user
#
#sqoop import \
#--connect jdbc:mysql://10.211.55.42:3306/hzbap_ods \
#--username root \
#--password 123456 \
#--table user \
#--target-dir /home/apps/hive-1.1.0-cdh5.5.6/warehouse/hzbbp_ods_tmp.db/user_tmp \
#--fields-terminated-by '\001' \
#--check-column create_date \
#--incremental lastmodified \
#--last-value 0 \
#-m 1 \
#--append
#hive -e "from hzbbp_ods_tmp.user_tmp insert overwrite table \
#hzbbp_ods.ods_user partition(dt) select *, date(create_date) dt "

#hadoop fs -rm -r /user/root/user_addr

#sqoop import \
#--connect jdbc:mysql://10.211.55.42:3306/hzbap_ods \
#--username root \
#--password 123456 \
#--table user_addr \
#--target-dir /home/apps/hive-1.1.0-cdh5.5.6/warehouse/hzbbp_ods_tmp.db/user_addr_tmp \
#--fields-terminated-by '\001' \
#--check-column order_date \
#--incremental lastmodified \
#--last-value 0 \
#-m 1 \
#--append


#hadoop fs -rm -r /user/root/user_app_click_log

#sqoop import \
#--connect jdbc:mysql://10.211.55.42:3306/hzbap_ods \
#--username root \
#--password 123456 \
#--table user_app_click_log \
#--target-dir /home/apps/hive-1.1.0-cdh5.5.6/warehouse/hzbbp_ods_tmp.db/user_app_click_log_tmp \
#--fields-terminated-by '\001' \
#--check-column log_time \
#--incremental lastmodified \
#--last-value 0 \
#-m 1 \
#--append
#hive -e "from hzbbp_ods_tmp.user_app_click_log_tmp insert overwrite table \
#hzbbp_ods.ods_user_app_click_log partition(dt) select *, date(log_time) dt "

#hadoop fs -rm -r /user/root/user_extend

#sqoop import \
#--connect jdbc:mysql://10.211.55.42:3306/hzbap_ods \
#--username root \
#--password 123456 \
#--table user_extend \
#--target-dir /home/apps/hive-1.1.0-cdh5.5.6/warehouse/hzbbp_ods_tmp.db/user_extend_tmp \
#--fields-terminated-by '\001' \
#--check-column order_date \
#--incremental lastmodified \
#--last-value 0 \
#-m 1 \
#--append


#hadoop fs -rm -r /user/root/user_pc_click_log

#sqoop import \
#--connect jdbc:mysql://10.211.55.42:3306/hzbap_ods \
#--username root \
#--password 123456 \
#--table user_pc_click_log \
#--target-dir /home/apps/hive-1.1.0-cdh5.5.6/warehouse/hzbbp_ods_tmp.db/user_pc_click_log_tmp \
#--fields-terminated-by '\001' \
#--check-column visit_time \
#--incremental lastmodified \
#--last-value 0 \
#-m 1 \
#--append
#hive -e "from hzbbp_ods_tmp.user_pc_click_log_tmp insert overwrite table \
#hzbbp_ods.ods_user_pc_click_log partition(dt) select *, date(visit_time) dt "
