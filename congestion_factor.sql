/*alter table luc_woo_personal_123456_seg_all
add column if not exists congestion_factor numeric;
update luc_woo_personal_123456_seg_all
set congestion_factor = 1-free_flow_factor;*/

--lrp2045_priority_personal_123456_seg_all
alter table lrp2045_priority_personal_123456_seg_all
add column if not exists congestion_factor numeric;
update lrp2045_priority_personal_123456_seg_all
set congestion_factor = 1-free_flow_factor;