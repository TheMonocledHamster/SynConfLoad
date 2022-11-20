str_col, str_val = 'unnest(array[','unnest(array['
for i in range(1, 1440):
    str_col += '{},'.format(i)
    str_val += 'min{},'.format(i)
str_col += '1440]) as minute'
str_val += 'min1440]) as calls'

with open('unpivot.sql'.format(i), 'w') as commands:
    for i in range(1,15):
        commands.write('INSERT INTO calls(ownerID, appID, fnID, trigID, dayID, minuteid, reqcount)\nSELECT ownerID, appID, fnID, trigID, {}, {}, {} FROM staging{};\n\n'.format(i,str_col,str_val,i))

with open('staging_schema.sql','w') as schema:
    for i in range(1,15):
        schema.write('CREATE TABLE staging{}(\n'.format(i))
        schema.write('ownerID VARCHAR(100),\n')
        schema.write('appID VARCHAR(100),\n')
        schema.write('fnID VARCHAR(100),\n')
        schema.write('trigID VARCHAR(100),\n')
        for i in range(1,1440):
            schema.write('min{} INT,\n'.format(i))
        schema.write('min1440 INT\n')
        schema.write(');')
