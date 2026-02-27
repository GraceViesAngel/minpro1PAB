# EduSmart Digital Literacy 🎓

Aplikasi kuis literasi digital berbasis Flutter yang dirancang untuk membantu pengguna memahami konsep dasar etika internet dan penggunaan teknologi secara bijak.

---

## Deskripsi Aplikasi

EduSmart Digital Literacy merupakan aplikasi mobile sederhana yang dibuat menggunakan framework Flutter. Aplikasi ini menyediakan sistem pendataan peserta sebelum memulai kuis, sehingga setiap hasil yang diperoleh dapat dikaitkan langsung dengan identitas pengguna.

Di dalam aplikasi ini, pengguna diminta mengisi data diri terlebih dahulu seperti nama, email, dan kelas. Setelah data tersimpan, pengguna dapat mengikuti kuis literasi digital yang terdiri dari beberapa pertanyaan pilihan ganda. Pada akhir kuis, sistem akan menampilkan skor akhir beserta rincian jawaban yang dipilih dan jawaban yang benar.

Aplikasi ini tidak hanya berfungsi sebagai media pembelajaran, tetapi juga sebagai implementasi konsep dasar pemrograman mobile seperti pengelolaan state, navigasi antar halaman, serta operasi CRUD (Create, Read, Update, Delete).

---

## Tujuan Pembuatan Aplikasi

Tujuan utama dari pembuatan aplikasi ini adalah untuk menyediakan media latihan yang interaktif dalam memahami literasi digital. Dengan pendekatan kuis, pengguna dapat mengukur sejauh mana pemahaman mereka terhadap materi yang berkaitan dengan etika internet dan penggunaan teknologi.

Selain itu, aplikasi ini juga dibuat sebagai sarana pembelajaran dalam mata kuliah pemrograman berbasis aplikasi mobile. Melalui project ini, diterapkan berbagai konsep penting seperti pembuatan form input, pengelolaan data dalam list, penggunaan StatefulWidget dan StatelessWidget, serta navigasi antar halaman menggunakan Navigator.

Dengan demikian, aplikasi ini menggabungkan aspek edukasi dan praktik pengembangan aplikasi secara langsung.

---

## Fitur Aplikasi

➤ **Tambah Peserta (Create)**  

Aplikasi menyediakan form untuk menambahkan data peserta sebelum mengikuti kuis. Pengguna mengisi nama, email, dan kelas melalui input yang tersedia. Setelah disimpan, data tersebut langsung masuk ke dalam daftar peserta dan tersimpan di dalam state aplikasi.

---

➤ **Tampilkan Daftar Peserta (Read)**  

Seluruh peserta yang telah ditambahkan akan ditampilkan dalam bentuk daftar yang terstruktur. Informasi seperti nama, email, dan kelas ditampilkan secara jelas. Daftar ini akan otomatis diperbarui setiap kali terjadi perubahan data.

---

➤ **Hapus Peserta (Delete)**  

Pengguna dapat menghapus data peserta dari daftar jika sudah tidak diperlukan. Saat tombol hapus ditekan, data langsung dihapus dari state dan tampilan daftar akan menyesuaikan secara otomatis.

---

➤ **Sistem Kuis Literasi Digital**

Aplikasi menyediakan kuis pilihan ganda yang terdiri dari beberapa pertanyaan mengenai literasi digital. Pertanyaan ditampilkan satu per satu dan pengguna memilih jawaban yang dianggap benar. Sistem akan menghitung skor berdasarkan jawaban yang dipilih.

---

➤ **Pengacakan Urutan Jawaban**

Untuk menghindari pola jawaban yang tetap, sistem mengacak posisi pilihan jawaban pada setiap pertanyaan. Dengan demikian, jawaban yang benar tidak selalu berada pada posisi yang sama.

---

➤ **Halaman Hasil dengan Detail Jawaban**

Setelah kuis selesai, aplikasi tidak hanya menampilkan skor akhir, tetapi juga menampilkan rincian jawaban. Pengguna dapat melihat jawaban yang dipilih serta jawaban yang benar pada setiap soal, sehingga proses evaluasi menjadi lebih jelas.

---

### ✦ Nilai Tambah

➤ **Edit Data Peserta (Update)**  

Aplikasi memungkinkan pengguna untuk memperbarui data peserta yang sudah ada. Saat tombol edit ditekan, data sebelumnya akan muncul kembali di dalam form sehingga dapat diperbaiki tanpa perlu menginput ulang dari awal.

---

➤ **Navigasi Multi-Halaman**

Aplikasi menggunakan sistem navigasi antar halaman. Pengguna berpindah dari halaman utama ke halaman kuis, lalu ke halaman hasil, dan dapat kembali ke halaman awal melalui tombol navigasi yang tersedia.


## Widget dan Komponen yang Digunakan

| WIDGET | KETERANGAN |
|--------|------------|
| **StatelessWidget** | Digunakan pada komponen yang tidak memerlukan perubahan data selama aplikasi berjalan, seperti struktur utama aplikasi dan halaman hasil kuis. |
| **StatefulWidget** | Digunakan pada halaman yang membutuhkan pengelolaan state, seperti halaman utama (CRUD peserta) dan halaman kuis yang memproses perubahan skor serta perpindahan soal. |
| **Scaffold** | Menyediakan kerangka dasar tampilan halaman, termasuk body dan struktur visual utama aplikasi. |
| **Text** | Menampilkan informasi seperti judul aplikasi, pertanyaan kuis, data peserta, serta skor hasil akhir. |
| **TextField** | Digunakan untuk menerima input pengguna pada form data peserta (nama, email, dan kelas). |
| **TextEditingController** | Mengontrol dan mengelola data yang diinput pada TextField agar dapat diproses dan disimpan. |
| **ElevatedButton** | Digunakan sebagai tombol aksi seperti simpan peserta, mulai kuis, memilih jawaban, dan kembali ke halaman utama. |
| **ListView.builder** | Menampilkan daftar peserta secara dinamis berdasarkan data yang tersimpan dalam state. |
| **ListTile** | Mengatur tampilan setiap item peserta agar tersusun rapi dengan informasi dan tombol aksi. |
| **Card** | Membungkus setiap item peserta maupun detail jawaban agar tampilan lebih terstruktur dan memiliki pemisah visual yang jelas. |
| **Column & Row** | Mengatur tata letak widget secara vertikal dan horizontal agar tampilan lebih terorganisir. |
| **Navigator & MaterialPageRoute** | Mengatur perpindahan antar halaman, seperti dari halaman utama ke halaman kuis dan ke halaman hasil. |
| **SingleChildScrollView** | Memungkinkan halaman hasil kuis dapat di-scroll jika kontennya melebihi ukuran layar. |
| **BackdropFilter & Container (Glass Effect)** | Digunakan untuk menciptakan tampilan glassmorphism pada desain antarmuka agar terlihat modern dan elegan. |



## Alur Kerja Aplikasi

Aplikasi EduSmart Digital Literacy dirancang sebagai media kuis interaktif untuk menguji pemahaman pengguna mengenai literasi digital dan etika dalam menggunakan internet. Alur penggunaan dibuat sederhana dan runtut agar mudah dipahami oleh pengguna dari berbagai kalangan. Pengguna akan memulai dari pengisian data diri, kemudian mengerjakan soal kuis, hingga melihat hasil akhir beserta detail jawaban.

---

### • Halaman Home Page

Halaman Home merupakan tampilan pertama saat aplikasi dijalankan. Pada halaman ini, pengguna diminta untuk mengisi data diri berupa nama, email, dan kelas. Data tersebut digunakan sebagai identitas peserta sebelum mengikuti kuis.

Setelah data diisi dengan lengkap, pengguna dapat menekan tombol **Simpan Peserta** untuk menyimpan informasi tersebut. Data yang berhasil disimpan akan langsung muncul pada bagian **Daftar Peserta**. Dari daftar tersebut, pengguna dapat memilih untuk mengedit data, menghapus data, atau langsung memulai kuis dengan menekan tombol **Mulai**.

Halaman ini berfungsi sebagai pusat pengelolaan data peserta sekaligus langkah awal sebelum masuk ke tahap pengerjaan soal.

<img width="1268" height="984" alt="image" src="https://github.com/user-attachments/assets/356771bc-5dde-4c5d-b851-94e3ed567a24" />


<img width="1266" height="983" alt="image" src="https://github.com/user-attachments/assets/4b888ff6-2c4a-43c5-ae05-fd265c184ae8" />

---

### • Halaman Quiz

Setelah peserta menekan tombol **Mulai**, aplikasi akan berpindah ke halaman kuis. Pada halaman ini, soal ditampilkan satu per satu agar pengguna dapat lebih fokus dalam menjawab setiap pertanyaan.

Setiap soal memiliki beberapa pilihan jawaban dalam bentuk tombol. Ketika salah satu jawaban dipilih, sistem akan menyimpan pilihan tersebut dan secara otomatis menampilkan pertanyaan berikutnya. Proses ini berlangsung hingga seluruh soal selesai dijawab.

Pilihan jawaban ditampilkan secara dinamis sehingga tidak selalu berada pada posisi yang sama. Hal ini bertujuan untuk membuat kuis lebih variatif dan tidak mudah ditebak.

<img width="1262" height="988" alt="image" src="https://github.com/user-attachments/assets/1e38d081-e30c-4d2c-8636-73326fb06e1d" />

---

### • Halaman Result Page

Setelah seluruh pertanyaan dijawab, pengguna akan diarahkan ke halaman hasil. Pada halaman ini ditampilkan skor akhir berdasarkan jumlah jawaban yang benar dibandingkan dengan total soal yang tersedia.

Selain skor, aplikasi juga menampilkan rincian setiap pertanyaan, jawaban yang dipilih oleh pengguna, serta jawaban yang benar. Perbedaan warna digunakan sebagai indikator untuk membedakan jawaban yang benar dan salah agar pengguna dapat dengan mudah melakukan evaluasi.

Di bagian bawah halaman tersedia tombol untuk kembali ke halaman utama. Dengan demikian, pengguna dapat mengulang kuis atau menambahkan peserta baru tanpa perlu menutup aplikasi.

<img width="1264" height="985" alt="image" src="https://github.com/user-attachments/assets/371a3ea6-718e-42da-a3f1-b21f26d1b75b" />


<img width="1263" height="986" alt="image" src="https://github.com/user-attachments/assets/f3bf1211-6f44-469f-895a-02784256eb66" />


