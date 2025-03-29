# Pemrograman Asynchronous di Flutter

## PRAKTIKUM 1: Mengunduh Data dari Web Service (API)

**Deskripsi:**

Aplikasi ini mengimplementasikan cara mengambil atau mengunduh data dari sebuah Web Service API menggunakan Flutter.

## Soal 1 :
Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda.

#### Mengganti Tittle 
![Screenshot aplikasi kamera](assets/tittle.png)


## Soal 2 :
Carilah judul buku favorit Anda di Google Books, lalu ganti ID buku pada variabel path di kode tersebut. 

#### Mengganti ID Buku
![Screenshot aplikasi kamera](assets/W5_Soal_2.png)


## Soal 3: Penjelasan `substring` dan `catchError` pada Langkah 5

**Pertanyaan:** Jelaskan maksud kode langkah 5 tersebut terkait `substring` dan `catchError`!

**Jawaban:**

Kode di dalam blok `onPressed` dari `ElevatedButton` memiliki fungsi utama untuk mengambil data dan menanganinya:

1.  **Pengambilan Data (`getData()`):** Ketika tombol "GO!" ditekan, fungsi `getData()` dipanggil untuk melakukan permintaan data (kemungkinan dari sebuah API). Proses ini bersifat asinkron.

2.  **Penanganan Data Sukses (`.then((value) { ... })`):** Jika `getData()` berhasil mendapatkan respons:
    * `value.body.toString()`: Isi dari respons diubah menjadi format `String`.
    * `.substring(0, 450)`: **Fungsi `substring(0, 450)`** digunakan untuk mengekstrak dan mengambil hanya 450 karakter pertama dari string isi respons. Tujuannya adalah untuk membatasi jumlah data yang ditampilkan atau mengambil cuplikan awal.
    * Hasil potongan string ini kemudian disimpan ke dalam variabel `result` dan ditampilkan pada antarmuka pengguna melalui `setState(() {})`.

3.  **Penanganan Error (`.catchError((_) { ... })`):** Jika terjadi kesalahan selama proses `getData()` (misalnya, koneksi gagal):
    * **Fungsi `catchError((_) { ... })`** akan menangkap error tersebut.
    * Variabel `result` akan diubah menjadi pesan error statis: `"An error occurred"`.
    * Pesan error ini kemudian ditampilkan pada antarmuka pengguna melalui `setState(() {})`.

**Kesimpulan:**

* **`substring(0, 450)`:** Bertugas untuk membatasi dan menampilkan hanya 450 karakter pertama dari data yang berhasil diterima, berguna untuk menyajikan ringkasan atau mencegah tampilan yang terlalu panjang.
* **`catchError((_) { ... })`:** Berfungsi sebagai mekanisme penanganan error. Jika terjadi masalah saat pengambilan data, kode ini akan menampilkan pesan error yang lebih informatif kepada pengguna daripada aplikasi yang berhenti tiba-tiba.

#### Hasil Praktikum
![Screenshot aplikasi kamera](assets/W5_Soal_3.png)