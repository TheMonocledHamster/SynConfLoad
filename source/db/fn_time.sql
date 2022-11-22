DROP TABLE IF EXISTS fn_time;
CREATE TABLE fn_time (
    id INT,
    ownerid VARCHAR(100),
    appid VARCHAR(100),
    fnid VARCHAR(100),
    trigid VARCHAR(100),
    avg_exec_time INT,
    num_exec INT,
    exec_perc_1 INT,
    exec_perc_25 INT,
    exec_perc_50 INT,
    exec_perc_75 INT,
    exec_perc_99 INT
);