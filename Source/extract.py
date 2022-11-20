import pandas as pd
import sqlite3

conn = sqlite3.connect(database='packing_trace_zone_a_v1.sqlite',
                       isolation_level=None,
                       detect_types=sqlite3.PARSE_COLNAMES)

query = """
        SELECT vmr.vmId, vmr.starttime, vmr.endtime, vmt.core, vmt.memory
        FROM vm AS vmr
        JOIN vmtype AS vmt
        ON vmr.vmTypeId = vmt.vmTypeId
        AND vmr.starttime > 0
        AND vmr.endtime IS NOT NULL;
        """

db_df = pd.read_sql_query(query, conn)
db_df.to_csv('traces.csv', index=False)
conn.close()