create table if not exists luc_woo_123456_seg_all (
    vehicle_type varchar,
    zone_id varchar,
    zone_name varchar,
    zone_is_pass_through varchar,
    zone_is_bidirectional varchar,
    day_type varchar,
    day_part varchar,
    seg_traffic_stl_index numeric,
    mean_seg_speed_mph numeric,
    mean_all_seg_speed_mph numeric,
    mean_seg_duration_sec numeric,
    mean_all_seg_duration_sec numeric,
    free_flow_factor numeric,
    seg_speed_0_10_mph_pct numeric,
    seg_speed_10_20_mph_pct numeric,
    seg_speed_20_30_mph_pct numeric,
    seg_speed_30_40_mph_pct numeric,
    seg_speed_40_50_mph_pct numeric,
    seg_speed_50_60_mph_pct numeric,
    seg_speed_60_70_mph_pct numeric,
    seg_speed_70_80_mph_pct numeric,
    seg_speed_80_90_mph_pct numeric,
    seg_speed_90_plus_mph_pct numeric,
    seg_duration_0_10_min_pct numeric,
    seg_duration_10_20_min_pct numeric,
    seg_duration_20_30_min_pct numeric,
    seg_duration_30_40_min_pct numeric,
    seg_duration_40_50_min_pct numeric,
    seg_duration_50_60_min_pct numeric,
    seg_duration_60_70_min_pct numeric,
    seg_duration_70_80_min_pct numeric,
    seg_duration_80_90_min_pct numeric,
    seg_duration_90_100_min_pct numeric,
    seg_duration_100_110_min_pct numeric,
    seg_duration_110_120_min_pct numeric,
    seg_duration_120_130_min_pct numeric,
    seg_duration_130_140_min_pct numeric,
    seg_duration_140_150_min_pct numeric,
    seg_duration_150_plus_min_pct numeric
);