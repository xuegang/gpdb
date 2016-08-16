
-- start_ignore
create schema sql_partition_101_150;
set search_path to sql_partition_101_150;
-- end_ignore
-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_firstcol_dml_int8;
CREATE TABLE mpp21090_drop_firstcol_dml_int8(
col1 int8,
col2 decimal,
col3 char,
col4 date,
col5 int
)  with (appendonly= true)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_firstcol_dml_int8 VALUES(2000000000000000000,0.00,'a','2014-01-01',0);
SELECT * FROM mpp21090_drop_firstcol_dml_int8 ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_firstcol_dml_int8 DROP COLUMN col1;
INSERT INTO mpp21090_drop_firstcol_dml_int8 SELECT 1.00,'b','2014-01-02',1;
SELECT * FROM mpp21090_drop_firstcol_dml_int8 ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_firstcol_dml_int8 SET col3='c' WHERE col3 = 'b' AND col5 = 1;
SELECT * FROM mpp21090_drop_firstcol_dml_int8 ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_firstcol_dml_int8 WHERE col3='c';
SELECT * FROM mpp21090_drop_firstcol_dml_int8 ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_firstcol_dml_int8;
CREATE TABLE mpp21090_drop_firstcol_dml_int8(
col1 int8,
col2 decimal,
col3 char,
col4 date,
col5 int
)  with (appendonly= true, orientation= column)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_firstcol_dml_int8 VALUES(2000000000000000000,0.00,'a','2014-01-01',0);
SELECT * FROM mpp21090_drop_firstcol_dml_int8 ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_firstcol_dml_int8 DROP COLUMN col1;
INSERT INTO mpp21090_drop_firstcol_dml_int8 SELECT 1.00,'b','2014-01-02',1;
SELECT * FROM mpp21090_drop_firstcol_dml_int8 ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_firstcol_dml_int8 SET col3='c' WHERE col3 = 'b' AND col5 = 1;
SELECT * FROM mpp21090_drop_firstcol_dml_int8 ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_firstcol_dml_int8 WHERE col3='c';
SELECT * FROM mpp21090_drop_firstcol_dml_int8 ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_firstcol_dml_int8;
CREATE TABLE mpp21090_drop_firstcol_dml_int8(
col1 int8,
col2 decimal,
col3 char,
col4 date,
col5 int
)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_firstcol_dml_int8 VALUES(2000000000000000000,0.00,'a','2014-01-01',0);
SELECT * FROM mpp21090_drop_firstcol_dml_int8 ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_firstcol_dml_int8 DROP COLUMN col1;
INSERT INTO mpp21090_drop_firstcol_dml_int8 SELECT 1.00,'b','2014-01-02',1;
SELECT * FROM mpp21090_drop_firstcol_dml_int8 ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_firstcol_dml_int8 SET col3='c' WHERE col3 = 'b' AND col5 = 1;
SELECT * FROM mpp21090_drop_firstcol_dml_int8 ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_firstcol_dml_int8 WHERE col3='c';
SELECT * FROM mpp21090_drop_firstcol_dml_int8 ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_firstcol_dml_int;
CREATE TABLE mpp21090_drop_firstcol_dml_int(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 int
)  with (appendonly= true)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_firstcol_dml_int VALUES(20000,0.00,'a','2014-01-01',0);
SELECT * FROM mpp21090_drop_firstcol_dml_int ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_firstcol_dml_int DROP COLUMN col1;
INSERT INTO mpp21090_drop_firstcol_dml_int SELECT 1.00,'b','2014-01-02',1;
SELECT * FROM mpp21090_drop_firstcol_dml_int ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_firstcol_dml_int SET col3='c' WHERE col3 = 'b' AND col5 = 1;
SELECT * FROM mpp21090_drop_firstcol_dml_int ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_firstcol_dml_int WHERE col3='c';
SELECT * FROM mpp21090_drop_firstcol_dml_int ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_firstcol_dml_int;
CREATE TABLE mpp21090_drop_firstcol_dml_int(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 int
)  with (appendonly= true, orientation= column)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_firstcol_dml_int VALUES(20000,0.00,'a','2014-01-01',0);
SELECT * FROM mpp21090_drop_firstcol_dml_int ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_firstcol_dml_int DROP COLUMN col1;
INSERT INTO mpp21090_drop_firstcol_dml_int SELECT 1.00,'b','2014-01-02',1;
SELECT * FROM mpp21090_drop_firstcol_dml_int ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_firstcol_dml_int SET col3='c' WHERE col3 = 'b' AND col5 = 1;
SELECT * FROM mpp21090_drop_firstcol_dml_int ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_firstcol_dml_int WHERE col3='c';
SELECT * FROM mpp21090_drop_firstcol_dml_int ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_firstcol_dml_int;
CREATE TABLE mpp21090_drop_firstcol_dml_int(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 int
)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_firstcol_dml_int VALUES(20000,0.00,'a','2014-01-01',0);
SELECT * FROM mpp21090_drop_firstcol_dml_int ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_firstcol_dml_int DROP COLUMN col1;
INSERT INTO mpp21090_drop_firstcol_dml_int SELECT 1.00,'b','2014-01-02',1;
SELECT * FROM mpp21090_drop_firstcol_dml_int ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_firstcol_dml_int SET col3='c' WHERE col3 = 'b' AND col5 = 1;
SELECT * FROM mpp21090_drop_firstcol_dml_int ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_firstcol_dml_int WHERE col3='c';
SELECT * FROM mpp21090_drop_firstcol_dml_int ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_firstcol_dml_interval;
CREATE TABLE mpp21090_drop_firstcol_dml_interval(
col1 interval,
col2 decimal,
col3 char,
col4 date,
col5 int
)  with (appendonly= true)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_firstcol_dml_interval VALUES('1 day',0.00,'a','2014-01-01',0);
SELECT * FROM mpp21090_drop_firstcol_dml_interval ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_firstcol_dml_interval DROP COLUMN col1;
INSERT INTO mpp21090_drop_firstcol_dml_interval SELECT 1.00,'b','2014-01-02',1;
SELECT * FROM mpp21090_drop_firstcol_dml_interval ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_firstcol_dml_interval SET col3='c' WHERE col3 = 'b' AND col5 = 1;
SELECT * FROM mpp21090_drop_firstcol_dml_interval ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_firstcol_dml_interval WHERE col3='c';
SELECT * FROM mpp21090_drop_firstcol_dml_interval ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_firstcol_dml_interval;
CREATE TABLE mpp21090_drop_firstcol_dml_interval(
col1 interval,
col2 decimal,
col3 char,
col4 date,
col5 int
)  with (appendonly= true, orientation= column)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_firstcol_dml_interval VALUES('1 day',0.00,'a','2014-01-01',0);
SELECT * FROM mpp21090_drop_firstcol_dml_interval ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_firstcol_dml_interval DROP COLUMN col1;
INSERT INTO mpp21090_drop_firstcol_dml_interval SELECT 1.00,'b','2014-01-02',1;
SELECT * FROM mpp21090_drop_firstcol_dml_interval ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_firstcol_dml_interval SET col3='c' WHERE col3 = 'b' AND col5 = 1;
SELECT * FROM mpp21090_drop_firstcol_dml_interval ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_firstcol_dml_interval WHERE col3='c';
SELECT * FROM mpp21090_drop_firstcol_dml_interval ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_firstcol_dml_interval;
CREATE TABLE mpp21090_drop_firstcol_dml_interval(
col1 interval,
col2 decimal,
col3 char,
col4 date,
col5 int
)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_firstcol_dml_interval VALUES('1 day',0.00,'a','2014-01-01',0);
SELECT * FROM mpp21090_drop_firstcol_dml_interval ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_firstcol_dml_interval DROP COLUMN col1;
INSERT INTO mpp21090_drop_firstcol_dml_interval SELECT 1.00,'b','2014-01-02',1;
SELECT * FROM mpp21090_drop_firstcol_dml_interval ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_firstcol_dml_interval SET col3='c' WHERE col3 = 'b' AND col5 = 1;
SELECT * FROM mpp21090_drop_firstcol_dml_interval ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_firstcol_dml_interval WHERE col3='c';
SELECT * FROM mpp21090_drop_firstcol_dml_interval ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_firstcol_dml_numeric;
CREATE TABLE mpp21090_drop_firstcol_dml_numeric(
col1 numeric,
col2 decimal,
col3 char,
col4 date,
col5 int
)  with (appendonly= true)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_firstcol_dml_numeric VALUES(2.000000,0.00,'a','2014-01-01',0);
SELECT * FROM mpp21090_drop_firstcol_dml_numeric ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_firstcol_dml_numeric DROP COLUMN col1;
INSERT INTO mpp21090_drop_firstcol_dml_numeric SELECT 1.00,'b','2014-01-02',1;
SELECT * FROM mpp21090_drop_firstcol_dml_numeric ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_firstcol_dml_numeric SET col3='c' WHERE col3 = 'b' AND col5 = 1;
SELECT * FROM mpp21090_drop_firstcol_dml_numeric ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_firstcol_dml_numeric WHERE col3='c';
SELECT * FROM mpp21090_drop_firstcol_dml_numeric ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_firstcol_dml_numeric;
CREATE TABLE mpp21090_drop_firstcol_dml_numeric(
col1 numeric,
col2 decimal,
col3 char,
col4 date,
col5 int
)  with (appendonly= true, orientation= column)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_firstcol_dml_numeric VALUES(2.000000,0.00,'a','2014-01-01',0);
SELECT * FROM mpp21090_drop_firstcol_dml_numeric ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_firstcol_dml_numeric DROP COLUMN col1;
INSERT INTO mpp21090_drop_firstcol_dml_numeric SELECT 1.00,'b','2014-01-02',1;
SELECT * FROM mpp21090_drop_firstcol_dml_numeric ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_firstcol_dml_numeric SET col3='c' WHERE col3 = 'b' AND col5 = 1;
SELECT * FROM mpp21090_drop_firstcol_dml_numeric ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_firstcol_dml_numeric WHERE col3='c';
SELECT * FROM mpp21090_drop_firstcol_dml_numeric ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_firstcol_dml_numeric;
CREATE TABLE mpp21090_drop_firstcol_dml_numeric(
col1 numeric,
col2 decimal,
col3 char,
col4 date,
col5 int
)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_firstcol_dml_numeric VALUES(2.000000,0.00,'a','2014-01-01',0);
SELECT * FROM mpp21090_drop_firstcol_dml_numeric ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_firstcol_dml_numeric DROP COLUMN col1;
INSERT INTO mpp21090_drop_firstcol_dml_numeric SELECT 1.00,'b','2014-01-02',1;
SELECT * FROM mpp21090_drop_firstcol_dml_numeric ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_firstcol_dml_numeric SET col3='c' WHERE col3 = 'b' AND col5 = 1;
SELECT * FROM mpp21090_drop_firstcol_dml_numeric ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_firstcol_dml_numeric WHERE col3='c';
SELECT * FROM mpp21090_drop_firstcol_dml_numeric ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_firstcol_dml_text;
CREATE TABLE mpp21090_drop_firstcol_dml_text(
col1 text,
col2 decimal,
col3 char,
col4 date,
col5 int
)  with (appendonly= true)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_firstcol_dml_text VALUES('abcdefghijklmnop',0.00,'a','2014-01-01',0);
SELECT * FROM mpp21090_drop_firstcol_dml_text ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_firstcol_dml_text DROP COLUMN col1;
INSERT INTO mpp21090_drop_firstcol_dml_text SELECT 1.00,'b','2014-01-02',1;
SELECT * FROM mpp21090_drop_firstcol_dml_text ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_firstcol_dml_text SET col3='c' WHERE col3 = 'b' AND col5 = 1;
SELECT * FROM mpp21090_drop_firstcol_dml_text ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_firstcol_dml_text WHERE col3='c';
SELECT * FROM mpp21090_drop_firstcol_dml_text ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_firstcol_dml_text;
CREATE TABLE mpp21090_drop_firstcol_dml_text(
col1 text,
col2 decimal,
col3 char,
col4 date,
col5 int
)  with (appendonly= true, orientation= column)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_firstcol_dml_text VALUES('abcdefghijklmnop',0.00,'a','2014-01-01',0);
SELECT * FROM mpp21090_drop_firstcol_dml_text ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_firstcol_dml_text DROP COLUMN col1;
INSERT INTO mpp21090_drop_firstcol_dml_text SELECT 1.00,'b','2014-01-02',1;
SELECT * FROM mpp21090_drop_firstcol_dml_text ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_firstcol_dml_text SET col3='c' WHERE col3 = 'b' AND col5 = 1;
SELECT * FROM mpp21090_drop_firstcol_dml_text ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_firstcol_dml_text WHERE col3='c';
SELECT * FROM mpp21090_drop_firstcol_dml_text ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_firstcol_dml_text;
CREATE TABLE mpp21090_drop_firstcol_dml_text(
col1 text,
col2 decimal,
col3 char,
col4 date,
col5 int
)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_firstcol_dml_text VALUES('abcdefghijklmnop',0.00,'a','2014-01-01',0);
SELECT * FROM mpp21090_drop_firstcol_dml_text ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_firstcol_dml_text DROP COLUMN col1;
INSERT INTO mpp21090_drop_firstcol_dml_text SELECT 1.00,'b','2014-01-02',1;
SELECT * FROM mpp21090_drop_firstcol_dml_text ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_firstcol_dml_text SET col3='c' WHERE col3 = 'b' AND col5 = 1;
SELECT * FROM mpp21090_drop_firstcol_dml_text ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_firstcol_dml_text WHERE col3='c';
SELECT * FROM mpp21090_drop_firstcol_dml_text ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_firstcol_dml_time;
CREATE TABLE mpp21090_drop_firstcol_dml_time(
col1 time,
col2 decimal,
col3 char,
col4 date,
col5 int
)  with (appendonly= true)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_firstcol_dml_time VALUES('12:00:00',0.00,'a','2014-01-01',0);
SELECT * FROM mpp21090_drop_firstcol_dml_time ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_firstcol_dml_time DROP COLUMN col1;
INSERT INTO mpp21090_drop_firstcol_dml_time SELECT 1.00,'b','2014-01-02',1;
SELECT * FROM mpp21090_drop_firstcol_dml_time ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_firstcol_dml_time SET col3='c' WHERE col3 = 'b' AND col5 = 1;
SELECT * FROM mpp21090_drop_firstcol_dml_time ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_firstcol_dml_time WHERE col3='c';
SELECT * FROM mpp21090_drop_firstcol_dml_time ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_firstcol_dml_time;
CREATE TABLE mpp21090_drop_firstcol_dml_time(
col1 time,
col2 decimal,
col3 char,
col4 date,
col5 int
)  with (appendonly= true, orientation= column)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_firstcol_dml_time VALUES('12:00:00',0.00,'a','2014-01-01',0);
SELECT * FROM mpp21090_drop_firstcol_dml_time ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_firstcol_dml_time DROP COLUMN col1;
INSERT INTO mpp21090_drop_firstcol_dml_time SELECT 1.00,'b','2014-01-02',1;
SELECT * FROM mpp21090_drop_firstcol_dml_time ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_firstcol_dml_time SET col3='c' WHERE col3 = 'b' AND col5 = 1;
SELECT * FROM mpp21090_drop_firstcol_dml_time ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_firstcol_dml_time WHERE col3='c';
SELECT * FROM mpp21090_drop_firstcol_dml_time ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_firstcol_dml_time;
CREATE TABLE mpp21090_drop_firstcol_dml_time(
col1 time,
col2 decimal,
col3 char,
col4 date,
col5 int
)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_firstcol_dml_time VALUES('12:00:00',0.00,'a','2014-01-01',0);
SELECT * FROM mpp21090_drop_firstcol_dml_time ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_firstcol_dml_time DROP COLUMN col1;
INSERT INTO mpp21090_drop_firstcol_dml_time SELECT 1.00,'b','2014-01-02',1;
SELECT * FROM mpp21090_drop_firstcol_dml_time ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_firstcol_dml_time SET col3='c' WHERE col3 = 'b' AND col5 = 1;
SELECT * FROM mpp21090_drop_firstcol_dml_time ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_firstcol_dml_time WHERE col3='c';
SELECT * FROM mpp21090_drop_firstcol_dml_time ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_firstcol_dml_timestamp;
CREATE TABLE mpp21090_drop_firstcol_dml_timestamp(
col1 timestamp,
col2 decimal,
col3 char,
col4 date,
col5 int
)  with (appendonly= true)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_firstcol_dml_timestamp VALUES('2013-12-31 12:00:00',0.00,'a','2014-01-01',0);
SELECT * FROM mpp21090_drop_firstcol_dml_timestamp ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_firstcol_dml_timestamp DROP COLUMN col1;
INSERT INTO mpp21090_drop_firstcol_dml_timestamp SELECT 1.00,'b','2014-01-02',1;
SELECT * FROM mpp21090_drop_firstcol_dml_timestamp ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_firstcol_dml_timestamp SET col3='c' WHERE col3 = 'b' AND col5 = 1;
SELECT * FROM mpp21090_drop_firstcol_dml_timestamp ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_firstcol_dml_timestamp WHERE col3='c';
SELECT * FROM mpp21090_drop_firstcol_dml_timestamp ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_firstcol_dml_timestamp;
CREATE TABLE mpp21090_drop_firstcol_dml_timestamp(
col1 timestamp,
col2 decimal,
col3 char,
col4 date,
col5 int
)  with (appendonly= true, orientation= column)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_firstcol_dml_timestamp VALUES('2013-12-31 12:00:00',0.00,'a','2014-01-01',0);
SELECT * FROM mpp21090_drop_firstcol_dml_timestamp ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_firstcol_dml_timestamp DROP COLUMN col1;
INSERT INTO mpp21090_drop_firstcol_dml_timestamp SELECT 1.00,'b','2014-01-02',1;
SELECT * FROM mpp21090_drop_firstcol_dml_timestamp ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_firstcol_dml_timestamp SET col3='c' WHERE col3 = 'b' AND col5 = 1;
SELECT * FROM mpp21090_drop_firstcol_dml_timestamp ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_firstcol_dml_timestamp WHERE col3='c';
SELECT * FROM mpp21090_drop_firstcol_dml_timestamp ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_firstcol_dml_timestamp;
CREATE TABLE mpp21090_drop_firstcol_dml_timestamp(
col1 timestamp,
col2 decimal,
col3 char,
col4 date,
col5 int
)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_firstcol_dml_timestamp VALUES('2013-12-31 12:00:00',0.00,'a','2014-01-01',0);
SELECT * FROM mpp21090_drop_firstcol_dml_timestamp ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_firstcol_dml_timestamp DROP COLUMN col1;
INSERT INTO mpp21090_drop_firstcol_dml_timestamp SELECT 1.00,'b','2014-01-02',1;
SELECT * FROM mpp21090_drop_firstcol_dml_timestamp ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_firstcol_dml_timestamp SET col3='c' WHERE col3 = 'b' AND col5 = 1;
SELECT * FROM mpp21090_drop_firstcol_dml_timestamp ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_firstcol_dml_timestamp WHERE col3='c';
SELECT * FROM mpp21090_drop_firstcol_dml_timestamp ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_firstcol_dml_timestamptz;
CREATE TABLE mpp21090_drop_firstcol_dml_timestamptz(
col1 timestamptz,
col2 decimal,
col3 char,
col4 date,
col5 int
)  with (appendonly= true)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_firstcol_dml_timestamptz VALUES('2013-12-31 12:00:00 PST',0.00,'a','2014-01-01',0);
SELECT * FROM mpp21090_drop_firstcol_dml_timestamptz ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_firstcol_dml_timestamptz DROP COLUMN col1;
INSERT INTO mpp21090_drop_firstcol_dml_timestamptz SELECT 1.00,'b','2014-01-02',1;
SELECT * FROM mpp21090_drop_firstcol_dml_timestamptz ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_firstcol_dml_timestamptz SET col3='c' WHERE col3 = 'b' AND col5 = 1;
SELECT * FROM mpp21090_drop_firstcol_dml_timestamptz ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_firstcol_dml_timestamptz WHERE col3='c';
SELECT * FROM mpp21090_drop_firstcol_dml_timestamptz ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_firstcol_dml_timestamptz;
CREATE TABLE mpp21090_drop_firstcol_dml_timestamptz(
col1 timestamptz,
col2 decimal,
col3 char,
col4 date,
col5 int
)  with (appendonly= true, orientation= column)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_firstcol_dml_timestamptz VALUES('2013-12-31 12:00:00 PST',0.00,'a','2014-01-01',0);
SELECT * FROM mpp21090_drop_firstcol_dml_timestamptz ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_firstcol_dml_timestamptz DROP COLUMN col1;
INSERT INTO mpp21090_drop_firstcol_dml_timestamptz SELECT 1.00,'b','2014-01-02',1;
SELECT * FROM mpp21090_drop_firstcol_dml_timestamptz ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_firstcol_dml_timestamptz SET col3='c' WHERE col3 = 'b' AND col5 = 1;
SELECT * FROM mpp21090_drop_firstcol_dml_timestamptz ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_firstcol_dml_timestamptz WHERE col3='c';
SELECT * FROM mpp21090_drop_firstcol_dml_timestamptz ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_firstcol_dml_timestamptz;
CREATE TABLE mpp21090_drop_firstcol_dml_timestamptz(
col1 timestamptz,
col2 decimal,
col3 char,
col4 date,
col5 int
)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_firstcol_dml_timestamptz VALUES('2013-12-31 12:00:00 PST',0.00,'a','2014-01-01',0);
SELECT * FROM mpp21090_drop_firstcol_dml_timestamptz ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_firstcol_dml_timestamptz DROP COLUMN col1;
INSERT INTO mpp21090_drop_firstcol_dml_timestamptz SELECT 1.00,'b','2014-01-02',1;
SELECT * FROM mpp21090_drop_firstcol_dml_timestamptz ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_firstcol_dml_timestamptz SET col3='c' WHERE col3 = 'b' AND col5 = 1;
SELECT * FROM mpp21090_drop_firstcol_dml_timestamptz ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_firstcol_dml_timestamptz WHERE col3='c';
SELECT * FROM mpp21090_drop_firstcol_dml_timestamptz ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_boolean;
CREATE TABLE mpp21090_drop_lastcol_dml_boolean(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 boolean
) with (appendonly= true)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_boolean VALUES(0,0.00,'a','2014-01-01',True);
SELECT * FROM mpp21090_drop_lastcol_dml_boolean ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_boolean DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_boolean SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_boolean ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_boolean SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_boolean ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_boolean WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_boolean ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_boolean;
CREATE TABLE mpp21090_drop_lastcol_dml_boolean(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 boolean
) with (appendonly= true, orientation= column)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_boolean VALUES(0,0.00,'a','2014-01-01',True);
SELECT * FROM mpp21090_drop_lastcol_dml_boolean ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_boolean DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_boolean SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_boolean ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_boolean SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_boolean ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_boolean WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_boolean ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_boolean;
CREATE TABLE mpp21090_drop_lastcol_dml_boolean(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 boolean
) DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_boolean VALUES(0,0.00,'a','2014-01-01',True);
SELECT * FROM mpp21090_drop_lastcol_dml_boolean ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_boolean DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_boolean SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_boolean ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_boolean SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_boolean ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_boolean WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_boolean ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_char;
CREATE TABLE mpp21090_drop_lastcol_dml_char(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 char
) with (appendonly= true)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_char VALUES(0,0.00,'a','2014-01-01','z');
SELECT * FROM mpp21090_drop_lastcol_dml_char ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_char DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_char SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_char ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_char SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_char ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_char WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_char ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_char;
CREATE TABLE mpp21090_drop_lastcol_dml_char(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 char
) with (appendonly= true, orientation= column)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_char VALUES(0,0.00,'a','2014-01-01','z');
SELECT * FROM mpp21090_drop_lastcol_dml_char ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_char DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_char SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_char ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_char SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_char ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_char WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_char ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_char;
CREATE TABLE mpp21090_drop_lastcol_dml_char(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 char
) DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_char VALUES(0,0.00,'a','2014-01-01','z');
SELECT * FROM mpp21090_drop_lastcol_dml_char ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_char DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_char SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_char ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_char SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_char ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_char WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_char ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_date;
CREATE TABLE mpp21090_drop_lastcol_dml_date(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 date
) with (appendonly= true)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_date VALUES(0,0.00,'a','2014-01-01','2013-12-31');
SELECT * FROM mpp21090_drop_lastcol_dml_date ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_date DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_date SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_date ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_date SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_date ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_date WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_date ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_date;
CREATE TABLE mpp21090_drop_lastcol_dml_date(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 date
) with (appendonly= true, orientation= column)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_date VALUES(0,0.00,'a','2014-01-01','2013-12-31');
SELECT * FROM mpp21090_drop_lastcol_dml_date ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_date DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_date SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_date ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_date SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_date ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_date WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_date ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_date;
CREATE TABLE mpp21090_drop_lastcol_dml_date(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 date
) DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_date VALUES(0,0.00,'a','2014-01-01','2013-12-31');
SELECT * FROM mpp21090_drop_lastcol_dml_date ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_date DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_date SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_date ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_date SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_date ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_date WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_date ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_decimal;
CREATE TABLE mpp21090_drop_lastcol_dml_decimal(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 decimal
) with (appendonly= true)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_decimal VALUES(0,0.00,'a','2014-01-01',2.00);
SELECT * FROM mpp21090_drop_lastcol_dml_decimal ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_decimal DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_decimal SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_decimal ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_decimal SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_decimal ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_decimal WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_decimal ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_decimal;
CREATE TABLE mpp21090_drop_lastcol_dml_decimal(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 decimal
) with (appendonly= true, orientation= column)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_decimal VALUES(0,0.00,'a','2014-01-01',2.00);
SELECT * FROM mpp21090_drop_lastcol_dml_decimal ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_decimal DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_decimal SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_decimal ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_decimal SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_decimal ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_decimal WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_decimal ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_decimal;
CREATE TABLE mpp21090_drop_lastcol_dml_decimal(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 decimal
) DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_decimal VALUES(0,0.00,'a','2014-01-01',2.00);
SELECT * FROM mpp21090_drop_lastcol_dml_decimal ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_decimal DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_decimal SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_decimal ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_decimal SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_decimal ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_decimal WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_decimal ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_float;
CREATE TABLE mpp21090_drop_lastcol_dml_float(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 float
) with (appendonly= true)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_float VALUES(0,0.00,'a','2014-01-01',2.00);
SELECT * FROM mpp21090_drop_lastcol_dml_float ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_float DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_float SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_float ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_float SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_float ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_float WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_float ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_float;
CREATE TABLE mpp21090_drop_lastcol_dml_float(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 float
) with (appendonly= true, orientation= column)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_float VALUES(0,0.00,'a','2014-01-01',2.00);
SELECT * FROM mpp21090_drop_lastcol_dml_float ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_float DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_float SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_float ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_float SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_float ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_float WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_float ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_float;
CREATE TABLE mpp21090_drop_lastcol_dml_float(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 float
) DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_float VALUES(0,0.00,'a','2014-01-01',2.00);
SELECT * FROM mpp21090_drop_lastcol_dml_float ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_float DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_float SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_float ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_float SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_float ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_float WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_float ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_int4;
CREATE TABLE mpp21090_drop_lastcol_dml_int4(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 int4
) with (appendonly= true)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_int4 VALUES(0,0.00,'a','2014-01-01',2000000000);
SELECT * FROM mpp21090_drop_lastcol_dml_int4 ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_int4 DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_int4 SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_int4 ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_int4 SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_int4 ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_int4 WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_int4 ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_int4;
CREATE TABLE mpp21090_drop_lastcol_dml_int4(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 int4
) with (appendonly= true, orientation= column)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_int4 VALUES(0,0.00,'a','2014-01-01',2000000000);
SELECT * FROM mpp21090_drop_lastcol_dml_int4 ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_int4 DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_int4 SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_int4 ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_int4 SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_int4 ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_int4 WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_int4 ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_int4;
CREATE TABLE mpp21090_drop_lastcol_dml_int4(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 int4
) DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_int4 VALUES(0,0.00,'a','2014-01-01',2000000000);
SELECT * FROM mpp21090_drop_lastcol_dml_int4 ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_int4 DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_int4 SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_int4 ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_int4 SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_int4 ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_int4 WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_int4 ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_int8;
CREATE TABLE mpp21090_drop_lastcol_dml_int8(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 int8
) with (appendonly= true)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_int8 VALUES(0,0.00,'a','2014-01-01',2000000000000000000);
SELECT * FROM mpp21090_drop_lastcol_dml_int8 ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_int8 DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_int8 SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_int8 ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_int8 SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_int8 ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_int8 WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_int8 ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_int8;
CREATE TABLE mpp21090_drop_lastcol_dml_int8(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 int8
) with (appendonly= true, orientation= column)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_int8 VALUES(0,0.00,'a','2014-01-01',2000000000000000000);
SELECT * FROM mpp21090_drop_lastcol_dml_int8 ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_int8 DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_int8 SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_int8 ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_int8 SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_int8 ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_int8 WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_int8 ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_int8;
CREATE TABLE mpp21090_drop_lastcol_dml_int8(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 int8
) DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_int8 VALUES(0,0.00,'a','2014-01-01',2000000000000000000);
SELECT * FROM mpp21090_drop_lastcol_dml_int8 ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_int8 DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_int8 SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_int8 ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_int8 SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_int8 ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_int8 WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_int8 ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_int;
CREATE TABLE mpp21090_drop_lastcol_dml_int(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 int
) with (appendonly= true)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_int VALUES(0,0.00,'a','2014-01-01',20000);
SELECT * FROM mpp21090_drop_lastcol_dml_int ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_int DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_int SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_int ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_int SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_int ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_int WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_int ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_int;
CREATE TABLE mpp21090_drop_lastcol_dml_int(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 int
) with (appendonly= true, orientation= column)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_int VALUES(0,0.00,'a','2014-01-01',20000);
SELECT * FROM mpp21090_drop_lastcol_dml_int ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_int DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_int SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_int ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_int SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_int ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_int WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_int ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_int;
CREATE TABLE mpp21090_drop_lastcol_dml_int(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 int
) DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_int VALUES(0,0.00,'a','2014-01-01',20000);
SELECT * FROM mpp21090_drop_lastcol_dml_int ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_int DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_int SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_int ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_int SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_int ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_int WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_int ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_interval;
CREATE TABLE mpp21090_drop_lastcol_dml_interval(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 interval
) with (appendonly= true)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_interval VALUES(0,0.00,'a','2014-01-01','1 day');
SELECT * FROM mpp21090_drop_lastcol_dml_interval ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_interval DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_interval SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_interval ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_interval SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_interval ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_interval WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_interval ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_interval;
CREATE TABLE mpp21090_drop_lastcol_dml_interval(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 interval
) with (appendonly= true, orientation= column)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_interval VALUES(0,0.00,'a','2014-01-01','1 day');
SELECT * FROM mpp21090_drop_lastcol_dml_interval ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_interval DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_interval SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_interval ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_interval SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_interval ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_interval WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_interval ORDER BY 1,2,3,4;


-- start_ignore
drop schema sql_partition_101_150 cascade;
-- end_ignore
