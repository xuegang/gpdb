---
--- Test case errors out when we define aggregates without preliminary functions and use it as an aggregate derived window function.
---

create schema bfv_olap;
set search_path=bfv_olap;

-- SETUP
-- start_ignore
drop table if exists toy;
drop aggregate if exists mysum1(int4);
drop aggregate if exists mysum2(int4);
-- end_ignore
create table toy(id,val) as select i,i from generate_series(1,5) i;
create aggregate mysum1(int4) (sfunc = int4_sum, prefunc=int8pl, stype=bigint);
create aggregate mysum2(int4) (sfunc = int4_sum, stype=bigint);

-- TEST
select id, val, sum(val) over (w), mysum1(val) over (w), mysum2(val) over (w) from toy window w as (order by id rows 2 preceding);

-- CLEANUP
-- start_ignore
drop aggregate if exists mysum1(int4);
drop aggregate if exists mysum2(int4);
drop table if exists toy;
-- end_ignore

---
--- Test case errors out when we define aggregates without preliminary functions and use it as an aggregate derived window function.
---

-- SETUP
-- start_ignore
drop type if exists ema_type cascade;
drop function if exists ema_adv(t ema_type, v float, x float) cascade;
drop function if exists ema_fin(t ema_type) cascade;
drop aggregate if exists ema(float, float);
drop table if exists ema_test cascade;
-- end_ignore
create type ema_type as (x float, e float);

create function ema_adv(t ema_type, v float, x float)
    returns ema_type
    as $$
        begin
            if t.e is null then
                t.e = v;
                t.x = x;
            else
                if t.x != x then
                    raise exception 'ema smoothing x may not vary';
                end if;
                t.e = t.e + (v - t.e) * t.x;
            end if;
            return t;
        end;
    $$ language plpgsql;

create function ema_fin(t ema_type)
    returns float
    as $$
       begin
           return t.e;
       end;
    $$ language plpgsql;

create aggregate ema(float, float) (
    sfunc = ema_adv,
    stype = ema_type,
    finalfunc = ema_fin,
    initcond = '(,)');

create table ema_test (k int, v float ) distributed by (k);
insert into ema_test select i, 4*random() + 10.0*(1+cos(radians(i*5))) from generate_series(0,19) i(i);

-- TEST
select k, v, ema(v, 0.9) over (order by k rows between unbounded preceding and current row) from ema_test order by k;

-- CLEANUP
-- start_ignore
drop table if exists ema_test cascade;
drop aggregate if exists ema(float, float);
drop function if exists ema_fin(t ema_type) cascade;
drop function if exists ema_adv(t ema_type, v float, x float) cascade;
drop type if exists ema_type cascade;
-- end_ignore

---
--- Test case errors out when we define aggregates without preliminary functions and use it as an aggregate derived window function.
---

-- SETUP
-- start_ignore
drop type if exists ema_type cascade;
drop function if exists ema_adv(t ema_type, v float, x float) cascade;
drop function if exists ema_fin(t ema_type) cascade;
drop aggregate if exists ema(float, float);
drop table if exists ema_test cascade;
-- end_ignore
create type ema_type as (x float, e float);

create function ema_adv(t ema_type, v float, x float)
    returns ema_type
    as $$
        begin
            if t.e is null then
                t.e = v;
                t.x = x;
            else
                if t.x != x then
                    raise exception 'ema smoothing x may not vary';
                end if;
                t.e = t.e + (v - t.e) * t.x;
            end if;
            return t;
        end;
    $$ language plpgsql;

create function ema_fin(t ema_type)
    returns float
    as $$
       begin
           return t.e;
       end;
    $$ language plpgsql;

create aggregate ema(float, float) (
    sfunc = ema_adv,
    stype = ema_type,
    finalfunc = ema_fin,
    initcond = '(,)');

create table ema_test (k int, v float ) distributed by (k);
insert into ema_test select i, 4*random() + 10.0*(1+cos(radians(i*5))) from generate_series(0,19) i(i);

-- TEST
select k, v, ema(v, 0.9) over (order by k) from ema_test order by k;

-- CLEANUP
-- start_ignore
drop table if exists ema_test cascade;
drop aggregate if exists ema(float, float);
drop function if exists ema_fin(t ema_type) cascade;
drop function if exists ema_adv(t ema_type, v float, x float) cascade;
drop type if exists ema_type cascade;
-- end_ignore







---
--- Test with/without group by
---

-- SETUP
-- start_ignore
DROP TABLE IF EXISTS r;
-- end_ignore
CREATE TABLE r
(
    a INT NOT NULL, 
    b INT, 
    c CHARACTER VARYING(200),  
    d NUMERIC(10,0), 
    e DATE
) DISTRIBUTED BY (a,b);
ALTER TABLE r ADD CONSTRAINT PKEY PRIMARY KEY (b);

--TEST
SELECT MAX(a) AS m FROM r GROUP BY b ORDER BY m;
SELECT MAX(a) AS m FROM r GROUP BY a ORDER BY m;
SELECT MAX(a) AS m FROM r GROUP BY b;
 
-- CLEANUP
-- start_ignore
DROP TABLE IF EXISTS r;
-- end_ignore


---
--- ORDER BY clause includes some grouping column or not
---

-- SETUP
-- start_ignore
DROP TABLE IF EXISTS r;
-- end_ignore
CREATE TABLE r
(
    a INT NOT NULL, 
    b INT, 
    c CHARACTER VARYING(200),  
    d NUMERIC(10,0), 
    e DATE
) DISTRIBUTED BY (a,b);
ALTER TABLE r ADD CONSTRAINT PKEY PRIMARY KEY (b);

--TEST
SELECT MAX(a) AS m FROM R GROUP BY b ORDER BY m,b;
SELECT MAX(a) AS m FROM R GROUP BY b,e ORDER BY m,b,e;
SELECT MAX(a) AS m FROM R GROUP BY b,e ORDER BY m;

-- CLEANUP
-- start_ignore
DROP TABLE IF EXISTS r;
-- end_ignore


---
--- ORDER BY 1 or more columns
---

-- SETUP
-- start_ignore
DROP TABLE IF EXISTS r;
-- end_ignore
CREATE TABLE r
(
    a INT NOT NULL, 
    b INT, 
    c CHARACTER VARYING(200),  
    d NUMERIC(10,0), 
    e DATE
) DISTRIBUTED BY (a,b);
ALTER TABLE r ADD CONSTRAINT PKEY PRIMARY KEY (b);

--TEST
SELECT MAX(a),d,e AS m FROM r GROUP BY b,d,e ORDER BY m,e,d;
SELECT MIN(a),d,e AS m FROM r GROUP BY b,e,d ORDER BY e,d;
SELECT MAX(a) AS m FROM r GROUP BY b,c,d,e ORDER BY e,d;
SELECT MAX(a) AS m FROM r GROUP BY b,e ORDER BY e;
SELECT MAX(e) AS m FROM r GROUP BY b ORDER BY m;

-- CLEANUP
-- start_ignore
DROP TABLE IF EXISTS r;
-- end_ignore


---
--- ORDER BY clause includes some grouping column or not
---

-- SETUP
-- start_ignore
DROP TABLE IF EXISTS dm_calendar;
-- end_ignore
CREATE TABLE dm_calendar (
    calendar_id bigint NOT NULL,
    date_name character varying(200),
    date_name_cn character varying(200),
    calendar_date date,
    current_day numeric(10,0),
    month_id numeric(10,0),
    month_name character varying(200),
    month_name_cn character varying(200),
    month_name_short character varying(200),
    month_name_short_cn character varying(200),
    days_in_month numeric(10,0),
    first_of_month numeric(10,0),
    last_month_id numeric(10,0),
    month_end numeric(10,0),
    quarter_id numeric(10,0),
    quarter_name character varying(200),
    quarter_name_cn character varying(200),
    quarter_name_short character varying(200),
    quarter_name_short_cn character varying(200),
    year_id numeric(10,0),
    year_name character varying(200),
    year_name_cn character varying(200),
    description character varying(500),
    create_date timestamp without time zone,
    month_week_num character varying(100),
    month_week_begin character varying(100),
    month_week_end character varying(100),
    half_year character varying(100),
    weekend_flag character varying(100),
    holidays_flag character varying(100),
    workday_flag character varying(100),
    month_number numeric(10,0)
) DISTRIBUTED BY (calendar_id);
ALTER TABLE ONLY dm_calendar ADD CONSTRAINT dm_calendar_pkey PRIMARY KEY (calendar_id);

--TEST
SELECT "year_id" as id , min("year_name") as a  from (select "year_id" as "year_id" , min("year_name") as "year_name" from  "dm_calendar" group by "year_id") "dm_calendar3" group by "year_id" order by a ASC ;

-- CLEANUP
-- start_ignore
DROP TABLE IF EXISTS dm_calendar;
-- end_ignore


---
--- Test with/without group by with primary key as dist key
---

-- SETUP
-- start_ignore
drop table if exists t;
-- end_ignore
create table t
(
    a int NOT NULL,
    b int,
    c character varying(200),
    d numeric(10,0),
    e date
) distributed by (b);
alter table t ADD CONSTRAINT pkey primary key (b);

-- TEST
SELECT MAX(a) AS m FROM t GROUP BY b ORDER BY m;

-- CLEANUP
-- start_ignore
drop table if exists t;
-- end_ignore




---
--- Passing through distribution matching type in default implementation
---

-- SETUP
-- start_ignore
drop table if exists customer;
drop table if exists sale;
-- end_ignore
create table customer
(
	cn int not null,
	cname text not null,
	cloc text,

	primary key (cn)

) distributed by (cn);


insert into customer values
  ( 1, 'Macbeth', 'Inverness'),
  ( 2, 'Duncan', 'Forres'),
  ( 3, 'Lady Macbeth', 'Inverness'),
  ( 4, 'Witches, Inc', 'Lonely Heath');


create table sale
(
	cn int not null,
	vn int not null,
	pn int not null,
	dt date not null,
	qty int not null,
	prc float not null,

	primary key (cn, vn, pn)

) distributed by (cn,vn,pn);


insert into sale values
  ( 2, 40, 100, '1401-1-1', 1100, 2400),
  ( 1, 10, 200, '1401-3-1', 1, 0),
  ( 3, 40, 200, '1401-4-1', 1, 0),
  ( 1, 20, 100, '1401-5-1', 1, 0),
  ( 1, 30, 300, '1401-5-2', 1, 0),
  ( 1, 50, 400, '1401-6-1', 1, 0),
  ( 2, 50, 400, '1401-6-1', 1, 0),
  ( 1, 30, 500, '1401-6-1', 12, 5),
  ( 3, 30, 500, '1401-6-1', 12, 5),
  ( 3, 30, 600, '1401-6-1', 12, 5),
  ( 4, 40, 700, '1401-6-1', 1, 1),
  ( 4, 40, 800, '1401-6-1', 1, 1);
  
-- TEST
select cname,
rank() over (partition by sale.cn order by vn)
from sale, customer
where sale.cn = customer.cn
order by 1, 2;

-- CLEANUP
-- start_ignore
drop table if exists customer;
drop table if exists sale;
-- end_ignore


---
--- Optimzier query crashing for logical window with no window functions
---

-- SETUP
create table mpp23240(a int, b int, c int, d int, e int, f int);

-- TEST
select a, b,
       case 1
        when 10 then
          sum(c) over(partition by a)
        when 20 then
          sum(d) over(partition by a)
        else
          5
       end as sum1
from (select * from mpp23240 where f > 10) x;

-- CLEANUP
-- start_ignore
drop table mpp23240;

drop schema if exists bfv_olap;
-- end_ignore

