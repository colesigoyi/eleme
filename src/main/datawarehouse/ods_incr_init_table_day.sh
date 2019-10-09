#!/bin/bash

###############################################################################
####################          导入ods层数据 按天导入         #########################
###############################################################################

############################## 获取时间 ##################################
#获取传进来的日期
running_date=$1
if [ ${#running_date} == 0 ]
then
running_date=`date -d "1 days ago" "+%Y‐%m‐%d"`
fi
now_date=`date -d "‐1 days ago ${running_date}" "+%Y‐%m‐%d"`

############################### biz_trade ###########################################
sqoop import --connect jdbc:mysql://10.211.55.42:3306/hzbap_ods \
--username root \
--password 123456 \
--target-dir /home/apps/hive-1.1.0-cdh5.5.6/warehouse/hzbbp_ods.db/ods_biz_trade/dt=${running_date} \
--fields-terminated-by '\001' \
--query "select * from biz_trade where trade_time >= '"${running_date}"' and trade_time <
'"${now_date}"' and \$CONDITIONS" \
-m 1 \
--append

hive -e "alter table hzbbp_ods.ods_biz_trade add partition(dt='"${running_date}"');"

############################### us_order ###########################################
sqoop import --connect jdbc:mysql://10.211.55.42:3306/hzbap_ods \
--username root \
--password 123456 \
--target-dir /home/apps/hive-1.1.0-cdh5.5.6/warehouse/hzbbp_ods.db/ods_us_order/dt=${running_date} \
--fields-terminated-by '\001' \
--query "select * from us_order where order_date >= '"${running_date}"' and order_date <
'"${now_date}"' and \$CONDITIONS" \
-m 1 \
--append

hive -e "alter table hzbbp_ods.ods_us_order add partition(dt='"${running_date}"');"

############################### order_item ###########################################
sqoop import --connect jdbc:mysql://10.211.55.42:3306/hzbap_ods \
--username root \
--password 123456 \
--target-dir /home/apps/hive-1.1.0-cdh5.5.6/warehouse/hzbbp_ods.db/ods_order_item/dt=${running_date} \
--fields-terminated-by '\001' \
--query "select * from order_item where update_time >= '"${running_date}"' and update_time <
'"${now_date}"' and \$CONDITIONS" \
-m 1 \
--append

hive -e "alter table hzbbp_ods.ods_order_item add partition(dt='"${running_date}"');"

############################### order_delivery ###########################################
sqoop import --connect jdbc:mysql://10.211.55.42:3306/hzbap_ods \
--username root \
--password 123456 \
--target-dir /home/apps/hive-1.1.0-cdh5.5.6/warehouse/hzbbp_ods.db/ods_order_delivery/dt=${running_date} \
--fields-terminated-by '\001' \
--query "select * from order_delivery where update_time >= '"${running_date}"' and update_time <
'"${now_date}"' and \$CONDITIONS" \
-m 1 \
--append

hive -e "alter table hzbbp_ods.ods_order_delivery add partition(dt='"${running_date}"');"

############################### ods_cart ###########################################
sqoop import --connect jdbc:mysql://10.211.55.42:3306/hzbap_ods \
--username root \
--password 123456 \
--target-dir /home/apps/hive-1.1.0-cdh5.5.6/warehouse/hzbbp_ods.db/ods_cart/dt=${running_date} \
--fields-terminated-by '\001' \
--query "select * from cart where sumbit_time >= '"${running_date}"' and sumbit_time <
'"${now_date}"' and \$CONDITIONS" \
-m 1 \
--append

hive -e "alter table hzbbp_ods.ods_cart add partition(dt='"${running_date}"');"