# Analisis Computational Thinking — Kasir dengan Diskon

**Anggota Kelompok:**
* Aryan Firmansyah
* Muhammad Satria Nurulloh

---

## Deskripsi

Program kasir sederhana ini dibuat menggunakan bahasa Dart untuk menghitung potongan diskon dan total pembayaran belanjaan sesuai aturan bisnis (*business rules*) toko.

---

## 1. Ketentuan Diskon Toko (Business Rules)

Aturan perhitungan diskon yang diterapkan dalam program:

| Kode | Business Rule |
| --- | --- |
| **BR-01** | Belanja minimal Rp100.000 mendapat diskon 10%. |
| **BR-02** | Member mendapat tambahan diskon 5% (hanya berlaku jika **BR-01** terpenuhi). |
| **BR-03** | Total potongan harga maksimal Rp25.000. |

---

## 2. Analisis Variabel Program

Variabel dan tipe data yang digunakan pada kode Dart:

| Jenis Data | Nama Variabel | Tipe Data | Fungsi/Keterangan |
| --- | --- | --- | --- |
| **Input** | `totalBelanja` | `double` | Menyimpan jumlah nominal belanjaan awal. |
| **Input** | `membership` | `bool` | Menyimpan status member (`true` jika member, `false` jika bukan). |
| **Proses** | `pot_diskon` | `double` | Persentase diskon (`0.15`, `0.10`, atau `0`). |
| **Proses** | `potongan` | `double` | Nominal potongan rupiah (dibatasi maks Rp25.000). |
| **Proses** | `persen` | `double` | Menampung hasil persentase dari `hitungPersenDiskon()`. |
| **Output** | `totalBayar` | `double` | Hasil akhir total pembayaran (`totalBelanja - potongan`). |

---

## 3. Analisis Computational Thinking

### 3.1 Decomposition (Memecah Masalah)
Masalah dipecah menjadi 3 fungsi utama:
1. **`hitungPersenDiskon(totalBelanja, membership)`**
   Memeriksa `totalBelanja >= 100000`. Jika `membership == true`, diskon bernilai `0.15`. Jika `membership == false`, diskon bernilai `0.10`. Selain itu mengembalikan `0`.
2. **`hitungPotongan(pot_diskon, totalBelanja)`**
   Menghitung `pot_diskon * totalBelanja`. Jika hasilnya `>= 25000`, maka nilai potongan dikunci di angka `25000`.
3. **`hitungTotalBayar(totalBelanja, membership)`**
   Memanggil `hitungPersenDiskon` dan `hitungPotongan`, lalu mengembalikan `totalBelanja - potongan`.

### 3.2 Pattern Recognition (Pengenalan Pola)
* Belanja < Rp100.000 $\rightarrow$ Diskon **0** (status member tidak berpengaruh).
* Belanja $\ge$ Rp100.000 & bukan member (`membership == false`) $\rightarrow$ Diskon **0.10** (10%).
* Belanja $\ge$ Rp100.000 & member (`membership == true`) $\rightarrow$ Diskon **0.15** (15%).
* Batas Potongan: Berapa pun hasil diskonnya, jika nominalnya $\ge$ Rp25.000, potongan dikunci di **25000**.

### 3.3 Abstraction (Abstraksi)
Program fokus pada variabel inti: `totalBelanja` dan `membership`. Informasi seperti nama barang, jumlah barang, maupun nama pelanggan tidak diproses karena tidak mempengaruhi aturan diskon.

### 3.4 Algorithm (Langkah Logika)
1. Panggil `hitungPersenDiskon(totalBelanja, membership)` untuk menentukan persentase diskon.
2. Panggil `hitungPotongan(pot_diskon, totalBelanja)` untuk menghitung nominal rupiah potongan belanja.
3. Batasi potongan jika `>= 25000` menjadi `25000`.
4. Hitung `totalBayar = totalBelanja - potongan`.
5. Tampilkan hasil perhitungan ke layar melalui fungsi `main()`.

---

## 4. Flowchart Logika Program

```text
[ MULAI ]
    |
    v
( Input: totalBelanja & membership )
    |
    v
[ Apakah totalBelanja >= 100000? ]
    |                                \
  (YA)                             (TIDAK)
    |                                  \
[ Apakah membership == true? ]       return 0
    |                  \               |
  (YA)               (TIDAK)           |
    |                  \               |
return 0.15          return 0.10       |
    |                  /               |
    +-----------------+----------------+
    |
    v
[ Hitung: potongan = pot_diskon * totalBelanja ]
    |
    v
[ Apakah potongan >= 25000? ]
    |                      \
  (YA)                   (TIDAK)
    |                        \
return 25000              return potongan
    |                        /
    +-----------------------+
    |
    v
[ Hitung: totalBayar = totalBelanja - potongan ]
    |
    v
( Tampilkan totalBayar )
    |
    v
[ SELESAI ]

## 5. Simulasi & Verifikasi Uji Kasus (Trace Table)

| Skenario | Total Belanja | Member | Diskon | Rumus Potongan | Potongan Akhir | Expected Total Bayar | Status |
| :-: | --- | :-: | :-: | --- | --- | --- | :-: |
| **1** | Rp80.000 | `false` | 0 | 0 × 80.000 | Rp0 | Rp80.000 | **Sesuai** |
| **2** | Rp150.000 | `false` | 0.10 | 0.10 × 150.000 | Rp15.000 | Rp135.000 | **Sesuai** |
| **3** | Rp150.000 | `true` | 0.15 | 0.15 × 150.000 | Rp22.500 | Rp127.500 | **Sesuai** |
| **4** | Rp300.000 | `true` | 0.15 | 0.15 × 300.000 (Dibatasi) | Rp25.000 | Rp275.000 | **Sesuai** |