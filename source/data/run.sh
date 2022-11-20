python gen_tables.py

psql -d Traces -c "\i source/data/staging_schema.sql"

psql -d Traces -c "\copy staging1 FROM '~/Work/SynConfLoad/source/traces/AzureFunctions/invocations_per_function_md.anon.d01.csv' csv header;"
psql -d Traces -c "\copy staging2 FROM '~/Work/SynConfLoad/source/traces/AzureFunctions/invocations_per_function_md.anon.d02.csv' csv header;"
psql -d Traces -c "\copy staging3 FROM '~/Work/SynConfLoad/source/traces/AzureFunctions/invocations_per_function_md.anon.d03.csv' csv header;"
psql -d Traces -c "\copy staging4 FROM '~/Work/SynConfLoad/source/traces/AzureFunctions/invocations_per_function_md.anon.d04.csv' csv header;"
psql -d Traces -c "\copy staging5 FROM '~/Work/SynConfLoad/source/traces/AzureFunctions/invocations_per_function_md.anon.d05.csv' csv header;"
psql -d Traces -c "\copy staging6 FROM '~/Work/SynConfLoad/source/traces/AzureFunctions/invocations_per_function_md.anon.d06.csv' csv header;"
psql -d Traces -c "\copy staging7 FROM '~/Work/SynConfLoad/source/traces/AzureFunctions/invocations_per_function_md.anon.d07.csv' csv header;"
psql -d Traces -c "\copy staging8 FROM '~/Work/SynConfLoad/source/traces/AzureFunctions/invocations_per_function_md.anon.d08.csv' csv header;"
psql -d Traces -c "\copy staging9 FROM '~/Work/SynConfLoad/source/traces/AzureFunctions/invocations_per_function_md.anon.d09.csv' csv header;"
psql -d Traces -c "\copy staging10 FROM '~/Work/SynConfLoad/source/traces/AzureFunctions/invocations_per_function_md.anon.d10.csv' csv header;"
psql -d Traces -c "\copy staging11 FROM '~/Work/SynConfLoad/source/traces/AzureFunctions/invocations_per_function_md.anon.d11.csv' csv header;"
psql -d Traces -c "\copy staging12 FROM '~/Work/SynConfLoad/source/traces/AzureFunctions/invocations_per_function_md.anon.d12.csv' csv header;"
psql -d Traces -c "\copy staging13 FROM '~/Work/SynConfLoad/source/traces/AzureFunctions/invocations_per_function_md.anon.d13.csv' csv header;"
psql -d Traces -c "\copy staging14 FROM '~/Work/SynConfLoad/source/traces/AzureFunctions/invocations_per_function_md.anon.d14.csv' csv header;"

psql -d Traces -c "\i source/data/calls_schema.sql"

psql -d Traces -c "\i source/data/unpivot.sql"
