create table xyz ("B B" int, "C" int, "D+1" int) DISTRIBUTED RANDOMLY;
-- start_equiv
create table xyz_ctas1 as (select "B B" AS "B+1", "C" AS "_%A", "D+1" AS "D" from xyz) DISTRIBUTED RANDOMLY;
create table xyz_ctas2 as (select "B B" "B+1", "C" "_%A", "D+1" "D" from xyz) DISTRIBUTED RANDOMLY;
-- end_equiv
CREATE TEMP TABLE disttable (f1 integer) DISTRIBUTED RANDOMLY;
INSERT INTO DISTTABLE VALUES (1), (2), (3), (NULL);

-- start_equiv
SELECT f1, f1 IS DISTINCT FROM 2 AS "not 2" FROM disttable ORDER BY 1;
SELECT f1, f1 IS DISTINCT FROM 2 "not 2" FROM disttable ORDER BY 1;
-- end_equiv

-- start_equiv
SELECT f1, f1 IS DISTINCT FROM NULL AS "not null" FROM disttable ORDER BY 1;
SELECT f1, f1 IS DISTINCT FROM NULL "not null" FROM disttable ORDER BY 1;
-- end_equiv

-- start_equiv
SELECT f1, f1 IS DISTINCT FROM f1 AS "false" FROM disttable ORDER BY 1;
SELECT f1, f1 IS DISTINCT FROM f1 "false" FROM disttable ORDER BY 1;
-- end_equiv

-- start_equiv
SELECT f1, f1 IS DISTINCT FROM f1+1 AS "not null" FROM disttable ORDER BY 1;
SELECT f1, f1 IS DISTINCT FROM f1+1 "not null" FROM disttable ORDER BY 1;
-- end_equiv

-- start_equiv
SELECT 1 IS DISTINCT FROM 2 AS "yes";
SELECT 1 IS DISTINCT FROM 2 "yes";
-- end_equiv

-- start_equiv
SELECT 2 IS DISTINCT FROM 2 AS "no";
SELECT 2 IS DISTINCT FROM 2 "no";
-- end_equiv

-- start_equiv
SELECT 2 IS DISTINCT FROM null AS "yes";
SELECT 2 IS DISTINCT FROM null "yes";
-- end_equiv

-- start_equiv
SELECT null IS DISTINCT FROM null AS "no";
SELECT null IS DISTINCT FROM null "no";
-- end_equiv

CREATE TABLE test_having (a int, b int, c char(8), d char) DISTRIBUTED RANDOMLY;
INSERT INTO test_having VALUES
  (0, 1, 'XXXX', 'A'),
  (1, 2, 'AAAA', 'b'),
  (2, 2, 'AAAA', 'c'),
  (3, 3, 'BBBB', 'D'),
  (4, 3, 'BBBB', 'e'),
  (5, 3, 'bbbb', 'F'),
  (6, 4, 'cccc', 'g'),
  (7, 4, 'cccc', 'h'),
  (8, 4, 'CCCC', 'I'),
  (9, 4, 'CCCC', 'j');

-- start_equiv
SELECT 1 AS one FROM test_having WHERE 1/a = 1 HAVING 1 < 2;
SELECT 1 one FROM test_having WHERE 1/a = 1 HAVING 1 < 2;
-- end_equiv

-- start_equiv
SELECT 1 AS "one_%^" FROM test_having WHERE 1/a = 1 HAVING 1 < 2;
SELECT 1 "one_%^" FROM test_having WHERE 1/a = 1 HAVING 1 < 2;
-- end_equiv

-- start_equiv
SELECT c AS "C+1", max(a) AS MAX FROM test_having GROUP BY c HAVING count(*) > 2 OR min(a) = max(a)  ORDER BY c;
SELECT c "C+1", max(a) AS MAX FROM test_having GROUP BY c HAVING count(*) > 2 OR min(a) = max(a)  ORDER BY c;
-- end_equiv
-- start_equiv
SELECT 1 AS one WHERE 1 IN (SELECT 1);
SELECT 1 one WHERE 1 IN (SELECT 1);
-- end_equiv

-- start_equiv
SELECT 1 AS zero WHERE 1 NOT IN (SELECT 1);
SELECT 1 zero WHERE 1 NOT IN (SELECT 1);
-- end_equiv

-- start_equiv
SELECT 1 AS zero WHERE 1 IN (SELECT 2);
SELECT 1 zero WHERE 1 IN (SELECT 2);
-- end_equiv

CREATE TABLE SUBSELECT_TBL_AS_TEST (
   f1 integer,
   f2 integer,
   f3 float
 ) DISTRIBUTED RANDOMLY;
INSERT INTO SUBSELECT_TBL_AS_TEST VALUES
  (1, 2, 3),
  (2, 3, 4),
  (3, 4, 5),
  (1, 1, 1),
  (2, 2, 2),
  (3, 3, 3),
  (6, 7, 8),
  (8, 9, NULL);

-- start_equiv
SELECT '' AS eight, * FROM SUBSELECT_TBL_AS_TEST ORDER BY 2,3,4;
SELECT '' eight, * FROM SUBSELECT_TBL_AS_TEST ORDER BY 2,3,4;
-- end_equiv

-- start_equiv
SELECT '' AS six, f1 AS "Uncorrelated Field" FROM SUBSELECT_TBL_AS_TEST  WHERE f1 IN (SELECT f2 FROM SUBSELECT_TBL_AS_TEST) ORDER BY 2;
SELECT '' six, f1 "Uncorrelated Field" FROM SUBSELECT_TBL_AS_TEST  WHERE f1 IN (SELECT f2 FROM SUBSELECT_TBL_AS_TEST) ORDER BY 2;
-- end_equiv

-- start_equiv
SELECT '' AS six, f1 AS "Uncorrelated Field" FROM SUBSELECT_TBL_AS_TEST  WHERE f1 IN (SELECT f2 FROM SUBSELECT_TBL_AS_TEST WHERE f2 IN (SELECT f1 FROM SUBSELECT_TBL_AS_TEST)) ORDER BY 2;
SELECT '' six, f1 "Uncorrelated Field" FROM SUBSELECT_TBL_AS_TEST  WHERE f1 IN (SELECT f2 FROM SUBSELECT_TBL_AS_TEST WHERE f2 IN (SELECT f1 FROM SUBSELECT_TBL_AS_TEST)) ORDER BY 
2;
-- end_equiv

-- start_equiv
SELECT '' AS six, f1 AS "Correlated Field", f2 AS "Second Field"  FROM SUBSELECT_TBL_AS_TEST upper  WHERE f1 IN (SELECT f2 FROM SUBSELECT_TBL_AS_TEST WHERE f1 = upper.f1) ORDER BY 2,3;
SELECT '' six, f1 "Correlated Field", f2 "Second Field"  FROM SUBSELECT_TBL_AS_TEST upper  WHERE f1 IN (SELECT f2 FROM SUBSELECT_TBL_AS_TEST WHERE f1 = upper.f1) ORDER
 BY 2,3;
-- end_equiv

 
CREATE TEMP TABLE foo (id integer) DISTRIBUTED RANDOMLY;
CREATE TEMP TABLE bar (id1 integer, id2 integer) DISTRIBUTED RANDOMLY;
INSERT INTO foo VALUES (1);
INSERT INTO bar VALUES (1, 1), (2, 2), (3, 1);

-- start_equiv
SELECT * FROM foo WHERE id IN (SELECT id2 FROM (SELECT DISTINCT id1, id2 FROM bar) AS s) ORDER BY 1;
SELECT * FROM foo WHERE id IN (SELECT id2 FROM (SELECT DISTINCT id1, id2 FROM bar) s) ORDER BY 1;
-- end_equiv

-- start_equiv
SELECT * FROM foo WHERE id IN (SELECT id2 FROM (SELECT id1, id2 FROM bar UNION SELECT id1, id2 FROM bar) AS s) ORDER BY 1;
SELECT * FROM foo WHERE id IN (SELECT id2 FROM (SELECT id1, id2 FROM bar UNION SELECT id1, id2 FROM bar) s) ORDER BY 1;
-- end_equiv

-- start_equiv
SELECT * FROM foo WHERE id IN  (SELECT id2 FROM (SELECT id2 FROM bar GROUP BY id2) AS s) ORDER BY 1;
SELECT * FROM foo WHERE id IN  (SELECT id2 FROM (SELECT id2 FROM bar GROUP BY id2) s) ORDER BY 1;
-- end_equiv

-- start_equiv
SELECT * FROM foo WHERE id IN (SELECT id2 FROM (SELECT id2 FROM bar UNION SELECT id2 FROM bar) AS s) ORDER BY 1;
SELECT * FROM foo WHERE id IN (SELECT id2 FROM (SELECT id2 FROM bar UNION SELECT id2 FROM bar) s) ORDER BY 1;
-- end_equiv
create table xyz2 ("B B" int, "C" int, "D+1" int) DISTRIBUTED RANDOMLY;
insert into xyz2 values (generate_series(1,3),generate_series(4,6),generate_series(7,9));

-- start_equiv
select "B B" AS "%_B B","C" AS _c, "D+1" AS "D" from xyz2;
select "B B" "%_B B","C" _c, "D+1" "D" from xyz2;
-- end_equiv

-- start_equiv
select "B B" AS "%_B()","C" AS "_c&--", "D+1" AS "D+1" from xyz2;
select "B B" "%_B()","C" "_c&--", "D+1" "D+1" from xyz2;
-- end_equiv

-- start_equiv
select "B B" AS "## B B ##","C" AS "##_C_##", "D+1" AS "## D+1 ##" from xyz2;
select "B B" "## B B ##","C" "##_C_##", "D+1" "## D+1 ##" from xyz2;
-- end_equiv

-- start_equiv
select "B B" AS "!@ B @!","C" AS "&* C *&", "D+1" AS "^~ D ~^" from xyz2;
select "B B" "!@ B @!","C" "&* C *&", "D+1" "^~ D ~^" from xyz2;
-- end_equiv

-- start_equiv
select "B B"+1 "(B B)","C" "[C]", "D+1" "{D+1}" from xyz2;
select "B B"+1 "(B B)","C" "[C]", "D+1" "{D+1}" from xyz2;
-- end_equiv
CREATE TABLE TIMESTAMP_TBL_AS_TEST (d1 timestamp(2) without time zone) DISTRIBUTED RANDOMLY;
INSERT INTO TIMESTAMP_TBL_AS_TEST VALUES
  ('now'),
  ('now'),
  ('today'),
  ('yesterday'),
  ('tomorrow'),
  ('tomorrow EST'),
  ('tomorrow zulu');

-- start_equiv
SELECT count(*) AS One FROM TIMESTAMP_TBL_AS_TEST WHERE d1 = timestamp without time zone 'today';
SELECT count(*) One FROM TIMESTAMP_TBL_AS_TEST WHERE d1 = timestamp without time zone 'today';
-- end_equiv

-- start_equiv
SELECT count(*) AS Three FROM TIMESTAMP_TBL_AS_TEST WHERE d1 = timestamp without time zone 'tomorrow';
SELECT count(*) Three FROM TIMESTAMP_TBL_AS_TEST WHERE d1 = timestamp without time zone 'tomorrow';
-- end_equiv

-- start_equiv
SELECT count(*) AS One FROM TIMESTAMP_TBL_AS_TEST WHERE d1 = timestamp without time zone 'yesterday';
SELECT count(*) One FROM TIMESTAMP_TBL_AS_TEST WHERE d1 = timestamp without time zone 'yesterday';
-- end_equiv

-- start_equiv
SELECT count(*) AS One FROM TIMESTAMP_TBL_AS_TEST WHERE d1 = timestamp(2) without time zone 'now';
SELECT count(*) One FROM TIMESTAMP_TBL_AS_TEST WHERE d1 = timestamp(2) without time zone 'now';
-- end_equiv

DELETE FROM TIMESTAMP_TBL_AS_TEST;

INSERT INTO TIMESTAMP_TBL_AS_TEST VALUES
  ('2009-09-09 00:16:07'),
  ('2009-03-28 01:09:00'),
  ('2009-03-27 15:31:50.06'),
  ('2010-05-15'),
  ('Mon Feb 10 17:32:01 1997 PST');

-- start_equiv
SELECT '' AS "day", date_trunc('day',d1) AS date_trunc  FROM TIMESTAMP_TBL_AS_TEST WHERE d1 > timestamp without time zone '2009-03-27';
SELECT '' "day", date_trunc('day',d1) date_trunc  FROM TIMESTAMP_TBL_AS_TEST WHERE d1 > timestamp without time zone '2009-03-27';
-- end_equiv

-- start_equiv
SELECT '' AS "5", d1 FROM TIMESTAMP_TBL_AS_TEST  WHERE d1 <= timestamp without time zone '2010-05-15';
SELECT '' "5", d1 FROM TIMESTAMP_TBL_AS_TEST  WHERE d1 <= timestamp without time zone '2010-05-15';
-- end_equiv

-- start_equiv
SELECT '' AS date_trunc_week, date_trunc( 'week', timestamp '2004-02-29 15:44:17.71393' ) AS week_trunc;
SELECT '' date_trunc_week, date_trunc( 'week', timestamp '2004-02-29 15:44:17.71393' )  week_trunc;
-- end_equiv

-- start_equiv
SELECT '' AS to_char_1, to_char(d1, 'DAY Day day DY Dy dy MONTH Month month RM MON Mon mon')  FROM TIMESTAMP_TBL_AS_TEST;
SELECT '' to_char_1, to_char(d1, 'DAY Day day DY Dy dy MONTH Month month RM MON Mon mon')  FROM TIMESTAMP_TBL_AS_TEST;
-- end_equiv
create table xyz1 ("B B" text, "C" text, "D+1" text) DISTRIBUTED RANDOMLY;
insert into xyz1 values
  ('0_zero','1_one','2_two'),
  ('3_three','4_four','5_five'),
  ('6_six','7_seven','8_eight');

-- start_equiv
select upper("B B") AS "B_B", upper ("C") AS C, substr("D+1",1,1) AS "D" from xyz1;
select upper("B B") "B_B", upper ("C") C, substr("D+1",1,1) "D" from xyz1;
-- end_equiv

-- start_equiv
select lower("B B") AS "B_B", lower ("C") AS C, substr("D+1",1,1) AS "D+1" from xyz1;
select lower("B B") "B_B", lower ("C") C, substr("D+1",1,1) "D+1" from xyz1;
-- end_equiv

-- start_equiv
select upper("B B") AS "B_B", lower ("C") AS C, substr("D+1",1,1) AS "D+1%" from xyz1;
select upper("B B") "B_B", lower ("C") C, substr("D+1",1,1) "D+1%" from xyz1;
-- end_equiv

-- start_equiv
select lower("B B") AS "B_B", upper ("C") AS C, ("D+1") AS "D+1" from xyz1;
select lower("B B") "B_B", upper ("C") C, ("D+1") "D+1" from xyz1;
-- end_equiv

-- start_equiv
select upper("C") AS "C", lower ("B B") AS "%B_B%", "D+1" AS "D+1" from xyz1;
select upper("C") "C", lower ("B B") "%B_B%", "D+1" "D+1" from xyz1;
-- end_equiv

-- start_equiv
select lower("C") AS "%C%", upper ("B B") AS "BB", "D+1"||'9_nine' AS "D+1" from xyz1;
select lower("C") "%C%", upper ("B B") "BB", "D+1"||'9_nine' "D+1" from xyz1;
-- end_equiv

-- start_equiv
select upper("B B") AS "B_B", lower ("C") AS C, ("D+1"||'9_nine') AS "D+1" from xyz1;
select upper("B B") "B_B", lower ("C") C, ("D+1"||'9_nine') "D+1" from xyz1;
-- end_equiv
CREATE TABLE test_as_alias (a integer, b integer) DISTRIBUTED RANDOMLY;

-- start_equiv
CREATE OR REPLACE FUNCTION one() returns integer as $$ select 1 AS result; $$ language sql;
CREATE OR REPLACE FUNCTION one() returns integer as $$ select 1 result; $$ language sql;
-- end_equiv

-- start_equiv
CREATE OR REPLACE FUNCTION add_em(integer, integer) RETURNS integer as $$ SELECT $1 + $2 AS sum; $$ LANGUAGE SQL CONTAINS SQL;
CREATE OR REPLACE FUNCTION add_em(integer, integer) RETURNS integer as $$ SELECT $1 + $2 sum; $$ LANGUAGE SQL CONTAINS SQL;
-- end_equiv

-- start_equiv
INSERT INTO test_as_alias select a, a%5 from generate_series(1, 20) AS a;
INSERT INTO test_as_alias select a, a%5 from generate_series(1, 20) a;
-- end_equiv
