USE pilot_proc_db;

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
