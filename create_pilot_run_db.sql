CREATE DATABASE IF NOT EXISTS pilot_run_db;

USE pilot_run_db;

----------------------
--CREATE LV DATA TBL--
----------------------
DROP TABLE IF EXISTS lv_data_tbl;

CREATE TABLE IF NOT EXISTS pilot_run_db.lv_data_tbl(
  ts TIMESTAMP,
  AG_1407_FAULT TINYINT(1),
  AG_1407_OP DOUBLE,
  AI_922021 DOUBLE,
  AI_932050 DOUBLE,
  DPI_922019 DOUBLE,
  DPI_922021 DOUBLE,
  DPI_922022 DOUBLE,
  DPI_932014 DOUBLE,
  DPI_932015 DOUBLE,
  DPI_932070 DOUBLE,
  DPI_932071 DOUBLE,
  DPI_932302 DOUBLE,
  DPI_936014 DOUBLE,
  DPI_936015 DOUBLE,
  DPIT_922007 DOUBLE,
  E_STOP TINYINT(1),
  FI_1423 DOUBLE,
  FI_1445 DOUBLE,
  FI_932006 DOUBLE,
  FI_932036 DOUBLE,
  FIC_1442_OP DOUBLE,
  FIC_1442_PV  DOUBLE,
  FIC_1442_SP DOUBLE,
  FIC_983006_OP DOUBLE,
  FIC_983006_PV DOUBLE,
  FIC_983006_SP DOUBLE,
  FIC_986009_OP DOUBLE,
  FIC_986009_PV DOUBLE,
  FIC_986009_SP DOUBLE,
  FIC_989011_PV DOUBLE,
  FIC_989011_SP DOUBLE,
  FIC_990014_PV DOUBLE,
  FIC_990014_SP DOUBLE,
  HS_932018 TINYINT(1),
  HS_932025 TINYINT(1),
  LCV_932024 TINYINT(1),
  LE_932004 DOUBLE,
  LSH_1405 TINYINT(1),
  LSH_932021 TINYINT(1),
  LSL_1406 TINYINT(1),
  PC_983001 DOUBLE,
  PCV_1420_OP DOUBLE,
  PCV_1420_PV DOUBLE,
  PCV_1420_SP DOUBLE,
  PDI_1445 DOUBLE,
  PI_1442 DOUBLE,
  PI_1445 DOUBLE,
  PI_326 DOUBLE,
  PI_924502 DOUBLE,
  PI_924XXX DOUBLE,
  PI_932019 DOUBLE,
  PI_932042 DOUBLE,
  PI_932057 DOUBLE,
  PI_932503 DOUBLE,
  PI_936010 DOUBLE,
  PI_936012 DOUBLE,
  PI_936052 DOUBLE,
  PI_983003 DOUBLE,
  PI_983005 DOUBLE,
  PIC_932005_OP DOUBLE,
  PIC_932005_PV DOUBLE,
  PIC_932005_SP DOUBLE,
  PIC_932030_OP DOUBLE,
  PIC_932030_PV DOUBLE,
  PIC_932030_SP DOUBLE,
  PS_1404 TINYINT(1),
  PS_1405 TINYINT(1),
  PS_1406 TINYINT(1),
  PS_932044 TINYINT(1),
  PSL_986611 TINYINT(1),
  PSL_986902 TINYINT(1),
  PT_1406 DOUBLE,
  PT_922008 DOUBLE,
  PT_1450 DOUBLE,
  TE_922022 DOUBLE,
  TE_932016 DOUBLE,
  TE_983301 DOUBLE,
  TE_983302 DOUBLE,
  TE_983303 DOUBLE,
  TE_983304 DOUBLE,
  TE_983305 DOUBLE,
  TI_323 DOUBLE,
  TI_324A DOUBLE,
  TI_324B DOUBLE,
  TI_922020 DOUBLE,
  TI_924001 DOUBLE,
  TI_924002 DOUBLE,
  TI_924003 DOUBLE,
  TI_924004 DOUBLE,
  TI_924012 DOUBLE,
  TI_924013 DOUBLE,
  TI_924014 DOUBLE,
  TI_924032 DOUBLE,
  TI_924034 DOUBLE,
  TI_924036 DOUBLE,
  TI_924101 DOUBLE,
  TI_924503 DOUBLE,
  TI_932001 DOUBLE,
  TI_932003 DOUBLE,
  TI_932007A DOUBLE,
  TI_932007B DOUBLE,
  TI_932011 DOUBLE,
  TI_932017 DOUBLE,
  TI_932018 DOUBLE,
  TI_932023 DOUBLE,
  TI_932035 DOUBLE,
  TI_932051 DOUBLE,
  TI_932056 DOUBLE,
  TI_932101 DOUBLE,
  TI_932151 DOUBLE,
  TI_932152 DOUBLE,
  TI_932501 DOUBLE,
  TI_932502 DOUBLE,
  TI_936001 DOUBLE,
  TI_936002 DOUBLE,
  TI_936003 DOUBLE,
  TI_936004 DOUBLE,
  TI_936005 DOUBLE,
  TI_936006 DOUBLE,
  TI_936007 DOUBLE,
  TI_936008 DOUBLE,
  TI_936009 DOUBLE,
  TI_936102 DOUBLE,
  TI_983004 DOUBLE,
  TI_983013 DOUBLE,
  TI_983027 DOUBLE,
  TI_983036 DOUBLE,
  TI_986065 DOUBLE,
  TI_989015 DOUBLE,
  TIC_932007_OP DOUBLE,
  TIC_932007_PV DOUBLE,
  TIC_932007_SP DOUBLE,
  TIC_932053_OP DOUBLE,
  TIC_932053_PV DOUBLE,
  TIC_932053_SP DOUBLE,
  TIC_986610_OP DOUBLE,
  TIC_986610_PV DOUBLE,
  TIC_986610_SP DOUBLE,
  TY_924021_SP DOUBLE,
  TY_983014_SP DOUBLE,
  WIC_1402_PV DOUBLE,
  WIT_1406 DOUBLE,
  XV_1401 TINYINT(1),
  XV_1404 TINYINT(1),
  XV_1405 TINYINT(1),
  XV_1406 TINYINT(1),
  XV_1421 TINYINT(1),
  XV_1422 TINYINT(1),
  XV_1423 TINYINT(1),
  XV_1440 TINYINT(1),
  XV_1441 TINYINT(1),
  XV_1443 TINYINT(1),
  XV_1444 TINYINT(1),
  XV_1445 TINYINT(1),
  XV_1447 TINYINT(1),
  XV_1448A TINYINT(1),
  XV_1448B TINYINT(1),
  XV_1449A TINYINT(1),
  XV_1449B TINYINT(1),
  XV_1449C TINYINT(1),
  XV_1450 TINYINT(1),
  XV_922016 TINYINT(1),
  XV_932018 TINYINT(1),
  XV_932025 TINYINT(1),
  XV_932028 TINYINT(1),
  XV_932046 TINYINT(1),
  XV_932049 TINYINT(1),
  XV_932052 TINYINT(1),
  XV_932180 TINYINT(1),
  XV_932301A TINYINT(1),
  XV_932301B TINYINT(1),
  XV_932301C TINYINT(1),
  XV_932504 TINYINT(1),
  XV_932505 TINYINT(1),
  XV_936001A TINYINT(1),
  XV_936001B TINYINT(1),
  XV_936002A TINYINT(1),
  XV_936002B TINYINT(1),
  XV_936050 TINYINT(1),
  XV_936058 TINYINT(1),
  XV_936080 TINYINT(1),
  XV_983012 TINYINT(1),
  XV_983013 TINYINT(1),
  XV_983065 TINYINT(1),
  XV_986006 TINYINT(1),
  XV_986016 TINYINT(1),
  XV_986024 TINYINT(1),
  XV_986034 TINYINT(1),
  XV_986901 TINYINT(1),
  XV_989012 TINYINT(1),
  XV_990013 TINYINT(1),
  ZSC_922016 TINYINT(1),
  ZSC_932504 TINYINT(1),
  ZSC_932505 TINYINT(1),
  ZSC_936001A TINYINT(1),
  ZSC_936001B TINYINT(1),
  ZSC_936002A TINYINT(1),
  ZSC_936002B TINYINT(1),
  ZSC_983012 TINYINT(1),
  ZSC_983013 TINYINT(1),
  ZSO_922016 TINYINT(1),
  ZSO_983012 TINYINT(1),
  ZSO_983013 TINYINT(1)
);

----------------------
--CREATE MS DATA TBL--
----------------------
DROP TABLE IF EXISTS ms_data_tbl;

CREATE  TABLE IF NOT EXISTS pilot_run_db.ms_data_tbl (
  ts TIMESTAMP NOT NULL,
  N2_MS     DOUBLE,
  Ar_MS     DOUBLE,
  H2_MS     DOUBLE,
  CO_MS     DOUBLE,
  CO2_MS    DOUBLE,
  CH4_MS    DOUBLE,
  C2H6_MS   DOUBLE,
  C2H4_MS   DOUBLE,
  C2H2_MS   DOUBLE,
  C3H8_MS   DOUBLE,
  C3H6_MS   DOUBLE,
  C6H6_MS   DOUBLE,
  C7H8_MS   DOUBLE,
  C10H8_MS  DOUBLE,
  PRIMARY KEY (ts)
);

----------------------
--CREATE GC DATA TBL--
----------------------
DROP TABLE IF EXISTS gc_data_tbl;

-----------------------
--CREATE GLOSSARY TBL--
-----------------------
DROP TABLE IF EXISTS glossary_tbl;

CREATE  TABLE IF NOT EXISTS pilot_run_db.glossary_tbl (
  tag_name      VARCHAR(45) NOT NULL,
  simple_name   VARCHAR(90),
  description   VARCHAR(90),
  units         VARCHAR(10),
  tag_log       TINYINT(1) NOT NULL DEFAULT 0,
  pid_sheet     VARCHAR(45),
  PRIMARY KEY (tag_name),
  UNIQUE INDEX `tag_name_UNIQUE` (`tag_name` ASC) ,
  UNIQUE INDEX `simple_name_UNIQUE` (`simple_name` ASC) 
);

INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('AG_1407_FAULT', 'fault_roto_feed', 'Roto_feed fault signal', 'boolean', 0, 9005);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('AG_1407_OP', 'roto_feed_op', 'Roto_feed percentage speed output', 'percent', 0, 9005);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('AI_922021', 'ai_lock_hopper_purge', 'Lock hopper purge O2', 'nan', 0, 9005);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('AI_932050', 'ai_outlet_moisture', 'Outlet moisture', 'nan', 0, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('DPI_922019', 'dp_feeder_inlet', 'Mac feeder/biomass inlet DP', 'psi', 0, 9007);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('DPI_922021', 'dp_gasifier', 'Gasifier DP', 'psi', 0, 9007);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('DPI_922022', 'dp_inlet_bell', 'Biomass inlet/bell housing DP', 'psi', 0, 9007);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('DPI_932014', 'dp_exit_quench', 'Reactor exit/quench vessel DP', 'psi', 0, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('DPI_932015', 'dp_quench_candle', 'Quench vessel/candle filter DP', 'psi', 0, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('DPI_932070', 'dp_quench_ako', 'Quench/ask KO DP', 'psi', 0, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('DPI_932071', 'dp_ako_ambient', 'Ash KO/ambient DP', 'psi', 0, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('DPI_932302', 'dp_bag_purge', 'Purge gas filter cross_bag DP', 'psi', 0, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('DPI_936014', 'dp_quench_candle_hopper', 'Quench/candle filter hopper DP', 'psi', 0, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('DPI_936015', 'dp_candle_ko_ambient', 'Candle filter KO/ambient DP', 'psi', 0, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('DPIT_922007', 'dp_1403_1402', 'U_1403/V_1402 differential pressure', 'psi', 0, 9003);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status)
  VALUES ('E_STOP', 'e_stop', 'nan', 'boolean', 1);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('FI_1423', 'mass_flow_supply_4', 'Biomass feed lock hopper flowrate (supply 4)', 'nan', 0, 9004);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('FI_1445', 'mass_flow_supply_5', 'Biomass feed lock hopper flowrate (supply 5) ', 'nan', 0, 9004);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('FI_932006', 'mass_flow_quench', 'Primary quench water flow', 'nan', 0, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('FI_932036', 'flow_coriolis', 'Outlet coriolis flowrate', 'nan', 0, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('FIC_1442_OP', 'mass_flow_entrainment_op', 'CO2 entrainment feed output', 'percent', 0, 9004);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('FIC_1442_PV ', 'mass_flow_entrainment', 'CO2 entrainment feed process value', 'nan', 0, 9004);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('FIC_1442_SP', 'mass_flow_entrainment_sp', 'CO2 entrainment feed setpoint', 'nan', 1, 9004);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('FIC_983006_OP', 'mass_flow_steam_op', 'Steam control valve output', 'percent', 0, 9006);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('FIC_983006_PV', 'mass_flow_steam', 'Steam control valve flow', 'nan', 0, 9006);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('FIC_983006_SP', 'mass_flow_steam_sp', 'Steam control valve setpoint', 'nan', 1, 9006);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('FIC_986009_OP', 'mass_flow_superheater_op', 'Steam superheater purge flow output', 'percent', 0, 9006);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('FIC_986009_PV', 'mass_flow_superheater_purge', 'Steam superheater purge flow', 'nan', 0, 9006);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('FIC_986009_SP', 'mass_flow_superheater_purge_sp', 'Steam superheater purge flow controller setpoint', 'nan', 1, 9006);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('FIC_989011_PV', 'mass_flow_sweep', 'Sweep CO2 mass flow controller', 'nan', 0, 9007);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('FIC_989011_SP', 'mass_flow_sweep_sp', 'Sweep CO2 mass flow controller setpoint', 'nan', 1, 9007);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('FIC_990014_PV', 'mass_flow_argon', 'Argon mass flow controller', 'nan', 0, 9007);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('FIC_990014_SP', 'mass_flow_argon_sp', 'Argon mass flow controller setpoint', 'nan', 1, 9007);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('HS_932018', 'valve_ako_inlet_actuator', 'Ash KO inlet Spheri_valve actuator', 'boolean', 0, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('HS_932025', 'valve_ako_outlet_actuator', 'Ash KO outlet Spheri_valve actuator', 'boolean', 0, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('LCV_932024', 'valve_water_fill', 'Water tank 932T001A fill valve', 'boolean', 1, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('LE_932004', 'level_water', 'Water tank 932T001A level', 'percent', 0, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('LSH_1405', 'switch_level_water_high', 'V_1406 high level switch', 'boolean', 1, 9005);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('LSH_932021', 'switch_ako_level_high', 'Ash KO level switch high', 'boolean', 1, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('LSL_1406', 'switch_1406_low', 'V_1406 low level switch', 'boolean', 1, 9005);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('PC_983001', 'pressure_boiler_sp', 'Boiler pressure setpoint', 'psig', 1, 9006);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('PCV_1420_OP', 'pressure_entrainment_op', 'CO2 entrainment pressure control valve output', 'percent', 0, 9004);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('PCV_1420_PV', 'pressure_entrainment', 'CO2 entrainment pressure control valve process value', 'psig', 0, 9004);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('PCV_1420_SP', 'pressure_entrainment_sp', 'CO2 entrainment pressure control valve setpoint', 'psig', 1, 9004);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('PDI_1445', 'dp_lock_hopper_injector', 'Lock hopper/injector differential pressure', 'psi', 0, 9004);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('PI_1442', 'pressure_roto_feed_injector_inlet', 'Roto_feed injector inlet pressure', 'psig', 0, 9004);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('PI_1445', 'pressure_lock_hopper_supply', 'Lock hopper supply pressure', 'psig', 0, 9004);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('PI_326', 'pressure_furnace_2', 'Furnace pressure 2 (Bloom)', 'psig', 0, 9010);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('PI_924502', 'pressure_bell_housing', 'Bell housing pressure', 'psig', 0, 9007);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('PI_924XXX', 'pressure_furnace_1', 'Furnace pressure', 'psig', 0, 9010);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('PI_932019', 'pressure_ako', 'Ash KO vessel pressure', 'psig', 0, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('PI_932042', 'pressure_purge_gas_filter', 'Purge gas filter pressure', 'psig', 0, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('PI_932057', 'pressure_ms_inlet', 'MS inlet pressure', 'psig', 0, 9016);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('PI_932503', 'pressure_backup_quench_inlet', 'Backup quench inlet pressure', 'psig', 0, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('PI_936010', 'pressure_candle_filter_outlet', 'Candle filter outlet pressure', 'psig', 0, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('PI_936012', 'pressure_candle_filter_backpulse', 'Candle filter backpulse pressure', 'psig', 0, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('PI_936052', 'pressure_candle_filter_ko', 'Candle filter KO pressure', 'psig', 0, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('PI_983003', 'pressure_boiler ', 'Boiler pressure', 'psig', 0, 9006);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('PI_983005', 'pressure_boiler_exit', 'Boiler exit pressure', 'psig', 0, 9006);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('PIC_932005_OP', 'pressure_quench_op', 'Primary quench pressure control valve output', 'percent', 0, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('PIC_932005_PV', 'pressure_quench', 'Primary quench pressure control valve process value', 'psig', 0, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('PIC_932005_SP', 'pressure_quench_sp', 'Primary quench pressure control valve setpoint', 'psig', 1, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('PIC_932030_OP', 'pressure_outlet_op', 'Outlet pressure controller output', 'percent', 0, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('PIC_932030_PV', 'pressure_outlet', 'Outlet pressure controller process value', 'psig', 0, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('PIC_932030_SP', 'pressure_outlet_sp', 'Outlet pressure controller setpoint', 'psig', 1, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('PS_1404', 'switch_bladder_1404_inflation', 'XV_1404 bladder inflation verification', 'boolean', 0, 9005);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('PS_1405', 'switch_bladder_1405_inflation', 'XV_1405 bladder inflation verification', 'boolean', 0, 9005);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('PS_1406', 'switch_bladder_lower_inflation', 'Lower spheri_valve bladder inflation verification', 'boolean', 0, 9005);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('PS_932044', 'switch_bladder_purge_filter_inflation', 'Purge gas filter spheri_valve inflation verification', 'boolean', 0, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('PSL_986611', 'switch_ms_containment_pressure_low', 'MS containment box pressure switch low', 'boolean', 0, 9016);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('PSL_986902', 'switch_analyzer_containment_pressure_low', 'Analyzer containment box pressure switch low', 'boolean', 0, 9015);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('PT_1406', 'pressure_1405', 'V_1405 pressure', 'psig', 0, 9005);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('PT_922008/PT_1450', 'pressure_roto_feed_exit', 'Pressure at exit of Roto_Feed', 'psig', 0, 9005);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TE_922022', 'temp_ako_relief', 'Ash KO relief valve line temperature', 'C', 0, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TE_932016', 'temp_quench_exit_relief', 'Quench exit relief valve line temperature', 'C', 0, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TE_983301', 'temp_superheater_2_shell', 'Superheater stage 2 shell temperature', 'C', 0, 9006);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TE_983302', 'temp_superheater_2_element', 'Superheater stage 2 element temperature', 'C', 0, 9006);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TE_983303', 'temp_superheater_1_shell', 'Superheater stage 1 shell temperature', 'C', 0, 9006);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TE_983304', 'temp_superheater_1_element', 'Superheater stage 1 element temperature', 'C', 0, 9006);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TE_983305', 'temp_superheater_interstage', 'Superheater interstage temperature', 'C', 0, 9006);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_323', 'temp_gasifier_stack_inlet', 'Gasifier stack inlet temperature', 'C', 0, 9010);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_324A', 'temp_gasifier_refractory_2', 'Gasifier refractory temp 2 (Bloom)', 'C', 0, 9010);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_324B', 'temp_gasifier_refactory_1', 'Gasifier refractory temp 1 (Bloom)', 'C', 0, 9010);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_922020', 'temp_biomass_inlet_skin', 'Biomass inlet skin temperature', 'C', 0, 9007);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_924001', 'temp_upper_bucket_seal_skin', 'Upper bucket seal skin temperature', 'C', 0, 9007);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_924002', 'temp_lower_bucket_seal_skin', 'Lower bucket seal skin temperature', 'C', 0, 9007);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_924003', 'temp_gasifier_exit', 'Gasifier exit temperature', 'C', 0, 9007);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_924004', 'temp_expansion_joint_skin', 'Expansion joint skin temperature', 'C', 0, 9007);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_924012', 'temp_skin_tube_top', 'Gasifier top tube temperature', 'C', 0, 9007);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_924013', 'temp_skin_tube_middle', 'Gasifier middle tube temperature', 'C', 0, 9007);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_924014', 'temp_skin_tube_bottom', 'Gasifier bottom tube temperature', 'C', 0, 9007);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_924032', 'temp_upper_bucket_seal_containment_skin', 'Upper bucket seal containment skin temperature', 'C', 0, 9007);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_924034', 'temp_lower_bucket_seal_containment_skin', 'Lower bucket seal containment skin temperature', 'C', 0, 9007);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_924036', 'temp_gasifier_exit_spool_skin', 'Gasifier exit spool skin temperature', 'C', 0, 9007);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_924101', 'temp_gasifier_stack_outlet', 'Gasifier stack outlet temperature', 'C', 0, 9010);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_924503', 'temp_tar_cooler_skin', 'Tar cooler skin temperature', 'C', 0, 9007);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_932001', 'temp_quench_skin', 'Quench vessel skin temperature', 'C', 0, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_932003', 'temp_quench_lower', 'Quench vessel lower temperature', 'C', 0, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_932007A', 'temp_quench_exit ', 'Quench exit temperature', 'C', 0, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_932007B', 'temp_quench_exit_redundant', 'Quench exit temperature (redundant)', 'C', 0, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_932011', 'temp_primary_quench_inlet', 'Primary quench inlet temperature', 'C', 0, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_932017', 'temp_quench_pressure_relief_exit', 'Quench pressure relief exit temperature', 'C', 0, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_932018', 'temp_quench_exit_valve_skin', 'Quench vessel exit Spheri_valve skin temperature', 'C', 0, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_932023', 'temp_ako_outlet_valve_skin', 'Ash KO outlet Spheri_valve skin temperature', 'C', 0, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_932035', 'temp_coriolis_before', 'Pre_coriolis temperature', 'C', 0, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_932051', 'temp_tar_filter_exit', 'Tar ceramic filter exit temperature', 'C', 0, 9007);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_932056', 'temp_ms_inlet', 'MS inlet temperature', 'C', 0, 9016);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_932101', 'temp_ako_gas', 'Ash KO gas temperature', 'C', 0, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_932151', 'temp_tar_probe_vent', 'Tar probe vent temperature', 'C', 0, 9015);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_932152', 'temp_gc_vent', 'GC vent temperature', 'C', 0, 9015);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_932501', 'temp_primary_quench_water', 'Primary quench water tank exit temperature', 'C', 0, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_932502', 'temp_backup_quench_return', 'Backup quench return temperature', 'C', 0, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_936001', 'temp_candle_filter_inlet', 'Candle filter inlet temperature', 'C', 0, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_936002', 'temp_candle_filter_1', 'Candle filter temp 1', 'C', 0, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_936003', 'temp_candle_filter_2', 'Candle filter temp 2', 'C', 0, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_936004', 'temp_candle_filter_3', 'Candle filter temp 3', 'C', 0, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_936005', 'temp_candle_filter_4', 'Candle filter temp 4', 'C', 0, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_936006', 'temp_candle_filter_5', 'Candle filter temp 5', 'C', 0, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_936007', 'temp_candle_filter_outlet', 'Candle filter outlet temperature', 'C', 0, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_936008', 'temp_candle_filter_ash_dump', 'Candle filter ash dump temperature', 'C', 0, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_936009', 'temp_candle_filter_backpulse', 'Candle filter backpulse temperature', 'C', 0, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_936102', 'temp_candle_filter_outlet_purge', 'Candle filter outlet purge temperature', 'C', 0, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_983004', 'temp_boiler', 'Boiler temperature', 'C', 0, 9006);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_983013', 'temp_steam_relief_vent', 'Steam pressure relief vent temperature', 'C', 0, 9006);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_983027', 'temp_steam_superheater_exit', 'Steam superheater exit temperature', 'C', 0, 9006);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_983036', 'temp_steam_gasifier_inlet', 'Gasifier steam inlet temperature', 'C', 0, 9007);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_986065', 'temp_car_cooling_exit', 'Tar cooling N2 exit temperature', 'C', 0, 9007);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TI_989015', 'temp_bell_sweep_inlet', 'Bell housing sweep/tracer inlet temperature', 'C', 0, 9007);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TIC_932007_OP', 'temp_quench_op', 'Quench tempreature controller output', 'percent', 0, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TIC_932007_PV', 'temp_quench', 'Quench temperature controller process value', 'C', 0, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TIC_932007_SP', 'temp_quench_sp', 'Quench temperature controller setpoint', 'C', 1, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TIC_932053_OP', 'temp_tar_probe_heat_trace_op', 'Tar probe heat trace output', 'percent', 0, 9015);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TIC_932053_PV', 'temp_tar_probe_heat_trace', 'Tar probe heat trace temperature', 'C', 0, 9015);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TIC_932053_SP', 'temp_tar_probe_heat_trace_sp', 'Tar probe heat trace setpoint', 'C', 1, 9015);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TIC_986610_OP', 'temp_ms_heat_trace_op', 'MS heat trace output', 'percent', 0, 9016);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TIC_986610_PV', 'temp_ms_heat_trace', 'MS heat trace process value', 'C', 0, 9016);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TIC_986610_SP', 'temp_mv_heat_trace_sp', 'MS heat trace setpoint', 'C', 1, 9016);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TY_924021_SP', 'temp_furnace_sp', 'Furnace temperature setpoint', 'C', 1, 9010);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('TY_983014_SP', 'temp_superheater_sp', 'Superheater temperature setpoint', 'C', 1, 9006);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('WIC_1402_PV', 'valve_feed_auger_pv', 'V_1402 feed auger process value', 'percent', 0, 9003);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('WIT_1406', 'mass_feed_vessel', 'Feed vessel weight', 'lb', 0, 9005);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_1401', 'valve_feed_hopper_filter_purge', 'U_1403 (feed hopper) filter purge on/off solenoid', 'boolean', 1, 9003);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_1404', 'valve_top_lock_inlet', 'Top lock vessel inlet Spheri_valve', 'boolean', 1, 9005);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_1405', 'valve_inter_feed', 'Inter_feed vessel Spheri_valve', 'boolean', 1, 9005);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_1406', 'valve_bottom_lock_outlet', 'Bottom lock vessel outlet Spheri_Valve', 'boolean', 1, 9005);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_1421', 'valve_injector', 'CO2 to injector on/off solenoid (1/2/5)', 'boolean', 1, 9004);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_1422', 'valve_supply_3', 'Biomass feed lock hopper (supply 3) on/off solenoid', 'boolean', 1, 9004);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_1423', 'valve_supply_4', 'Biomass feed lock hopper (supply 4) on/off solenoid', 'boolean', 1, 9004);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_1440', 'valve_injector_2', 'CO2 to injector on/off solenoid (supply 1/2)', 'boolean', 1, 9004);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_1441', 'valve_injector_1', 'CO2 to injector on/off solenoid (supply 1) ', 'boolean', 1, 9004);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_1443', 'valve_pressurization', 'V_1407 pressurization on/off valve', 'boolean', 1, 9005);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_1444', 'valve_isolating_flex', 'Isolating flex pressurization', 'boolean', 1, 9005);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_1445', 'valve_supply_5', 'Biomass feed lock hopper (supply5) on/off solenoid', 'boolean', 1, 9004);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_1447', 'valve_purge', 'V_1405 purge on/off valve', 'boolean', 1, 9005);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_1448A', 'valve_purge_1', 'Lock hopper purge solenoid 1', 'boolean', 1, 9005);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_1448B', 'valve_purge_2', 'Lock hopper purge solenoid 2', 'boolean', 1, 9005);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_1449A', 'valve_vent_1', 'Balancing vent solenoid 1', 'boolean', 1, 9005);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_1449B', 'valve_vent_2', 'Balancing vent solenoid 2', 'boolean', 1, 9005);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_1449C', 'valve_vent_bleed', 'Balancing vent bleed solenoid', 'boolean', 1, 9005);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_1450', 'valve_feed_entrainment', 'Feed entrainment shutoff valve', 'boolean', 1, 9005);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_922016', 'valve_biomass_inlet', 'Biomass inlet full port ball_valve', 'boolean', 1, 9007);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_932018', 'valve_quench_exit', 'Quench vessel exit Spheri_valve', 'boolean', 1, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_932025', 'valve_ako_outlet', 'Ash KO outlet Spheri_valve ', 'boolean', 1, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_932028', 'valve_oxidizer_purge', 'Thermal oxidizer purge N2 on/off solenoid', 'boolean', 1, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_932046', 'valve_purge_filter', 'Purge filter outlet valve', 'boolean', 1, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_932049', 'valve_quench_backup', 'Backup quench on/off solenoid', 'boolean', 1, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_932052', 'valve_tar_probe', 'Tar probe on/off solenoid', 'boolean', 1, 9015);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_932180', 'valve_quench_isolation', 'Gasifier/quench isolation fast acting valve', 'boolean', 1, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_932301A', 'valve_filter_backpulse_a', 'Purge gas filter backpulse solenoid A', 'boolean', 1, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_932301B', 'valve_filter_backpulse_b', 'Purge gas filter backpulse solenoid B', 'boolean', 1, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_932301C', 'valve_filter_backpulse_c', 'Purge gas filter backpulse solenoid C', 'boolean', 1, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_932504', 'valve_ako_outlet_shutoff', 'Ash KO outlet shutoff valve', 'boolean', 1, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_932505', 'valve_quench_exit_top', 'Quench vessel exit valve (top)', 'boolean', 1, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_936001A', 'valve_candle_filter_exit_a', 'Candle filter exit valve A', 'boolean', 1, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_936001B', 'valve_candle_filter_exit_b', 'Candle filter exit valve B', 'boolean', 1, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_936002A', 'valve_candle_filter_ko_exit_a', 'Candle filter KO exit valve A', 'boolean', 1, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_936002B', 'valve_candle_filter_ko_exit_b', 'Candle filter KO exit valve B', 'boolean', 1, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_936050', 'valve_candle_filter_hopper_purge', 'Candle filter ash hopper purge nitrogen on/off valve', 'boolean', 1, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_936058', 'valve_candle_filter_outlet_purge', 'Candle filter outlet purge on/off solenoid valve', 'boolean', 1, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_936080', 'valve_candle_filter_purge_supply', 'Candle filter purge supply N2 on/off solenoid', 'boolean', 1, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_983012', 'valve_steam_vent', 'Steam vent solenoid', 'boolean', 1, 9006);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_983013', 'valve_steam_shutoff', 'Steam shutoff valve', 'boolean', 1, 9006);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_983065', 'valve_tar_probe_steam', 'Tar probe cleaning steam solenoid', 'boolean', 1, 9015);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_986006', 'valve_steam_superheater_purge', 'Steam superheater purge solenoid', 'boolean', 1, 9006);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_986016', 'valve_ako_purge_filter', 'On/off solenoid from ash KO to purge gas filter', 'boolean', 1, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_986024', 'valve_ako_purge', 'Ash KO purge N2 on/off solenoid', 'boolean', 1, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_986034', 'valve_purge_filter_supply', 'Purge gas filter purge supply N2 solenoid', 'boolean', 1, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_986901', 'valve_tar_probe_purge', 'Tar probe purge N2 solenoid', 'boolean', 1, 9015);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_989012', 'valve_sweep', 'Sweep CO2 on/off solenoid', 'boolean', 1, 9007);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('XV_990013', 'valve_argon', 'Argon tracer on/off solenoid', 'boolean', 1, 9007);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('ZSC_922016', 'switch_biomass_inlet_closed', 'Biomass inlet full port ball valve closed position switch', 'boolean', 0, 9007);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('ZSC_932504', 'switch_ako_outlet_closed', 'Ash KO outlet shutoff valve closed position switch', 'boolean', 0, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('ZSC_932505', 'switch_quench_exit_closed', 'Quench vessel exit valve closed position switch', 'boolean', 0, 9008);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('ZSC_936001A', 'switch_candle_filter_exit_a_closed', 'Candle filter exit valve A closed position switch', 'boolean', 0, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('ZSC_936001B', 'switch_candle_filter_exit_b_closed', 'Candle filter exit valve B closed position switch', 'boolean', 0, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('ZSC_936002A', 'switch_candle_filter_ko_a_closed', 'Candle filter KO exit valve A closed position switch', 'boolean', 0, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('ZSC_936002B', 'switch_candle_filter_ko_b_closed', 'Candle filter KO exit valve B closed position switch', 'boolean', 0, 9009);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('ZSC_983012', 'switch_steam_vent_closed', 'Steam vent solenoid closed position switch', 'boolean', 0, 9006);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('ZSC_983013', 'switch_steam_shutoff_closed', 'Steam shutoff solenoid closed position switch', 'boolean', 0, 9006);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('ZSO_922016', 'switch_biomass_inlet_open', 'Biomass inlet full port ball valve open position switch', 'boolean', 0, 9007);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('ZSO_983012', 'switch_steam_vent_open', 'Steam vent solenoid open position switch', 'boolean', 0, 9006);
INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)
  VALUES ('ZSO_983013', 'switch_steam_shutoff_open', 'Steam shutoff solenoid open position switch', 'boolean', 0, 9006);

-------------------------
--CREATE SYSTEM LOG TBL--
-------------------------
DROP TABLE IF EXISTS system_log_tbl;

CREATE  TABLE IF NOT EXISTS pilot_run_db.system_log_tbl (
  ts            DATETIME NOT NULL ,
  tag_name      VARCHAR(45) NOT NULL ,
  old_value     DOUBLE NULL ,
  new_value     DOUBLE NULL ,
  PRIMARY KEY (ts, tag_name)
);

---------------------------
--CREATE OPERATOR LOG TBL--
---------------------------
DROP TABLE IF EXISTS operator_log_tbl;

CREATE  TABLE IF NOT EXISTS pilot_run_db.operator_log_tbl (
  ts            DATETIME NOT NULL ,
  operator      VARCHAR(45) NOT NULL ,
  notes         TEXT NULL ,
  PRIMARY KEY (ts, operator)
);


