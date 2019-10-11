--select count(* ) from luc_woo_commercial_123456_seg_all;
select 
--day_part,
--day_type
--congestion_factor
percentile_cont(0.25) within group (order by congestion_factor ) as cong_pctile_25,
percentile_cont(0.50) within group (order by congestion_factor) as cong_pctile_50,
percentile_cont(0.75) within group (order by congestion_factor) as cong_pctile_75
from luc_woo_personal_123456_seg_all
where day_part ='0: All Day (12am-12am)'  and day_type = '0: All Days (M-Su)' ;