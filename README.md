# Survei Kebutuhan Pengembangan Kompetensi Pegawai
### Kedeputian Bidang Peningkatan Kualitas Kebijakan Administrasi Negara - LAN RI

Aplikasi web survei pemetaan kebutuhan pengembangan kompetensi (Bangkom) pegawai dan dashboard analitik berbasis HCDP di lingkungan Kedeputian I LAN RI.

---

## 📌 Halaman & Fitur

1. **Formulir Survei (`index.html`)**
   - **Profil Pegawai Otomatis**: Pilih nama pegawai dari 58 database pegawai internal Deputi I, data NIP, Pangkat/Golongan, Jabatan, Jenjang, dan Masa Kerja akan terverifikasi secara otomatis.
   - **Pemilihan Topik Pelatihan**: Pilihan langsung tanpa batasan jumlah checkbox berdasarkan 4 Subkompetensi HCDP:
     1. Analisis Kebijakan
     2. Advokasi Kebijakan
     3. Manajemen Stakeholders
     4. Manajemen Ekosistem Pelayanan Publik
     *(Dilengkapi opsi isian topik khusus/lainnya di setiap subkompetensi)*.
   - **Preferensi Jadwal & Metode**: Pilihan hari pelaksanaan (Senin–Kamis), sesi waktu (Pagi/Siang), dan metode pelatihan (Offline/Online/Lainnya).
   - **Knowledge Sharing**: Pendataan kesediaan menjadi narasumber internal beserta bidang keahlian.

2. **Dashboard Hasil & Analisis (`dashboard.html`)**
   - **5 Kartu KPI Eksekutif**: Total responden, topik prioritas #1, jadwal terfavorit, metode dominan, dan calon narasumber knowledge sharing.
   - **Visualisasi Interaktif (Chart.js)**:
     - Ranking prioritas kebutuhan pelatihan bangkom.
     - Distribusi partisipasi per unit kerja/direktorat.
     - Preferensi hari pelaksanaan dan sesi jam.
     - Preferensi metode pembelajaran.
   - **Talent Pool Knowledge Sharing**: Profil pegawai yang bersedia berbagi pengalaman dan keahlian.
   - **Tabel Rekapitulasi Lengkap**: Filter unit kerja, pencarian nama/NIP, modal detail jawaban, dan tombol **Export ke Excel/CSV**.
   - **Dukungan Data**: Terintegrasi Supabase Database dan mode demo simulasi.

---

## 🚀 Teknologi

- **HTML5 & Vanilla JavaScript**
- **Tailwind CSS (CDN)**
- **Chart.js (CDN)**
- **Supabase JS Client (CDN)**

## Admin & penyimpanan draf

- Editor admin tersedia di `/editor.html`. Editor menggunakan Supabase Auth dan menyimpan konfigurasi aktif ke tabel `survey_config`.
- Jalankan `supabase-survey-config.sql` lewat Supabase SQL Editor.
- Buat user admin dari Supabase Dashboard → Authentication → Users. Salin UUID user tersebut lalu jalankan perintah `insert` yang dicontohkan di file SQL untuk memasukkannya ke `survey_admins`. Nonaktifkan pendaftaran publik jika tidak diperlukan.
- Setelah perubahan kode dideploy ke Vercel, login ke `/editor.html`, ubah kuesioner, lalu klik **Simpan & Terapkan**. Halaman survei dan kategori dashboard membaca konfigurasi aktif dari Supabase.
- Draf jawaban disimpan otomatis di `localStorage` browser/perangkat responden dan dihapus setelah pengiriman ke Supabase berhasil. Draf tidak tersinkron antarperangkat.
