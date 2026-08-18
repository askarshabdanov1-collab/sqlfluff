-- ATTACH statements
ATTACH 'file.db';
ATTACH 'file.db' AS dbname;
ATTACH IF NOT EXISTS 'file.db' AS dbname;
ATTACH DATABASE 'file.db' AS dbname;
ATTACH IF NOT EXISTS DATABASE 'file.db' AS dbname;
ATTACH ':memory:' AS mem_db;
ATTACH 's3://bucket/db.duckdb' AS s3_db;
ATTACH '' AS empty_db;
ATTACH 'file.db' (READ_ONLY);
ATTACH 'file.db' (READ_ONLY, TYPE SQLITE);
ATTACH 'file.db' AS dbname (READ_ONLY, TYPE SQLITE);
ATTACH 'file.db' AS dbname (READ_ONLY 1, TYPE SQLITE);
ATTACH 'file.db' AS dbname (READ_ONLY false);
ATTACH 'file.db' AS dbname (READ_ONLY 0);
ATTACH 'file.db' AS dbname (READ_WRITE);

-- DETACH statements
DETACH dbname;
DETACH DATABASE dbname;
DETACH IF EXISTS dbname;
DETACH DATABASE IF EXISTS dbname;
DETACH 'dbname';

-- CHECKPOINT statements
CHECKPOINT;
CHECKPOINT dbname;
FORCE CHECKPOINT;
FORCE CHECKPOINT dbname;

-- EXPORT and IMPORT DATABASE statements
EXPORT DATABASE 'target_dir';
EXPORT DATABASE 'target_dir' (FORMAT PARQUET);
EXPORT DATABASE 'target_dir' (FORMAT PARQUET, CODEC ZSTD);
EXPORT DATABASE 'target_dir' (FORMAT CSV, DELIMITER ',');
IMPORT DATABASE 'source_dir';

-- SUMMARIZE statements
SUMMARIZE tbl;
SUMMARIZE SELECT * FROM tbl;
SUMMARIZE SELECT a, b FROM tbl WHERE a > 10;
SUMMARIZE SELECT a, count(*) FROM tbl GROUP BY a;

-- Unreserved keyword usage
SELECT attach, detach, checkpoint, export, import, summarize FROM my_table;
