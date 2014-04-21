import pandas as pd

df = pd.read_csv('PP_tag_list.csv')

for i in df.index:
    if df['SQL type'][i] == 'BOOL':
       df['SQL type'][i] = 'TINYINT(1)' 

with open('csv_to_sql.txt', 'w') as f:

    # LV DATA TBL #
    f.write("\n ------LV_DATA_TBL------ \n\n")
    f.write('  ts DATETIME NOT NULL PRIMARY KEY,\n')
    for i in df.index:
        if df['Included'][i] == "X" or df['Included'][i] == "Maybe":
            f.write('  %s %s,\n' %(df['Tag'][i], df['SQL type'][i]))
            
    # GLOSSARY TBL INSERTS #
    f.write("\n ------LV_DATA_TBL------ \n\n")
    for i in df.index:
        if df['Included'][i] == "X" or df['Included'][i] == "Maybe":
            try: 
                f.write("  INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status, pid_sheet)\n    VALUES ('%s', '%s', '%s', '%s', %s, %s);\n" %(df['Tag'][i], df['Simple name'][i], df['Description'][i], df['Units'][i], df['Log Status'][i], int(df['Sheet'][i])))
            except:
                f.write("  INSERT INTO pilot_run_db.glossary_tbl (tag_name, simple_name, description, units, log_status)\n    VALUES ('%s', '%s', '%s', '%s', %s);\n" %(df['Tag'][i], df['Simple name'][i], df['Description'][i], df['Units'][i], df['Log Status'][i]))
                
    # ANALYSIS_VIEW #
    f.write("\n ------ANALYSIS_VIEW------ \n\n")
    for i in df.index:
        if df['Included'][i] == "X" or df['Included'][i] == "Maybe":   
            f.write("  lv_data_tbl.%s AS %s,\n" %(df['Tag'][i], df['Simple name'][i]))
        
             
    # INTEGRAL TBL #
    f.write("\n ------INTEGRAL_TBL------ \n\n")
    int_list = []
    for i in df.index:
        if (df['Included'][i] == "X" or df['Included'][i] == "Maybe") and df['SQL type'][i] == 'DOUBLE':
            int_list.append(df['Simple name'][i])
    int_list.sort()
    for tag in int_list:
        f.write("  %s_avg %s,\n" %(tag, 'DOUBLE'))
        f.write("  %s_std %s,\n" %(tag, 'DOUBLE'))    
        
    # ANALYSIS CONFIG TBL #
    f.write("\n ------ANALYSIS_CONFIG_TBL------ \n\n")   
    for tag in int_list:
        f.write("  INSERT INTO analysis_config_tbl (avg_std_cols, active) VALUES ('%s', 1);\n" %tag)
            
