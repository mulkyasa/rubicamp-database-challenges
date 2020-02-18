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
    id_mahasiswa VARCHAR(10),
    id_matakuliah VARCHAR(10),
    nip VARCHAR(10),
    nilai VARCHAR(1),
    FOREIGN KEY (id_mahasiswa)
        REFERENCES mahasiswa (id_mahasiswa),
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
)
(
    'M113',
    'Eko Prasetyo',
    'Bandung',
    'J003'
);

INSERT INTO mata_kuliah (
    id_matakuliah
    nama_matakuliah,
    sks,
)
VALUES (
    'MK01',
    'Bahasa Inggris',
    '2'
),
(
    'MK02',
    'Bahasa Arab',
    '2'
),
(
    'MK03',
    'Ilmu Komputer',
    '2'
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
    id_mahasiswa,
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