-- start_ignore
SET gp_create_table_random_default_distribution=off;
-- end_ignore
CREATE INDEX pg2_heap_bitmap_idx1_template ON pg2_heap_table_bitmap_index_template USING bitmap (numeric_col);
