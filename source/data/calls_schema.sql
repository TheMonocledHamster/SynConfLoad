DROP TABLE IF EXISTS calls;
CREATE TABLE calls (
    ownerID VARCHAR(100),
    appID VARCHAR(100),
    fnID VARCHAR(100),
    trigID VARCHAR(100),
    dayID INT,
    minuteID INT,
    reqcount INT
);