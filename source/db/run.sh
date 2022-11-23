psql -d Traces -c "\i source/db/staging_schema.sql"

psql -d Traces -c "\copy staging FROM '~/Work/SynConfLoad/source/traces/AzureFunctions/invocations_per_function_md.anon.d01.csv' csv header;"

psql -d Traces -c "ALTER TABLE staging ADD COLUMN id SERIAL PRIMARY KEY;"

psql -d Traces -c "\i source/db/calls_schema.sql"

psql -d Traces -c "\i source/db/unpivot.sql"

psql -d Traces -c "DROP TABLE staging;"

psql -d Traces -c "\i source/db/dur_staging.sql"

psql -d Traces -c "\copy dur_staging FROM '~/Work/SynConfLoad/source/traces/AzureFunctions/function_durations_percentiles.anon.d01.csv' csv header;"

psql -d Traces -c "\i source/db/fn_time.sql"

psql -d Traces -c "INSERT INTO fn_time SELECT cm.id, cm.ownerid, cm.appid, cm.fnid, cm.trigid, ds.avg_duration, ds.num_exec, \
                   ds.exec_percentile_1, ds.exec_percentile_25, ds.exec_percentile_50, ds.exec_percentile_75, ds.exec_percentile_99 \
                   FROM calls_master AS cm JOIN dur_staging AS ds ON (cm.ownerid,cm.appid,cm.fnid) = (ds.ownerid,ds.appid,ds.fnid);"

psql -d Traces -c "DROP TABLE dur_staging; DROP TABLE calls_master;"

psql -d Traces -c "DELETE FROM fn_time WHERE id IN (SELECT id FROM fn_time GROUP BY id HAVING count(id) > 1) ;"

psql -d Traces -c "ALTER TABLE fn_time ADD PRIMARY KEY (fnid);"

psql -d Traces -c "ALTER TABLE fn_time ADD CONSTRAINT fk_fnid FOREIGN KEY (fnid) REFERENCES calls_minute(id);"

psql -d Traces -c "\i source/db/min_bin.sql"

psql -d Traces -c "\i source/db/bins_view.sql"