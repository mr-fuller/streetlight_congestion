drop table if exists secor_2016_01_geom_join;
create table secor_2016_1_geom_join as (

select b.zone_id, 
			  b.mean_seg_speed_mph, 
			  b.mean_seg_duration_sec,
			  b.free_flow_factor,
			  (1-b.free_flow_factor) as congestion_factor,
			  s.id, 
			  s.geom
from secor_2016_01_seg_all b
join secor_segment_2016_segment_line_zone_set s
on b.zone_id = cast(s.id as varchar)
where b.day_type = '0: Average Day (M-Su)' and
			  b.day_part = '0: All Day (12am-12am)'
	);
			  --group by zone_id, mean_seg_speed_mph,mean_seg_duration_sec, free_flow_factor'