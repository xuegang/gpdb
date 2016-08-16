-- start_ignore
SET gp_create_table_random_default_distribution=off;
-- end_ignore
--
-- RESYNC
--
CREATE ROLE resync_user1;
CREATE ROLE resync_user2;
CREATE ROLE resync_admin;

CREATE TABLE resync_foo1 (i int, j int) DISTRIBUTED  RANDOMLY;
ALTER TABLE resync_foo1 OWNER TO resync_user1;
CREATE TABLE resync_foo2 (i int, j int) DISTRIBUTED  RANDOMLY;
ALTER TABLE resync_foo2 OWNER TO resync_user2;



--
-- DROP OWNED 
--
DROP OWNED by  sync1_user6;
DROP OWNED by  ck_sync1_user5;
DROP OWNED by  ct_user3;
DROP OWNED by resync_user1;


CREATE TABLE resync_foo11 (i int, j int) DISTRIBUTED  RANDOMLY;
ALTER TABLE resync_foo11 OWNER TO resync_user1;
CREATE TABLE resync_foo22(i int, j int) DISTRIBUTED  RANDOMLY;
ALTER TABLE resync_foo22 OWNER TO resync_user2;




--
-- REASSIGN OWNED
--
REASSIGN OWNED BY sync1_user6 to resync_admin;
REASSIGN OWNED BY ck_sync1_user5 to resync_admin;
REASSIGN OWNED BY ct_user3 to resync_admin;
REASSIGN OWNED BY  resync_user1 to resync_admin;

