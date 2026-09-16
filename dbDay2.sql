-- permision for user
GRANT SELECT
ON ALL TABELS SCHEMA PUBLIC
TO xone;

-- revoke permision
REVOKE SELECT 
ON TABLE public.buku
FROM muftin;

-- create user
createuser -U <root user> -h localhost -p <port db> -P <new user>;

-- create user with time
CREATE USER noli
WITH SUPERUSER VALID UNTIL '2026-09-17' LOGIN PASSWORD '321';

-- delete role
DROP ROLE "xone";

-- create database
CREATE DATABASE beasisdata
OWNER muftin;

-- alter tabel
ALTER TABLE 

-- update


-- QUERY & FILTER

-- distinct -> melihat seluruh column, dan melihat combinasi dari semua colomn yg uniq
SELECT DISTINCT [column_name...]
FROM table_name;

-- order by -> mengurutkan
SELECT {DISTINCT} [nama_column...]
FROM nama_row
ORDER BY [nama_column...] <kondisi>;

-- limit -> membatasi data
-- ofset -> melewati beberapa angka
SELECT nama_column
FROM nama_row
-- kalo mau tambah order by
ORDER BY <nama_column> <kondisi>
LIMIT <brapa angka pertama> OFFSET <berapa yg di lewati>;

SELECT nama_column,nama_column
FROM nama_tabel
WHERE BETWEEN 120 AND 150
ORDER BY ASC(kecil > besar)
LIMIT <count>;

-- like -> untuk melakukan pencarian sensitif case / pake where = lower(value row)=lower(value)
SELECT nama_column
FROM nama_row
WHERE nama_column LIKE <value>;

-- where like -> akses %(wildcard) : pada posisi yg bresangkutan maka true
-- ilike -> langsung di samain key mencari sama value yg di cari, cuma tidak evisien karna paling lambat
SELECT nama_column
FROM nama_row
WHERE nama_column LIKE %val (yg cocok ahiran val) / val% (yang awalan val) (bisa juga depan % belakang atau %mengandung value yg sama% juga bisa)
