DROP TABLE IF EXISTS dur_staging;
CREATE TABLE dur_staging (
    ownerid VARCHAR(100),
    appid VARCHAR(100),
    fnid VARCHAR(100),
    avg_duration INTEGER,
    num_exec INTEGER,
    exec_min NUMERIC(10,2),
    exec_max NUMERIC(10,2),
    exec_percentile_0 INTEGER,
    exec_percentile_1 INTEGER,
    exec_percentile_25 INTEGER,
    exec_percentile_50 INTEGER,
    exec_percentile_75 INTEGER,
    exec_percentile_99 INTEGER,
    exec_percentile_100 INTEGER
);
