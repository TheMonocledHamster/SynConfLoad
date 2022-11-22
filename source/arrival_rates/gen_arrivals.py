import psycopg2 as pg
import numpy as np
import csv

slo_bins = [10, 15, 20, 30, 50, 80, 120, 180, 270, 410, -1]

for slo_bin in slo_bins:
    conn = pg.connect(dbname='Traces', user='adi')
    cur = conn.cursor()

    cur.execute("SELECT timeframe_bin,req_count FROM bins WHERE slo_bin={} ORDER BY timeframe_bin;".format(slo_bin))
    arrivals = [[x[0],x[1]] for x in cur.fetchall()]

    arrivals = np.array(arrivals,dtype=np.float32)
    arrivals[:,1] = np.round(arrivals[:,1]/np.max(arrivals[:,1]),4)

    with open('source/arrival_rates/slo{}.csv'.format(slo_bin),'w+') as f:
        writer = csv.writer(f)
        writer.writerow(['time_upper','rate'])
        writer.writerows(arrivals)

    cur.close()
    conn.close()
