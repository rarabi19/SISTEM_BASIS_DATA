SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE  tampilkan_pustakawan IS
    v_total NUMBER := 0;

BEGIN
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('DAFTAR PUSTAKAWAN PERPUSTAKAAN SUKA BACA');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------');

    FOR v_data IN (
        SELECT ID_PETUGAS, NAMA_PETUGAS, JABATAN, NO_TELEPON
        FROM PETUGAS_PERPUSTAKAAN
        WHERE JABATAN = 'Pustakawan'
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Id Petugas    : ' || v_data.ID_PETUGAS);
        DBMS_OUTPUT.PUT_LINE('Nama Petugas  : ' || v_data.NAMA_PETUGAS);
        DBMS_OUTPUT.PUT_LINE('Jabatan       : ' || v_data.JABATAN);
        DBMS_OUTPUT.PUT_LINE('No Telepon    : ' || v_data.NO_TELEPON);
        DBMS_OUTPUT.PUT_LINE('--------------------------------------------');

        v_total := v_total + 1;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('--------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Jumlah Pustakawan : ' || v_total || ' Orang');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------');
END;
/

BEGIN
    tampilkan_pustakawan;
END;
/