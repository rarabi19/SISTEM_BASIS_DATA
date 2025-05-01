CREATE OR REPLACE PROCEDURE tambah_petugas_baru(
    p_id_petugas IN VARCHAR2,
    p_nama_petugas IN VARCHAR2,
    p_jabatan IN VARCHAR2,
    p_no_telepon IN VARCHAR2
) IS
BEGIN
    INSERT INTO PETUGAS_PERPUSTAKAAN(ID_PETUGAS, NAMA_PETUGAS, JABATAN, NO_TELEPON)
    VALUES (p_id_petugas, p_nama_petugas, p_jabatan, p_no_telepon);

    -- agar tersimpan--
    COMMIT;
END;
/
    -- panggil prosedur yang sudah kita buat
    EXEC tambah_petugas_baru('P052', 'Zahra Salsabila','Operator 2','081234567890');