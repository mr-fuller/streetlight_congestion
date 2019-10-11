--note that the values were the quartile values found using quartiles.sql
--TO DO: combine this with quartiles.sql so values aren't hard coded
alter table lrp2045_priority_personal_123456_seg_all
add column if not exists score numeric;
update lrp2045_priority_personal_123456_seg_all
set score = case 
	when congestion_factor < 0.142 then 0
	when congestion_factor between 0.142 and 0.207 then 1
	when congestion_factor between 0.207 and 0.283 then 2
	when congestion_factor > 0.283 then 3
	else null
	end;