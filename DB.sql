DROP TABLE guru
DROP TABLE siswa
DROP TABLE kursus
DROP TABLE materi
DROP TABLE tingkatpendidikan
DROP TABLE transaksi
DROP TABLE memilih

CREATE TABLE Guru
(
	idguru int NOT NULL,
	idkursus int NOT NULL,
	emailguru varchar(50),
	namaguru varchar(50),
	tarif int NOT NULL,
	email varchar(50),
	pass varchar(50)
)

CREATE TABLE Siswa
(
	idsiswa int NOT NULL,
	namasiswa varchar(50),
	tingkat varchar(50),
	asalsekolah varchar(50),
	email varchar(50),
	pass varchar(50),
	idtingkat int
)

CREATE TABLE Kursus
(
	idkursus int NOT NULL,
	tanggalpertemuan date,
	idsiswa int NOT NULL
)

CREATE TABLE Materi
(
	idmateri int NOT NULL,
	idsiswa int NOT NULL,
	namaguru varchar(50),
	tarif int NOT NULL,
	email varchar(50),
	pass varchar(50)
)

CREATE TABLE Tingkatpendidikan
(
	idtingkat int NOT NULL,
	tingkat int NOT NULL
)

CREATE TABLE Transaksi
(
	idtransaksi int NOT NULL,
	tanggaltransaksi date,
	idkursus int NOT NULL,
	idsiswa int NOT NULL
)

CREATE TABLE Memilih
(
	idkursus int NOT NULL,
	idsiswa int NOT NULL
)

ALTER TABLE Guru
	ADD CONSTRAINT [PK-Guru]
	PRIMARY KEY
	(
		idguru
	)
	ALTER TABLE Guru
	ADD CONSTRAINT [FK-Guru-Kursus]
	FOREIGN KEY (idkursus) REFERENCES Kursus (idkursus)

ALTER TABLE Siswa
	ADD CONSTRAINT [PK-siswa]
	PRIMARY KEY
	(
		idsiswa
	)
	ALTER TABLE Siswa
	ADD CONSTRAINT [FK-siswa-tingkatPENDIDIKAN]
	FOREIGN KEY (idtingkat) REFERENCES Tingkatpendidikan (idtingkat)

ALTER TABLE Kursus
	ADD CONSTRAINT [PK-kursus]
	PRIMARY KEY
	(
		idkursus
	)
ALTER TABLE Kursus
	ADD CONSTRAINT [FK-kursus-siswa]
	FOREIGN KEY (idsiswa) REFERENCES siswa (idsiswa)

ALTER TABLE Materi
	ADD CONSTRAINT [PK-materi]
	PRIMARY KEY
	(
		idmateri
	)
ALTER TABLE Materi
	ADD CONSTRAINT [FK-Materi-siswa]
	FOREIGN KEY (idsiswa) REFERENCES siswa (idsiswa)

ALTER TABLE Tingkatpendidikan
	ADD CONSTRAINT [PK-tingkatpendidikan]
	PRIMARY KEY
	(
		idtingkat
	)

ALTER TABLE Transaksi
	ADD CONSTRAINT [PK-Transaksi]
	PRIMARY KEY
	(
		idtransaksi
	)
ALTER TABLE Transaksi
	ADD CONSTRAINT [PK-transaksi-Kursus]
	FOREIGN KEY (idkursus) REFERENCES Kursus (idkursus),
	CONSTRAINT [PK-transaksi-Siswa]
	FOREIGN KEY (idsiswa) REFERENCES Siswa (idsiswa)

ALTER TABLE Memilih
	ADD CONSTRAINT [FK-memilih-kursus]
	FOREIGN KEY (idkursus) REFERENCES Kursus (idkursus),
	CONSTRAINT [FK-memilih-Siswa]
	FOREIGN KEY(idsiswa) REFERENCES Siswa (idsiswa)

