CREATE TABLE TDESCONTO(
  CLASSE VARCHAR(2),
  INFERIOR INTEGER,
  SUPERIOR INTEGER
);

SELECT * FROM TDESCONTO;

INSERT INTO TDESCONTO(CLASSE, INFERIOR, SUPERIOR)
VALUES ('&cla', &inf, &sup);

SELECT * FROM TDESCONTO
WHERE CLASSE = '&cla';

UPDATE TDESCONTO SET
INFERIOR = &inf,
SUPERIOR = &sup
WHERE CLASSE = '&cla';

DELETE FROM TDESCONTO
WHERE CLASSE = '&cla';

--CRIANTE TABELA COPIA
CREATE TABLE TDESCONTO2 AS SELECT * FROM TDESCONTO;

SELECT * FROM TDESCONTO2;

COMMIT;

DELETE FROM TDESCONTO2;

ROLLBACK;


TRUNCATE TABLE TDESCONTO2;

SELECT * FROM TDESCONTO2;

SELECT * FROM TDESCONTO;

--Savepoint
SAVEPOINT upd_b;
UPDATE TDESCONTO SET
SUPERIOR = 88
WHERE CLASSE = 'B';

SAVEPOINT udp_a;
UPDATE TDESCONTO SET
SUPERIOR = 99
WHERE CLASSE = 'A';

--ponto de restaura��o
SAVEPOINT ins_Ok;
INSERT INTO tdesconto(classe,
inferior, superior)
VALUES('&cla', &inf, &sup);

SELECT * FROM TDESCONTO;

ROLLBACK TO SAVEPOINT ins_Ok;
ROLLBACK TO SAVEPOINT upd_a;
ROLLBACK TO SAVEPOINT upd_b;

DROP TABLE TDESCONTO2;