create or replace view bins as
select
case
when avg_exec_time between 0 and 10 then 10
when avg_exec_time between 10 and 15 then 15
when avg_exec_time between 15 and 20 then 20
when avg_exec_time between 20 and 30 then 30
when avg_exec_time between 30 and 50 then 50
when avg_exec_time between 50 and 80 then 80
when avg_exec_time between 80 and 120 then 120
when avg_exec_time between 120 and 180 then 180
when avg_exec_time between 180 and 270 then 270
when avg_exec_time between 270 and 410 then 410
else -1
end as slo_bin,
mb.minute_bin as timeframe_bin,
sum(cm.reqcount) req_count
from fn_time ft
join calls_minute cm on cm.id = ft.id
join minute_bins mb on mb.minuteid = cm.minuteid
group by slo_bin, timeframe_bin;
