
-- start_ignore
create schema sql_partition_151_200;
set search_path to sql_partition_151_200;
-- end_ignore
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
) DISTRIBUTED by(col3);
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
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_numeric;
CREATE TABLE mpp21090_drop_lastcol_dml_numeric(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 numeric
) with (appendonly= true)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_numeric VALUES(0,0.00,'a','2014-01-01',2.000000);
SELECT * FROM mpp21090_drop_lastcol_dml_numeric ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_numeric DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_numeric SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_numeric ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_numeric SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_numeric ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_numeric WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_numeric ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_numeric;
CREATE TABLE mpp21090_drop_lastcol_dml_numeric(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 numeric
) with (appendonly= true, orientation= column)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_numeric VALUES(0,0.00,'a','2014-01-01',2.000000);
SELECT * FROM mpp21090_drop_lastcol_dml_numeric ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_numeric DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_numeric SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_numeric ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_numeric SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_numeric ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_numeric WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_numeric ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_numeric;
CREATE TABLE mpp21090_drop_lastcol_dml_numeric(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 numeric
) DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_numeric VALUES(0,0.00,'a','2014-01-01',2.000000);
SELECT * FROM mpp21090_drop_lastcol_dml_numeric ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_numeric DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_numeric SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_numeric ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_numeric SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_numeric ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_numeric WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_numeric ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_text;
CREATE TABLE mpp21090_drop_lastcol_dml_text(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 text
) with (appendonly= true)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_text VALUES(0,0.00,'a','2014-01-01','abcdefghijklmnop');
SELECT * FROM mpp21090_drop_lastcol_dml_text ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_text DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_text SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_text ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_text SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_text ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_text WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_text ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_text;
CREATE TABLE mpp21090_drop_lastcol_dml_text(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 text
) with (appendonly= true, orientation= column)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_text VALUES(0,0.00,'a','2014-01-01','abcdefghijklmnop');
SELECT * FROM mpp21090_drop_lastcol_dml_text ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_text DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_text SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_text ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_text SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_text ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_text WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_text ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_text;
CREATE TABLE mpp21090_drop_lastcol_dml_text(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 text
) DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_text VALUES(0,0.00,'a','2014-01-01','abcdefghijklmnop');
SELECT * FROM mpp21090_drop_lastcol_dml_text ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_text DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_text SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_text ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_text SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_text ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_text WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_text ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_time;
CREATE TABLE mpp21090_drop_lastcol_dml_time(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 time
) with (appendonly= true)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_time VALUES(0,0.00,'a','2014-01-01','12:00:00');
SELECT * FROM mpp21090_drop_lastcol_dml_time ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_time DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_time SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_time ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_time SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_time ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_time WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_time ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_time;
CREATE TABLE mpp21090_drop_lastcol_dml_time(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 time
) with (appendonly= true, orientation= column)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_time VALUES(0,0.00,'a','2014-01-01','12:00:00');
SELECT * FROM mpp21090_drop_lastcol_dml_time ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_time DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_time SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_time ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_time SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_time ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_time WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_time ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_time;
CREATE TABLE mpp21090_drop_lastcol_dml_time(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 time
) DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_time VALUES(0,0.00,'a','2014-01-01','12:00:00');
SELECT * FROM mpp21090_drop_lastcol_dml_time ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_time DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_time SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_time ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_time SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_time ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_time WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_time ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_timestamp;
CREATE TABLE mpp21090_drop_lastcol_dml_timestamp(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 timestamp
) with (appendonly= true)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_timestamp VALUES(0,0.00,'a','2014-01-01','2013-12-31 12:00:00');
SELECT * FROM mpp21090_drop_lastcol_dml_timestamp ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_timestamp DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_timestamp SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_timestamp ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_timestamp SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_timestamp ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_timestamp WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_timestamp ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_timestamp;
CREATE TABLE mpp21090_drop_lastcol_dml_timestamp(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 timestamp
) with (appendonly= true, orientation= column)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_timestamp VALUES(0,0.00,'a','2014-01-01','2013-12-31 12:00:00');
SELECT * FROM mpp21090_drop_lastcol_dml_timestamp ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_timestamp DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_timestamp SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_timestamp ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_timestamp SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_timestamp ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_timestamp WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_timestamp ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_timestamp;
CREATE TABLE mpp21090_drop_lastcol_dml_timestamp(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 timestamp
) DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_timestamp VALUES(0,0.00,'a','2014-01-01','2013-12-31 12:00:00');
SELECT * FROM mpp21090_drop_lastcol_dml_timestamp ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_timestamp DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_timestamp SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_timestamp ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_timestamp SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_timestamp ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_timestamp WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_timestamp ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_timestamptz;
CREATE TABLE mpp21090_drop_lastcol_dml_timestamptz(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 timestamptz
) with (appendonly= true)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_timestamptz VALUES(0,0.00,'a','2014-01-01','2013-12-31 12:00:00 PST');
SELECT * FROM mpp21090_drop_lastcol_dml_timestamptz ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_timestamptz DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_timestamptz SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_timestamptz ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_timestamptz SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_timestamptz ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_timestamptz WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_timestamptz ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_timestamptz;
CREATE TABLE mpp21090_drop_lastcol_dml_timestamptz(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 timestamptz
) with (appendonly= true, orientation= column)  DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_timestamptz VALUES(0,0.00,'a','2014-01-01','2013-12-31 12:00:00 PST');
SELECT * FROM mpp21090_drop_lastcol_dml_timestamptz ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_timestamptz DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_timestamptz SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_timestamptz ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_timestamptz SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_timestamptz ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_timestamptz WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_timestamptz ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_dml_timestamptz;
CREATE TABLE mpp21090_drop_lastcol_dml_timestamptz(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 timestamptz
) DISTRIBUTED by(col3);
INSERT INTO mpp21090_drop_lastcol_dml_timestamptz VALUES(0,0.00,'a','2014-01-01','2013-12-31 12:00:00 PST');
SELECT * FROM mpp21090_drop_lastcol_dml_timestamptz ORDER BY 1,2,3,4;
ALTER TABLE mpp21090_drop_lastcol_dml_timestamptz DROP COLUMN col5;
INSERT INTO mpp21090_drop_lastcol_dml_timestamptz SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_dml_timestamptz ORDER BY 1,2,3,4;
UPDATE mpp21090_drop_lastcol_dml_timestamptz SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_dml_timestamptz ORDER BY 1,2,3,4;
DELETE FROM mpp21090_drop_lastcol_dml_timestamptz WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_dml_timestamptz ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_index_dml_char;
CREATE TABLE mpp21090_drop_lastcol_index_dml_char(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 char
) with (appendonly= true)  DISTRIBUTED by(col3);

DROP INDEX IF EXISTS mpp21090_drop_lastcol_index_dml_idx_char;
CREATE INDEX mpp21090_drop_lastcol_index_dml_idx_char on mpp21090_drop_lastcol_index_dml_char(col3);

INSERT INTO mpp21090_drop_lastcol_index_dml_char VALUES(0,0.00,'a','2014-01-01','g');
SELECT * FROM mpp21090_drop_lastcol_index_dml_char ORDER BY 1,2,3,4;

ALTER TABLE mpp21090_drop_lastcol_index_dml_char DROP COLUMN col5;

INSERT INTO mpp21090_drop_lastcol_index_dml_char SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_index_dml_char ORDER BY 1,2,3,4;

UPDATE mpp21090_drop_lastcol_index_dml_char SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_index_dml_char ORDER BY 1,2,3,4;

DELETE FROM mpp21090_drop_lastcol_index_dml_char WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_index_dml_char ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_index_dml_char;
CREATE TABLE mpp21090_drop_lastcol_index_dml_char(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 char
) with (appendonly= true, orientation= column)  DISTRIBUTED by(col3);

DROP INDEX IF EXISTS mpp21090_drop_lastcol_index_dml_idx_char;
CREATE INDEX mpp21090_drop_lastcol_index_dml_idx_char on mpp21090_drop_lastcol_index_dml_char(col3);

INSERT INTO mpp21090_drop_lastcol_index_dml_char VALUES(0,0.00,'a','2014-01-01','g');
SELECT * FROM mpp21090_drop_lastcol_index_dml_char ORDER BY 1,2,3,4;

ALTER TABLE mpp21090_drop_lastcol_index_dml_char DROP COLUMN col5;

INSERT INTO mpp21090_drop_lastcol_index_dml_char SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_index_dml_char ORDER BY 1,2,3,4;

UPDATE mpp21090_drop_lastcol_index_dml_char SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_index_dml_char ORDER BY 1,2,3,4;

DELETE FROM mpp21090_drop_lastcol_index_dml_char WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_index_dml_char ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_index_dml_char;
CREATE TABLE mpp21090_drop_lastcol_index_dml_char(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 char
) DISTRIBUTED by(col3);

DROP INDEX IF EXISTS mpp21090_drop_lastcol_index_dml_idx_char;
CREATE INDEX mpp21090_drop_lastcol_index_dml_idx_char on mpp21090_drop_lastcol_index_dml_char(col3);

INSERT INTO mpp21090_drop_lastcol_index_dml_char VALUES(0,0.00,'a','2014-01-01','g');
SELECT * FROM mpp21090_drop_lastcol_index_dml_char ORDER BY 1,2,3,4;

ALTER TABLE mpp21090_drop_lastcol_index_dml_char DROP COLUMN col5;

INSERT INTO mpp21090_drop_lastcol_index_dml_char SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_index_dml_char ORDER BY 1,2,3,4;

UPDATE mpp21090_drop_lastcol_index_dml_char SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_index_dml_char ORDER BY 1,2,3,4;

DELETE FROM mpp21090_drop_lastcol_index_dml_char WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_index_dml_char ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_index_dml_date;
CREATE TABLE mpp21090_drop_lastcol_index_dml_date(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 date
) with (appendonly= true)  DISTRIBUTED by(col3);

DROP INDEX IF EXISTS mpp21090_drop_lastcol_index_dml_idx_date;
CREATE INDEX mpp21090_drop_lastcol_index_dml_idx_date on mpp21090_drop_lastcol_index_dml_date(col3);

INSERT INTO mpp21090_drop_lastcol_index_dml_date VALUES(0,0.00,'a','2014-01-01','2013-12-30');
SELECT * FROM mpp21090_drop_lastcol_index_dml_date ORDER BY 1,2,3,4;

ALTER TABLE mpp21090_drop_lastcol_index_dml_date DROP COLUMN col5;

INSERT INTO mpp21090_drop_lastcol_index_dml_date SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_index_dml_date ORDER BY 1,2,3,4;

UPDATE mpp21090_drop_lastcol_index_dml_date SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_index_dml_date ORDER BY 1,2,3,4;

DELETE FROM mpp21090_drop_lastcol_index_dml_date WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_index_dml_date ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_index_dml_date;
CREATE TABLE mpp21090_drop_lastcol_index_dml_date(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 date
) with (appendonly= true, orientation= column)  DISTRIBUTED by(col3);

DROP INDEX IF EXISTS mpp21090_drop_lastcol_index_dml_idx_date;
CREATE INDEX mpp21090_drop_lastcol_index_dml_idx_date on mpp21090_drop_lastcol_index_dml_date(col3);

INSERT INTO mpp21090_drop_lastcol_index_dml_date VALUES(0,0.00,'a','2014-01-01','2013-12-30');
SELECT * FROM mpp21090_drop_lastcol_index_dml_date ORDER BY 1,2,3,4;

ALTER TABLE mpp21090_drop_lastcol_index_dml_date DROP COLUMN col5;

INSERT INTO mpp21090_drop_lastcol_index_dml_date SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_index_dml_date ORDER BY 1,2,3,4;

UPDATE mpp21090_drop_lastcol_index_dml_date SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_index_dml_date ORDER BY 1,2,3,4;

DELETE FROM mpp21090_drop_lastcol_index_dml_date WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_index_dml_date ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_index_dml_date;
CREATE TABLE mpp21090_drop_lastcol_index_dml_date(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 date
) DISTRIBUTED by(col3);

DROP INDEX IF EXISTS mpp21090_drop_lastcol_index_dml_idx_date;
CREATE INDEX mpp21090_drop_lastcol_index_dml_idx_date on mpp21090_drop_lastcol_index_dml_date(col3);

INSERT INTO mpp21090_drop_lastcol_index_dml_date VALUES(0,0.00,'a','2014-01-01','2013-12-30');
SELECT * FROM mpp21090_drop_lastcol_index_dml_date ORDER BY 1,2,3,4;

ALTER TABLE mpp21090_drop_lastcol_index_dml_date DROP COLUMN col5;

INSERT INTO mpp21090_drop_lastcol_index_dml_date SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_index_dml_date ORDER BY 1,2,3,4;

UPDATE mpp21090_drop_lastcol_index_dml_date SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_index_dml_date ORDER BY 1,2,3,4;

DELETE FROM mpp21090_drop_lastcol_index_dml_date WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_index_dml_date ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_index_dml_decimal;
CREATE TABLE mpp21090_drop_lastcol_index_dml_decimal(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 decimal
) with (appendonly= true)  DISTRIBUTED by(col3);

DROP INDEX IF EXISTS mpp21090_drop_lastcol_index_dml_idx_decimal;
CREATE INDEX mpp21090_drop_lastcol_index_dml_idx_decimal on mpp21090_drop_lastcol_index_dml_decimal(col3);

INSERT INTO mpp21090_drop_lastcol_index_dml_decimal VALUES(0,0.00,'a','2014-01-01',2.00);
SELECT * FROM mpp21090_drop_lastcol_index_dml_decimal ORDER BY 1,2,3,4;

ALTER TABLE mpp21090_drop_lastcol_index_dml_decimal DROP COLUMN col5;

INSERT INTO mpp21090_drop_lastcol_index_dml_decimal SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_index_dml_decimal ORDER BY 1,2,3,4;

UPDATE mpp21090_drop_lastcol_index_dml_decimal SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_index_dml_decimal ORDER BY 1,2,3,4;

DELETE FROM mpp21090_drop_lastcol_index_dml_decimal WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_index_dml_decimal ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_index_dml_decimal;
CREATE TABLE mpp21090_drop_lastcol_index_dml_decimal(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 decimal
) with (appendonly= true, orientation= column)  DISTRIBUTED by(col3);

DROP INDEX IF EXISTS mpp21090_drop_lastcol_index_dml_idx_decimal;
CREATE INDEX mpp21090_drop_lastcol_index_dml_idx_decimal on mpp21090_drop_lastcol_index_dml_decimal(col3);

INSERT INTO mpp21090_drop_lastcol_index_dml_decimal VALUES(0,0.00,'a','2014-01-01',2.00);
SELECT * FROM mpp21090_drop_lastcol_index_dml_decimal ORDER BY 1,2,3,4;

ALTER TABLE mpp21090_drop_lastcol_index_dml_decimal DROP COLUMN col5;

INSERT INTO mpp21090_drop_lastcol_index_dml_decimal SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_index_dml_decimal ORDER BY 1,2,3,4;

UPDATE mpp21090_drop_lastcol_index_dml_decimal SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_index_dml_decimal ORDER BY 1,2,3,4;

DELETE FROM mpp21090_drop_lastcol_index_dml_decimal WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_index_dml_decimal ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_index_dml_decimal;
CREATE TABLE mpp21090_drop_lastcol_index_dml_decimal(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 decimal
) DISTRIBUTED by(col3);

DROP INDEX IF EXISTS mpp21090_drop_lastcol_index_dml_idx_decimal;
CREATE INDEX mpp21090_drop_lastcol_index_dml_idx_decimal on mpp21090_drop_lastcol_index_dml_decimal(col3);

INSERT INTO mpp21090_drop_lastcol_index_dml_decimal VALUES(0,0.00,'a','2014-01-01',2.00);
SELECT * FROM mpp21090_drop_lastcol_index_dml_decimal ORDER BY 1,2,3,4;

ALTER TABLE mpp21090_drop_lastcol_index_dml_decimal DROP COLUMN col5;

INSERT INTO mpp21090_drop_lastcol_index_dml_decimal SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_index_dml_decimal ORDER BY 1,2,3,4;

UPDATE mpp21090_drop_lastcol_index_dml_decimal SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_index_dml_decimal ORDER BY 1,2,3,4;

DELETE FROM mpp21090_drop_lastcol_index_dml_decimal WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_index_dml_decimal ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_index_dml_float;
CREATE TABLE mpp21090_drop_lastcol_index_dml_float(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 float
) with (appendonly= true)  DISTRIBUTED by(col3);

DROP INDEX IF EXISTS mpp21090_drop_lastcol_index_dml_idx_float;
CREATE INDEX mpp21090_drop_lastcol_index_dml_idx_float on mpp21090_drop_lastcol_index_dml_float(col3);

INSERT INTO mpp21090_drop_lastcol_index_dml_float VALUES(0,0.00,'a','2014-01-01',2.00);
SELECT * FROM mpp21090_drop_lastcol_index_dml_float ORDER BY 1,2,3,4;

ALTER TABLE mpp21090_drop_lastcol_index_dml_float DROP COLUMN col5;

INSERT INTO mpp21090_drop_lastcol_index_dml_float SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_index_dml_float ORDER BY 1,2,3,4;

UPDATE mpp21090_drop_lastcol_index_dml_float SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_index_dml_float ORDER BY 1,2,3,4;

DELETE FROM mpp21090_drop_lastcol_index_dml_float WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_index_dml_float ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_index_dml_float;
CREATE TABLE mpp21090_drop_lastcol_index_dml_float(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 float
) with (appendonly= true, orientation= column)  DISTRIBUTED by(col3);

DROP INDEX IF EXISTS mpp21090_drop_lastcol_index_dml_idx_float;
CREATE INDEX mpp21090_drop_lastcol_index_dml_idx_float on mpp21090_drop_lastcol_index_dml_float(col3);

INSERT INTO mpp21090_drop_lastcol_index_dml_float VALUES(0,0.00,'a','2014-01-01',2.00);
SELECT * FROM mpp21090_drop_lastcol_index_dml_float ORDER BY 1,2,3,4;

ALTER TABLE mpp21090_drop_lastcol_index_dml_float DROP COLUMN col5;

INSERT INTO mpp21090_drop_lastcol_index_dml_float SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_index_dml_float ORDER BY 1,2,3,4;

UPDATE mpp21090_drop_lastcol_index_dml_float SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_index_dml_float ORDER BY 1,2,3,4;

DELETE FROM mpp21090_drop_lastcol_index_dml_float WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_index_dml_float ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_index_dml_float;
CREATE TABLE mpp21090_drop_lastcol_index_dml_float(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 float
) DISTRIBUTED by(col3);

DROP INDEX IF EXISTS mpp21090_drop_lastcol_index_dml_idx_float;
CREATE INDEX mpp21090_drop_lastcol_index_dml_idx_float on mpp21090_drop_lastcol_index_dml_float(col3);

INSERT INTO mpp21090_drop_lastcol_index_dml_float VALUES(0,0.00,'a','2014-01-01',2.00);
SELECT * FROM mpp21090_drop_lastcol_index_dml_float ORDER BY 1,2,3,4;

ALTER TABLE mpp21090_drop_lastcol_index_dml_float DROP COLUMN col5;

INSERT INTO mpp21090_drop_lastcol_index_dml_float SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_index_dml_float ORDER BY 1,2,3,4;

UPDATE mpp21090_drop_lastcol_index_dml_float SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_index_dml_float ORDER BY 1,2,3,4;

DELETE FROM mpp21090_drop_lastcol_index_dml_float WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_index_dml_float ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_index_dml_int4;
CREATE TABLE mpp21090_drop_lastcol_index_dml_int4(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 int4
) with (appendonly= true)  DISTRIBUTED by(col3);

DROP INDEX IF EXISTS mpp21090_drop_lastcol_index_dml_idx_int4;
CREATE INDEX mpp21090_drop_lastcol_index_dml_idx_int4 on mpp21090_drop_lastcol_index_dml_int4(col3);

INSERT INTO mpp21090_drop_lastcol_index_dml_int4 VALUES(0,0.00,'a','2014-01-01',20000000);
SELECT * FROM mpp21090_drop_lastcol_index_dml_int4 ORDER BY 1,2,3,4;

ALTER TABLE mpp21090_drop_lastcol_index_dml_int4 DROP COLUMN col5;

INSERT INTO mpp21090_drop_lastcol_index_dml_int4 SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_index_dml_int4 ORDER BY 1,2,3,4;

UPDATE mpp21090_drop_lastcol_index_dml_int4 SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_index_dml_int4 ORDER BY 1,2,3,4;

DELETE FROM mpp21090_drop_lastcol_index_dml_int4 WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_index_dml_int4 ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_index_dml_int4;
CREATE TABLE mpp21090_drop_lastcol_index_dml_int4(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 int4
) with (appendonly= true, orientation= column)  DISTRIBUTED by(col3);

DROP INDEX IF EXISTS mpp21090_drop_lastcol_index_dml_idx_int4;
CREATE INDEX mpp21090_drop_lastcol_index_dml_idx_int4 on mpp21090_drop_lastcol_index_dml_int4(col3);

INSERT INTO mpp21090_drop_lastcol_index_dml_int4 VALUES(0,0.00,'a','2014-01-01',20000000);
SELECT * FROM mpp21090_drop_lastcol_index_dml_int4 ORDER BY 1,2,3,4;

ALTER TABLE mpp21090_drop_lastcol_index_dml_int4 DROP COLUMN col5;

INSERT INTO mpp21090_drop_lastcol_index_dml_int4 SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_index_dml_int4 ORDER BY 1,2,3,4;

UPDATE mpp21090_drop_lastcol_index_dml_int4 SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_index_dml_int4 ORDER BY 1,2,3,4;

DELETE FROM mpp21090_drop_lastcol_index_dml_int4 WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_index_dml_int4 ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_index_dml_int4;
CREATE TABLE mpp21090_drop_lastcol_index_dml_int4(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 int4
) DISTRIBUTED by(col3);

DROP INDEX IF EXISTS mpp21090_drop_lastcol_index_dml_idx_int4;
CREATE INDEX mpp21090_drop_lastcol_index_dml_idx_int4 on mpp21090_drop_lastcol_index_dml_int4(col3);

INSERT INTO mpp21090_drop_lastcol_index_dml_int4 VALUES(0,0.00,'a','2014-01-01',20000000);
SELECT * FROM mpp21090_drop_lastcol_index_dml_int4 ORDER BY 1,2,3,4;

ALTER TABLE mpp21090_drop_lastcol_index_dml_int4 DROP COLUMN col5;

INSERT INTO mpp21090_drop_lastcol_index_dml_int4 SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_index_dml_int4 ORDER BY 1,2,3,4;

UPDATE mpp21090_drop_lastcol_index_dml_int4 SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_index_dml_int4 ORDER BY 1,2,3,4;

DELETE FROM mpp21090_drop_lastcol_index_dml_int4 WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_index_dml_int4 ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_index_dml_int8;
CREATE TABLE mpp21090_drop_lastcol_index_dml_int8(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 int8
) with (appendonly= true)  DISTRIBUTED by(col3);

DROP INDEX IF EXISTS mpp21090_drop_lastcol_index_dml_idx_int8;
CREATE INDEX mpp21090_drop_lastcol_index_dml_idx_int8 on mpp21090_drop_lastcol_index_dml_int8(col3);

INSERT INTO mpp21090_drop_lastcol_index_dml_int8 VALUES(0,0.00,'a','2014-01-01',200000000000000000);
SELECT * FROM mpp21090_drop_lastcol_index_dml_int8 ORDER BY 1,2,3,4;

ALTER TABLE mpp21090_drop_lastcol_index_dml_int8 DROP COLUMN col5;

INSERT INTO mpp21090_drop_lastcol_index_dml_int8 SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_index_dml_int8 ORDER BY 1,2,3,4;

UPDATE mpp21090_drop_lastcol_index_dml_int8 SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_index_dml_int8 ORDER BY 1,2,3,4;

DELETE FROM mpp21090_drop_lastcol_index_dml_int8 WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_index_dml_int8 ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_index_dml_int8;
CREATE TABLE mpp21090_drop_lastcol_index_dml_int8(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 int8
) with (appendonly= true, orientation= column)  DISTRIBUTED by(col3);

DROP INDEX IF EXISTS mpp21090_drop_lastcol_index_dml_idx_int8;
CREATE INDEX mpp21090_drop_lastcol_index_dml_idx_int8 on mpp21090_drop_lastcol_index_dml_int8(col3);

INSERT INTO mpp21090_drop_lastcol_index_dml_int8 VALUES(0,0.00,'a','2014-01-01',200000000000000000);
SELECT * FROM mpp21090_drop_lastcol_index_dml_int8 ORDER BY 1,2,3,4;

ALTER TABLE mpp21090_drop_lastcol_index_dml_int8 DROP COLUMN col5;

INSERT INTO mpp21090_drop_lastcol_index_dml_int8 SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_index_dml_int8 ORDER BY 1,2,3,4;

UPDATE mpp21090_drop_lastcol_index_dml_int8 SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_index_dml_int8 ORDER BY 1,2,3,4;

DELETE FROM mpp21090_drop_lastcol_index_dml_int8 WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_index_dml_int8 ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_index_dml_int8;
CREATE TABLE mpp21090_drop_lastcol_index_dml_int8(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 int8
) DISTRIBUTED by(col3);

DROP INDEX IF EXISTS mpp21090_drop_lastcol_index_dml_idx_int8;
CREATE INDEX mpp21090_drop_lastcol_index_dml_idx_int8 on mpp21090_drop_lastcol_index_dml_int8(col3);

INSERT INTO mpp21090_drop_lastcol_index_dml_int8 VALUES(0,0.00,'a','2014-01-01',200000000000000000);
SELECT * FROM mpp21090_drop_lastcol_index_dml_int8 ORDER BY 1,2,3,4;

ALTER TABLE mpp21090_drop_lastcol_index_dml_int8 DROP COLUMN col5;

INSERT INTO mpp21090_drop_lastcol_index_dml_int8 SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_index_dml_int8 ORDER BY 1,2,3,4;

UPDATE mpp21090_drop_lastcol_index_dml_int8 SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_index_dml_int8 ORDER BY 1,2,3,4;

DELETE FROM mpp21090_drop_lastcol_index_dml_int8 WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_index_dml_int8 ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_index_dml_int;
CREATE TABLE mpp21090_drop_lastcol_index_dml_int(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 int
) with (appendonly= true)  DISTRIBUTED by(col3);

DROP INDEX IF EXISTS mpp21090_drop_lastcol_index_dml_idx_int;
CREATE INDEX mpp21090_drop_lastcol_index_dml_idx_int on mpp21090_drop_lastcol_index_dml_int(col3);

INSERT INTO mpp21090_drop_lastcol_index_dml_int VALUES(0,0.00,'a','2014-01-01',10000);
SELECT * FROM mpp21090_drop_lastcol_index_dml_int ORDER BY 1,2,3,4;

ALTER TABLE mpp21090_drop_lastcol_index_dml_int DROP COLUMN col5;

INSERT INTO mpp21090_drop_lastcol_index_dml_int SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_index_dml_int ORDER BY 1,2,3,4;

UPDATE mpp21090_drop_lastcol_index_dml_int SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_index_dml_int ORDER BY 1,2,3,4;

DELETE FROM mpp21090_drop_lastcol_index_dml_int WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_index_dml_int ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_index_dml_int;
CREATE TABLE mpp21090_drop_lastcol_index_dml_int(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 int
) with (appendonly= true, orientation= column)  DISTRIBUTED by(col3);

DROP INDEX IF EXISTS mpp21090_drop_lastcol_index_dml_idx_int;
CREATE INDEX mpp21090_drop_lastcol_index_dml_idx_int on mpp21090_drop_lastcol_index_dml_int(col3);

INSERT INTO mpp21090_drop_lastcol_index_dml_int VALUES(0,0.00,'a','2014-01-01',10000);
SELECT * FROM mpp21090_drop_lastcol_index_dml_int ORDER BY 1,2,3,4;

ALTER TABLE mpp21090_drop_lastcol_index_dml_int DROP COLUMN col5;

INSERT INTO mpp21090_drop_lastcol_index_dml_int SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_index_dml_int ORDER BY 1,2,3,4;

UPDATE mpp21090_drop_lastcol_index_dml_int SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_index_dml_int ORDER BY 1,2,3,4;

DELETE FROM mpp21090_drop_lastcol_index_dml_int WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_index_dml_int ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_index_dml_int;
CREATE TABLE mpp21090_drop_lastcol_index_dml_int(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 int
) DISTRIBUTED by(col3);

DROP INDEX IF EXISTS mpp21090_drop_lastcol_index_dml_idx_int;
CREATE INDEX mpp21090_drop_lastcol_index_dml_idx_int on mpp21090_drop_lastcol_index_dml_int(col3);

INSERT INTO mpp21090_drop_lastcol_index_dml_int VALUES(0,0.00,'a','2014-01-01',10000);
SELECT * FROM mpp21090_drop_lastcol_index_dml_int ORDER BY 1,2,3,4;

ALTER TABLE mpp21090_drop_lastcol_index_dml_int DROP COLUMN col5;

INSERT INTO mpp21090_drop_lastcol_index_dml_int SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_index_dml_int ORDER BY 1,2,3,4;

UPDATE mpp21090_drop_lastcol_index_dml_int SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_index_dml_int ORDER BY 1,2,3,4;

DELETE FROM mpp21090_drop_lastcol_index_dml_int WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_index_dml_int ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_index_dml_interval;
CREATE TABLE mpp21090_drop_lastcol_index_dml_interval(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 interval
) with (appendonly= true)  DISTRIBUTED by(col3);

DROP INDEX IF EXISTS mpp21090_drop_lastcol_index_dml_idx_interval;
CREATE INDEX mpp21090_drop_lastcol_index_dml_idx_interval on mpp21090_drop_lastcol_index_dml_interval(col3);

INSERT INTO mpp21090_drop_lastcol_index_dml_interval VALUES(0,0.00,'a','2014-01-01','10 secs');
SELECT * FROM mpp21090_drop_lastcol_index_dml_interval ORDER BY 1,2,3,4;

ALTER TABLE mpp21090_drop_lastcol_index_dml_interval DROP COLUMN col5;

INSERT INTO mpp21090_drop_lastcol_index_dml_interval SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_index_dml_interval ORDER BY 1,2,3,4;

UPDATE mpp21090_drop_lastcol_index_dml_interval SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_index_dml_interval ORDER BY 1,2,3,4;

DELETE FROM mpp21090_drop_lastcol_index_dml_interval WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_index_dml_interval ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_index_dml_interval;
CREATE TABLE mpp21090_drop_lastcol_index_dml_interval(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 interval
) with (appendonly= true, orientation= column)  DISTRIBUTED by(col3);

DROP INDEX IF EXISTS mpp21090_drop_lastcol_index_dml_idx_interval;
CREATE INDEX mpp21090_drop_lastcol_index_dml_idx_interval on mpp21090_drop_lastcol_index_dml_interval(col3);

INSERT INTO mpp21090_drop_lastcol_index_dml_interval VALUES(0,0.00,'a','2014-01-01','10 secs');
SELECT * FROM mpp21090_drop_lastcol_index_dml_interval ORDER BY 1,2,3,4;

ALTER TABLE mpp21090_drop_lastcol_index_dml_interval DROP COLUMN col5;

INSERT INTO mpp21090_drop_lastcol_index_dml_interval SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_index_dml_interval ORDER BY 1,2,3,4;

UPDATE mpp21090_drop_lastcol_index_dml_interval SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_index_dml_interval ORDER BY 1,2,3,4;

DELETE FROM mpp21090_drop_lastcol_index_dml_interval WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_index_dml_interval ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_index_dml_interval;
CREATE TABLE mpp21090_drop_lastcol_index_dml_interval(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 interval
) DISTRIBUTED by(col3);

DROP INDEX IF EXISTS mpp21090_drop_lastcol_index_dml_idx_interval;
CREATE INDEX mpp21090_drop_lastcol_index_dml_idx_interval on mpp21090_drop_lastcol_index_dml_interval(col3);

INSERT INTO mpp21090_drop_lastcol_index_dml_interval VALUES(0,0.00,'a','2014-01-01','10 secs');
SELECT * FROM mpp21090_drop_lastcol_index_dml_interval ORDER BY 1,2,3,4;

ALTER TABLE mpp21090_drop_lastcol_index_dml_interval DROP COLUMN col5;

INSERT INTO mpp21090_drop_lastcol_index_dml_interval SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_index_dml_interval ORDER BY 1,2,3,4;

UPDATE mpp21090_drop_lastcol_index_dml_interval SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_index_dml_interval ORDER BY 1,2,3,4;

DELETE FROM mpp21090_drop_lastcol_index_dml_interval WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_index_dml_interval ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_index_dml_numeric;
CREATE TABLE mpp21090_drop_lastcol_index_dml_numeric(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 numeric
) with (appendonly= true)  DISTRIBUTED by(col3);

DROP INDEX IF EXISTS mpp21090_drop_lastcol_index_dml_idx_numeric;
CREATE INDEX mpp21090_drop_lastcol_index_dml_idx_numeric on mpp21090_drop_lastcol_index_dml_numeric(col3);

INSERT INTO mpp21090_drop_lastcol_index_dml_numeric VALUES(0,0.00,'a','2014-01-01',2.000000);
SELECT * FROM mpp21090_drop_lastcol_index_dml_numeric ORDER BY 1,2,3,4;

ALTER TABLE mpp21090_drop_lastcol_index_dml_numeric DROP COLUMN col5;

INSERT INTO mpp21090_drop_lastcol_index_dml_numeric SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_index_dml_numeric ORDER BY 1,2,3,4;

UPDATE mpp21090_drop_lastcol_index_dml_numeric SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_index_dml_numeric ORDER BY 1,2,3,4;

DELETE FROM mpp21090_drop_lastcol_index_dml_numeric WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_index_dml_numeric ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_index_dml_numeric;
CREATE TABLE mpp21090_drop_lastcol_index_dml_numeric(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 numeric
) with (appendonly= true, orientation= column)  DISTRIBUTED by(col3);

DROP INDEX IF EXISTS mpp21090_drop_lastcol_index_dml_idx_numeric;
CREATE INDEX mpp21090_drop_lastcol_index_dml_idx_numeric on mpp21090_drop_lastcol_index_dml_numeric(col3);

INSERT INTO mpp21090_drop_lastcol_index_dml_numeric VALUES(0,0.00,'a','2014-01-01',2.000000);
SELECT * FROM mpp21090_drop_lastcol_index_dml_numeric ORDER BY 1,2,3,4;

ALTER TABLE mpp21090_drop_lastcol_index_dml_numeric DROP COLUMN col5;

INSERT INTO mpp21090_drop_lastcol_index_dml_numeric SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_index_dml_numeric ORDER BY 1,2,3,4;

UPDATE mpp21090_drop_lastcol_index_dml_numeric SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_index_dml_numeric ORDER BY 1,2,3,4;

DELETE FROM mpp21090_drop_lastcol_index_dml_numeric WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_index_dml_numeric ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_index_dml_numeric;
CREATE TABLE mpp21090_drop_lastcol_index_dml_numeric(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 numeric
) DISTRIBUTED by(col3);

DROP INDEX IF EXISTS mpp21090_drop_lastcol_index_dml_idx_numeric;
CREATE INDEX mpp21090_drop_lastcol_index_dml_idx_numeric on mpp21090_drop_lastcol_index_dml_numeric(col3);

INSERT INTO mpp21090_drop_lastcol_index_dml_numeric VALUES(0,0.00,'a','2014-01-01',2.000000);
SELECT * FROM mpp21090_drop_lastcol_index_dml_numeric ORDER BY 1,2,3,4;

ALTER TABLE mpp21090_drop_lastcol_index_dml_numeric DROP COLUMN col5;

INSERT INTO mpp21090_drop_lastcol_index_dml_numeric SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_index_dml_numeric ORDER BY 1,2,3,4;

UPDATE mpp21090_drop_lastcol_index_dml_numeric SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_index_dml_numeric ORDER BY 1,2,3,4;

DELETE FROM mpp21090_drop_lastcol_index_dml_numeric WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_index_dml_numeric ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_index_dml_time;
CREATE TABLE mpp21090_drop_lastcol_index_dml_time(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 time
) with (appendonly= true)  DISTRIBUTED by(col3);

DROP INDEX IF EXISTS mpp21090_drop_lastcol_index_dml_idx_time;
CREATE INDEX mpp21090_drop_lastcol_index_dml_idx_time on mpp21090_drop_lastcol_index_dml_time(col3);

INSERT INTO mpp21090_drop_lastcol_index_dml_time VALUES(0,0.00,'a','2014-01-01','12:00:00');
SELECT * FROM mpp21090_drop_lastcol_index_dml_time ORDER BY 1,2,3,4;

ALTER TABLE mpp21090_drop_lastcol_index_dml_time DROP COLUMN col5;

INSERT INTO mpp21090_drop_lastcol_index_dml_time SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_index_dml_time ORDER BY 1,2,3,4;

UPDATE mpp21090_drop_lastcol_index_dml_time SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_index_dml_time ORDER BY 1,2,3,4;

DELETE FROM mpp21090_drop_lastcol_index_dml_time WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_index_dml_time ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_index_dml_time;
CREATE TABLE mpp21090_drop_lastcol_index_dml_time(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 time
) with (appendonly= true, orientation= column)  DISTRIBUTED by(col3);

DROP INDEX IF EXISTS mpp21090_drop_lastcol_index_dml_idx_time;
CREATE INDEX mpp21090_drop_lastcol_index_dml_idx_time on mpp21090_drop_lastcol_index_dml_time(col3);

INSERT INTO mpp21090_drop_lastcol_index_dml_time VALUES(0,0.00,'a','2014-01-01','12:00:00');
SELECT * FROM mpp21090_drop_lastcol_index_dml_time ORDER BY 1,2,3,4;

ALTER TABLE mpp21090_drop_lastcol_index_dml_time DROP COLUMN col5;

INSERT INTO mpp21090_drop_lastcol_index_dml_time SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_index_dml_time ORDER BY 1,2,3,4;

UPDATE mpp21090_drop_lastcol_index_dml_time SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_index_dml_time ORDER BY 1,2,3,4;

DELETE FROM mpp21090_drop_lastcol_index_dml_time WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_index_dml_time ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_index_dml_time;
CREATE TABLE mpp21090_drop_lastcol_index_dml_time(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 time
) DISTRIBUTED by(col3);

DROP INDEX IF EXISTS mpp21090_drop_lastcol_index_dml_idx_time;
CREATE INDEX mpp21090_drop_lastcol_index_dml_idx_time on mpp21090_drop_lastcol_index_dml_time(col3);

INSERT INTO mpp21090_drop_lastcol_index_dml_time VALUES(0,0.00,'a','2014-01-01','12:00:00');
SELECT * FROM mpp21090_drop_lastcol_index_dml_time ORDER BY 1,2,3,4;

ALTER TABLE mpp21090_drop_lastcol_index_dml_time DROP COLUMN col5;

INSERT INTO mpp21090_drop_lastcol_index_dml_time SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_index_dml_time ORDER BY 1,2,3,4;

UPDATE mpp21090_drop_lastcol_index_dml_time SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_index_dml_time ORDER BY 1,2,3,4;

DELETE FROM mpp21090_drop_lastcol_index_dml_time WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_index_dml_time ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_index_dml_timestamp;
CREATE TABLE mpp21090_drop_lastcol_index_dml_timestamp(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 timestamp
) with (appendonly= true)  DISTRIBUTED by(col3);

DROP INDEX IF EXISTS mpp21090_drop_lastcol_index_dml_idx_timestamp;
CREATE INDEX mpp21090_drop_lastcol_index_dml_idx_timestamp on mpp21090_drop_lastcol_index_dml_timestamp(col3);

INSERT INTO mpp21090_drop_lastcol_index_dml_timestamp VALUES(0,0.00,'a','2014-01-01','2013-12-30 12:00:00');
SELECT * FROM mpp21090_drop_lastcol_index_dml_timestamp ORDER BY 1,2,3,4;

ALTER TABLE mpp21090_drop_lastcol_index_dml_timestamp DROP COLUMN col5;

INSERT INTO mpp21090_drop_lastcol_index_dml_timestamp SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_index_dml_timestamp ORDER BY 1,2,3,4;

UPDATE mpp21090_drop_lastcol_index_dml_timestamp SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_index_dml_timestamp ORDER BY 1,2,3,4;

DELETE FROM mpp21090_drop_lastcol_index_dml_timestamp WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_index_dml_timestamp ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_index_dml_timestamp;
CREATE TABLE mpp21090_drop_lastcol_index_dml_timestamp(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 timestamp
) with (appendonly= true, orientation= column)  DISTRIBUTED by(col3);

DROP INDEX IF EXISTS mpp21090_drop_lastcol_index_dml_idx_timestamp;
CREATE INDEX mpp21090_drop_lastcol_index_dml_idx_timestamp on mpp21090_drop_lastcol_index_dml_timestamp(col3);

INSERT INTO mpp21090_drop_lastcol_index_dml_timestamp VALUES(0,0.00,'a','2014-01-01','2013-12-30 12:00:00');
SELECT * FROM mpp21090_drop_lastcol_index_dml_timestamp ORDER BY 1,2,3,4;

ALTER TABLE mpp21090_drop_lastcol_index_dml_timestamp DROP COLUMN col5;

INSERT INTO mpp21090_drop_lastcol_index_dml_timestamp SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_index_dml_timestamp ORDER BY 1,2,3,4;

UPDATE mpp21090_drop_lastcol_index_dml_timestamp SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_index_dml_timestamp ORDER BY 1,2,3,4;

DELETE FROM mpp21090_drop_lastcol_index_dml_timestamp WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_index_dml_timestamp ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_index_dml_timestamp;
CREATE TABLE mpp21090_drop_lastcol_index_dml_timestamp(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 timestamp
) DISTRIBUTED by(col3);

DROP INDEX IF EXISTS mpp21090_drop_lastcol_index_dml_idx_timestamp;
CREATE INDEX mpp21090_drop_lastcol_index_dml_idx_timestamp on mpp21090_drop_lastcol_index_dml_timestamp(col3);

INSERT INTO mpp21090_drop_lastcol_index_dml_timestamp VALUES(0,0.00,'a','2014-01-01','2013-12-30 12:00:00');
SELECT * FROM mpp21090_drop_lastcol_index_dml_timestamp ORDER BY 1,2,3,4;

ALTER TABLE mpp21090_drop_lastcol_index_dml_timestamp DROP COLUMN col5;

INSERT INTO mpp21090_drop_lastcol_index_dml_timestamp SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_index_dml_timestamp ORDER BY 1,2,3,4;

UPDATE mpp21090_drop_lastcol_index_dml_timestamp SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_index_dml_timestamp ORDER BY 1,2,3,4;

DELETE FROM mpp21090_drop_lastcol_index_dml_timestamp WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_index_dml_timestamp ORDER BY 1,2,3,4;

-- @author prabhd 
-- @created 2014-04-01 12:00:00
-- @modified 2012-04-01 12:00:00
-- @tags dml MPP-21090 ORCA
-- @optimizer_mode on	
-- @description Tests for MPP-21090
\echo --start_ignore

\echo --end_ignore
DROP TABLE IF EXISTS mpp21090_drop_lastcol_index_dml_timestamptz;
CREATE TABLE mpp21090_drop_lastcol_index_dml_timestamptz(
col1 int,
col2 decimal,
col3 char,
col4 date,
col5 timestamptz
) with (appendonly= true)  DISTRIBUTED by(col3);

DROP INDEX IF EXISTS mpp21090_drop_lastcol_index_dml_idx_timestamptz;
CREATE INDEX mpp21090_drop_lastcol_index_dml_idx_timestamptz on mpp21090_drop_lastcol_index_dml_timestamptz(col3);

INSERT INTO mpp21090_drop_lastcol_index_dml_timestamptz VALUES(0,0.00,'a','2014-01-01','2013-12-30 12:00:00 PST');
SELECT * FROM mpp21090_drop_lastcol_index_dml_timestamptz ORDER BY 1,2,3,4;

ALTER TABLE mpp21090_drop_lastcol_index_dml_timestamptz DROP COLUMN col5;

INSERT INTO mpp21090_drop_lastcol_index_dml_timestamptz SELECT 1,1.00,'b','2014-01-02';
SELECT * FROM mpp21090_drop_lastcol_index_dml_timestamptz ORDER BY 1,2,3,4;

UPDATE mpp21090_drop_lastcol_index_dml_timestamptz SET col3='c' WHERE col3 = 'b' AND col1 = 1;
SELECT * FROM mpp21090_drop_lastcol_index_dml_timestamptz ORDER BY 1,2,3,4;

DELETE FROM mpp21090_drop_lastcol_index_dml_timestamptz WHERE col3='c';
SELECT * FROM mpp21090_drop_lastcol_index_dml_timestamptz ORDER BY 1,2,3,4;


-- start_ignore
drop schema sql_partition_151_200 cascade;
-- end_ignore
