with open('staging_schema.sql','w') as stage:
    stage.write('DROP TABLE IF EXISTS staging;')
    stage.write('CREATE TABLE staging(\n')
    stage.write('ownerID VARCHAR(100),\n')
    stage.write('appID VARCHAR(100),\n')
    stage.write('fnID VARCHAR(100),\n')
    stage.write('trigID VARCHAR(100),\n')
    for i in range(1,1440):
        stage.write('min{} INT,\n'.format(i))
    stage.write('min1440 INT\n')
    stage.write(');')

str_col, str_val = 'unnest(array[','unnest(array['
for i in range(1, 1440):
    str_col += '{},'.format(i)
    str_val += 'min{},'.format(i)
str_col += '1440]) as minute'
str_val += 'min1440]) as calls'


with open('unpivot.sql', 'w') as unpivot:
    unpivot.write('INSERT INTO calls_master(id, ownerID, appID, fnID, trigID)\nSELECT ID, ownerID, appID, fnID, trigID FROM staging;\n\n')
    unpivot.write('INSERT INTO calls_minute(id, minuteid, reqcount)\nSELECT ID, {}, {} FROM staging;\n\n'.format(str_col,str_val))
