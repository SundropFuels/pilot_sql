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
    feedstock       VARCHAR(45)
);
ALTER TABLE setpoint_tbl ADD UNIQUE (
      temperature,
      pressure,
      biomass_rate,
      steam_flow,
      steam_temp,
      ent_CO2,
      feedstock
      );

-- ------------------- --
-- CREATE RUN INFO TBL --
-- ------------------- --
-- DROP TABLE IF EXISTS run_info_tbl;

CREATE TABLE run_info_tbl
(
    run_id      INT PRIMARY KEY AUTO_INCREMENT,
    sample_id   INT,
    setpoint_id INT,
    ts_start    DATETIME,
    ts_stop     DATETIME,
    ss_start    DATETIME,
    ss_stop     DATETIME,
    operator    VARCHAR(45),
    FOREIGN KEY (setpoint_id)
        REFERENCES setpoint_tbl (setpoint_id)
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
  AG_1407_OP_avg DOUBLE,
  AG_1407_OP_std DOUBLE,
  AI_922021_avg DOUBLE,
  AI_922021_std DOUBLE,
  AI_932050_avg DOUBLE,
  AI_932050_std DOUBLE,
  DPI_922019_avg DOUBLE,
  DPI_922019_std DOUBLE,
  DPI_922021_avg DOUBLE,
  DPI_922021_std DOUBLE,
  DPI_922022_avg DOUBLE,
  DPI_922022_std DOUBLE,
  DPI_932014_avg DOUBLE,
  DPI_932014_std DOUBLE,
  DPI_932015_avg DOUBLE,
  DPI_932015_std DOUBLE,
  DPI_932070_avg DOUBLE,
  DPI_932070_std DOUBLE,
  DPI_932071_avg DOUBLE,
  DPI_932071_std DOUBLE,
  DPI_932302_avg DOUBLE,
  DPI_932302_std DOUBLE,
  DPI_936014_avg DOUBLE,
  DPI_936014_std DOUBLE,
  DPI_936015_avg DOUBLE,
  DPI_936015_std DOUBLE,
  DPIT_922007_avg DOUBLE,
  DPIT_922007_std DOUBLE,
  FI_1423_avg DOUBLE,
  FI_1423_std DOUBLE,
  FI_1445_avg DOUBLE,
  FI_1445_std DOUBLE,
  FI_932006_avg DOUBLE,
  FI_932006_std DOUBLE,
  FI_932036_avg DOUBLE,
  FI_932036_std DOUBLE,
  FIC_1442_OP_avg DOUBLE,
  FIC_1442_OP_std DOUBLE,
  FIC_1442_PV_avg DOUBLE,
  FIC_1442_PV_std DOUBLE,
  FIC_1442_SP_avg DOUBLE,
  FIC_1442_SP_std DOUBLE,
  FIC_983006_OP_avg DOUBLE,
  FIC_983006_OP_std DOUBLE,
  FIC_983006_PV_avg DOUBLE,
  FIC_983006_PV_std DOUBLE,
  FIC_983006_SP_avg DOUBLE,
  FIC_983006_SP_std DOUBLE,
  FIC_986009_OP_avg DOUBLE,
  FIC_986009_OP_std DOUBLE,
  FIC_986009_PV_avg DOUBLE,
  FIC_986009_PV_std DOUBLE,
  FIC_986009_SP_avg DOUBLE,
  FIC_986009_SP_std DOUBLE,
  FIC_989011_PV_avg DOUBLE,
  FIC_989011_PV_std DOUBLE,
  FIC_989011_SP_avg DOUBLE,
  FIC_989011_SP_std DOUBLE,
  FIC_990014_PV_avg DOUBLE,
  FIC_990014_PV_std DOUBLE,
  FIC_990014_SP_avg DOUBLE,
  FIC_990014_SP_std DOUBLE,
  LE_932004_avg DOUBLE,
  LE_932004_std DOUBLE,
  PC_983001_avg DOUBLE,
  PC_983001_std DOUBLE,
  PCV_1420_OP_avg DOUBLE,
  PCV_1420_OP_std DOUBLE,
  PCV_1420_PV_avg DOUBLE,
  PCV_1420_PV_std DOUBLE,
  PCV_1420_SP_avg DOUBLE,
  PCV_1420_SP_std DOUBLE,
  PDI_1445_avg DOUBLE,
  PDI_1445_std DOUBLE,
  PI_1442_avg DOUBLE,
  PI_1442_std DOUBLE,
  PI_1445_avg DOUBLE,
  PI_1445_std DOUBLE,
  PI_326_avg DOUBLE,
  PI_326_std DOUBLE,
  PI_924502_avg DOUBLE,
  PI_924502_std DOUBLE,
  PI_924XXX_avg DOUBLE,
  PI_924XXX_std DOUBLE,
  PI_932019_avg DOUBLE,
  PI_932019_std DOUBLE,
  PI_932042_avg DOUBLE,
  PI_932042_std DOUBLE,
  PI_932057_avg DOUBLE,
  PI_932057_std DOUBLE,
  PI_932503_avg DOUBLE,
  PI_932503_std DOUBLE,
  PI_936010_avg DOUBLE,
  PI_936010_std DOUBLE,
  PI_936012_avg DOUBLE,
  PI_936012_std DOUBLE,
  PI_936052_avg DOUBLE,
  PI_936052_std DOUBLE,
  PI_983003_avg DOUBLE,
  PI_983003_std DOUBLE,
  PI_983005_avg DOUBLE,
  PI_983005_std DOUBLE,
  PIC_932005_OP_avg DOUBLE,
  PIC_932005_OP_std DOUBLE,
  PIC_932005_PV_avg DOUBLE,
  PIC_932005_PV_std DOUBLE,
  PIC_932005_SP_avg DOUBLE,
  PIC_932005_SP_std DOUBLE,
  PIC_932030_OP_avg DOUBLE,
  PIC_932030_OP_std DOUBLE,
  PIC_932030_PV_avg DOUBLE,
  PIC_932030_PV_std DOUBLE,
  PIC_932030_SP_avg DOUBLE,
  PIC_932030_SP_std DOUBLE,
  PT_1406_avg DOUBLE,
  PT_1406_std DOUBLE,
  PT_1450_avg DOUBLE,
  PT_1450_std DOUBLE,
  TE_922022_avg DOUBLE,
  TE_922022_std DOUBLE,
  TE_932016_avg DOUBLE,
  TE_932016_std DOUBLE,
  TE_983301_avg DOUBLE,
  TE_983301_std DOUBLE,
  TE_983302_avg DOUBLE,
  TE_983302_std DOUBLE,
  TE_983303_avg DOUBLE,
  TE_983303_std DOUBLE,
  TE_983304_avg DOUBLE,
  TE_983304_std DOUBLE,
  TE_983305_avg DOUBLE,
  TE_983305_std DOUBLE,
  TI_323_avg DOUBLE,
  TI_323_std DOUBLE,
  TI_324A_avg DOUBLE,
  TI_324A_std DOUBLE,
  TI_324B_avg DOUBLE,
  TI_324B_std DOUBLE,
  TI_922020_avg DOUBLE,
  TI_922020_std DOUBLE,
  TI_924001_avg DOUBLE,
  TI_924001_std DOUBLE,
  TI_924002_avg DOUBLE,
  TI_924002_std DOUBLE,
  TI_924003_avg DOUBLE,
  TI_924003_std DOUBLE,
  TI_924004_avg DOUBLE,
  TI_924004_std DOUBLE,
  TI_924012_avg DOUBLE,
  TI_924012_std DOUBLE,
  TI_924013_avg DOUBLE,
  TI_924013_std DOUBLE,
  TI_924014_avg DOUBLE,
  TI_924014_std DOUBLE,
  TI_924032_avg DOUBLE,
  TI_924032_std DOUBLE,
  TI_924034_avg DOUBLE,
  TI_924034_std DOUBLE,
  TI_924036_avg DOUBLE,
  TI_924036_std DOUBLE,
  TI_924101_avg DOUBLE,
  TI_924101_std DOUBLE,
  TI_924503_avg DOUBLE,
  TI_924503_std DOUBLE,
  TI_932001_avg DOUBLE,
  TI_932001_std DOUBLE,
  TI_932003_avg DOUBLE,
  TI_932003_std DOUBLE,
  TI_932007A_avg DOUBLE,
  TI_932007A_std DOUBLE,
  TI_932007B_avg DOUBLE,
  TI_932007B_std DOUBLE,
  TI_932011_avg DOUBLE,
  TI_932011_std DOUBLE,
  TI_932017_avg DOUBLE,
  TI_932017_std DOUBLE,
  TI_932018_avg DOUBLE,
  TI_932018_std DOUBLE,
  TI_932023_avg DOUBLE,
  TI_932023_std DOUBLE,
  TI_932035_avg DOUBLE,
  TI_932035_std DOUBLE,
  TI_932051_avg DOUBLE,
  TI_932051_std DOUBLE,
  TI_932056_avg DOUBLE,
  TI_932056_std DOUBLE,
  TI_932101_avg DOUBLE,
  TI_932101_std DOUBLE,
  TI_932151_avg DOUBLE,
  TI_932151_std DOUBLE,
  TI_932152_avg DOUBLE,
  TI_932152_std DOUBLE,
  TI_932501_avg DOUBLE,
  TI_932501_std DOUBLE,
  TI_932502_avg DOUBLE,
  TI_932502_std DOUBLE,
  TI_936001_avg DOUBLE,
  TI_936001_std DOUBLE,
  TI_936002_avg DOUBLE,
  TI_936002_std DOUBLE,
  TI_936003_avg DOUBLE,
  TI_936003_std DOUBLE,
  TI_936004_avg DOUBLE,
  TI_936004_std DOUBLE,
  TI_936005_avg DOUBLE,
  TI_936005_std DOUBLE,
  TI_936006_avg DOUBLE,
  TI_936006_std DOUBLE,
  TI_936007_avg DOUBLE,
  TI_936007_std DOUBLE,
  TI_936008_avg DOUBLE,
  TI_936008_std DOUBLE,
  TI_936009_avg DOUBLE,
  TI_936009_std DOUBLE,
  TI_936102_avg DOUBLE,
  TI_936102_std DOUBLE,
  TI_983004_avg DOUBLE,
  TI_983004_std DOUBLE,
  TI_983013_avg DOUBLE,
  TI_983013_std DOUBLE,
  TI_983027_avg DOUBLE,
  TI_983027_std DOUBLE,
  TI_983036_avg DOUBLE,
  TI_983036_std DOUBLE,
  TI_986065_avg DOUBLE,
  TI_986065_std DOUBLE,
  TI_989015_avg DOUBLE,
  TI_989015_std DOUBLE,
  TIC_932007_OP_avg DOUBLE,
  TIC_932007_OP_std DOUBLE,
  TIC_932007_PV_avg DOUBLE,
  TIC_932007_PV_std DOUBLE,
  TIC_932007_SP_avg DOUBLE,
  TIC_932007_SP_std DOUBLE,
  TIC_932053_OP_avg DOUBLE,
  TIC_932053_OP_std DOUBLE,
  TIC_932053_PV_avg DOUBLE,
  TIC_932053_PV_std DOUBLE,
  TIC_932053_SP_avg DOUBLE,
  TIC_932053_SP_std DOUBLE,
  TIC_986610_OP_avg DOUBLE,
  TIC_986610_OP_std DOUBLE,
  TIC_986610_PV_avg DOUBLE,
  TIC_986610_PV_std DOUBLE,
  TIC_986610_SP_avg DOUBLE,
  TIC_986610_SP_std DOUBLE,
  TY_924021_SP_avg DOUBLE,
  TY_924021_SP_std DOUBLE,
  TY_983014_SP_avg DOUBLE,
  TY_983014_SP_std DOUBLE,
  WIC_1402_PV_avg DOUBLE,
  WIC_1402_PV_std DOUBLE,
  WIT_1406_avg DOUBLE,
  WIT_1406_std DOUBLE,
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

  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('AG_1407_OP', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('AI_922021', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('AI_932050', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('DPI_922019', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('DPI_922021', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('DPI_922022', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('DPI_932014', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('DPI_932015', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('DPI_932070', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('DPI_932071', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('DPI_932302', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('DPI_936014', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('DPI_936015', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('DPIT_922007', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('FI_1423', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('FI_1445', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('FI_932006', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('FI_932036', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('FIC_1442_OP', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('FIC_1442_PV ', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('FIC_1442_SP', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('FIC_983006_OP', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('FIC_983006_PV', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('FIC_983006_SP', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('FIC_986009_OP', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('FIC_986009_PV', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('FIC_986009_SP', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('FIC_989011_PV', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('FIC_989011_SP', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('FIC_990014_PV', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('FIC_990014_SP', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('LE_932004', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('PC_983001', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('PCV_1420_OP', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('PCV_1420_PV', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('PCV_1420_SP', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('PDI_1445', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('PI_1442', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('PI_1445', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('PI_326', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('PI_924502', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('PI_924XXX', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('PI_932019', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('PI_932042', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('PI_932057', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('PI_932503', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('PI_936010', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('PI_936012', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('PI_936052', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('PI_983003', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('PI_983005', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('PIC_932005_OP', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('PIC_932005_PV', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('PIC_932005_SP', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('PIC_932030_OP', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('PIC_932030_PV', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('PIC_932030_SP', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('PT_1406', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('PT_922008/PT_1450', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TE_922022', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TE_932016', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TE_983301', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TE_983302', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TE_983303', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TE_983304', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TE_983305', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_323', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_324A', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_324B', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_922020', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_924001', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_924002', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_924003', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_924004', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_924012', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_924013', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_924014', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_924032', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_924034', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_924036', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_924101', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_924503', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_932001', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_932003', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_932007A', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_932007B', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_932011', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_932017', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_932018', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_932023', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_932035', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_932051', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_932056', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_932101', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_932151', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_932152', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_932501', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_932502', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_936001', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_936002', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_936003', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_936004', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_936005', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_936006', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_936007', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_936008', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_936009', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_936102', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_983004', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_983013', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_983027', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_983036', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_986065', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TI_989015', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TIC_932007_OP', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TIC_932007_PV', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TIC_932007_SP', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TIC_932053_OP', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TIC_932053_PV', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TIC_932053_SP', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TIC_986610_OP', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TIC_986610_PV', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TIC_986610_SP', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TY_924021_SP', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('TY_983014_SP', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('WIC_1402_PV', 1);
  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('WIT_1406', 1);
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
  SELECT run_id, sample_id, ts_start, ts_stop, ss_start, ss_stop, operator FROM run_info_tbl 
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


