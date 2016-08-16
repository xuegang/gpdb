
-- start_ignore
create schema functionProperty_1001_1100;
set search_path to functionProperty_1001_1100;

CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;

CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;

-- func1 IMMUTABLE
CREATE FUNCTION func1_nosql_imm(x int) RETURNS int AS $$
BEGIN
RETURN $1 +1;
END
$$ LANGUAGE plpgsql NO SQL IMMUTABLE;

CREATE FUNCTION func1_sql_int_imm(x int) RETURNS int AS $$
DECLARE
    r int;
BEGIN
    SELECT $1 + 1 INTO r;
    return r;
END
$$ LANGUAGE plpgsql CONTAINS SQL IMMUTABLE;

CREATE FUNCTION func1_sql_setint_imm(x int) RETURNS setof int AS $$
DECLARE
    r int;
BEGIN
    FOR r in SELECT generate_series($1, $1+5)
    LOOP
        RETURN NEXT r;
    END LOOP;
    RETURN;
END
$$ LANGUAGE plpgsql CONTAINS SQL IMMUTABLE;

--CREATE FUNCTION func1_read_int_sql_imm(x int) RETURNS int AS $$
--DECLARE
--    r int;
--BEGIN
--    SELECT d FROM bar WHERE c = $1 LIMIT 1 INTO r;
--    return r;
--END
--$$ LANGUAGE plpgsql IMMUTABLE READS SQL DATA;
--
--CREATE FUNCTION func1_read_setint_sql_imm(x int) RETURNS setof int AS $$
--DECLARE
--    r int;
--BEGIN
--    FOR r in SELECT d FROM bar WHERE c <> $1
--    LOOP
--        RETURN NEXT r;
--    END LOOP;
--    RETURN;
--END
--$$ LANGUAGE plpgsql IMMUTABLE READS SQL DATA;
--
--CREATE FUNCTION func1_mod_int_imm(x int) RETURNS int AS $$
--BEGIN
--UPDATE bar SET d = d+1 WHERE c = $1;
--RETURN $1 + 1;
--END
--$$ LANGUAGE plpgsql IMMUTABLE MODIFIES SQL DATA;
--
--CREATE FUNCTION func1_mod_setint_imm(x int) RETURNS setof int AS $$
--DECLARE
--    r int;
--BEGIN
--    UPDATE bar SET d = d+1 WHERE c > $1;
--    FOR r in SELECT d FROM bar WHERE c > $1 
--    LOOP
--        RETURN NEXT r;
--    END LOOP;
--    RETURN;
--END
--$$ LANGUAGE plpgsql MODIFIES SQL DATA IMMUTABLE;
--
----func2 IMMUTABLE

CREATE FUNCTION func2_nosql_imm(x int) RETURNS int AS $$
BEGIN 
RETURN $1 + 1; 
END
$$ LANGUAGE plpgsql NO SQL IMMUTABLE;

CREATE FUNCTION func2_sql_int_imm(x int) RETURNS int AS $$
DECLARE
    r int;
BEGIN
    SELECT $1 + 1 INTO r;
    RETURN r;
END
$$ LANGUAGE plpgsql CONTAINS SQL IMMUTABLE;
--
--CREATE FUNCTION func2_read_int_imm(x int) RETURNS int AS $$
--DECLARE
--    r int;
--BEGIN
--    SELECT d FROM bar WHERE c = $1 LIMIT 1 INTO r;
--    RETURN r;
--END
--$$ LANGUAGE plpgsql IMMUTABLE READS SQL DATA;
--
--CREATE FUNCTION func2_mod_int_imm(x int) RETURNS int AS $$
--BEGIN
--UPDATE bar SET d = d+1 WHERE c = $1;
--RETURN $1 + 1;
--END
--$$ LANGUAGE plpgsql IMMUTABLE MODIFIES SQL DATA;



-- func1 STABLE
CREATE FUNCTION func1_nosql_stb(x int) RETURNS int AS $$
BEGIN
RETURN $1 +1;
END
$$ LANGUAGE plpgsql STABLE NO SQL;

CREATE FUNCTION func1_sql_int_stb(x int) RETURNS int AS $$
DECLARE
    r int;
BEGIN
    SELECT $1 + 1 INTO r;
    RETURN r;
END
$$ LANGUAGE plpgsql STABLE CONTAINS SQL;

CREATE FUNCTION func1_sql_setint_stb(x int) RETURNS setof int AS $$
DECLARE
    r int;
BEGIN
    FOR r in SELECT generate_series($1, $1+5)
    LOOP
        RETURN NEXT r;
    END LOOP;
    RETURN;
END
$$ LANGUAGE plpgsql STABLE CONTAINS SQL;

CREATE FUNCTION func1_read_int_sql_stb(x int) RETURNS int AS $$
DECLARE
    r int;
BEGIN
    SELECT d FROM bar WHERE c = $1 LIMIT 1 INTO r;
    RETURN r;
END
$$ LANGUAGE plpgsql STABLE READS SQL DATA;

CREATE FUNCTION func1_read_setint_sql_stb(x int) RETURNS setof int AS $$
DECLARE
    r int;
BEGIN
    FOR r in SELECT d FROM bar WHERE c <> $1
    LOOP
        RETURN NEXT r;
    END LOOP;
    RETURN;
END
$$ LANGUAGE plpgsql STABLE READS SQL DATA;

CREATE FUNCTION func1_mod_int_stb(x int) RETURNS int AS $$
BEGIN
UPDATE bar SET d = d+1 WHERE c = $1;
RETURN $1 + 1;
END
$$ LANGUAGE plpgsql STABLE MODIFIES SQL DATA;

CREATE FUNCTION func1_mod_setint_stb(x int) RETURNS setof int AS $$
DECLARE
    r int;
BEGIN
UPDATE bar SET d = d+1 WHERE c > $1;
    FOR r in SELECT d FROM bar WHERE c > $1
    LOOP
        RETURN NEXT r;
    END LOOP;
    RETURN;
END
$$ LANGUAGE plpgsql STABLE MODIFIES SQL DATA;

--func2 STABLE

CREATE FUNCTION func2_nosql_stb(x int) RETURNS int AS $$
BEGIN
RETURN $1 + 1;
END
$$ LANGUAGE plpgsql STABLE NO SQL;

CREATE FUNCTION func2_sql_int_stb(x int) RETURNS int AS $$
DECLARE
    r int;
BEGIN
    SELECT $1 + 1 INTO r;
    RETURN r;
END
$$ LANGUAGE plpgsql STABLE CONTAINS SQL;

CREATE FUNCTION func2_read_int_stb(x int) RETURNS int AS $$
DECLARE
    r int;
BEGIN
    SELECT d FROM bar WHERE c = $1 LIMIT 1 INTO r;
    RETURN r;
END
$$ LANGUAGE plpgsql STABLE READS SQL DATA;

CREATE FUNCTION func2_mod_int_stb(x int) RETURNS int AS $$
BEGIN
UPDATE bar SET d = d+1 WHERE c = $1;
RETURN $1 + 1;
END
$$ LANGUAGE plpgsql STABLE MODIFIES SQL DATA;






-- func1  VOLATILE
CREATE FUNCTION func1_nosql_vol(x int) RETURNS int AS $$
BEGIN
RETURN $1 +1;
END
$$ LANGUAGE plpgsql VOLATILE NO SQL;

CREATE FUNCTION func1_sql_int_vol(x int) RETURNS int AS $$
DECLARE
    r int;
BEGIN
    SELECT $1 + 1 INTO r;
    RETURN r;
END
$$ LANGUAGE plpgsql VOLATILE CONTAINS SQL;

CREATE FUNCTION func1_sql_setint_vol(x int) RETURNS setof int AS $$
DECLARE
    r int;
BEGIN
    FOR r in SELECT generate_series($1, $1+5)
    LOOP
        RETURN NEXT r;
    END LOOP;
    RETURN;
END
$$ LANGUAGE plpgsql VOLATILE CONTAINS SQL;

CREATE FUNCTION func1_read_int_sql_vol(x int) RETURNS int AS $$
DECLARE
    r int;
BEGIN
    SELECT d FROM bar WHERE c = $1 LIMIT 1 INTO r;
    RETURN r;
END
$$ LANGUAGE plpgsql VOLATILE READS SQL DATA;

CREATE FUNCTION func1_read_setint_sql_vol(x int) RETURNS setof int AS $$
DECLARE
    r int;
BEGIN
    FOR r in SELECT d FROM bar WHERE c <> $1
    LOOP
        RETURN NEXT r;
    END LOOP;
    RETURN;
END
$$ LANGUAGE plpgsql VOLATILE READS SQL DATA;

CREATE FUNCTION func1_mod_int_vol(x int) RETURNS int AS $$
BEGIN
UPDATE bar SET d = d+1 WHERE c = $1;
RETURN $1 + 1;
END
$$ LANGUAGE plpgsql VOLATILE MODIFIES SQL DATA;

CREATE FUNCTION func1_mod_setint_vol(x int) RETURNS setof int AS $$
DECLARE
    r int;
BEGIN
    UPDATE bar SET d = d+1 WHERE c > $1;
    FOR r in SELECT d FROM bar WHERE c > $1
    LOOP
        RETURN NEXT r;
    END LOOP;
    RETURN;
END
$$ LANGUAGE plpgsql VOLATILE MODIFIES SQL DATA;

--func2   VOLATILE

CREATE FUNCTION func2_nosql_vol(x int) RETURNS int AS $$
BEGIN
RETURN $1 + 1;
END
$$ LANGUAGE plpgsql VOLATILE NO SQL;

CREATE FUNCTION func2_sql_int_vol(x int) RETURNS int AS $$
DECLARE
    r int;
BEGIN
    SELECT $1 + 1 INTO r;
    RETURN r;
END
$$ LANGUAGE plpgsql VOLATILE CONTAINS SQL;

CREATE FUNCTION func2_read_int_vol(x int) RETURNS int AS $$
DECLARE
    r int;
BEGIN
    SELECT d FROM bar WHERE c = $1 LIMIT 1 INTO r;
    RETURN r;
END
$$ LANGUAGE plpgsql VOLATILE READS SQL DATA;

CREATE FUNCTION func2_mod_int_vol(x int) RETURNS int AS $$
BEGIN
UPDATE bar SET d = d+1 WHERE c = $1;
RETURN $1 + 1;
END
$$ LANGUAGE plpgsql VOLATILE MODIFIES SQL DATA;
-- end_ignore
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_32.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_int_vol(func2_nosql_imm(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_33.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_int_vol(func2_sql_int_vol(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_34.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_int_vol(func2_sql_int_stb(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_35.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_int_vol(func2_sql_int_imm(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_36.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_int_vol(func2_read_int_vol(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_37.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_int_vol(func2_read_int_stb(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_38.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_int_vol(func2_mod_int_vol(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_39.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_int_vol(func2_mod_int_stb(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_4.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_nosql_vol(func2_sql_int_stb(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_40.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_int_stb(func2_nosql_vol(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_41.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_int_stb(func2_nosql_stb(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_42.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_int_stb(func2_nosql_imm(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_43.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_int_stb(func2_sql_int_vol(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_44.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_int_stb(func2_sql_int_stb(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_45.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_int_stb(func2_sql_int_imm(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_46.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_int_stb(func2_read_int_vol(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_47.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_int_stb(func2_read_int_stb(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_48.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_int_stb(func2_mod_int_vol(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_49.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_int_stb(func2_mod_int_stb(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_5.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_nosql_vol(func2_sql_int_imm(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_50.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_int_imm(func2_nosql_vol(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_51.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_int_imm(func2_nosql_stb(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_52.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_int_imm(func2_nosql_imm(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_53.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_int_imm(func2_sql_int_vol(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_54.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_int_imm(func2_sql_int_stb(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_55.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_int_imm(func2_sql_int_imm(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_56.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_int_imm(func2_read_int_vol(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_57.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_int_imm(func2_read_int_stb(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_58.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_int_imm(func2_mod_int_vol(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_59.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_int_imm(func2_mod_int_stb(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_6.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_nosql_vol(func2_read_int_vol(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_60.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_setint_vol(func2_nosql_vol(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_61.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_setint_vol(func2_nosql_stb(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_62.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_setint_vol(func2_nosql_imm(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_63.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_setint_vol(func2_sql_int_vol(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_64.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_setint_vol(func2_sql_int_stb(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_65.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_setint_vol(func2_sql_int_imm(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_66.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_setint_vol(func2_read_int_vol(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_67.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_setint_vol(func2_read_int_stb(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_68.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_setint_vol(func2_mod_int_vol(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_69.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_setint_vol(func2_mod_int_stb(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_7.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_nosql_vol(func2_read_int_stb(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_70.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_setint_stb(func2_nosql_vol(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_71.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_setint_stb(func2_nosql_stb(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_72.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_setint_stb(func2_nosql_imm(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_73.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_setint_stb(func2_sql_int_vol(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_74.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_setint_stb(func2_sql_int_stb(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_75.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_setint_stb(func2_sql_int_imm(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_76.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_setint_stb(func2_read_int_vol(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_77.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_setint_stb(func2_read_int_stb(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_78.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_setint_stb(func2_mod_int_vol(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_79.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_setint_stb(func2_mod_int_stb(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_8.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_nosql_vol(func2_mod_int_vol(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_80.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_setint_imm(func2_nosql_vol(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_81.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_setint_imm(func2_nosql_stb(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_82.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_setint_imm(func2_nosql_imm(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_83.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_setint_imm(func2_sql_int_vol(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_84.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_setint_imm(func2_sql_int_stb(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_85.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_setint_imm(func2_sql_int_imm(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_86.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_setint_imm(func2_read_int_vol(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_87.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_setint_imm(func2_read_int_stb(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_88.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_setint_imm(func2_mod_int_vol(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_89.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_sql_setint_imm(func2_mod_int_stb(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_9.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_nosql_vol(func2_mod_int_stb(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_90.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_read_int_sql_vol(func2_nosql_vol(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_91.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_read_int_sql_vol(func2_nosql_stb(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_92.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_read_int_sql_vol(func2_nosql_imm(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_93.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_read_int_sql_vol(func2_sql_int_vol(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_94.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_read_int_sql_vol(func2_sql_int_stb(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_95.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_read_int_sql_vol(func2_sql_int_imm(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_96.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_read_int_sql_vol(func2_read_int_vol(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_97.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_read_int_sql_vol(func2_read_int_stb(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_98.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_read_int_sql_vol(func2_mod_int_vol(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_select_notable_withfunc2_99.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT func1_read_int_sql_vol(func2_mod_int_stb(5)) order by 1; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_subqry_0.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT * FROM foo, (SELECT func1_nosql_vol(5)) r order by 1,2,3; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_subqry_1.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT * FROM foo, (SELECT func1_nosql_stb(5)) r order by 1,2,3; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_subqry_10.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT * FROM foo, (SELECT func1_read_int_sql_stb(5)) r order by 1,2,3; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_subqry_12.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT * FROM foo, (SELECT func1_read_setint_sql_stb(5)) r order by 1,2,3; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_subqry_13.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT * FROM foo, (SELECT func1_mod_int_vol(5)) r order by 1,2,3; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_subqry_14.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT * FROM foo, (SELECT func1_mod_int_stb(5)) r order by 1,2,3; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_subqry_16.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT * FROM foo, (SELECT func1_mod_setint_stb(5)) r order by 1,2,3; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_subqry_2.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT * FROM foo, (SELECT func1_nosql_imm(5)) r order by 1,2,3; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_subqry_3.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT * FROM foo, (SELECT func1_sql_int_vol(5)) r order by 1,2,3; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_subqry_4.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT * FROM foo, (SELECT func1_sql_int_stb(5)) r order by 1,2,3; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_subqry_5.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT * FROM foo, (SELECT func1_sql_int_imm(5)) r order by 1,2,3; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_subqry_6.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT * FROM foo, (SELECT func1_sql_setint_vol(5)) r order by 1,2,3; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_subqry_7.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT * FROM foo, (SELECT func1_sql_setint_stb(5)) r order by 1,2,3; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_subqry_8.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT * FROM foo, (SELECT func1_sql_setint_imm(5)) r order by 1,2,3; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_subqry_9.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT * FROM foo, (SELECT func1_read_int_sql_vol(5)) r order by 1,2,3; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_subqry_column_0.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT * FROM foo, (SELECT func1_nosql_vol(a) from foo) r order by 1,2,3; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_subqry_column_1.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT * FROM foo, (SELECT func1_nosql_stb(a) from foo) r order by 1,2,3; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_subqry_column_10.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT * FROM foo, (SELECT func1_read_int_sql_stb(a) from foo) r order by 1,2,3; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @executemode ORCA_PLANNER_DIFF
-- @description function_in_subqry_column_11.sql
-- @db_name functionproperty

-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT * FROM foo, (SELECT func1_read_setint_sql_vol(a) from foo) r order by 1,2,3; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @executemode ORCA_PLANNER_DIFF
-- @description function_in_subqry_column_12.sql
-- @db_name functionproperty

-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT * FROM foo, (SELECT func1_read_setint_sql_stb(a) from foo) r order by 1,2,3; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_subqry_column_13.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT * FROM foo, (SELECT func1_mod_int_vol(a) from foo) r order by 1,2,3; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_subqry_column_14.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT * FROM foo, (SELECT func1_mod_int_stb(a) from foo) r order by 1,2,3; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @executemode ORCA_PLANNER_DIFF
-- @description function_in_subqry_column_15.sql
-- @db_name functionproperty

-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT * FROM foo, (SELECT func1_mod_setint_vol(a) from foo) r order by 1,2,3; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @executemode ORCA_PLANNER_DIFF
-- @description function_in_subqry_column_16.sql
-- @db_name functionproperty

-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT * FROM foo, (SELECT func1_mod_setint_stb(a) from foo) r order by 1,2,3; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_subqry_column_2.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT * FROM foo, (SELECT func1_nosql_imm(a) from foo) r order by 1,2,3; 
-- start_ignore
DROP TABLE foo;
DROP TABLE bar;
CREATE TABLE foo (a int, b int);
INSERT INTO foo select i, i+1 from generate_series(1,10) i;
CREATE TABLE bar (c int, d int);
INSERT INTO bar select i, i+1 from generate_series(1,10) i;
-- end_ignore
-- @description function_in_subqry_column_3.sql
-- @db_name functionproperty
-- @author tungs1
-- @modified 2013-04-03 12:00:00
-- @created 2013-04-03 12:00:00
-- @tags functionProperties 
SELECT * FROM foo, (SELECT func1_sql_int_vol(a) from foo) r order by 1,2,3; 

-- start_ignore
drop schema functionProperty_1001_1100 cascade;
-- end_ignore
