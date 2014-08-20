DROP DATABASE IF EXISTS pilot_proc_db;
CREATE DATABASE IF NOT EXISTS pilot_proc_db;

USE pilot_proc_db;

-- ------------------- --
-- CREATE SETPOINT TBL --
-- ------------------- --
-- DROP TABLE IF EXISTS setpoint_tbl;

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
    feedstock       VARCHAR(45),
    tube_diameter   double
);

-- ------------------- --
-- CREATE BIOMASS TBL  --
-- ------------------- --
DROP TABLE IF EXISTS biomass_tbl;

CREATE TABLE biomass_tbl
(
biomass_id INT,
sample_name VARCHAR(100),
moisture DOUBLE,
wt_c DOUBLE,
wt_n DOUBLE,
wt_h DOUBLE,
d10 DOUBLE,
d50 DOUBLE,
d90 DOUBLE);

-- ------------------- --
-- CREATE RUN INFO TBL --
-- ------------------- --
-- DROP TABLE IF EXISTS run_info_tbl;

CREATE TABLE run_info_tbl
(
    run_id      INT PRIMARY KEY AUTO_INCREMENT,
    sample_id   INT,
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
-- DROP TABLE IF EXISTS reanalyze_tbl;

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
-- CREATE INTEGRAL TBL --
-- ------------------- --

-- DROP TABLE IF EXISTS integral_tbl;

CREATE TABLE integral_tbl
(
  run_id INT PRIMARY KEY,
  ai_lock_hopper_purge_avg DOUBLE,
  ai_lock_hopper_purge_std DOUBLE,
  ai_outlet_moisture_avg DOUBLE,
  ai_outlet_moisture_std DOUBLE,
  dp_1403_1402_avg DOUBLE,
  dp_1403_1402_std DOUBLE,
  dp_ako_ambient_avg DOUBLE,
  dp_ako_ambient_std DOUBLE,
  dp_bag_purge_avg DOUBLE,
  dp_bag_purge_std DOUBLE,
  dp_candle_ko_ambient_avg DOUBLE,
  dp_candle_ko_ambient_std DOUBLE,
  dp_exit_quench_avg DOUBLE,
  dp_exit_quench_std DOUBLE,
  dp_feeder_inlet_avg DOUBLE,
  dp_feeder_inlet_std DOUBLE,
  dp_gasifier_avg DOUBLE,
  dp_gasifier_std DOUBLE,
  dp_inlet_bell_avg DOUBLE,
  dp_inlet_bell_std DOUBLE,
  dp_lock_hopper_injector_avg DOUBLE,
  dp_lock_hopper_injector_std DOUBLE,
  dp_quench_ako_avg DOUBLE,
  dp_quench_ako_std DOUBLE,
  dp_quench_candle_avg DOUBLE,
  dp_quench_candle_std DOUBLE,
  dp_quench_candle_hopper_avg DOUBLE,
  dp_quench_candle_hopper_std DOUBLE,
  flow_coriolis_avg DOUBLE,
  flow_coriolis_std DOUBLE,
  level_water_avg DOUBLE,
  level_water_std DOUBLE,
  mass_feed_vessel_avg DOUBLE,
  mass_feed_vessel_std DOUBLE,
  mass_flow_argon_avg DOUBLE,
  mass_flow_argon_std DOUBLE,
  mass_flow_argon_sp_avg DOUBLE,
  mass_flow_argon_sp_std DOUBLE,
  mass_flow_entrainment_avg DOUBLE,
  mass_flow_entrainment_std DOUBLE,
  mass_flow_entrainment_op_avg DOUBLE,
  mass_flow_entrainment_op_std DOUBLE,
  mass_flow_entrainment_sp_avg DOUBLE,
  mass_flow_entrainment_sp_std DOUBLE,
  mass_flow_quench_avg DOUBLE,
  mass_flow_quench_std DOUBLE,
  mass_flow_steam_avg DOUBLE,
  mass_flow_steam_std DOUBLE,
  mass_flow_steam_op_avg DOUBLE,
  mass_flow_steam_op_std DOUBLE,
  mass_flow_steam_sp_avg DOUBLE,
  mass_flow_steam_sp_std DOUBLE,
  mass_flow_superheater_op_avg DOUBLE,
  mass_flow_superheater_op_std DOUBLE,
  mass_flow_superheater_purge_avg DOUBLE,
  mass_flow_superheater_purge_std DOUBLE,
  mass_flow_superheater_purge_sp_avg DOUBLE,
  mass_flow_superheater_purge_sp_std DOUBLE,
  mass_flow_supply_4_avg DOUBLE,
  mass_flow_supply_4_std DOUBLE,
  mass_flow_supply_5_avg DOUBLE,
  mass_flow_supply_5_std DOUBLE,
  mass_flow_sweep_avg DOUBLE,
  mass_flow_sweep_std DOUBLE,
  mass_flow_sweep_sp_avg DOUBLE,
  mass_flow_sweep_sp_std DOUBLE,
  pressure_1405_avg DOUBLE,
  pressure_1405_std DOUBLE,
  pressure_ako_avg DOUBLE,
  pressure_ako_std DOUBLE,
  pressure_backup_quench_inlet_avg DOUBLE,
  pressure_backup_quench_inlet_std DOUBLE,
  pressure_bell_housing_avg DOUBLE,
  pressure_bell_housing_std DOUBLE,
  pressure_boiler_avg DOUBLE,
  pressure_boiler_std DOUBLE,
  pressure_boiler_exit_avg DOUBLE,
  pressure_boiler_exit_std DOUBLE,
  pressure_boiler_sp_avg DOUBLE,
  pressure_boiler_sp_std DOUBLE,
  pressure_candle_filter_backpulse_avg DOUBLE,
  pressure_candle_filter_backpulse_std DOUBLE,
  pressure_candle_filter_ko_avg DOUBLE,
  pressure_candle_filter_ko_std DOUBLE,
  pressure_candle_filter_outlet_avg DOUBLE,
  pressure_candle_filter_outlet_std DOUBLE,
  pressure_entrainment_avg DOUBLE,
  pressure_entrainment_std DOUBLE,
  pressure_entrainment_op_avg DOUBLE,
  pressure_entrainment_op_std DOUBLE,
  pressure_entrainment_sp_avg DOUBLE,
  pressure_entrainment_sp_std DOUBLE,
  pressure_furnace_1_avg DOUBLE,
  pressure_furnace_1_std DOUBLE,
  pressure_furnace_2_avg DOUBLE,
  pressure_furnace_2_std DOUBLE,
  pressure_gasifier_furnace_avg DOUBLE,
  pressure_gasifier_furnace_std DOUBLE,
  pressure_lock_hopper_supply_avg DOUBLE,
  pressure_lock_hopper_supply_std DOUBLE,
  pressure_ms_inlet_avg DOUBLE,
  pressure_ms_inlet_std DOUBLE,
  pressure_outlet_avg DOUBLE,
  pressure_outlet_std DOUBLE,
  pressure_outlet_op_avg DOUBLE,
  pressure_outlet_op_std DOUBLE,
  pressure_outlet_sp_avg DOUBLE,
  pressure_outlet_sp_std DOUBLE,
  pressure_purge_gas_filter_avg DOUBLE,
  pressure_purge_gas_filter_std DOUBLE,
  pressure_quench_avg DOUBLE,
  pressure_quench_std DOUBLE,
  pressure_quench_op_avg DOUBLE,
  pressure_quench_op_std DOUBLE,
  pressure_quench_sp_avg DOUBLE,
  pressure_quench_sp_std DOUBLE,
  pressure_roto_feed_exit_avg DOUBLE,
  pressure_roto_feed_exit_std DOUBLE,
  pressure_roto_feed_injector_inlet_avg DOUBLE,
  pressure_roto_feed_injector_inlet_std DOUBLE,
  roto_feed_op_avg DOUBLE,
  roto_feed_op_std DOUBLE,
  temp_ako_gas_avg DOUBLE,
  temp_ako_gas_std DOUBLE,
  temp_ako_outlet_valve_skin_avg DOUBLE,
  temp_ako_outlet_valve_skin_std DOUBLE,
  temp_ako_relief_avg DOUBLE,
  temp_ako_relief_std DOUBLE,
  temp_backup_quench_return_avg DOUBLE,
  temp_backup_quench_return_std DOUBLE,
  temp_bell_sweep_inlet_avg DOUBLE,
  temp_bell_sweep_inlet_std DOUBLE,
  temp_biomass_inlet_skin_avg DOUBLE,
  temp_biomass_inlet_skin_std DOUBLE,
  temp_boiler_avg DOUBLE,
  temp_boiler_std DOUBLE,
  temp_candle_filter_1_avg DOUBLE,
  temp_candle_filter_1_std DOUBLE,
  temp_candle_filter_2_avg DOUBLE,
  temp_candle_filter_2_std DOUBLE,
  temp_candle_filter_3_avg DOUBLE,
  temp_candle_filter_3_std DOUBLE,
  temp_candle_filter_4_avg DOUBLE,
  temp_candle_filter_4_std DOUBLE,
  temp_candle_filter_5_avg DOUBLE,
  temp_candle_filter_5_std DOUBLE,
  temp_candle_filter_ash_dump_avg DOUBLE,
  temp_candle_filter_ash_dump_std DOUBLE,
  temp_candle_filter_backpulse_avg DOUBLE,
  temp_candle_filter_backpulse_std DOUBLE,
  temp_candle_filter_inlet_avg DOUBLE,
  temp_candle_filter_inlet_std DOUBLE,
  temp_candle_filter_outlet_avg DOUBLE,
  temp_candle_filter_outlet_std DOUBLE,
  temp_candle_filter_outlet_purge_avg DOUBLE,
  temp_candle_filter_outlet_purge_std DOUBLE,
  temp_car_cooling_exit_avg DOUBLE,
  temp_car_cooling_exit_std DOUBLE,
  temp_coriolis_before_avg DOUBLE,
  temp_coriolis_before_std DOUBLE,
  temp_expansion_joint_skin_avg DOUBLE,
  temp_expansion_joint_skin_std DOUBLE,
  temp_furnace_sp_avg DOUBLE,
  temp_furnace_sp_std DOUBLE,
  temp_gasifier_exit_avg DOUBLE,
  temp_gasifier_exit_std DOUBLE,
  temp_gasifier_exit_spool_skin_avg DOUBLE,
  temp_gasifier_exit_spool_skin_std DOUBLE,
  temp_gasifier_refactory_1_avg DOUBLE,
  temp_gasifier_refactory_1_std DOUBLE,
  temp_gasifier_refractory_2_avg DOUBLE,
  temp_gasifier_refractory_2_std DOUBLE,
  temp_gasifier_stack_inlet_avg DOUBLE,
  temp_gasifier_stack_inlet_std DOUBLE,
  temp_gasifier_stack_outlet_avg DOUBLE,
  temp_gasifier_stack_outlet_std DOUBLE,
  temp_gc_vent_avg DOUBLE,
  temp_gc_vent_std DOUBLE,
  temp_lower_bucket_seal_containment_skin_avg DOUBLE,
  temp_lower_bucket_seal_containment_skin_std DOUBLE,
  temp_lower_bucket_seal_skin_a_avg DOUBLE,
  temp_lower_bucket_seal_skin_a_std DOUBLE,
  temp_lower_bucket_seal_skin_b_avg DOUBLE,
  temp_lower_bucket_seal_skin_b_std DOUBLE,
  temp_lower_bucket_seal_skin_c_avg DOUBLE,
  temp_lower_bucket_seal_skin_c_std DOUBLE,
  temp_lower_bucket_seal_skin_d_avg DOUBLE,
  temp_lower_bucket_seal_skin_d_std DOUBLE,
  temp_ms_heat_trace_avg DOUBLE,
  temp_ms_heat_trace_std DOUBLE,
  temp_ms_heat_trace_op_avg DOUBLE,
  temp_ms_heat_trace_op_std DOUBLE,
  temp_ms_inlet_avg DOUBLE,
  temp_ms_inlet_std DOUBLE,
  temp_mv_heat_trace_sp_avg DOUBLE,
  temp_mv_heat_trace_sp_std DOUBLE,
  temp_primary_quench_inlet_avg DOUBLE,
  temp_primary_quench_inlet_std DOUBLE,
  temp_primary_quench_water_avg DOUBLE,
  temp_primary_quench_water_std DOUBLE,
  temp_quench_avg DOUBLE,
  temp_quench_std DOUBLE,
  temp_quench_exit_avg DOUBLE,
  temp_quench_exit_std DOUBLE,
  temp_quench_exit_redundant_avg DOUBLE,
  temp_quench_exit_redundant_std DOUBLE,
  temp_quench_exit_relief_avg DOUBLE,
  temp_quench_exit_relief_std DOUBLE,
  temp_quench_exit_valve_skin_avg DOUBLE,
  temp_quench_exit_valve_skin_std DOUBLE,
  temp_quench_lower_avg DOUBLE,
  temp_quench_lower_std DOUBLE,
  temp_quench_op_avg DOUBLE,
  temp_quench_op_std DOUBLE,
  temp_quench_pressure_relief_exit_avg DOUBLE,
  temp_quench_pressure_relief_exit_std DOUBLE,
  temp_quench_skin_avg DOUBLE,
  temp_quench_skin_std DOUBLE,
  temp_quench_sp_avg DOUBLE,
  temp_quench_sp_std DOUBLE,
  temp_skin_tube_bottom_avg DOUBLE,
  temp_skin_tube_bottom_std DOUBLE,
  temp_skin_tube_middle_avg DOUBLE,
  temp_skin_tube_middle_std DOUBLE,
  temp_skin_tube_top_avg DOUBLE,
  temp_skin_tube_top_std DOUBLE,
  temp_steam_gasifier_inlet_avg DOUBLE,
  temp_steam_gasifier_inlet_std DOUBLE,
  temp_steam_relief_vent_avg DOUBLE,
  temp_steam_relief_vent_std DOUBLE,
  temp_steam_superheater_exit_avg DOUBLE,
  temp_steam_superheater_exit_std DOUBLE,
  temp_superheater_1_element_avg DOUBLE,
  temp_superheater_1_element_std DOUBLE,
  temp_superheater_1_shell_avg DOUBLE,
  temp_superheater_1_shell_std DOUBLE,
  temp_superheater_2_element_avg DOUBLE,
  temp_superheater_2_element_std DOUBLE,
  temp_superheater_2_shell_avg DOUBLE,
  temp_superheater_2_shell_std DOUBLE,
  temp_superheater_interstage_avg DOUBLE,
  temp_superheater_interstage_std DOUBLE,
  temp_superheater_relief_1_avg DOUBLE,
  temp_superheater_relief_1_std DOUBLE,
  temp_superheater_relief_2_avg DOUBLE,
  temp_superheater_relief_2_std DOUBLE,
  temp_superheater_sp_avg DOUBLE,
  temp_superheater_sp_std DOUBLE,
  temp_tar_cooler_skin_avg DOUBLE,
  temp_tar_cooler_skin_std DOUBLE,
  temp_tar_filter_exit_avg DOUBLE,
  temp_tar_filter_exit_std DOUBLE,
  temp_tar_probe_heat_trace_avg DOUBLE,
  temp_tar_probe_heat_trace_std DOUBLE,
  temp_tar_probe_heat_trace_op_avg DOUBLE,
  temp_tar_probe_heat_trace_op_std DOUBLE,
  temp_tar_probe_heat_trace_sp_avg DOUBLE,
  temp_tar_probe_heat_trace_sp_std DOUBLE,
  temp_tar_probe_vent_avg DOUBLE,
  temp_tar_probe_vent_std DOUBLE,
  temp_upper_bucket_seal_containment_skin_avg DOUBLE,
  temp_upper_bucket_seal_containment_skin_std DOUBLE,
  temp_upper_bucket_seal_skin_avg DOUBLE,
  temp_upper_bucket_seal_skin_std DOUBLE,
  valve_feed_auger_pv_avg DOUBLE,
  valve_feed_auger_pv_std DOUBLE,
  N2_MS_avg DOUBLE,
  N2_MS_std DOUBLE,
  Ar_MS_avg DOUBLE,
  Ar_MS_std DOUBLE,
  H2O_MS_avg DOUBLE,
  H2O_MS_std DOUBLE,
  H2_MS_avg DOUBLE,
  H2_MS_std DOUBLE,
  CO_MS_avg DOUBLE,
  CO_MS_std DOUBLE,
  CO2_MS_avg DOUBLE,
  CO2_MS_std DOUBLE,
  CH4_MS_avg DOUBLE,
  CH4_MS_std DOUBLE,
  C2H6_MS_avg DOUBLE,
  C2H6_MS_std DOUBLE,
  C2H4_MS_avg DOUBLE,
  C2H4_MS_std DOUBLE,
  C2H2_MS_avg DOUBLE,
  C2H2_MS_std DOUBLE,
  C3H8_MS_avg DOUBLE,
  C3H8_MS_std DOUBLE,
  C3H6_MS_avg DOUBLE,
  C3H6_MS_std DOUBLE,
  C6H6_MS_avg DOUBLE,
  C6H6_MS_std DOUBLE,
  C7H8_MS_avg DOUBLE,
  C7H8_MS_std DOUBLE,
  C10H8_MS_avg DOUBLE,
  C10H8_MS_std DOUBLE,
  N2_inlet_avg DOUBLE,
  N2_inlet_std DOUBLE,
  Ar_inlet_avg DOUBLE,
  Ar_inlet_std DOUBLE,
  H2O_inlet_avg DOUBLE,
  H2O_inlet_std DOUBLE,
  H2_inlet_avg DOUBLE,
  H2_inlet_std DOUBLE,
  CO_inlet_avg DOUBLE,
  CO_inlet_std DOUBLE,
  CO2_inlet_avg DOUBLE,
  CO2_inlet_std DOUBLE,
  CH4_inlet_avg DOUBLE,
  CH4_inlet_std DOUBLE,
  C2H6_inlet_avg DOUBLE,
  C2H6_inlet_std DOUBLE,
  C2H4_inlet_avg DOUBLE,
  C2H4_inlet_std DOUBLE,
  C2H2_inlet_avg DOUBLE,
  C2H2_inlet_std DOUBLE,
  C3H8_inlet_avg DOUBLE,
  C3H8_inlet_std DOUBLE,
  C3H6_inlet_avg DOUBLE,
  C3H6_inlet_std DOUBLE,
  C6H6_inlet_avg DOUBLE,
  C6H6_inlet_std DOUBLE,
  C7H8_inlet_avg DOUBLE,
  C7H8_inlet_std DOUBLE,
  C10H8_inlet_avg DOUBLE,
  C10H8_inlet_std DOUBLE,
  N2_outlet_avg DOUBLE,
  N2_outlet_std DOUBLE,
  Ar_outlet_avg DOUBLE,
  Ar_outlet_std DOUBLE,
  H2O_outlet_avg DOUBLE,
  H2O_outlet_std DOUBLE,
  H2_outlet_avg DOUBLE,
  H2_outlet_std DOUBLE,
  CO_outlet_avg DOUBLE,
  CO_outlet_std DOUBLE,
  CO2_outlet_avg DOUBLE,
  CO2_outlet_std DOUBLE,
  CH4_outlet_avg DOUBLE,
  CH4_outlet_std DOUBLE,
  C2H6_outlet_avg DOUBLE,
  C2H6_outlet_std DOUBLE,
  C2H4_outlet_avg DOUBLE,
  C2H4_outlet_std DOUBLE,
  C2H2_outlet_avg DOUBLE,
  C2H2_outlet_std DOUBLE,
  C3H8_outlet_avg DOUBLE,
  C3H8_outlet_std DOUBLE,
  C3H6_outlet_avg DOUBLE,
  C3H6_outlet_std DOUBLE,
  C6H6_outlet_avg DOUBLE,
  C6H6_outlet_std DOUBLE,
  C7H8_outlet_avg DOUBLE,
  C7H8_outlet_std DOUBLE,
  C10H8_outlet_avg DOUBLE,
  C10H8_outlet_std DOUBLE,
  analysis_ts DATETIME,
  FOREIGN KEY (run_id)
        REFERENCES run_info_tbl (run_id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

-- -------------------------- --
-- CREATE ANALYSIS CONFIG TBL --
-- -------------------------- --

-- DROP TABLE IF EXISTS analysis_config_tbl;

CREATE TABLE analysis_config_tbl
(
  avg_std_cols VARCHAR(100) PRIMARY KEY,
  active TINYINT(1)
);

  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('ai_lock_hopper_purge', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('ai_outlet_moisture', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('dp_1403_1402', 1);
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
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('flow_coriolis', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('level_water', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('mass_feed_vessel', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('mass_flow_argon', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('mass_flow_argon_sp', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('mass_flow_entrainment', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('mass_flow_entrainment_op', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('mass_flow_entrainment_sp', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('mass_flow_quench', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('mass_flow_steam', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('mass_flow_steam_op', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('mass_flow_steam_sp', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('mass_flow_superheater_op', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('mass_flow_superheater_purge', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('mass_flow_superheater_purge_sp', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('mass_flow_supply_4', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('mass_flow_supply_5', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('mass_flow_sweep', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('mass_flow_sweep_sp', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_1405', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_ako', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_backup_quench_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_bell_housing', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_boiler', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_boiler_exit', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_boiler_sp', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_candle_filter_backpulse', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_candle_filter_ko', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_candle_filter_outlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_entrainment', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_entrainment_op', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_entrainment_sp', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_furnace_1', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_furnace_2', 1);
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
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_roto_feed_exit', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('pressure_roto_feed_injector_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('roto_feed_op', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_ako_gas', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_ako_outlet_valve_skin', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_ako_relief', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_backup_quench_return', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_bell_sweep_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_biomass_inlet_skin', 1);
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
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_candle_filter_outlet_purge', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_car_cooling_exit', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_coriolis_before', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_expansion_joint_skin', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_furnace_sp', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_gasifier_exit', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_gasifier_exit_spool_skin', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_gasifier_refactory_1', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_gasifier_refractory_2', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_gasifier_stack_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_gasifier_stack_outlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_gc_vent', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_lower_bucket_seal_containment_skin', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_lower_bucket_seal_skin_a', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_lower_bucket_seal_skin_b', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_lower_bucket_seal_skin_c', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_lower_bucket_seal_skin_d', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_ms_heat_trace', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_ms_heat_trace_op', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_ms_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_mv_heat_trace_sp', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_primary_quench_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_primary_quench_water', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_quench', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_quench_exit', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_quench_exit_redundant', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_quench_exit_relief', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_quench_exit_valve_skin', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_quench_lower', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_quench_op', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_quench_pressure_relief_exit', 1);
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
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_superheater_relief_1', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_superheater_relief_2', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_superheater_sp', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_tar_cooler_skin', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_tar_filter_exit', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_tar_probe_heat_trace', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_tar_probe_heat_trace_op', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_tar_probe_heat_trace_sp', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_tar_probe_vent', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_upper_bucket_seal_containment_skin', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('temp_upper_bucket_seal_skin', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('valve_feed_auger_pv', 1);
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
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C6H6_MS', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C7H8_MS', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C10H8_MS', 1);  
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
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C6H6_normalized', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C7H8_normalized', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C10H8_normalized', 1);  
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
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C6H6_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C7H8_inlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C10H8_inlet', 1);
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
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C6H6_outlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C7H8_outlet', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('C10H8_outlet', 1);

-- ---------------------- --
-- CREATE REPORT PLOT TBL --
-- ---------------------- --

-- DROP TABLE IF EXISTS plot_tbl;

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
  SELECT * FROM run_info_tbl 
  LEFT JOIN setpoint_tbl ON
  run_info_tbl.setpoint_id = setpoint_tbl.setpoint_id;

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


