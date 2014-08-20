USE pilot_run_db;

DROP TABLE IF EXISTS analysis_view;

CREATE VIEW analysis_view AS

	SELECT lv_data_tbl.*,
		ms_data_tbl.N2_MS,
		ms_data_tbl.Ar_MS,
                ms_data_tbl.H2O_MS,
                ms_data_tbl.H2_MS,
                ms_data_tbl.CO_MS,
                ms_data_tbl.CO2_MS,
                ms_data_tbl.CH4_MS,
                ms_data_tbl.C2H6_MS,
                ms_data_tbl.C2H4_MS,
                ms_data_tbl.C2H2_MS,
                ms_data_tbl.C3H8_MS,
                ms_data_tbl.C3H6_MS,
                ms_data_tbl.C4H8_MS,
                ms_data_tbl.C4H10_MS,
                ms_data_tbl.CH3CHCH3CH3_MS,
                ms_data_tbl.C6H6_MS,
                ms_data_tbl.C7H8_MS,
                ms_data_tbl.C6H4CH3CH3_MS,
                ms_data_tbl.C6H5CH2CH3_MS,
                ms_data_tbl.C10H8_MS,
                ms_data_tbl.H2S_MS
        FROM lv_data_tbl 
	LEFT JOIN ms_data_tbl 
	ON lv_data_tbl.ts = ms_data_tbl.ts;
