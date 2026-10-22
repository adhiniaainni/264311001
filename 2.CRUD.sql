A.CREATE
 
-- Insert data ke Tabel Induk 1: posyandu
INSERT INTO posyandu (nama_posyandu, dusun, desa, kecamatan) VALUES
('Posyandu Melati', 'Dusun I', 'Suka Makmur', 'Mojo'),
('Posyandu Anggrek', 'Dusun II', 'Bojong', 'Mojo'),
('Posyandu Mawar', 'Dusun III', 'Karanganyar', 'Mojo');

-- Insert data ke Tabel Induk 2: pengguna
INSERT INTO pengguna (id_posyandu, nama, username, password_hash, role, hak_koreksi) VALUES
(1, 'Siti Aminah', 'siti_kader', '$2y$10$abcdefg12345', 'Kader', 1),
(2, 'Budi Santoso', 'budi_ketua', '$2y$10$hijklmn67890', 'Ketua Posyandu', 1),
(3, 'Dewi Lestari', 'dewi_petugas', '$2y$10$opqrstu11223', 'Petugas', 0);

-- Insert data ke Tabel Transaksi: rekap_bulanan
INSERT INTO rekap_bulanan (id_posyandu, id_pengguna, bulan, tahun, status_serah, jumlah_ditimbang, jumlah_berisiko, jumlah_stunting, tgl_dihitung) VALUES
(1, 1, 10, 2026, 'Belum', 45, 5, 2, '2026-10-20 08:00:00'),
(2, 2, 10, 2026, 'Diserahkan', 50, 3, 1, '2026-10-21 09:30:00'),
(3, 3, 10, 2026, 'Diterima', 40, 4, 0, '2026-10-22 10:00:00');

B.READ
SELECT * FROM posyandu;

C.UPDATE
UPDATE rekap_bulanan 
SET status_serah = 'Diterima', 
    jumlah_ditimbang = 48 
WHERE id_rekap = 1;

D. DELETE
DELETE FROM rekap_bulanan 
WHERE id_rekap = 3;
