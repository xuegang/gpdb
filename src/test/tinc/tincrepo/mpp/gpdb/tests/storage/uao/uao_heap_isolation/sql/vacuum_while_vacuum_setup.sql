-- start_ignore
SET gp_create_table_random_default_distribution=off;
-- end_ignore
DROP TABLE IF EXISTS ao;

CREATE TABLE ao (a INT, b INT) ;
INSERT INTO ao SELECT i as a, i as b FROM generate_series(1, 10000) AS i;
INSERT INTO ao SELECT i as a, i as b FROM generate_series(1, 10000) AS i;
INSERT INTO ao SELECT i as a, i as b FROM generate_series(1, 10000) AS i;
INSERT INTO ao SELECT i as a, i as b FROM generate_series(1, 10000) AS i;
INSERT INTO ao SELECT i as a, i as b FROM generate_series(1, 10000) AS i;
INSERT INTO ao SELECT i as a, i as b FROM generate_series(1, 10000) AS i;
