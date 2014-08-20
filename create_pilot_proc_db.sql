DROP DATABASE IF EXISTS pilot_proc_db;
CREATE DATABASE IF NOT EXISTS pilot_proc_db;

USE pilot_proc_db;

-- ------------------- --
-- CREATE SETPOINT TBL --
-- ------------------- --
DROP TABLE IF EXISTS setpoint_tbl;

CREATE TABLE setpoint_tbl
(
    setpoint_id     INT PRIMARY KEY AUTO_INCREMENT,
    temperature     DOUBLE,
    pressure        DOUBLE,
    biomass_rate    DOUBLE,
    steam_flow      DOUBLE,
    steam_temp      DOUBLE,
    ent_CO2         DOUBLE,
    sweep_CO2       DOUBLE,
    Ar_tracer       DOUBLE,
    superheater_purge DOUBLE,
    tube_diameter   double
);

-- ------------------- --
-- CREATE BIOMASS TBL  --
-- ------------------- --
DROP TABLE IF EXISTS biomass_tbl;

CREATE TABLE biomass_tbl
(
biomass_id INT PRIMARY KEY AUTO_INCREMENT,
sample_name VARCHAR(100),
moisture DOUBLE,
w_c DOUBLE,
w_n DOUBLE,
w_h DOUBLE,
d10 DOUBLE,
d50 DOUBLE,
d90 DOUBLE);

-- ------------------- --
-- CREATE RUN INFO TBL --
-- ------------------- --
DROP TABLE IF EXISTS run_info_tbl;

CREATE TABLE run_info_tbl
(
    run_id      INT PRIMARY KEY,
    setpoint_id INT,
    biomass_id INT,
    ts_start    DATETIME,
    ts_stop     DATETIME,
    ss_start    DATETIME,
    ss_stop     DATETIME,
    operator    VARCHAR(45),
    feeder_slope DOUBLE,
    feeder_intercept DOUBLE,
    FOREIGN KEY (setpoint_id)
        REFERENCES setpoint_tbl (setpoint_id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    FOREIGN KEY (biomass_id)
        REFERENCES biomass_tbl (biomass_id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

-- -------------------- --
-- CREATE REANALYZE TBL --
-- -------------------- --
DROP TABLE IF EXISTS reanalyze_tbl;

CREATE TABLE reanalyze_tbl
(
  run_id    INT PRIMARY KEY,
  new_run   TINYINT(1),
  reanalyze TINYINT(1),
  FOREIGN KEY (run_id)
        REFERENCES run_info_tbl (run_id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
); 

-- ------------------- --
-- CREATE PROC TBL     --
-- ------------------- --

DROP TABLE IF EXISTS pilot_proc_data_tbl;

CREATE TABLE pilot_proc_data_tbl
(
  ts DATETIME PRIMARY KEY,
  counter INT,
  biomass_flowrate DOUBLE,
  roto_feed_op DOUBLE,
  mass_flow_entrainment DOUBLE,
  mass_flow_entrainment_sp DOUBLE,
  mass_flow_entrainment_op DOUBLE,
  mass_flow_steam DOUBLE,
  mass_flow_steam_sp DOUBLE,
  mass_flow_steam_op DOUBLE,
  mass_flow_superheater_purge DOUBLE,
  mass_flow_superheater_purge_sp DOUBLE,
  mass_flow_sweep DOUBLE,
  mass_flow_sweep_sp DOUBLE,
  mass_flow_argon DOUBLE,
  mass_flow_argon_sp DOUBLE,
  mass_flow_purge_tap_N2_total DOUBLE,
  mass_flow_supply_4 DOUBLE,
  mass_flow_supply_5 DOUBLE,
  mass_flow_quench DOUBLE,
  vol_flow_entrainment DOUBLE,
  flow_coriolis DOUBLE,
  temp_ako_relief DOUBLE,
  temp_quench_exit_relief DOUBLE,
  temp_superheater_2_shell DOUBLE,
  temp_superheater_2_element DOUBLE,
  temp_superheater_1_shell DOUBLE,
  temp_superheater_1_element DOUBLE,
  temp_superheater_interstage DOUBLE,
  temp_quench DOUBLE,
  temp_quench_sp DOUBLE,
  temp_quench_op DOUBLE,
  temp_tar_probe_heat_trace DOUBLE,
  temp_tar_probe_heat_trace_sp DOUBLE,
  temp_tar_probe_heat_trace_op DOUBLE,
  temp_ms_heat_trace DOUBLE,
  temp_ms_heat_trace_sp DOUBLE,
  temp_ms_heat_trace_op DOUBLE,
  temp_gasifier_stack_inlet DOUBLE,
  temp_gasifier_refractory_2 DOUBLE,
  temp_gasifier_refractory_1 DOUBLE,
  temp_biomass_inlet_skin DOUBLE,
  temp_upper_bucket_seal_skin DOUBLE,
  temp_lower_bucket_seal_skin_a DOUBLE,
  temp_lower_bucket_seal_skin_b DOUBLE,
  temp_lower_bucket_seal_skin_c DOUBLE,
  temp_lower_bucket_seal_skin_d DOUBLE,
  temp_gasifier_exit DOUBLE,
  temp_expansion_joint_skin DOUBLE,
  temp_skin_tube_top DOUBLE,
  temp_skin_tube_middle DOUBLE,
  temp_skin_tube_bottom DOUBLE,
  temp_upper_bucket_seal_containment_skin DOUBLE,
  temp_lower_bucket_seal_containment_skin DOUBLE,
  temp_gasifier_exit_spool_skin DOUBLE,
  temp_gasifier_stack_outlet DOUBLE,
  temp_tar_cooler_skin DOUBLE,
  temp_quench_skin DOUBLE,
  temp_quench_lower DOUBLE,
  temp_quench_exit DOUBLE,
  temp_quench_exit_redundant DOUBLE,
  temp_primary_quench_inlet DOUBLE,
  temp_quench_pressure_relief_exit DOUBLE,
  temp_quench_exit_valve_skin DOUBLE,
  temp_coriolis_inlet DOUBLE,
  temp_tar_filter_exit DOUBLE,
  temp_ms_inlet DOUBLE,
  temp_ako_gas DOUBLE,
  temp_tar_probe_vent DOUBLE,
  temp_gc_vent DOUBLE,
  temp_primary_quench_water DOUBLE,
  temp_backup_quench_return DOUBLE,
  temp_candle_filter_inlet DOUBLE,
  temp_candle_filter_1 DOUBLE,
  temp_candle_filter_2 DOUBLE,
  temp_candle_filter_3 DOUBLE,
  temp_candle_filter_4 DOUBLE,
  temp_candle_filter_5 DOUBLE,
  temp_candle_filter_outlet DOUBLE,
  temp_candle_filter_ash_dump DOUBLE,
  temp_candle_filter_backpulse DOUBLE,
  candle_rupt_temp DOUBLE,
  temp_boiler DOUBLE,
  temp_steam_relief_vent DOUBLE,
  temp_steam_superheater_exit DOUBLE,
  temp_steam_gasifier_inlet DOUBLE,
  temp_superheater_relief_1 DOUBLE,
  temp_superheater_relief_2 DOUBLE,
  temp_tar_cooling_exit DOUBLE,
  temp_bell_sweep_inlet DOUBLE,
  temp_furnace_sp DOUBLE,
  temp_superheater_sp DOUBLE,
  temp_bed_1 DOUBLE,
  temp_bed_2 DOUBLE,
  temp_blower DOUBLE,
  temp_quench_psv DOUBLE,
  temp_ako_psv DOUBLE,
  TI_932399 DOUBLE,
  temp_ako_scale DOUBLE,
  temp_backup_quench_sp DOUBLE,
  temp_backup_quench_op DOUBLE,
  temp_BH_PSV DOUBLE,
  temp_ash_spheri DOUBLE,
  temp_ash_knife DOUBLE,
  temp_quench_knife DOUBLE,
  temp_steam_fcv DOUBLE,
  TI_932060 DOUBLE,  
  CO_ako_scale DOUBLE,
  CO_filter_ash_scale DOUBLE,
  temp_furnace_roof DOUBLE,
  temp_furnace_exhaust DOUBLE,
  pressure_entrainment_line DOUBLE,
  pressure_furnace_box DOUBLE,
  pressure_steam DOUBLE,
  pressure_steam_sp DOUBLE,
  pressure_steam_op DOUBLE,
  pressure_CH4 DOUBLE,
  pressure_CO2_supply DOUBLE,
  pressure_compressed_air DOUBLE,
  pressure_N2_supply DOUBLE,
  pressure_MAC_CO2 DOUBLE,
  pressure_furnace_exhaust_fan DOUBLE,
  pressure_boiler_sp DOUBLE,
  pressure_quench DOUBLE,
  pressure_quench_sp DOUBLE,
  pressure_quench_op DOUBLE,
  pressure_outlet DOUBLE,
  pressure_outlet_sp DOUBLE,
  pressure_outlet_op DOUBLE,
  pressure_roto_feed_injector_inlet DOUBLE,
  pressure_lock_hopper_supply DOUBLE,
  pressure_furnace_2 DOUBLE,
  pressure_bell_housing DOUBLE,
  pressure_ako DOUBLE,
  pressure_purge_gas_filter DOUBLE,
  pressure_ms_inlet DOUBLE,
  pressure_backup_quench_inlet DOUBLE,
  pressure_candle_filter_outlet DOUBLE,
  pressure_candle_filter_backpulse DOUBLE,
  pressure_candle_filter_ko DOUBLE,
  pressure_boiler DOUBLE,
  pressure_boiler_exit DOUBLE,
  pressure_V_1406 DOUBLE,
  pressure_roto_feed_exit DOUBLE,
  pressure_gasifier_furnace DOUBLE,
  pressure_combustion_air DOUBLE,
  dp_feeder_inlet DOUBLE,
  dp_gasifier DOUBLE,
  dp_inlet_bell DOUBLE,
  dp_exit_quench DOUBLE,
  dp_quench_candle DOUBLE,
  dp_quench_ako DOUBLE,
  dp_ako_ambient DOUBLE,
  dp_bag_purge DOUBLE,
  dp_quench_candle_hopper DOUBLE,
  dp_candle_ko_ambient DOUBLE,
  dp_lock_hopper_injector DOUBLE,
  dp_filter_vessel_filters DOUBLE,
  dp_first_stage_burner DOUBLE,
  dp_second_stage_burner DOUBLE,
  dp_main_gas_burner DOUBLE,
  ai_outlet_moisture DOUBLE,
  stack_moisture_percent DOUBLE,
  mass_feed_vessel DOUBLE,
  value_feed_auger_pv DOUBLE,
  e_stop INT,
  valve_ako_inlet_actuator INT,
  valve_ako_outlet_actuator INT,
  valve_water_fill INT,
  level_quench_water DOUBLE,
  switch_level_water_high INT,
  switch_ako_level_high INT,
  switch_1406_low INT,
  switch_ms_containment_pressure_low INT,
  switch_analyzer_containment_pressure_low INT,
  switch_bladder_1404_inflation INT,
  switch_bladder_1405_inflation INT,
  switch_bladder_lower_inflation INT,
  switch_bladder_purge_filter_inflation INT,
  valve_feed_hopper_filter_purge INT,
  valve_top_lock_inlet INT,
  valve_inter_feed INT,
  valve_bottom_lock_outlet INT,
  valve_injector INT,
  valve_supply_3 INT,
  valve_supply_4 INT,
  valve_injector_2 INT,
  valve_injector_1 INT,
  valve_pressurization INT,
  valve_isolating_flex INT,
  valve_supply_5 INT,
  valve_purge INT,
  valve_purge_1 INT,
  valve_purge_2 INT,
  valve_vent_1 INT,
  valve_vent_2 INT,
  valve_vent_bleed INT,
  valve_feed_entrainment INT,
  valve_biomass_inlet INT,
  valve_quench_exit INT,
  valve_ako_outlet INT,
  valve_oxidizer_purge INT,
  valve_purge_filter INT,
  valve_quench_backup INT,
  valve_tar_probe INT,
  valve_quench_isolation_close INT,
  valve_quench_isolation_open INT,
  valve_filter_backpulse_a INT,
  valve_filter_backpulse_b INT,
  valve_filter_backpulse_c INT,
  valve_ako_outlet_shutoff INT,
  valve_quench_exit_top INT,
  valve_candle_filter_exit_a INT,
  valve_candle_filter_exit_b INT,
  valve_candle_filter_ko_exit_a INT,
  valve_candle_filter_ko_exit_b INT,
  valve_candle_filter_hopper_purge INT,
  valve_candle_filter_outlet_purge INT,
  valve_candle_filter_purge_supply INT,
  valve_steam_vent INT,
  valve_steam_shutoff INT,
  valve_tar_probe_steam INT,
  valve_steam_superheater_purge INT,
  valve_ako_purge_filter INT,
  valve_ako_purge INT,
  valve_purge_filter_supply INT,
  valve_tar_probe_purge INT,
  valve_sweep INT,
  valve_argon INT,
  switch_biomass_inlet_closed INT,
  switch_ako_outlet_closed INT,
  switch_quench_exit_closed INT,
  switch_candle_filter_exit_a_closed INT,
  switch_candle_filter_exit_b_closed INT,
  switch_candle_filter_ko_a_closed INT,
  switch_candle_filter_ko_b_closed INT,
  switch_steam_vent_closed INT,
  switch_steam_shutoff_closed INT,
  switch_biomass_inlet_open INT,
  switch_steam_vent_open INT,
  switch_steam_shutoff_open INT,
  pp_H2O DOUBLE,
  pp_CO2 DOUBLE,
  pp_Ar DOUBLE,
  Ar_MS DOUBLE,
  N2_MS DOUBLE,
  H2O_MS DOUBLE,
  H2_MS DOUBLE,
  CO_MS DOUBLE,
  CO2_MS DOUBLE,
  CH4_MS DOUBLE,
  C2H6_MS DOUBLE,
  C2H4_MS DOUBLE,
  C2H2_MS DOUBLE,
  C3H8_MS DOUBLE,
  C3H6_MS DOUBLE,
  C4H8_MS DOUBLE,
  C4H10_MS DOUBLE,
  CH3CHCH3CH3_MS DOUBLE,
  C6H6_MS DOUBLE,
  C7H8_MS DOUBLE,
  C6H4CH3CH3_MS DOUBLE,
  C6H5CH2CH3_MS DOUBLE,
  C10H8_MS DOUBLE,
  H2S_MS DOUBLE,
  Ar_normalized DOUBLE,
  N2_normalized DOUBLE,
  H2O_normalized DOUBLE,
  H2_normalized DOUBLE,
  CO_normalized DOUBLE,
  CO2_normalized DOUBLE,
  CH4_normalized DOUBLE,
  C2H6_normalized DOUBLE,
  C2H4_normalized DOUBLE,
  C2H2_normalized DOUBLE,
  C3H8_normalized DOUBLE,
  C3H6_normalized DOUBLE,
  C4H8_normalized DOUBLE,
  C4H10_normalized DOUBLE,
  CH3CHCH3CH3_normalized DOUBLE,
  C6H6_normalized DOUBLE,
  C7H8_normalized DOUBLE,
  C6H4CH3CH3_normalized DOUBLE,
  C6H5CH2CH3_normalized DOUBLE,
  C10H8_normalized DOUBLE,
  H2S_normalized DOUBLE,
  Ar_inlet DOUBLE,
  N2_inlet DOUBLE,
  H2O_inlet DOUBLE,
  H2_inlet DOUBLE,
  CO_inlet DOUBLE,
  CO2_inlet DOUBLE,
  CH4_inlet DOUBLE,
  C2H6_inlet DOUBLE,
  C2H4_inlet DOUBLE,
  C2H2_inlet DOUBLE,
  C3H8_inlet DOUBLE,
  C3H6_inlet DOUBLE,
  C4H8_inlet DOUBLE,
  C4H10_inlet DOUBLE,
  CH3CHCH3CH3_inlet DOUBLE,
  C6H6_inlet DOUBLE,
  C7H8_inlet DOUBLE,
  C6H4CH3CH3_inlet DOUBLE,
  C6H5CH2CH3_inlet DOUBLE,
  C10H8_inlet DOUBLE,
  H2S_inlet DOUBLE,
  Ar_outlet DOUBLE,
  N2_outlet DOUBLE,
  H2O_outlet DOUBLE,
  H2_outlet DOUBLE,
  CO_outlet DOUBLE,
  CO2_outlet DOUBLE,
  CH4_outlet DOUBLE,
  C2H6_outlet DOUBLE,
  C2H4_outlet DOUBLE,
  C2H2_outlet DOUBLE,
  C3H8_outlet DOUBLE,
  C3H6_outlet DOUBLE,
  C4H8_outlet DOUBLE,
  C4H10_outlet DOUBLE,
  CH3CHCH3CH3_outlet DOUBLE,
  C6H6_outlet DOUBLE,
  C7H8_outlet DOUBLE,
  C6H4CH3CH3_outlet DOUBLE,
  C6H5CH2CH3_outlet DOUBLE,
  C10H8_outlet DOUBLE,
  H2S_outlet DOUBLE,
  C_inlet DOUBLE,
  H_inlet DOUBLE,
  O_inlet DOUBLE,
  C_outlet DOUBLE,
  H_outlet DOUBLE,
  O_outlet DOUBLE,
  X_std DOUBLE,
  X_tot DOUBLE,
  X_good DOUBLE,
  CH4_yield DOUBLE,
  CO_yield DOUBLE,
  tar_loading DOUBLE,
  tar_loading_incl DOUBLE,
  optical_thickness_d10 DOUBLE,
  optical_thickness_d50 DOUBLE,
  optical_thickness_d90 DOUBLE,
  volumetric_inlet_gas_only DOUBLE,
  T_cupmix_gas_only DOUBLE,
  C_gas_mass_balance DOUBLE,
  space_time DOUBLE,
  delta_H DOUBLE,
  dH_max DOUBLE,
  exit_gas_flowrate DOUBLE
);

-- ------------------- --
-- CREATE INTEGRAL TBL --
-- ------------------- --

DROP TABLE IF EXISTS integral_tbl;

CREATE TABLE integral_tbl
(
  run_id INT PRIMARY KEY,
  biomass_flowrate_avg DOUBLE,
  roto_feed_op_avg DOUBLE,
  mass_flow_entrainment_avg DOUBLE,
  mass_flow_entrainment_sp_avg DOUBLE,
  mass_flow_entrainment_op_avg DOUBLE,
  mass_flow_steam_avg DOUBLE,
  mass_flow_steam_sp_avg DOUBLE,
  mass_flow_steam_op_avg DOUBLE,
  mass_flow_superheater_purge_avg DOUBLE,
  mass_flow_superheater_purge_sp_avg DOUBLE,
  mass_flow_sweep_avg DOUBLE,
  mass_flow_sweep_sp_avg DOUBLE,
  mass_flow_argon_avg DOUBLE,
  mass_flow_argon_sp_avg DOUBLE,
  mass_flow_purge_tap_N2_total_avg DOUBLE,
  mass_flow_supply_4_avg DOUBLE,
  mass_flow_supply_5_avg DOUBLE,
  mass_flow_quench_avg DOUBLE,
  vol_flow_entrainment_avg DOUBLE,
  flow_coriolis_avg DOUBLE,
  temp_superheater_2_shell_avg DOUBLE,
  temp_superheater_2_element_avg DOUBLE,
  temp_superheater_1_shell_avg DOUBLE,
  temp_superheater_1_element_avg DOUBLE,
  temp_superheater_interstage_avg DOUBLE,
  temp_quench_avg DOUBLE,
  temp_quench_sp_avg DOUBLE,
  temp_quench_op_avg DOUBLE,
  temp_tar_probe_heat_trace_avg DOUBLE,
  temp_tar_probe_heat_trace_sp_avg DOUBLE,
  temp_tar_probe_heat_trace_op_avg DOUBLE,
  temp_ms_heat_trace_avg DOUBLE,
  temp_ms_heat_trace_sp_avg DOUBLE,
  temp_ms_heat_trace_op_avg DOUBLE,
  temp_gasifier_stack_inlet_avg DOUBLE,
  temp_gasifier_refractory_2_avg DOUBLE,
  temp_gasifier_refractory_1_avg DOUBLE,
  temp_biomass_inlet_skin_avg DOUBLE,
  temp_upper_bucket_seal_skin_avg DOUBLE,
  temp_lower_bucket_seal_skin_a_avg DOUBLE,
  temp_lower_bucket_seal_skin_b_avg DOUBLE,
  temp_lower_bucket_seal_skin_c_avg DOUBLE,
  temp_lower_bucket_seal_skin_d_avg DOUBLE,
  temp_gasifier_exit_avg DOUBLE,
  temp_expansion_joint_skin_avg DOUBLE,
  temp_skin_tube_top_avg DOUBLE,
  temp_skin_tube_middle_avg DOUBLE,
  temp_skin_tube_bottom_avg DOUBLE,
  temp_upper_bucket_seal_containment_skin_avg DOUBLE,
  temp_lower_bucket_seal_containment_skin_avg DOUBLE,
  temp_gasifier_exit_spool_skin_avg DOUBLE,
  temp_gasifier_stack_outlet_avg DOUBLE,
  temp_tar_cooler_skin_avg DOUBLE,
  temp_quench_skin_avg DOUBLE,
  temp_quench_lower_avg DOUBLE,
  temp_quench_exit_avg DOUBLE,
  temp_quench_exit_redundant_avg DOUBLE,
  temp_primary_quench_inlet_avg DOUBLE,
  temp_quench_exit_valve_skin_avg DOUBLE,
  temp_coriolis_inlet_avg DOUBLE,
  temp_tar_filter_exit_avg DOUBLE,
  temp_ms_inlet_avg DOUBLE,
  temp_ako_gas_avg DOUBLE,
  temp_tar_probe_vent_avg DOUBLE,
  temp_gc_vent_avg DOUBLE,
  temp_primary_quench_water_avg DOUBLE,
  temp_backup_quench_return_avg DOUBLE,
  temp_candle_filter_inlet_avg DOUBLE,
  temp_candle_filter_1_avg DOUBLE,
  temp_candle_filter_2_avg DOUBLE,
  temp_candle_filter_3_avg DOUBLE,
  temp_candle_filter_4_avg DOUBLE,
  temp_candle_filter_5_avg DOUBLE,
  temp_candle_filter_outlet_avg DOUBLE,
  temp_candle_filter_ash_dump_avg DOUBLE,
  temp_candle_filter_backpulse_avg DOUBLE,
  temp_boiler_avg DOUBLE,
  temp_steam_relief_vent_avg DOUBLE,
  temp_steam_superheater_exit_avg DOUBLE,
  temp_steam_gasifier_inlet_avg DOUBLE,
  temp_tar_cooling_exit_avg DOUBLE,
  temp_bell_sweep_inlet_avg DOUBLE,
  temp_furnace_sp_avg DOUBLE,
  temp_superheater_sp_avg DOUBLE,
  temp_bed_1_avg DOUBLE,
  temp_bed_2_avg DOUBLE,
  temp_blower_avg DOUBLE,
  temp_backup_quench_sp_avg DOUBLE,
  temp_backup_quench_op_avg DOUBLE,
  temp_ash_spheri_avg DOUBLE,
  temp_ash_knife_avg DOUBLE,
  temp_quench_knife_avg DOUBLE,
  temp_steam_fcv_avg DOUBLE,
  temp_furnace_roof_avg DOUBLE,
  temp_furnace_exhaust_avg DOUBLE,
  pressure_entrainment_line_avg DOUBLE,
  pressure_furnace_box_avg DOUBLE,
  pressure_steam_avg DOUBLE,
  pressure_steam_sp_avg DOUBLE,
  pressure_steam_op_avg DOUBLE,
  pressure_CH4_avg DOUBLE,
  pressure_CO2_supply_avg DOUBLE,
  pressure_compressed_air_avg DOUBLE,
  pressure_N2_supply_avg DOUBLE,
  pressure_MAC_CO2_avg DOUBLE,
  pressure_furnace_exhaust_fan_avg DOUBLE,
  pressure_boiler_sp_avg DOUBLE,
  pressure_quench_avg DOUBLE,
  pressure_quench_sp_avg DOUBLE,
  pressure_quench_op_avg DOUBLE,
  pressure_outlet_avg DOUBLE,
  pressure_outlet_sp_avg DOUBLE,
  pressure_outlet_op_avg DOUBLE,
  pressure_roto_feed_injector_inlet_avg DOUBLE,
  pressure_lock_hopper_supply_avg DOUBLE,
  pressure_furnace_2_avg DOUBLE,
  pressure_bell_housing_avg DOUBLE,
  pressure_ako_avg DOUBLE,
  pressure_purge_gas_filter_avg DOUBLE,
  pressure_ms_inlet_avg DOUBLE,
  pressure_backup_quench_inlet_avg DOUBLE,
  pressure_candle_filter_outlet_avg DOUBLE,
  pressure_candle_filter_backpulse_avg DOUBLE,
  pressure_candle_filter_ko_avg DOUBLE,
  pressure_boiler_avg DOUBLE,
  pressure_boiler_exit_avg DOUBLE,
  pressure_V_1406_avg DOUBLE,
  pressure_roto_feed_exit_avg DOUBLE,
  pressure_gasifier_furnace_avg DOUBLE,
  pressure_combustion_air_avg DOUBLE,
  dp_feeder_inlet_avg DOUBLE,
  dp_gasifier_avg DOUBLE,
  dp_inlet_bell_avg DOUBLE,
  dp_exit_quench_avg DOUBLE,
  dp_quench_candle_avg DOUBLE,
  dp_quench_ako_avg DOUBLE,
  dp_ako_ambient_avg DOUBLE,
  dp_bag_purge_avg DOUBLE,
  dp_quench_candle_hopper_avg DOUBLE,
  dp_candle_ko_ambient_avg DOUBLE,
  dp_lock_hopper_injector_avg DOUBLE,
  dp_filter_vessel_filters_avg DOUBLE,
  dp_first_stage_burner_avg DOUBLE,
  dp_second_stage_burner_avg DOUBLE,
  dp_main_gas_burner_avg DOUBLE,
  ai_outlet_moisture_avg DOUBLE,
  stack_moisture_percent_avg DOUBLE,
  mass_feed_vessel_avg DOUBLE,
  value_feed_auger_pv_avg DOUBLE,
  pp_H2O_avg DOUBLE,
  pp_CO2_avg DOUBLE,
  pp_Ar_avg DOUBLE,
  Ar_MS_avg DOUBLE,
  N2_MS_avg DOUBLE,
  H2O_MS_avg DOUBLE,
  H2_MS_avg DOUBLE,
  CO_MS_avg DOUBLE,
  CO2_MS_avg DOUBLE,
  CH4_MS_avg DOUBLE,
  C2H6_MS_avg DOUBLE,
  C2H4_MS_avg DOUBLE,
  C2H2_MS_avg DOUBLE,
  C3H8_MS_avg DOUBLE,
  C3H6_MS_avg DOUBLE,
  C4H8_MS_avg DOUBLE,
  C4H10_MS_avg DOUBLE,
  CH3CHCH3CH3_MS_avg DOUBLE,
  C6H6_MS_avg DOUBLE,
  C7H8_MS_avg DOUBLE,
  C6H4CH3CH3_MS_avg DOUBLE,
  C6H5CH2CH3_MS_avg DOUBLE,
  C10H8_MS_avg DOUBLE,
  H2S_MS_avg DOUBLE,
  Ar_normalized_avg DOUBLE,
  N2_normalized_avg DOUBLE,
  H2O_normalized_avg DOUBLE,
  H2_normalized_avg DOUBLE,
  CO_normalized_avg DOUBLE,
  CO2_normalized_avg DOUBLE,
  CH4_normalized_avg DOUBLE,
  C2H6_normalized_avg DOUBLE,
  C2H4_normalized_avg DOUBLE,
  C2H2_normalized_avg DOUBLE,
  C3H8_normalized_avg DOUBLE,
  C3H6_normalized_avg DOUBLE,
  C4H8_normalized_avg DOUBLE,
  C4H10_normalized_avg DOUBLE,
  CH3CHCH3CH3_normalized_avg DOUBLE,
  C6H6_normalized_avg DOUBLE,
  C7H8_normalized_avg DOUBLE,
  C6H4CH3CH3_normalized_avg DOUBLE,
  C6H5CH2CH3_normalized_avg DOUBLE,
  C10H8_normalized_avg DOUBLE,
  H2S_normalized_avg DOUBLE,
  Ar_inlet_avg DOUBLE,
  N2_inlet_avg DOUBLE,
  H2O_inlet_avg DOUBLE,
  H2_inlet_avg DOUBLE,
  CO_inlet_avg DOUBLE,
  CO2_inlet_avg DOUBLE,
  CH4_inlet_avg DOUBLE,
  C2H6_inlet_avg DOUBLE,
  C2H4_inlet_avg DOUBLE,
  C2H2_inlet_avg DOUBLE,
  C3H8_inlet_avg DOUBLE,
  C3H6_inlet_avg DOUBLE,
  C4H8_inlet_avg DOUBLE,
  C4H10_inlet_avg DOUBLE,
  CH3CHCH3CH3_inlet_avg DOUBLE,
  C6H6_inlet_avg DOUBLE,
  C7H8_inlet_avg DOUBLE,
  C6H4CH3CH3_inlet_avg DOUBLE,
  C6H5CH2CH3_inlet_avg DOUBLE,
  C10H8_inlet_avg DOUBLE,
  H2S_inlet_avg DOUBLE,
  Ar_outlet_avg DOUBLE,
  N2_outlet_avg DOUBLE,
  H2O_outlet_avg DOUBLE,
  H2_outlet_avg DOUBLE,
  CO_outlet_avg DOUBLE,
  CO2_outlet_avg DOUBLE,
  CH4_outlet_avg DOUBLE,
  C2H6_outlet_avg DOUBLE,
  C2H4_outlet_avg DOUBLE,
  C2H2_outlet_avg DOUBLE,
  C3H8_outlet_avg DOUBLE,
  C3H6_outlet_avg DOUBLE,
  C4H8_outlet_avg DOUBLE,
  C4H10_outlet_avg DOUBLE,
  CH3CHCH3CH3_outlet_avg DOUBLE,
  C6H6_outlet_avg DOUBLE,
  C7H8_outlet_avg DOUBLE,
  C6H4CH3CH3_outlet_avg DOUBLE,
  C6H5CH2CH3_outlet_avg DOUBLE,
  C10H8_outlet_avg DOUBLE,
  H2S_outlet_avg DOUBLE,
  C_inlet_avg DOUBLE,
  H_inlet_avg DOUBLE,
  O_inlet_avg DOUBLE,
  C_outlet_avg DOUBLE,
  H_outlet_avg DOUBLE,
  O_outlet_avg DOUBLE,
  X_std_avg DOUBLE,
  X_tot_avg DOUBLE,
  X_good_avg DOUBLE,
  CH4_yield_avg DOUBLE,
  CO_yield_avg DOUBLE,
  tar_loading_avg DOUBLE,
  tar_loading_incl_avg DOUBLE,
  optical_thickness_d10_avg DOUBLE,
  optical_thickness_d50_avg DOUBLE,
  optical_thickness_d90_avg DOUBLE,
  volumetric_inlet_gas_only_avg DOUBLE,
  T_cupmix_gas_only_avg DOUBLE,
  C_gas_mass_balance_avg DOUBLE,
  space_time_avg DOUBLE,
  delta_H_avg DOUBLE,
  dH_max_avg DOUBLE,
  exit_gas_flowrate_avg DOUBLE,
  biomass_flowrate_std DOUBLE,
  roto_feed_op_std DOUBLE,
  mass_flow_entrainment_std DOUBLE,
  mass_flow_entrainment_sp_std DOUBLE,
  mass_flow_entrainment_op_std DOUBLE,
  mass_flow_steam_std DOUBLE,
  mass_flow_steam_sp_std DOUBLE,
  mass_flow_steam_op_std DOUBLE,
  mass_flow_superheater_purge_std DOUBLE,
  mass_flow_superheater_purge_sp_std DOUBLE,
  mass_flow_sweep_std DOUBLE,
  mass_flow_sweep_sp_std DOUBLE,
  mass_flow_argon_std DOUBLE,
  mass_flow_argon_sp_std DOUBLE,
  mass_flow_purge_tap_N2_total_std DOUBLE,
  mass_flow_supply_4_std DOUBLE,
  mass_flow_supply_5_std DOUBLE,
  mass_flow_quench_std DOUBLE,
  vol_flow_entrainment_std DOUBLE,
  flow_coriolis_std DOUBLE,
  temp_superheater_2_shell_std DOUBLE,
  temp_superheater_2_element_std DOUBLE,
  temp_superheater_1_shell_std DOUBLE,
  temp_superheater_1_element_std DOUBLE,
  temp_superheater_interstage_std DOUBLE,
  temp_quench_std DOUBLE,
  temp_quench_sp_std DOUBLE,
  temp_quench_op_std DOUBLE,
  temp_tar_probe_heat_trace_std DOUBLE,
  temp_tar_probe_heat_trace_sp_std DOUBLE,
  temp_tar_probe_heat_trace_op_std DOUBLE,
  temp_ms_heat_trace_std DOUBLE,
  temp_ms_heat_trace_sp_std DOUBLE,
  temp_ms_heat_trace_op_std DOUBLE,
  temp_gasifier_stack_inlet_std DOUBLE,
  temp_gasifier_refractory_2_std DOUBLE,
  temp_gasifier_refractory_1_std DOUBLE,
  temp_biomass_inlet_skin_std DOUBLE,
  temp_upper_bucket_seal_skin_std DOUBLE,
  temp_lower_bucket_seal_skin_a_std DOUBLE,
  temp_lower_bucket_seal_skin_b_std DOUBLE,
  temp_lower_bucket_seal_skin_c_std DOUBLE,
  temp_lower_bucket_seal_skin_d_std DOUBLE,
  temp_gasifier_exit_std DOUBLE,
  temp_expansion_joint_skin_std DOUBLE,
  temp_skin_tube_top_std DOUBLE,
  temp_skin_tube_middle_std DOUBLE,
  temp_skin_tube_bottom_std DOUBLE,
  temp_upper_bucket_seal_containment_skin_std DOUBLE,
  temp_lower_bucket_seal_containment_skin_std DOUBLE,
  temp_gasifier_exit_spool_skin_std DOUBLE,
  temp_gasifier_stack_outlet_std DOUBLE,
  temp_tar_cooler_skin_std DOUBLE,
  temp_quench_skin_std DOUBLE,
  temp_quench_lower_std DOUBLE,
  temp_quench_exit_std DOUBLE,
  temp_quench_exit_redundant_std DOUBLE,
  temp_primary_quench_inlet_std DOUBLE,
  temp_quench_exit_valve_skin_std DOUBLE,
  temp_coriolis_inlet_std DOUBLE,
  temp_tar_filter_exit_std DOUBLE,
  temp_ms_inlet_std DOUBLE,
  temp_ako_gas_std DOUBLE,
  temp_tar_probe_vent_std DOUBLE,
  temp_gc_vent_std DOUBLE,
  temp_primary_quench_water_std DOUBLE,
  temp_backup_quench_return_std DOUBLE,
  temp_candle_filter_inlet_std DOUBLE,
  temp_candle_filter_1_std DOUBLE,
  temp_candle_filter_2_std DOUBLE,
  temp_candle_filter_3_std DOUBLE,
  temp_candle_filter_4_std DOUBLE,
  temp_candle_filter_5_std DOUBLE,
  temp_candle_filter_outlet_std DOUBLE,
  temp_candle_filter_ash_dump_std DOUBLE,
  temp_candle_filter_backpulse_std DOUBLE,
  temp_boiler_std DOUBLE,
  temp_steam_relief_vent_std DOUBLE,
  temp_steam_superheater_exit_std DOUBLE,
  temp_steam_gasifier_inlet_std DOUBLE,
  temp_tar_cooling_exit_std DOUBLE,
  temp_bell_sweep_inlet_std DOUBLE,
  temp_furnace_sp_std DOUBLE,
  temp_superheater_sp_std DOUBLE,
  temp_bed_1_std DOUBLE,
  temp_bed_2_std DOUBLE,
  temp_blower_std DOUBLE,
  temp_backup_quench_sp_std DOUBLE,
  temp_backup_quench_op_std DOUBLE,
  temp_ash_spheri_std DOUBLE,
  temp_ash_knife_std DOUBLE,
  temp_quench_knife_std DOUBLE,
  temp_steam_fcv_std DOUBLE,
  temp_furnace_roof_std DOUBLE,
  temp_furnace_exhaust_std DOUBLE,
  pressure_entrainment_line_std DOUBLE,
  pressure_furnace_box_std DOUBLE,
  pressure_steam_std DOUBLE,
  pressure_steam_sp_std DOUBLE,
  pressure_steam_op_std DOUBLE,
  pressure_CH4_std DOUBLE,
  pressure_CO2_supply_std DOUBLE,
  pressure_compressed_air_std DOUBLE,
  pressure_N2_supply_std DOUBLE,
  pressure_MAC_CO2_std DOUBLE,
  pressure_furnace_exhaust_fan_std DOUBLE,
  pressure_boiler_sp_std DOUBLE,
  pressure_quench_std DOUBLE,
  pressure_quench_sp_std DOUBLE,
  pressure_quench_op_std DOUBLE,
  pressure_outlet_std DOUBLE,
  pressure_outlet_sp_std DOUBLE,
  pressure_outlet_op_std DOUBLE,
  pressure_roto_feed_injector_inlet_std DOUBLE,
  pressure_lock_hopper_supply_std DOUBLE,
  pressure_furnace_2_std DOUBLE,
  pressure_bell_housing_std DOUBLE,
  pressure_ako_std DOUBLE,
  pressure_purge_gas_filter_std DOUBLE,
  pressure_ms_inlet_std DOUBLE,
  pressure_backup_quench_inlet_std DOUBLE,
  pressure_candle_filter_outlet_std DOUBLE,
  pressure_candle_filter_backpulse_std DOUBLE,
  pressure_candle_filter_ko_std DOUBLE,
  pressure_boiler_std DOUBLE,
  pressure_boiler_exit_std DOUBLE,
  pressure_V_1406_std DOUBLE,
  pressure_roto_feed_exit_std DOUBLE,
  pressure_gasifier_furnace_std DOUBLE,
  pressure_combustion_air_std DOUBLE,
  dp_feeder_inlet_std DOUBLE,
  dp_gasifier_std DOUBLE,
  dp_inlet_bell_std DOUBLE,
  dp_exit_quench_std DOUBLE,
  dp_quench_candle_std DOUBLE,
  dp_quench_ako_std DOUBLE,
  dp_ako_ambient_std DOUBLE,
  dp_bag_purge_std DOUBLE,
  dp_quench_candle_hopper_std DOUBLE,
  dp_candle_ko_ambient_std DOUBLE,
  dp_lock_hopper_injector_std DOUBLE,
  dp_filter_vessel_filters_std DOUBLE,
  dp_first_stage_burner_std DOUBLE,
  dp_second_stage_burner_std DOUBLE,
  dp_main_gas_burner_std DOUBLE,
  ai_outlet_moisture_std DOUBLE,
  stack_moisture_percent_std DOUBLE,
  mass_feed_vessel_std DOUBLE,
  value_feed_auger_pv_std DOUBLE,
  pp_H2O_std DOUBLE,
  pp_CO2_std DOUBLE,
  pp_Ar_std DOUBLE,
  Ar_MS_std DOUBLE,
  N2_MS_std DOUBLE,
  H2O_MS_std DOUBLE,
  H2_MS_std DOUBLE,
  CO_MS_std DOUBLE,
  CO2_MS_std DOUBLE,
  CH4_MS_std DOUBLE,
  C2H6_MS_std DOUBLE,
  C2H4_MS_std DOUBLE,
  C2H2_MS_std DOUBLE,
  C3H8_MS_std DOUBLE,
  C3H6_MS_std DOUBLE,
  C4H8_MS_std DOUBLE,
  C4H10_MS_std DOUBLE,
  CH3CHCH3CH3_MS_std DOUBLE,
  C6H6_MS_std DOUBLE,
  C7H8_MS_std DOUBLE,
  C6H4CH3CH3_MS_std DOUBLE,
  C6H5CH2CH3_MS_std DOUBLE,
  C10H8_MS_std DOUBLE,
  H2S_MS_std DOUBLE,
  Ar_normalized_std DOUBLE,
  N2_normalized_std DOUBLE,
  H2O_normalized_std DOUBLE,
  H2_normalized_std DOUBLE,
  CO_normalized_std DOUBLE,
  CO2_normalized_std DOUBLE,
  CH4_normalized_std DOUBLE,
  C2H6_normalized_std DOUBLE,
  C2H4_normalized_std DOUBLE,
  C2H2_normalized_std DOUBLE,
  C3H8_normalized_std DOUBLE,
  C3H6_normalized_std DOUBLE,
  C4H8_normalized_std DOUBLE,
  C4H10_normalized_std DOUBLE,
  CH3CHCH3CH3_normalized_std DOUBLE,
  C6H6_normalized_std DOUBLE,
  C7H8_normalized_std DOUBLE,
  C6H4CH3CH3_normalized_std DOUBLE,
  C6H5CH2CH3_normalized_std DOUBLE,
  C10H8_normalized_std DOUBLE,
  H2S_normalized_std DOUBLE,
  Ar_inlet_std DOUBLE,
  N2_inlet_std DOUBLE,
  H2O_inlet_std DOUBLE,
  H2_inlet_std DOUBLE,
  CO_inlet_std DOUBLE,
  CO2_inlet_std DOUBLE,
  CH4_inlet_std DOUBLE,
  C2H6_inlet_std DOUBLE,
  C2H4_inlet_std DOUBLE,
  C2H2_inlet_std DOUBLE,
  C3H8_inlet_std DOUBLE,
  C3H6_inlet_std DOUBLE,
  C4H8_inlet_std DOUBLE,
  C4H10_inlet_std DOUBLE,
  CH3CHCH3CH3_inlet_std DOUBLE,
  C6H6_inlet_std DOUBLE,
  C7H8_inlet_std DOUBLE,
  C6H4CH3CH3_inlet_std DOUBLE,
  C6H5CH2CH3_inlet_std DOUBLE,
  C10H8_inlet_std DOUBLE,
  H2S_inlet_std DOUBLE,
  Ar_outlet_std DOUBLE,
  N2_outlet_std DOUBLE,
  H2O_outlet_std DOUBLE,
  H2_outlet_std DOUBLE,
  CO_outlet_std DOUBLE,
  CO2_outlet_std DOUBLE,
  CH4_outlet_std DOUBLE,
  C2H6_outlet_std DOUBLE,
  C2H4_outlet_std DOUBLE,
  C2H2_outlet_std DOUBLE,
  C3H8_outlet_std DOUBLE,
  C3H6_outlet_std DOUBLE,
  C4H8_outlet_std DOUBLE,
  C4H10_outlet_std DOUBLE,
  CH3CHCH3CH3_outlet_std DOUBLE,
  C6H6_outlet_std DOUBLE,
  C7H8_outlet_std DOUBLE,
  C6H4CH3CH3_outlet_std DOUBLE,
  C6H5CH2CH3_outlet_std DOUBLE,
  C10H8_outlet_std DOUBLE,
  H2S_outlet_std DOUBLE,
  C_inlet_std DOUBLE,
  H_inlet_std DOUBLE,
  O_inlet_std DOUBLE,
  C_outlet_std DOUBLE,
  H_outlet_std DOUBLE,
  O_outlet_std DOUBLE,
  X_std_std DOUBLE,
  X_tot_std DOUBLE,
  X_good_std DOUBLE,
  CH4_yield_std DOUBLE,
  CO_yield_std DOUBLE,
  tar_loading_std DOUBLE,
  tar_loading_incl_std DOUBLE,
  optical_thickness_d10_std DOUBLE,
  optical_thickness_d50_std DOUBLE,
  optical_thickness_d90_std DOUBLE,
  volumetric_inlet_gas_only_std DOUBLE,
  T_cupmix_gas_only_std DOUBLE,
  C_gas_mass_balance_std DOUBLE,
  space_time_std DOUBLE,
  delta_H_std DOUBLE,
  dH_max_std DOUBLE,
  exit_gas_flowrate_std DOUBLE,
  analysis_ts DATETIME,
  N_total INT,
  N_MS INT,
  FOREIGN KEY (run_id)
        REFERENCES run_info_tbl (run_id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

-- -------------------------- --
-- CREATE ANALYSIS CONFIG TBL --
-- -------------------------- --

DROP TABLE IF EXISTS analysis_config_tbl;

CREATE TABLE analysis_config_tbl
(
  avg_std_cols VARCHAR(100) PRIMARY KEY,
  active TINYINT(1)
);

  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('roto_feed_op', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('mass_flow_argon', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('mass_flow_argon_sp', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('mass_flow_entrainment', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('mass_flow_entrainment_op', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('mass_flow_entrainment_sp', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('mass_flow_quench', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('mass_flow_steam', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('mass_flow_steam_op', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('mass_flow_steam_sp', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('mass_flow_superheater_purge', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('mass_flow_superheater_purge_sp', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('mass_flow_supply_4', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('mass_flow_supply_5', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('mass_flow_sweep', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('mass_flow_sweep_sp', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('mass_flow_purge_tap_N2_total', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('vol_flow_entrainment', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('flow_coriolis', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('dp_ako_ambient', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('dp_bag_purge', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('dp_candle_ko_ambient', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('dp_exit_quench', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('dp_feeder_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('dp_gasifier', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('dp_inlet_bell', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('dp_lock_hopper_injector', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('dp_quench_ako', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('dp_quench_candle', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('dp_quench_candle_hopper', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('dp_filter_vessel_filters', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('dp_first_stage_burner', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('dp_second_stage_burner', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('dp_main_gas_burner', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_V_1406', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_ako', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_backup_quench_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_bell_housing', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_boiler', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_boiler_exit', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_boiler_sp', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_candle_filter_backpulse', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_candle_filter_ko', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_candle_filter_outlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_CH4', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_CO2_supply', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_compressed_air', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_combustion_air', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_N2_supply', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_MAC_CO2', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_entrainment_line', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_furnace_2', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_furnace_box', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_furnace_exhaust_fan', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_gasifier_furnace', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_lock_hopper_supply', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_ms_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_outlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_outlet_op', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_outlet_sp', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_purge_gas_filter', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_quench', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_quench_op', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_quench_sp', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_steam', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_steam_sp', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_steam_op', 1);

  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_roto_feed_exit', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_roto_feed_injector_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_ako_gas', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_ash_spheri', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_ash_knife', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_quench_knife', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_steam_fcv', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_backup_quench_return', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_backup_quench_sp', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_backup_quench_op', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_bed_1', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_bed_2', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_bell_sweep_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_biomass_inlet_skin', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_blower', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_boiler', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_candle_filter_1', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_candle_filter_2', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_candle_filter_3', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_candle_filter_4', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_candle_filter_5', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_candle_filter_ash_dump', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_candle_filter_backpulse', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_candle_filter_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_candle_filter_outlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_coriolis_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_expansion_joint_skin', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_furnace_sp', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_furnace_roof', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_furnace_exhaust', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_gasifier_exit', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_gasifier_exit_spool_skin', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_gasifier_refractory_1', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_gasifier_refractory_2', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_gasifier_stack_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_gc_vent', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_lower_bucket_seal_containment_skin', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_lower_bucket_seal_skin_a', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_lower_bucket_seal_skin_b', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_lower_bucket_seal_skin_c', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_lower_bucket_seal_skin_d', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_ms_heat_trace', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_ms_heat_trace_op', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_ms_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_primary_quench_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_primary_quench_water', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_quench', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_quench_exit', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_quench_exit_redundant', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_quench_exit_valve_skin', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_quench_lower', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_quench_op', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_quench_skin', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_quench_sp', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_skin_tube_bottom', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_skin_tube_middle', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_skin_tube_top', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_steam_gasifier_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_steam_relief_vent', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_steam_superheater_exit', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_superheater_1_element', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_superheater_1_shell', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_superheater_2_element', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_superheater_2_shell', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_superheater_interstage', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_superheater_sp', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_tar_cooling_exit', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_tar_cooler_skin', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_tar_filter_exit', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_tar_probe_heat_trace', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_tar_probe_heat_trace_op', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_tar_probe_heat_trace_sp', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_tar_probe_vent', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_upper_bucket_seal_containment_skin', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_upper_bucket_seal_skin', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('ai_outlet_moisture', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('stack_moisture_percent', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('mass_feed_vessel', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('value_feed_auger_pv', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pp_H2O', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pp_CO2', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pp_Ar', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('N2_MS', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('Ar_MS', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('H2O_MS', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('H2_MS', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('CO_MS', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('CO2_MS', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('CH4_MS', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C2H6_MS', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C2H4_MS', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C2H2_MS', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C3H8_MS', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C3H6_MS', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C4H8_MS', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('CH3CHCH3CH3_MS', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C6H6_MS', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C7H8_MS', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C6H4CH3CH3_MS', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C6H5CH2CH3_MS', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C10H8_MS', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('H2S_MS', 1);  
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('N2_normalized', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('Ar_normalized', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('H2O_normalized', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('H2_normalized', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('CO_normalized', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('CO2_normalized', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('CH4_normalized', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C2H6_normalized', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C2H4_normalized', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C2H2_normalized', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C3H8_normalized', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C3H6_normalized', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C4H8_normalized', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('CH3CHCH3CH3_normalized', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C6H6_normalized', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C7H8_normalized', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C6H4CH3CH3_normalized', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C6H5CH2CH3_normalized', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C10H8_normalized', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('H2S_normalized', 1); 
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('N2_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('Ar_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('H2O_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('H2_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('CO_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('CO2_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('CH4_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C2H6_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C2H4_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C2H2_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C3H8_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C3H6_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C4H8_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('CH3CHCH3CH3_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C6H6_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C7H8_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C6H4CH3CH3_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C6H5CH2CH3_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C10H8_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('H2S_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('N2_outlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('Ar_outlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('H2O_outlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('H2_outlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('CO_outlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('CO2_outlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('CH4_outlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C2H6_outlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C2H4_outlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C2H2_outlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C3H8_outlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C3H6_outlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C4H8_outlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('CH3CHCH3CH3_outlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C6H6_outlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C7H8_outlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C6H4CH3CH3_outlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C6H5CH2CH3_outlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C10H8_outlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('H2S_outlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('H_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('O_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C_outlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('H_outlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('O_outlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('X_std', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('X_tot', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('X_good', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('CH4_yield', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('CO_yield', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('tar_loading', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('tar_loading_incl', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('optical_thickness_d10', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('optical_thickness_d50', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('optical_thickness_d90', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('volumetric_inlet_gas_only', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('T_cupmix_gas_only', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C_gas_mass_balance', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('space_time', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('delta_H', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('dH_max', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('exit_gas_flowrate', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('biomass_flowrate', 1);

-- ---------------------- --
-- CREATE REPORT PLOT TBL --
-- ---------------------- --

DROP TABLE IF EXISTS plot_tbl;

CREATE TABLE plot_tbl
(
  plot_id INT PRIMARY KEY AUTO_INCREMENT,
  plot_type ENUM('time_series', 'time_series_ss', 'control', 'four'),
  plot_title VARCHAR(45),
  plot_caption VARCHAR(45),
  x_variable VARCHAR(45),
  x_label VARCHAR(45),
  x_min FLOAT,
  x_max FLOAT,
  y_variable VARCHAR(45),
  y_label VARCHAR(45),
  y_min FLOAT,
  y_max FLOAT
);

-- ------------ --
-- CREATE VIEWS --
-- ------------ --
DROP VIEW IF EXISTS run_plan_view;

CREATE VIEW run_plan_view AS
  SELECT R.*,
         S.temperature,
         S.pressure,
         S.biomass_rate,
         S.steam_flow,
         S.steam_temp,
         S.ent_CO2,
         S.sweep_CO2,
         S.Ar_tracer,
         S.superheater_purge,
         S.tube_diameter,
         B.moisture,
         B.w_c,
         B.w_n,
         B.w_h,
         B.d10,
         B.d50,
         B.d90
  FROM run_info_tbl AS R, setpoint_tbl AS S, biomass_tbl AS B
  WHERE R.setpoint_id = S.setpoint_id AND
        R.biomass_id = B.biomass_id
  ORDER BY R.run_id;
 
-- --------------- --
-- CREATE TRIGGERS --
-- --------------- --

DELIMITER $$

-- Sets reanalyze and new run value for run to zero after integral tbl is updated
DROP TRIGGER IF EXISTS after_integral_tbl_update;
CREATE TRIGGER after_integral_tbl_update AFTER UPDATE ON integral_tbl
  FOR EACH ROW
  BEGIN
    IF NEW.analysis_ts != OLD.analysis_ts THEN
        UPDATE reanalyze_tbl SET new_run = 0, reanalyze = 0 WHERE run_id = NEW.run_id;
    END IF;
END $$

-- Sets reanalyze and new run value for run to zero after new run is insreted into integral tbl
DROP TRIGGER IF EXISTS after_integral_tbl_insert;
CREATE TRIGGER after_integral_tbl_insert AFTER INSERT ON integral_tbl
  FOR EACH ROW
  BEGIN
    UPDATE reanalyze_tbl SET new_run = 0, reanalyze = 0 WHERE run_id = NEW.run_id;
END $$

-- Sets reanalyze value to 1 when run info tbl is updated for certain columns.  Columns must be added manually to code...
-- Also will set reanalyze value to 1 for new runs once all needed information is added to run info tbl
DROP TRIGGER IF EXISTS after_run_info_tbl_update;
CREATE TRIGGER after_run_info_tbl_update AFTER UPDATE ON run_info_tbl
  FOR EACH ROW
  BEGIN
    IF ((NEW.ss_start != OLD.ss_start OR (NEW.ss_start IS NOT NULL AND OLD.ss_start IS NULL))
      OR (NEW.ss_stop != OLD.ss_stop OR (NEW.ss_stop IS NOT NULL AND OLD.ss_stop IS NULL))) 
      AND (NEW.ss_start IS NOT NULL AND NEW.ss_stop IS NOT NULL) THEN
                UPDATE reanalyze_tbl SET reanalyze_tbl.reanalyze = 1 
                WHERE reanalyze_tbl.run_id = NEW.run_id;
    END IF;
END $$

-- Sets value for new run to 1.  Leaves reanalyze value as 0, waits until needed information is put into run info tbl to mark for reanalysis.
DROP TRIGGER IF EXISTS after_run_info_tbl_insert;
CREATE TRIGGER after_run_info_tbl_insert AFTER INSERT ON run_info_tbl
  FOR EACH ROW
  BEGIN
    INSERT INTO reanalyze_tbl (run_id, new_run) VALUES (NEW.run_id, 1);
END $$

DELIMITER ;

INSERT INTO setpoint_tbl (temperature, pressure, biomass_rate, steam_flow, steam_temp, ent_CO2, sweep_CO2, Ar_tracer, superheater_purge, tube_diameter) VALUES (1400, 25.0, 25.0, 20.0, 400.0, 20.0, 100.0, 100.0, 25.0, 3.5);

INSERT INTO biomass_tbl (sample_name, moisture, w_c, w_n, w_h, d10, d50, d90) VALUES ('test_data', 4.00, 57.0, 0.2, 6.0, 15.0, 75.0, 150.0);

INSERT INTO run_info_tbl (run_id, setpoint_id, biomass_id, ts_start, ts_stop, ss_start, ss_stop, operator, feeder_slope, feeder_intercept) VALUES (0, 1, 1, '2014-08-19 19:30:00', '2014-08-19 19:35:00', '2014-08-19 19:30:00', '2014-08-19 19:35:00', 'aa', '1.0', '0.0');
