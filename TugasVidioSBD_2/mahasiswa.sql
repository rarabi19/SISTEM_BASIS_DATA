CREATE TABLE DataMahasiswa (
    nim           VARCHAR2(10) PRIMARY KEY,
    nama          VARCHAR2(100),
    angkatan      NUMBER(4),
    total_sks     NUMBER(3),
    jurusan       VARCHAR2(100)
);

-- Insert 50 Data Mahasiswa :

INSERT INTO DataMahasiswa VALUES ('220001', 'Aldi Nugraha',     2022, 68, 'Informatika');
INSERT INTO DataMahasiswa VALUES ('220002', 'Rina Lestari',     2022, 54, 'Sistem Informasi');
INSERT INTO DataMahasiswa VALUES ('210003', 'Budi Santoso',     2021, 20, 'Teknik Elektro');
INSERT INTO DataMahasiswa VALUES ('210004', 'Dewi Anggraini',   2021, 16, 'Informatika');
INSERT INTO DataMahasiswa VALUES ('230005', 'Fitri Amalia',     2023, 12, 'Sistem Informasi');
INSERT INTO DataMahasiswa VALUES ('230006', 'Andi Prasetyo',    2023, 74, 'Teknik Mesin');
INSERT INTO DataMahasiswa VALUES ('220007', 'Lina Marlina',     2022, 22, 'Informatika');
INSERT INTO DataMahasiswa VALUES ('220008', 'Rizky Maulana',    2022, 49, 'Sistem Informasi');
INSERT INTO DataMahasiswa VALUES ('210009', 'Siti Nurhaliza',   2021, 25, 'Informatika');
INSERT INTO DataMahasiswa VALUES ('210010', 'Fajar Hidayat',    2021, 15, 'Teknik Elektro');
INSERT INTO DataMahasiswa VALUES ('230011', 'Wulan Puspita',    2023, 9,  'Sistem Informasi');
INSERT INTO DataMahasiswa VALUES ('230012', 'Dimas Aditya',     2023, 13, 'Informatika');
INSERT INTO DataMahasiswa VALUES ('220013', 'Tari Utami',       2022, 21, 'Sistem Informasi');
INSERT INTO DataMahasiswa VALUES ('220014', 'Eko Ramadhan',     2022, 17, 'Teknik Elektro');
INSERT INTO DataMahasiswa VALUES ('210015', 'Salsa Kirana',     2021, 85, 'Informatika');
INSERT INTO DataMahasiswa VALUES ('210016', 'Yuda Permana',     2021, 14, 'Teknik Mesin');
INSERT INTO DataMahasiswa VALUES ('230017', 'Irfan Hidayat',    2023, 10, 'Informatika');
INSERT INTO DataMahasiswa VALUES ('230018', 'Citra Dewi',       2023, 11, 'Sistem Informasi');
INSERT INTO DataMahasiswa VALUES ('220019', 'Nina Kurnia',      2022, 20, 'Informatika');
INSERT INTO DataMahasiswa VALUES ('220020', 'Robby Saputra',    2022, 18, 'Teknik Mesin');
INSERT INTO DataMahasiswa VALUES ('210021', 'Putri Andini',     2021, 22, 'Informatika');
INSERT INTO DataMahasiswa VALUES ('210022', 'Gilang Ramadhan',  2021, 19, 'Sistem Informasi');
INSERT INTO DataMahasiswa VALUES ('230023', 'Indah Lestari',    2023, 12, 'Teknik Elektro');
INSERT INTO DataMahasiswa VALUES ('230024', 'Raka Prabowo',     2023, 16, 'Informatika');
INSERT INTO DataMahasiswa VALUES ('220025', 'Farah Nabila',     2022, 24, 'Sistem Informasi');
INSERT INTO DataMahasiswa VALUES ('220026', 'Hendra Wijaya',    2022, 17, 'Informatika');
INSERT INTO DataMahasiswa VALUES ('210027', 'Nadia Salsabila',  2021, 21, 'Teknik Elektro');
INSERT INTO DataMahasiswa VALUES ('210028', 'Agung Prasetya',   2021, 18, 'Sistem Informasi');
INSERT INTO DataMahasiswa VALUES ('230029', 'Mega Oktaviani',   2023, 9,  'Informatika');
INSERT INTO DataMahasiswa VALUES ('230030', 'Arif Kurniawan',   2023, 11, 'Teknik Mesin');
INSERT INTO DataMahasiswa VALUES ('220031', 'Ayu Ramadhani',    2022, 23, 'Informatika');
INSERT INTO DataMahasiswa VALUES ('220032', 'Dedi Saputra',     2022, 19, 'Sistem Informasi');
INSERT INTO DataMahasiswa VALUES ('210033', 'Melati Puspita',   2021, 20, 'Teknik Mesin');
INSERT INTO DataMahasiswa VALUES ('210034', 'Yoga Nugroho',     2021, 15, 'Informatika');
INSERT INTO DataMahasiswa VALUES ('230035', 'Shinta Maharani',  2023, 63, 'Sistem Informasi');
INSERT INTO DataMahasiswa VALUES ('230036', 'Bagas Pamungkas',  2023, 10, 'Teknik Elektro');
INSERT INTO DataMahasiswa VALUES ('220037', 'Anisa Rahmawati',  2022, 21, 'Informatika');
INSERT INTO DataMahasiswa VALUES ('220038', 'Fikri Hakim',      2022, 20, 'Teknik Mesin');
INSERT INTO DataMahasiswa VALUES ('210039', 'Nur Azizah',       2021, 24, 'Sistem Informasi');
INSERT INTO DataMahasiswa VALUES ('210040', 'Bayu Wicaksono',   2021, 22, 'Informatika');
INSERT INTO DataMahasiswa VALUES ('230041', 'Lutfi Mubarok',    2023, 8,  'Sistem Informasi');
INSERT INTO DataMahasiswa VALUES ('230042', 'Rani Andini',      2023, 14, 'Teknik Mesin');
INSERT INTO DataMahasiswa VALUES ('220043', 'Zaki Ramadhan',    2022, 19, 'Informatika');
INSERT INTO DataMahasiswa VALUES ('220044', 'Yuniar Lestari',   2022, 22, 'Sistem Informasi');
INSERT INTO DataMahasiswa VALUES ('210045', 'Rio Setiawan',     2021, 17, 'Teknik Elektro');
INSERT INTO DataMahasiswa VALUES ('210046', 'Bella Ardianti',   2021, 20, 'Informatika');
INSERT INTO DataMahasiswa VALUES ('230047', 'Hana Amalia',      2023, 9,  'Sistem Informasi');
INSERT INTO DataMahasiswa VALUES ('230048', 'Tegar Pratama',    2023, 15, 'Informatika');
INSERT INTO DataMahasiswa VALUES ('220049', 'Naufal Rizky',     2022, 16, 'Teknik Mesin');
INSERT INTO DataMahasiswa VALUES ('220050', 'Rafa Syahputra',   2022, 18, 'Sistem Informasi');
INSERT INTO DataMahasiswa VALUES ('210051', 'Dina Safitri',     2021, 33, 'Informatika');
INSERT INTO DataMahasiswa VALUES ('210052', 'Dimas Prabowo',    2021, 14, 'Teknik Elektro');                

COMMIT;
--  
