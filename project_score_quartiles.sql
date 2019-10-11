with scored as 
(select
zone_name,
sum(score) as sum_score
from
lrp2045_priority_personal_123456_seg_all
where day_part ='0: All Day (12am-12am)'  and day_type = '0: All Days (M-Su)'
group by zone_name )

select
percentile_cont(0.25) within group (order by sum_score ) as score_pctile_25,
percentile_cont(0.50) within group (order by sum_score) as score_pctile_50,
percentile_cont(0.75) within group (order by sum_score) as score_pctile_75
from scored;