-- Date functions
use company_info;
select curdate(); -- current date
select current_date(); -- current date
select current_time(); -- current time
select curtime();-- current time
select current_timestamp(); -- current date and current time
select now(); -- current date and current time
select sysdate(); -- current date and current time
select day(curdate()); -- iut will extract  day
select day('2020-04-19');
select day('2020-04-19'),dayname('2020-04-19');-- name of day
select dayofmonth('2020-04-19');
select dayofweek('2020-04-19'); -- starts with 1 from sunday
select dayofyear('2020-04-19');

select month('2020-04-19');
select monthname('2020-04-19');

select year('2020-04-19');
select yearweek('2020-04-19');

select quarter('2020-04-19');

select week('2020-04-19');
select weekday('2020-04-19'); -- starts with 0 from monday
select weekofyear('2020-04-19');

select hour(now());
select minute('15:42:52');
select hour('25:42:52');
select second(current_time());
select microsecond(now());
select microsecond('14:23:52.000023');
select last_day(curdate()); -- last day of current month

-- add date,dateadd
-- add 7 days to the current date
select adddate(curdate(),7);

-- interval - specifies whether day or month or year has to be added
select adddate(curdate(),interval 7 day);
select adddate(curdate(),interval 7 month);
select adddate(curdate(),interval 7 year);
select adddate(curdate(),interval 7 quarter);
select adddate(curdate(),interval 7 week);
select adddate(curdate(),interval -1 day); -- same operatopns can be done for back
select adddate(curdate(),interval -1 week);
select adddate(curdate(),interval -1 year);

select date_add(curdate(),interval 4 day); -- mandatory to add interval
select date_add(curdate(),interval 4 month); 
select date_add(curdate(),interval 4 year); 

select date_sub(curdate(),interval 10 day);
select date_sub(curdate(),interval 10 month);

select datediff(curdate(),'1997-01-01');-- it will only give output in days
select floor(datediff(curdate(),'1997-01-01')/365); -- floor division is done to remove decimal part
select timestampdiff(YEAR,'1997-01-01',curdate())as age;

select date_format(curdate(),'%d-%m-%Y'); -- date formating y will give 2 digit year and Y will give 4 digit 
select date_format(curdate(),'%d-%m-%y');

select date_format(curdate(),'%W,%d-%m-%Y');
select date_format(curdate(),'%W,%d-%m-%Y');

select addtime(now(),'1:00:00'); -- adding 1 hr to current time
select makedate(2019,365); -- adding 365 days to given year
select makedate('2019-01-31',400);

select str_to_date('2009,01,20','%Y,%m,%d');
select str_to_date('18,05,2009','%d,%m,%Y');

