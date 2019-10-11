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
## 指标口径:凌晨:0##05 上午:06##12 中午:13##15 下午16##20 晚上：21##24
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

######################## 需求2:订单分布 ##############################
##第一次下单时间,
##最近一次下单时间,
##首单距今时间,
##尾单距今时间,
##近30天订单数量（不含退拒）,
##近30天订单金额（不含退拒）,
##近60天订单数量（不含退拒）,
##近60天订单金额（不含退拒）,
##近90天订单数量（不含退拒）,
##近90天订单金额（不含退拒）,
##近30天订单数量（含退拒）,
##近30天订单金额（含退拒）,
##近60天购买次数（含退拒）,
##近60天购买金额（含退拒）,
##近90天购买次数（含退拒）,
##近90天购买金额（含退拒）,
##近90天的客单价（含退拒）,
##最大消费金额 ,
##最小消费金额,
##累计消费次数（不含退拒）,
##累计消费金额（不含退拒）,
##客单价（含退拒）,
##最常用收货地址,
##最常用支付方式
##退货商品数量,
##退货商品金额,
##拒收商品数量,
##拒收商品金额,
##最近一次退货时间
#select
#duo.order_id user_id,
#first_order_time,
#last_order_time,
#first_to_now,
#last_to_now,
#hour6_12_order,
#without_30_orders,
#without_30_amounts,
#without_60_orders,
#without_60_amounts,
#without_90_orders,
#without_90_amounts,
#30_orders,
#30_amounts,
#60_orders,
#60_amounts,
#90_orders,
#90_amounts,
#max_amounts,
#min_amounts,
#without_total_orders,
#without_total_amounts,
#total_orders,
#total_amounts,
#common_addr,
#common_pay,
#repay_goods,
#repay_amount,
#refuse_goods,
#refuse_good_amounts,
#last_repay_good_time,
#dm_date
#
#from
#hzbbp_dwd.dwd_us_order duo
#left join hzbbp_dwd.dwd_order_delivery dod on duo.order_id = dod.order_id
#left join hzbbp_dwd.dwd_biz_trade biz on dod.order_id = biz.order_id