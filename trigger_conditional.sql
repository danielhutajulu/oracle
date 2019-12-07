CREATE OR REPLACE TRIGGER "ST_UPDATE_KONVERSI_ANGKA_HURUF" 
AFTER INSERT ON ST_UJIAN_DES
FOR EACH ROW
 
DECLARE
 konversi char(1);

BEGIN

	IF (:NEW.angka > 79) THEN
		konversi := 'A';
	END IF;
	
	IF (69 < :NEW.angka) and (:NEW.angka < 80) THEN
         konversi := 'B';
	END IF;
	
	IF (59 < :NEW.angka) and (:NEW.angka < 70) THEN
         konversi := 'C';
	END IF;
 
	IF (49 < :NEW.angka) and (:NEW.angka < 60) THEN
         konversi := 'D';
	END IF;
	
	IF (:NEW.angka < 50) THEN
         konversi := 'E';
	END IF;
	
	INSERT INTO ST_REKAP_DES
        VALUES(:NEW.NIM, :NEW.KD_MK, konversi);
END;

select * from ST_REKAP_DES

SELECT * FROM ST_UJIAN_DES

INSERT INTO ST_UJIAN_DES
VALUES ('20180801384','666404','59');

