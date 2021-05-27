
--Bloco anonimo
DECLARE
  X INTEGER;
  Y INTEGER;
  C INTEGER;
BEGIN
  X:=10;
  Y:=20;
  C:= X+Y;
  Dbms_Output.Put_Line('Resultado: '||c);
END;

DECLARE
  VDESCONTO NUMBER(6,2) := 0.50;
  VCIDADE VARCHAR(30) := 'NOVO HAMBURGO';
  VCOD_ALUNO TALUNO.COD_ALUNO%TYPE := 5;--mesmo tipo da coluna cod_aluno de taluno
  VTOTAL NUMBER(8,2) := 1345.89;
BEGIN
  VTOTAL := Round(VTOTAL * VDESCONTO, 2);
  Dbms_Output.Put_Line('Total: '|| vTotal);
  VDESCONTO := 1.20;
  vCIDADE := InitCap(VCIDADE);
  Dbms_Output.Put_Line('Cidade: '||vCidade);
  Dbms_Output.Put_Line('Desconto: '|| VDESCONTO);
  Dbms_Output.Put_Line('Aluno: '||VCOD_ALUNO);
END;

SELECT * FROM TCURSO;
SELECT * FROM TALNO;

DECLARE
  vPreco1 NUMBER(8,2) := 10;
  vPreco2 NUMBER(8,2) := 20;
  vFlag BOOLEAN;
BEGIN
  vFlag := (vPreco1>vPreco2);
  IF(vFlag=TRUE) THEN
    Dbms_Output.Put_Line('Verdadeiro');
  ELSE
    Dbms_Output.Put_Line('False');
  END IF;
  IF(vPreco1>vPreco2) THEN
    Dbms_Output.Put_Line('vPreco1 é maior');
  ELSE
    Dbms_Output.Put_Line('vPreco2 é maior');
  END IF;
END;

--Bind variable
VARIABLE vDESCONTO2 NUMBER
DECLARE
  VCOD_ALUNO NUMBER := 1;
BEGIN
  :vDESCONTO2 := 0.90;
  Dbms_Output.Put_Line('desconto 2: '|| :vDESCONTO2);

  UPDATE TContrato SET
  TOTAL = TOTAL * :vDESCONTO2
  WHERE COD_ALUNO = VCOD_ALUNO;
END;

SELECT * FROM tcontrato;

--aninhamento
DECLARE
  VTESTE VARCHAR(10) :='JOSE';
BEGIN

  DECLARE
     VTESTE VARCHAR(10) := 'PEDRO';
  BEGIN
     Dbms_Output.Put_Line('BLOCO INTERNO: '||VTESTE);
  END;

  Dbms_Output.Put_Line('BLOCO EXTERNO: '||VTESTE);
END;