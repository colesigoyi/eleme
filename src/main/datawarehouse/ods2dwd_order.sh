#!/bin/bash

################################order_dlivery##################################
hive -e "
from hzbbp_ods.ods_order_delivery
insert overwrite table hzbbp_dwd.dwd_order_delivery partition(dt='2019-10-09')
select *
;
"

################################us_order##################################
hive -e "
from hzbbp_ods.ods_us_order
insert overwrite table hzbbp_dwd.dwd_us_order partition(dt='2019-10-09')
select *
;
"