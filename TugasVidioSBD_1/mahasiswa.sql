CREATE TABLE mahasiswa (
    nim VARCHAR2(12) PRIMARY KEY,
    nama VARCHAR2(50),
    tugas NUMBER,
    latihan NUMBER,
    uts NUMBER,
    uas NUMBER
);
--input data
INSERT INTO mahasiswa (nim, nama, tugas, latihan, uts, uas) VALUES ('1234567890', 'Haniva Azzahra Salsabila', 80, 85, 90, 95);

COMMIT;
