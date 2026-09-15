```mermaid
---
Title: Minitask1
---
erDiagram

buku }|--|| kategori : kategori
kategori ||--|{ rak_buku : position_kategori
buku }|--|| peminjam : borrowing
buku }|--|| petugas : witness

buku {
    id_buku int PK
    judul string
    author string
    tahun_terbit string
    penerbit string

    id_kategori int FK
    id_rak_buku int FK
    id_peminjam int FK
    id_petugas int FK
}

kategori {
    id_kategori int PK
    nama_kategori string
}

rak_buku {
    id_rak_buku int PK
    nama_rak_buku string

    id_buku int FK
    id_kategori int FK
}

petugas {
    id_petugas int PK
    nama_petugas string
    ttgl string
    alamat string
}

peminjam {
    id_peminjam int PK
    nama_peminjam string
    ttgl string
    alamat string
}
````

![Minitask1](minitask1.png)