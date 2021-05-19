
SELECT COD_ALUNO, NOME, CIDADE FROM TALUNO;

SELECT COD_ALUNO AS "Codigo", NOME AS "Nome do Aluno" FROM TALUNO;

SELECT CIDADE FROM TALUNO;

SELECT DISTINCT CIDADE FROM TALUNO;

SELECT CIDADE, COD_ALUNO FROM TALUNO ORDER BY CIDADE;

SELECT NOME AS CURSO, VALOR, VALOR/CARGA_HORARIA, Round(VALOR/CARGA_HORARIA,2) AS VALOR_HORA
FROM TCURSO ORDER BY VALOR_HORA;

ALTER TABLE TCURSO RENAME COLUMN CARCA_HORARIA TO CARGA_HORARIA;

SELECT * FROM TCONTRATO;

UPDATE TCONTRATO SET DESCONTO = NULL WHERE COD_CONTRATO = 4;

SELECT COD_CONTRATO, TOTAL, DESCONTO, TOTAL+DESCONTO FROM TCONTRATO;

SELECT COD_CONTRATO, DESCONTO, Nvl(DESCONTO, 0), TOTAL, TOTAL + Nvl(DESCONTO,0)
AS TOTAL_MAIS_DESCONTO FROM TCONTRATO;

SELECT COD_ALUNO || '-' || NOME || '//' || CIDADE AS ALUNO FROM TALUNO ORDER BY COD_ALUNO;

INTEGER -1, 2 -- numero inteiro -> number(38)

NUMBER(5.2) -- 999,2
NUMERIC(5,2)  -- 999,2

DATE -- '10/03/2111 00:00:00'

VARCHAR(10) -- Sinonimo de VARCHAR2
VARCHAR2(10) -- 'Giordano'

CHAR(10)

COMMIT;
