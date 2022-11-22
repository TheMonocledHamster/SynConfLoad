DROP TABLE minute_bins;

CREATE TABLE minute_bins (
minuteid int4 NOT NULL,
minute_bin int4 NULL,
CONSTRAINT minute_bins_pk PRIMARY KEY (minuteid)
);

do $$
declare
intrvl integer := 10;
cntr integer := 1;
ifloor integer := 1;
iceiling integer :=0;
begin

delete from minute_bins;
for cntr in 1..1440 loop

ifloor = div(cntr-1, intrvl) * intrvl ;
iceiling = ifloor + intrvl;
    insert into minute_bins (minuteid, minute_bin) values (cntr, iceiling);

end loop;

end $$;