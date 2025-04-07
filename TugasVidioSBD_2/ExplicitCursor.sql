SET SERVEROUTPUT ON;

DECLARE 
    v_angkatan NUMBER := 2022;
    v_sks      NUMBER := 30;
    counter    NUMBER := 0; --guna menghitung jumlah data mahasiswa yang ditampilkan nantinya

-- Cursor dengan Parameternya : 
    CURSOR c_mahasiswa (angkatan_pr NUMBER, sks_pr NUMBER) IS 
        SELECT nim, nama, total_sks, jurusan FROM DataMahasiswa
        WHERE angkatan = angkatan_pr
        AND total_sks < sks_pr;

BEGIN 
    -- Bagian Kopi Header :
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('DAFTAR ANGKATAN ' || v_angkatan || ' DENGAN SKS DIBAWAH ' || v_sks || ' : ');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------');

    --loop dengan Cursor :
    FOR mhs_data IN c_mahasiswa(v_angkatan, v_sks) LOOP
        DBMS_OUTPUT.PUT_LINE('NIM        :' || mhs_data.nim);
        DBMS_OUTPUT.PUT_LINE('NAMA       :' || mhs_data.nama);
        DBMS_OUTPUT.PUT_LINE('TOTAL SKS  :' || mhs_data.total_sks);
        DBMS_OUTPUT.PUT_LINE('JURUSAN    :' || mhs_data.jurusan);
        DBMS_OUTPUT.PUT_LINE('--------------------------------------------------');
        counter := counter + 1; --menambah jumlah data mahasiswa yang ditampilkan
    END LOOP;

    IF counter = 0 THEN  --Menampilkan total mahasiswa yang di tampilkan dan pesan seandainya tidak ada data yang sesuai
        DBMS_OUTPUT.PUT_LINE('Tidak Ada Mahasiswa Angkatan '|| v_angkatan || ' dengan SKS dibawah ' || v_sks || ' : -');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Total Mahasiswa Angkatan '|| v_angkatan || ' dengan SKS dibawah ' || v_sks || '  adalah : ' || counter);
    END IF;
END;
/