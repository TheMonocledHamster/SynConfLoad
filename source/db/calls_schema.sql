DROP TABLE IF EXISTS calls_master;
CREATE TABLE calls_master (
    id INT,
    ownerid VARCHAR(100),
    appid VARCHAR(100),
    fnid VARCHAR(100),
    trigid VARCHAR(100)
);

DROP TABLE IF EXISTS calls_minute;
CREATE TABLE calls_minute (
    id INT,
    minuteID INT,
    reqcount INT
);
