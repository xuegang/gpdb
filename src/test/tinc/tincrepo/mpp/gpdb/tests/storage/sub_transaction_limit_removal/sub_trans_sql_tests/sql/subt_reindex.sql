Drop table if exists subt_tab_reindex_heap;
Create table subt_tab_reindex_heap(i int, x text,c char,v varchar, d date, n numeric, t timestamp without time zone, tz time with time zone, b box) distributed by (i);
Insert into subt_tab_reindex_heap values(generate_series(1,4),'create table with subtransactions','s','subtransaction table','12-11-2012',3,'2012-10-09 10:23:54', '2011-08-19 10:23:54+02', '( (0,0), (1,1) )');
Create index subt_btree_rix_heap on subt_tab_reindex_heap (x);
Create index subt_bitmap_rix_heap on subt_tab_reindex_heap using bitmap (n);
Create index subt_gist_rix_heap on subt_tab_reindex_heap using gist (b);
Create Unique index subt_unique_rix_heap on subt_tab_reindex_heap (i);
Drop table if exists subt_tab_reindex_ao;
Create table subt_tab_reindex_ao(i int, x text,c char,v varchar, d date, n numeric, t timestamp without time zone, tz time with time zone, b box) with(appendonly=true) distributed by (i);
Insert into subt_tab_reindex_ao values(generate_series(1,4),'create table with subtransactions','s','subtransaction table','12-11-2012',3,'2012-10-09 10:23:54', '2011-08-19 10:23:54+02', '( (0,0), (1,1) )');
Create index subt_btree_rix_ao on subt_tab_reindex_ao (x);
Create index subt_bitmap_rix_ao on subt_tab_reindex_ao using bitmap (n);
Create index subt_gist_rix_ao on subt_tab_reindex_ao using gist (b);
Drop table if exists subt_tab_reindex_co;
Create table subt_tab_reindex_co(i int, x text,c char,v varchar, d date, n numeric, t timestamp without time zone, tz time with time zone, b box) with(appendonly=true, orientation=column) distributed by (i);
Insert into subt_tab_reindex_co values(generate_series(1,4),'create table with subtransactions','s','subtransaction table','12-11-2012',3,'2012-10-09 10:23:54', '2011-08-19 10:23:54+02', '( (0,0), (1,1) )');
Create index subt_btree_rix_co on subt_tab_reindex_co (x);
Create index subt_bitmap_rix_co on subt_tab_reindex_co using bitmap (n);
Create index subt_gist_rix_co on subt_tab_reindex_co using gist (b);
BEGIN;
Savepoint sp1;
Insert into subt_tab_reindex_ao values(5,'create table with subtransactions','s','subtransaction table','12-11-2012',3,'2012-10-09 10:23:54', '2011-08-19 10:23:54+02', '( (0,0), (1,1) )');
Insert into subt_tab_reindex_co values(5,'create table with subtransactions','s','subtransaction table','12-11-2012',3,'2012-10-09 10:23:54', '2011-08-19 10:23:54+02', '( (0,0), (1,1) )');
REINDEX index subt_btree_rix_heap;
REINDEX index subt_bitmap_rix_heap;
REINDEX index subt_gist_rix_heap;
REINDEX index subt_unique_rix_heap;
REINDEX index subt_btree_rix_ao;
REINDEX index subt_bitmap_rix_ao;
REINDEX index subt_gist_rix_ao;
REINDEX index subt_btree_rix_co;
REINDEX index subt_bitmap_rix_co;
REINDEX index subt_gist_rix_co;
Select count(*) from subt_tab_reindex_ao;
Select count(*) from subt_tab_reindex_co;
Savepoint sp2;
Insert into subt_tab_reindex_ao values(5,'create table with subtransactions','s','subtransaction table','12-11-2012',3,'2012-10-09 10:23:54', '2011-08-19 10:23:54+02', '( (0,0), (1,1) )');
Insert into subt_tab_reindex_co values(5,'create table with subtransactions','s','subtransaction table','12-11-2012',3,'2012-10-09 10:23:54', '2011-08-19 10:23:54+02', '( (0,0), (1,1) )');
REINDEX index subt_btree_rix_heap;
REINDEX index subt_bitmap_rix_heap;
REINDEX index subt_gist_rix_heap;
REINDEX index subt_unique_rix_heap;
REINDEX index subt_btree_rix_ao;
REINDEX index subt_bitmap_rix_ao;
REINDEX index subt_gist_rix_ao;
REINDEX index subt_btree_rix_co;
REINDEX index subt_bitmap_rix_co;
REINDEX index subt_gist_rix_co;
Select count(*) from subt_tab_reindex_ao;
Select count(*) from subt_tab_reindex_co;
Savepoint sp3;
Rollback to sp2;
Select count(*) from subt_tab_reindex_ao;
Select count(*) from subt_tab_reindex_co;
Insert into subt_tab_reindex_ao values(5,'create table with subtransactions','s','subtransaction table','12-11-2012',3,'2012-10-09 10:23:54', '2011-08-19 10:23:54+02', '( (0,0), (1,1) )');
Insert into subt_tab_reindex_co values(5,'create table with subtransactions','s','subtransaction table','12-11-2012',3,'2012-10-09 10:23:54', '2011-08-19 10:23:54+02', '( (0,0), (1,1) )');
REINDEX index subt_btree_rix_heap;
REINDEX index subt_bitmap_rix_heap;
REINDEX index subt_gist_rix_heap;
REINDEX index subt_unique_rix_heap;
REINDEX index subt_btree_rix_ao;
REINDEX index subt_bitmap_rix_ao;
REINDEX index subt_gist_rix_ao;
REINDEX index subt_btree_rix_co;
REINDEX index subt_bitmap_rix_co;
REINDEX index subt_gist_rix_co;
Select count(*) from subt_tab_reindex_ao;
Select count(*) from subt_tab_reindex_co;
Release Savepoint sp2;
Select count(*) from subt_tab_reindex_ao;
Select count(*) from subt_tab_reindex_co;
COMMIT;

