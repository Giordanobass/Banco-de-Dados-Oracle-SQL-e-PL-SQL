

SELECT * FROM TALUNO;

SELECT Concat(COD_ALUNO, NOME) FROM TALUNO;

SELECT COD_ALUNO||' - '||NOME FROM TALUNO;

SELECT NOME, InitCap(NOME) FROM TALUNO;

SELECT NOME, InStr(NOME, 'R') FROM TALUNO;

SELECT NOME, Length(NOME) FROM TALUNO;

SELECT NOME, Lower(NOME) FROM TALUNO;

SELECT InitCap('JOSE DA SILVA') FROM TALUNO;

SELECT COD_ALUNO, LPad(COD_ALUNO, 5, '0') FROM TALUNO;

SELECT NOME, SALARIO, RPad(SALARIO,8,'0') FROM TALUNO;

SELECT NOME, RPad(NOME, 10, '$') FROM TALUNO;

SELECT NOME, SubStr(NOME, 1,3) FROM TALUNO;

SELECT SubStr(NOME, 1,1) FROM TALUNO;

SELECT NOME, SubStr(NOME, 3,1) FROM TALUNO;

SELECT REPLACE(NOME, 'R', '$') FROM TALUNO;

SELECT REPLACE(Upper(NOME), 'R', '$') FROM TALUNO;   -- transformo o R maiusculo

SELECT SubStr(NOME, Length(NOME), 1) FROM TALUNO;



SELECT * FROM TALUNO WHERE Lower(NOME) = 'marcio';

SELECT * FROM TALUNO WHERE Upper(NOME) = 'MARCIO';

SELECT * FROM TALUNO WHERE Upper(SubStr(CIDADE, 1,3)) = 'CAN';

UPDATE TALUNO SET SALARIO = 633.47 WHERE COD_ALUNO = 1;

SELECT SALARIO,
        REPLACE(SALARIO, ',', ''),
          RPad(SALARIO, 10,'0'),
          LPad(SALARIO, 10,'0'),
          LPad(REPLACE(SALARIO, ',', ''), 10,'0') FROM TALUNO;



-------DATA
SELECT * FROM DUAL;

--SysDate retorna data/hora do Servidor.
SELECT SYSDATE FROM DUAL;

-- Round e Trunc
SELECT Round(45.925, 2), --45.93
       Trunc(45.929, 2), --45.92
       Mod(10, 2) AS RESTO_DIVISAO,
       Trunc(1.99),
       Trunc(1.99, 2) FROM DUAL;

SELECT * FROM TCONTRATO;

-- Funcoes de Data/Hora
SELECT DATA, SYSDATE, DATA + 5  TCONTRATO;

SELECT SYSDATE - DATA AS DIF_DIAS FROM TCONTRATO;

SELECT Trunc(SYSDATE - DATA) AS DIAS FROM TCONTRATO;

SELECT SYSDATE + 2 / 24 AS ADD_HORAS FROM TCONTRATO;

SELECT SYSDATE + 15 / 1440 AS ADD_MINUTOS FROM TCONTRATO;

SELECT SYSDATE + 30 / (3600 * 24) AS ADD_SEGUNDOS FROM TCONTRATO;

--HORA FICA 00:00:00
SELECT SYSDATE, Trunc(SYSDATE) FROM DUAL;

-- DIFERENCA DE MESES ENTRE DATAS
SELECT MONTHS_BETWEEN(SYSDATE, SYSDATE-90) AS DIF_MES FROM DUAL;

--ADICIONA MESES
SELECT ADD_Months(SYSDATE, 5) AS ADICIONA_MES_DATA FROM DUAL;

SELECT NEXT_DAY(SYSDATE, 'QUARTA-FEIRA') AS PROXIMA_QUARTA_DATA FROM DUAL;

SELECT LAST_DAY(SYSDATE) AS ULTIMO_DIA_MES FROM DUAL;

SELECT Round(SYSDATE, 'MONTH') AS PRIMEIRO_DIA_PROXIMO_MES FROM DUAL;

SELECT Trunc(SYSDATE, 'MONTH') AS PRIMEIRO_DIA_PROXIMO_MES FROM DUAL;



--FORMATA?AO DE DATA

--CONVERSOR TO_CHAR(DATA, FORMATO)
SELECT SYSDATE, To_Char(SYSDATE, 'DD') FROM DUAL;

SELECT To_Char(SYSDATE, 'DD/MM/YYYY') DATA FROM DUAL;

SELECT To_Char(SYSDATE, 'DD/MM') DIA_MES FROM DUAL;

SELECT To_Char(SYSDATE, 'DD') DIA FROM DUAL;

SELECT To_Char(SYSDATE, 'MM') MES FROM DUAL;

SELECT To_Char(SYSDATE, 'YYYY') ANO FROM DUAL;

SELECT To_Char(SYSDATE, 'YY') ANO FROM DUAL;

SELECT To_Char(SYSDATE, 'MONTH') MES1 FROM DUAL;

SELECT To_Char(SYSDATE, 'D') DIA_SEMANA FROM DUAL;

SELECT To_Char(SYSDATE, 'DY') DIA_SEMANA FROM DUAL;

SELECT To_Char(SYSDATE, 'DAY') DIA_SEMANA FROM DUAL;

SELECT To_Char(SYSDATE, 'YEAR') ANO FROM DUAL;

SELECT To_Char(SYSDATE, ' "NOVO HAMBURGO, " FMDAY "," DD "DE" FMMONTH "DE" YYYY') FROM DUAL;

SELECT To_Char(SYSDATE, 'HH24:MI') HORA_MIN FROM DUAL;

SELECT To_Char(SYSDATE, 'HH24:MI:SS') HORA_MIN_SEG FROM DUAL;

SELECT To_Char(SYSDATE, 'DD/MM HH24:MI') DATA_HORA FROM DUAL;

SELECT To_Char(SYSDATE, 'DD/MM/YYYY HH24:MI:SS') DATA_HORA FROM DUAL;


--L -> R$
--G -> PONTO
--D - > CASAS DECIMAIS

SELECT * FROM TALUNO;

SELECT Trim(To_Char(SALARIO, 'L9999.99')) SALARIO1, Trim(To_Char(SALARIO,'L9999D99')) SALARIO1 FROM TALUNO;

SELECT 'R$ '||(Round(SALARIO,2)) AS SALARIO FROM TALUNO;

SELECT TOTAL, DESCONTO, DESCONTO+TOTAL, NVL(DESCONTO, 0), NVL(DESCONTO,0) + TOTAL, NvL2(DESCONTO, TOTAL, -1) FROM TCONTRATO;

UPDATE TALUNO SET NOME = NULL WHERE COD_ALUNO = 4;

SELECT COD_ALUNO, Nvl(NOME, 'SEM NOME') FROM TALUNO;

SELECT * FROM TALUNO;

UPDATE TALUNO SET ESTADO = 'AC' WHERE COD_ALUNO = 2;

UPDATE TALUNO SET ESTADO = 'SC' WHERE COD_ALUNO = 4;

UPDATE TALUNO SET ESTADO = 'RJ' WHERE COD_ALUNO = 5;

SELECT NOME, ESTADO, CASE WHEN ESTADO = 'RS' THEN 'GAUCHO' WHEN Upper(ESTADO) = 'AC' THEN 'ACREANO'
WHEN ESTADO = 'RJ' AND SALARIO > 500 THEN 'CARIOCA' ELSE 'OUTROS' END AS APELIDO FROM TALUNO;

SELECT NOME, ESTADO, Decode(ESTADO, 'RS', 'GAUCHO',
                                    'AC', 'ACREANO',
                                    'SP', 'PAULISTA',
                                          'OUTROS') AS APELIDO FROM TALUNO;





