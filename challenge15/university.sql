CREATE TABLE jurusan (
    id_jurusan VARCHAR(10) NOT NULL PRIMARY KEY,
    nama_jurusan VARCHAR(50) NOT NULL
);

CREATE TABLE mahasiswa (
    nim VARCHAR(10) NOT NULL PRIMARY KEY,
    nama_mahasiswa VARCHAR(50) NOT NULL,
    alamat VARCHAR(100) NOT NULL,
    id_jurusan VARCHAR(10),
    FOREIGN KEY (id_jurusan)
        REFERENCES jurusan (id_jurusan)
);

CREATE TABLE mata_kuliah (
    id_matakuliah VARCHAR(10) NOT NULL PRIMARY KEY,
    nama_matakuliah VARCHAR(50) NOT NULL,
    sks VARCHAR(25) NOT NULL
);

CREATE TABLE dosen (
    nip VARCHAR(10) NOT NULL PRIMARY KEY,
    nama_dosen VARCHAR(50) NOT NULL
);

CREATE TABLE kontrak (
    id_kontrak VARCHAR(10) NOT NULL PRIMARY KEY,
    nim VARCHAR(10),
    id_matakuliah VARCHAR(10),
    nip VARCHAR(10),
    nilai VARCHAR(1),
    FOREIGN KEY (nim)
        REFERENCES mahasiswa (nim),
    FOREIGN KEY (id_matakuliah)
        REFERENCES mata_kuliah (id_matakuliah),
    FOREIGN KEY (nip)
        REFERENCES dosen (nip)
    
);

INSERT INTO jurusan (
    id_jurusan,
    nama_jurusan
)
VALUES (
    'J001',
    'Teknologi dan Informatika'
),
(
    'J002',
    'Bahasa dan Sastra Arab'
),
(
    'J003',
    'Manajemen'
);

INSERT INTO mahasiswa (
    nim,
    nama_mahasiswa,
    alamat,
    id_jurusan
)
VALUES (
    'M111',
    'Yasa Mulky Al Afgani',
    'Lampung',
    'J002'
),
(
    'M112',
    'Romie Agung N.',
    'Bandung',
    'J001'
),
(
    'M113',
    'Eko Prasetyo',
    'Bandung',
    'J003'
);

INSERT INTO mata_kuliah (
    id_matakuliah,
    nama_matakuliah,
    sks
)
VALUES (
    'MK01',
    'Bahasa Inggris',
    '2'
),
(
    'MK02',
    'Bahasa Arab',
    '4'
),
(
    'MK03',
    'Ilmu Komputer',
    '6'
);

INSERT INTO dosen (
    nip,
    nama_dosen
)
VALUES (
    'D211',
    'Deden'
),
(
    'D212',
    'Mulyadi'
),
(
    'D213',
    'Ronny'
);

INSERT INTO kontrak (
    id_kontrak,
    nim,
    id_matakuliah,
    nip,
    nilai
)
VALUES (
    'K901',
    'M111',
    'MK01',
    'D211',
    'A'
),
(
    'K902',
    'M111',
    'MK02',
    'D212',
    'B'
),
(
    'K903',
    'M111',
    'MK03',
    'D213',
    'A'
),
(
    'K904',
    'M112',
    'MK01',
    'D211',
    'E'
),
(
    'K905',
    'M112',
    'MK02',
    'D212',
    'C'
),
(
    'K906',
    'M113',
    'MK03',
    'D213',
    'D'
),
(
    'K907',
    'M113',
    'MK01',
    'D211',
    'A'
),
(
    'K908',
    'M113',
    'MK02',
    'D212',
    'C'
),
(
    'K909',
    'M113',
    'MK03',
    'D213',
    'D'
);

-- 1
SELECT nim, nama_mahasiswa, alamat, nama_jurusan
FROM mahasiswa
INNER JOIN jurusan
    ON jurusan.id_jurusan = mahasiswa.id_jurusan;

ALTER TABLE mahasiswa
ADD COLUMN umur INT NULL;

UPDATE mahasiswa
SET umur = 19 
WHERE nim = 'M111';

UPDATE mahasiswa
SET umur = 25 
WHERE nim = 'M112';

UPDATE mahasiswa
SET umur = 32 
WHERE nim = 'M113';

-- 2
SELECT * FROM mahasiswa
WHERE umur BETWEEN 1 AND 19;

-- 3
SELECT mahasiswa.nama_mahasiswa, mata_kuliah.nama_matakuliah, kontrak.nilai
FROM mahasiswa
INNER JOIN kontrak
    ON mahasiswa.nim = kontrak.nim
INNER JOIN mata_kuliah
    ON mata_kuliah.id_matakuliah = kontrak.id_matakuliah
WHERE nilai BETWEEN 'A' AND 'B';
