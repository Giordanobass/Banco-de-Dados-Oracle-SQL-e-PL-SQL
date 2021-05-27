DECLARE
  vValor NUMBER(8,2);
  vNome VARCHAR(30);
BEGIN
  SELECT valor, nome
  INTO vValor, vNome
  FROM tcurso
  WHERE cod_curso = &cod_Curso;
  Dbms_Output.Put_Line('Valor: '|| To_Char(vValor, 'fm9999.99'));

  Dbms_Output.Put_Line('Curso: '|| InitCap(vNome));
END;

SELECT * FROM tcurso;

DECLARE
  vDt_compra tcontrato.Data%TYPE;
  vDt_curso tcontrato.Data%TYPE;
BEGIN
  SELECT data, data + 10
  INTO vDt_compra, vDt_curso
  FROM tcontrato
  WHERE cod_contrato = &Contrato;
  Dbms_Output.Put_Line('Data compra: '|| vDt_compra);
  Dbms_Output.Put_Line('Data curso: '|| vDt_curso);
END;

SELECT * FROM tcontrato;

SELECT Max(cod_contrato) FROM tcontrato;
CREATE SEQUENCE SEQ_CONTRATO START WITH 8;

DECLARE
  vCod tcontrato.cod_contrato%TYPE;
BEGIN
  SELECT SEQ_CONTRATO.NEXTVAL
  INTO vCod FROM Dual;

  INSERT INTO TContrato(COD_CONTRATO, DATA,
                        COD_ALUNO, DESCONTO)
  VALUES(vCod, SYSDATE, 2, NULL);

  Dbms_Output.Put_Line('Criado contrato: '|| vCod);
END;

--Pegar o valor atual
SELECT seq_contrato.CURRVAL FROM Dual;

SELECT * FROM tcontrato;

--update
DECLARE
  vValor TCurso.Valor%TYPE := &Valor;
BEGIN
  UPDATE TCurso SET
  Valor = Valor + vValor
  WHERE carga_horaria >= 30;
END;

SELECT * FROM tcurso;

--delete
DECLARE
  vContrato TContrato.COD_CONTRATO%TYPE := &contrato;
BEGIN
  DELETE FROM TContrato
  WHERE Cod_Contrato = vContrato;
END;

SELECT * FROM tcontrato;

--erro no_data_found
--select into que nao encontra registros
DECLARE
  vdt_compra  tcontrato.data%TYPE;
  vTotal  tcontrato.total%TYPE;
  vDt_atual   DATE := SYSDATE;
BEGIN
  SELECT data, total
  INTO vdt_compra, vTotal
  FROM tcontrato
  WHERE Data = vDt_atual;
END;

DECLARE
  vContrato   NUMBER := &cod_contrato;
  vTexto VARCHAR(59);
BEGIN
  UPDATE TContrato SET
  desconto = desconto + 2
  WHERE Cod_Contrato >= VContrato;

  vtexto := SQL%ROWCOUNT;
  --Retorna qtde de registros afetados
  --pelo comando sql

  Dbms_Output.Put_Line(vtexto || ' linhas atualizadas.');
END;