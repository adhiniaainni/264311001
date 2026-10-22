-- 1. Tabel Induk 1: posyandu
CREATE TABLE posyandu (
    id_posyandu INT NOT NULL AUTO_INCREMENT,
    nama_posyandu VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    dusun VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    desa VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    kecamatan VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    PRIMARY KEY (id_posyandu)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 2. Tabel Induk 2: pengguna
CREATE TABLE pengguna (
    id_pengguna INT NOT NULL AUTO_INCREMENT,
    id_posyandu INT NOT NULL,
    nama VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    username VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    password_hash VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    role ENUM('Ketua Posyandu', 'Anggota BKB', 'Kader', 'Petugas') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Kader',
    hak_koreksi TINYINT(1) DEFAULT NULL,
    PRIMARY KEY (id_pengguna),
    UNIQUE KEY username (username),
    CONSTRAINT fk_pengguna_posyandu FOREIGN KEY (id_posyandu) 
        REFERENCES posyandu (id_posyandu) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 3. Tabel Transaksi / Anak: rekap_bulanan
CREATE TABLE rekap_bulanan (
    id_rekap INT NOT NULL AUTO_INCREMENT,
    id_posyandu INT NOT NULL,
    id_pengguna INT NOT NULL,
    bulan TINYINT NOT NULL,
    tahun SMALLINT NOT NULL,
    status_serah ENUM('Belum', 'Diserahkan', 'Diterima') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Belum',
    jumlah_ditimbang INT NOT NULL DEFAULT 0,
    jumlah_berisiko INT NOT NULL DEFAULT 0,
    jumlah_stunting INT NOT NULL DEFAULT 0,
    tgl_dihitung DATETIME DEFAULT NULL,
    PRIMARY KEY (id_rekap),
    CONSTRAINT fk_rekap_posyandu FOREIGN KEY (id_posyandu) 
        REFERENCES posyandu (id_posyandu) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    CONSTRAINT fk_rekap_pengguna FOREIGN KEY (id_pengguna) 
        REFERENCES pengguna (id_pengguna) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
