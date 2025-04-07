SET SERVEROUTPUT ON;

DECLARE
    v_nama VARCHAR2(30) := 'Haniva Azahra Salsabila';
    v_nim VARCHAR2(12) := '1234567890';
    v_tugas NUMBER := 80;
    v_latihan NUMBER := 80;
    v_uts NUMBER := 85;
    v_uas NUMBER := 90;
    v_nilaiAkhir NUMBER;

BEGIN 

    v_nilaiAkhir := (v_tugas + v_latihan + v_uts + v_uas)/4;
    DBMS_OUTPUT.PUT_LINE('NAMA        : ' || v_nama);
    DBMS_OUTPUT.PUT_LINE('NIM         : ' || v_nim);
    DBMS_OUTPUT.PUT_LINE('Nilai SBD   : ' || v_nilaiAkhir);

    --Nested Block Untuk Menambahkan IPK dan Index IPK nya --
    DECLARE
        v_ipk NUMBER := v_nilaiAkhir/25;
        v_indexIpk char(1);

    BEGIN 
        IF v_nilaiAkhir >= 85 THEN
            v_indexIpk := 'A';

        ELSIF v_nilaiAkhir >= 75 THEN
            v_indexIpk := 'B';

        ELSIF v_nilaiAkhir >= 65 THEN
            v_indexIpk := 'C';
        
        ELSIF v_nilaiAkhir >= 55 THEN
            v_indexIpk := 'D';

        ELSE v_indexIpk :='E';
        END IF;

    DBMS_OUTPUT.PUT_LINE('IPK         : ' || v_ipk);
    DBMS_OUTPUT.PUT_LINE('Index IPK   : ' || v_indexIpk);

    END;
    --Akhir dari Nested Block [Block bagian dalam]
END;
/

--Pada kesempatan kali ini kita akan mencoba untuk melakukan update data
-- sebagai bentuk penerapan SQL ke PL/SQL
--Adapun data yang akan diupdate adalah data mahasiswa dengan NIM 1234567890 menjadi 12350123200
--berikut caranya--