#!bin/bash
######################## 订单分布 ##############################
## 学校下单总数,
## 公司下单总数,
## 家里下单总数,
## 凌晨下单总数,
## 上午下单总数,
## 中午下单总数，
## 下午下单总数,
## 晚上下单总数,
## 指标口径:凌晨:0‐05 上午:06‐12 中午:13‐15 下午16‐20 晚上：21‐24
hive -e "
from (
select
duo.user_id user_id,
(case when dua.user_order_flag = 1 then 1 else 0 end) school_order_cnt,
(case when dua.user_order_flag = 2 then 1 else 0 end) company_order_cnt,
(case when dua.user_order_flag = 3 then 1 else 0 end) home_order_cnt,
(case when hour(duo.order_date) between 0 and 5 then 1 else 0 end) order_0_5_cnt,
(case when hour(duo.order_date) between 6 and 12 then 1 else 0 end) order_6_12_cnt,
(case when hour(duo.order_date) between 13 and 15 then 1 else 0 end) order_13_15_cnt,
(case when hour(duo.order_date) between 16 and 20 then 1 else 0 end) order_16_20_cnt,
(case when hour(duo.order_date) between 21 and 23 then 1 else 0 end) order_21_23_cnt,
date(duo.update_time) dw_date
from
hzbbp_dwd.dwd_us_order duo
left join hzbbp_dwd.dwd_order_delivery dod on duo.order_id = dod.order_id
left join hzbbp_dim.dim_user_addr dua on dod.addr_id = dua.addr_id
) tmp
insert overwrite table hzbbp_dm.dm_order_distribute partition(dt='2019-10-09')
select
user_id,
sum(school_order_cnt) school_order_cnt,
sum(company_order_cnt) company_order_cnt,
sum(home_order_cnt) home_order_cnt,
sum(order_0_5_cnt) order_0_5_cnt,
sum(order_6_12_cnt) order_6_12_cnt,
sum(order_13_15_cnt) order_13_15_cnt,
sum(order_16_20_cnt) order_16_20_cnt,
sum(order_21_23_cnt) order_21_23_cnt,
dw_date
group by user_id,dw_date
; "
