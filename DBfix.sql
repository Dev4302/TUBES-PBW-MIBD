IF OBJECT_ID('Memilih', 'U') IS NOT NULL
    DROP TABLE Memilih;

IF OBJECT_ID('Transaksi', 'U') IS NOT NULL
    DROP TABLE Transaksi;

IF OBJECT_ID('Tingkatpendidikan', 'U') IS NOT NULL
    DROP TABLE Tingkatpendidikan;

IF OBJECT_ID('Materi', 'U') IS NOT NULL
    DROP TABLE Materi;

IF OBJECT_ID('Kursus', 'U') IS NOT NULL
    DROP TABLE Kursus;

IF OBJECT_ID('Siswa', 'U') IS NOT NULL
    DROP TABLE Siswa;

IF OBJECT_ID('Guru', 'U') IS NOT NULL
    DROP TABLE Guru;

CREATE TABLE Guru
(
    idguru int NOT NULL,
    idkursus int NOT NULL,
    emailguru varchar(50),
    namaguru varchar(50),
    tarif int NOT NULL,
    email varchar(50),
    pass varchar(50)
);

CREATE TABLE Siswa
(
    idsiswa int NOT NULL,
    namasiswa varchar(50),
    tingkat varchar(50),
    asalsekolah varchar(50),
    email varchar(50),
    pass varchar(50),
    idtingkat int NOT NULL
);

CREATE TABLE Kursus
(
    idkursus int NOT NULL,
    tanggalpertemuan date,
    idsiswa int NOT NULL
);

CREATE TABLE Materi
(
    idmateri int NOT NULL,
    idsiswa int NOT NULL,
    namaguru varchar(50),
    tarif int NOT NULL,
    email varchar(50),
    pass varchar(50)
);

CREATE TABLE Tingkatpendidikan
(
    idtingkat int NOT NULL,
    tingkat int NOT NULL
);

CREATE TABLE Transaksi
(
    idtransaksi int NOT NULL,
    tanggaltransaksi date,
    idkursus int NOT NULL,
    idsiswa int NOT NULL
);

CREATE TABLE Memilih
(
    idkursus int NOT NULL,
    idsiswa int NOT NULL
);


-- Alter table Guru
ALTER TABLE Guru
ADD CONSTRAINT PK_Guru PRIMARY KEY (idguru);

ALTER TABLE Guru
ADD CONSTRAINT FK_Guru_Kursus FOREIGN KEY (idkursus)
REFERENCES Kursus (idkursus);

-- Alter table Siswa
ALTER TABLE Siswa
ADD CONSTRAINT PK_Siswa PRIMARY KEY (idsiswa);

ALTER TABLE Siswa
ADD CONSTRAINT FK_Siswa_Tingkat FOREIGN KEY (idtingkat)
REFERENCES Tingkatpendidikan (idtingkat);

-- Alter table Kursus
ALTER TABLE Kursus
ADD CONSTRAINT PK_Kursus PRIMARY KEY (idkursus);

ALTER TABLE Kursus
ADD CONSTRAINT FK_Kursus_Siswa FOREIGN KEY (idsiswa)
REFERENCES Siswa (idsiswa);

-- Alter table Materi
ALTER TABLE Materi
ADD CONSTRAINT PK_Materi PRIMARY KEY (idmateri);

ALTER TABLE Materi
ADD CONSTRAINT FK_Materi_Siswa FOREIGN KEY (idsiswa)
REFERENCES Siswa (idsiswa);

-- Alter table Tingkatpendidikan
ALTER TABLE Tingkatpendidikan
ADD CONSTRAINT PK_Tingkatpendidikan PRIMARY KEY (idtingkat);

-- Alter table Transaksi
ALTER TABLE Transaksi
ADD CONSTRAINT PK_Transaksi PRIMARY KEY (idtransaksi);

ALTER TABLE Transaksi
ADD CONSTRAINT FK_Transaksi_Kursus FOREIGN KEY (idkursus)
REFERENCES Kursus (idkursus);

ALTER TABLE Transaksi
ADD CONSTRAINT FK_Transaksi_Siswa FOREIGN KEY (idsiswa)
REFERENCES Siswa (idsiswa);

-- Alter table Memilih
ALTER TABLE Memilih
ADD CONSTRAINT FK_Memilih_Kursus FOREIGN KEY (idkursus)
REFERENCES Kursus (idkursus);

ALTER TABLE Memilih
ADD CONSTRAINT FK_Memilih_Siswa FOREIGN KEY (idsiswa)
REFERENCES Siswa (idsiswa);
