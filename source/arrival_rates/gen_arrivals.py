import psycopg2 as pg
import numpy as np
import csv
from commons import slo_bins

conn = pg.connect(dbname='Traces', user='adi')
cur = conn.cursor()

cur.execute("SELECT MAX(req_count) FROM bins;")
max_arrival = cur.fetchone()[0]

for slo_bin in slo_bins:
    cur.execute("SELECT timeframe_bin,req_count FROM bins WHERE slo_bin={} ORDER BY timeframe_bin;".format(slo_bin))
    arrivals = np.array([[x[0],x[1]] for x in cur.fetchall()], dtype=np.float32)
    arrivals[:,1] = np.round(arrivals[:,1]/max_arrival, 4)

    with open('source/arrival_rates/slo{}.csv'.format(slo_bin),'w+') as f:
        writer = csv.writer(f)
        writer.writerow(['time_upper','rate'])
        writer.writerows(arrivals)

cur.close()
conn.close()
