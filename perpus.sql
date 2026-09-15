CREATE TABLE petugas(
    id_petugas INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nama_petugas VARCHAR(250) NOT NULL,
    ttgl DATE NOT NULL,
    alamat VARCHAR(250)
);
-- DROP TABLE petugas;
INSERT INTO petugas (nama_petugas, ttgl, alamat) VALUES
('Andi Saputra', '1998-03-12', 'Batam'),
('Budi Santoso', '1995-07-24', 'Tanjung Pinang'),
('Citra Lestari', '2000-01-18', 'Jakarta'),
('Dedi Kurniawan', '1997-11-05', 'Depok'),
('Eka Pratama', '1999-06-30', 'Tangerang'),
('Fajar Ramadhan', '1996-09-14', 'Bekasi'),
('Gita Permata', '2001-02-27', 'Bogor'),
('Hendra Wijaya', '1994-12-09', 'Bandung'),
('Intan Sari', '2000-08-21', 'Semarang'),
('Joko Setiawan', '1998-05-16', 'Surabaya');

CREATE TABLE rak_buku (
    id_rak_buku INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nama_rak_buku VARCHAR(250) NOT NULL
);
-- DROP TABLE rak_buku;
INSERT INTO rak_buku(nama_rak_buku)VALUES
('Rak Pemrograman'),
('Rak Database'),
('Rak Jaringan'),
('Rak Sistem Informasi'),
('Rak Algoritma'),
('Rak Web Development'),
('Rak Mobile Development'),
('Rak Teknologi'),
('Rak Novel'),
('Rak Referensi');

CREATE TABLE kategori (
    id_kategori INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nama_kategori VARCHAR(250) NOT NULL,
    id_rak_buku INTEGER,

    FOREIGN KEY (id_rak_buku) REFERENCES rak_buku(id_rak_buku)
);
-- DROP TABLE kategori;
INSERT INTO kategori(nama_kategori, id_rak_buku)VALUES
('action', 1),
('Pemrograman', 1),
('Database', 2),
('Jaringan Komputer', 3),
('Sistem Informasi', 4),
('Algoritma dan Struktur Data', 5),
('Web Development', 6),
('Mobile Development', 7),
('Teknologi Informasi', 8),
('Fiksi', 9),
('Referensi', 10);

CREATE TABLE buku (
    id_buku INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    judul VARCHAR(250) NOT NULL,
    author VARCHAR(250) NOT NULL,
    tahun_terbit INTEGER NOT NULL,
    penerbit VARCHAR(250) NOT NULL,
    id_kategori INTEGER,

    FOREIGN KEY (id_kategori) REFERENCES kategori(id_kategori)
);
-- DROP TABLE buku;
INSERT INTO buku(judul, author, tahun_terbit, penerbit, id_kategori)VALUES
('Belajar Pemrograman Python', 'Andi Pratama', 2021, 'Informatika', 1),
('Dasar-Dasar PostgreSQL', 'Budi Santoso', 2022, 'Elex Media Komputindo', 2),
('Jaringan Komputer Modern', 'Citra Lestari', 2020, 'Andi Publisher', 3),
('Sistem Informasi Manajemen', 'Dedi Kurniawan', 2019, 'Graha Ilmu', 4),
('Algoritma dan Struktur Data', 'Eka Saputra', 2023, 'Informatika', 5),
('Membangun Website Modern', 'Fajar Ramadhan', 2022, 'Media Kita', 6),
('Pemrograman Android', 'Gita Permata', 2021, 'Andi Publisher', 7),
('Teknologi Informasi Masa Kini', 'Hendra Wijaya', 2024, 'Elex Media Komputindo', 8),
('Laskar Pelangi', 'Andrea Hirata', 2005, 'Bentang Pustaka', 9),
('Kamus Teknologi Informasi', 'Intan Sari', 2020, 'Gramedia', 10);

CREATE TABLE peminjam (
    id_peminjam INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nama_peminjam VARCHAR(250) NOT NULL,
    ttgl DATE NOT NULL,
    alamat VARCHAR(250),
    id_buku INTEGER,
    id_petugas INTEGER,

    FOREIGN KEY (id_buku) REFERENCES buku(id_buku),
    FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas)
);
-- DROP TABLE peminjam;
INSERT INTO peminjam(nama_peminjam, ttgl, alamat, id_buku, id_petugas)VALUES
('Rizky Maulana', '2001-04-12', 'Batam', 1, 1),
('Siti Aisyah', '2000-08-25', 'Tanjung Pinang', 2, 2),
('Doni Pratama', '1999-11-03', 'Jakarta', 3, 3),
('Nadia Putri', '2002-01-17', 'Depok', 4, 4),
('Arif Setiawan', '1998-06-29', 'Tangerang', 5, 5),
('Maya Lestari', '2001-09-14', 'Bekasi', 6, 6),
('Rian Kurniawan', '2000-12-08', 'Bogor', 7, 7),
('Dewi Anggraini', '1999-03-21', 'Bandung', 8, 8),
('Yoga Saputra', '2002-07-05', 'Semarang', 9, 9),
('Putri Ramadhani', '2001-10-19', 'Surabaya', 10, 10);