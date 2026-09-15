<!-- 
Pengguna
Produk
Kategori Produk
Pesanan
Detail Pesanan
Pembayaran 

pengguna dapat membuat banyak pesanan (1-N)
produk dapat termasuk dalam banyak detail pesanan (1-N)
pesanan dapat memiliki banyak detail pesanan (1-N)
pesanan memiliki satu pembayaran (1-N)
produk memiliki satu kategori produk (1-N)
-->
```mermaid
---
title: Minitask2
---
erDiagram

pengguna ||--|{ pesanan : order
produk ||--|{ detail_pesanan : receipt
pesanan ||--|{ detail_pesanan : receipt
pesanan ||--|| pembayaran : payment
produk ||--|| kategori : product

pengguna{
    id_pengguna int PK
    nama_pengguna string
    ttgl string
    alamat string
}

produk{
    id_produk int PK
    nama_produk string
}

kategori_produk{
    id_kategori_produk int PK
    nama_kategori_produk string
}

pesanan{
    id_pesanan int PK
    nama_pesanan string
}

detail_pesanan{
    id_detail_pesanan int PK
    nama_detail_pesanan string
}

pembayaran{
    id_pembayaran int PK
    nama_pembayaran string
}

```

![Minitask2](Minitask2.png)