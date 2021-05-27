
DECLARE
  vcod taluno.cod_aluno%TYPE :=566;
  vcidade taluno.cidade%TYPE;
  x NUMBER;
BEGIN
  SELECT cidade INTO vcidade
  FROM taluno
  --where nome like '%';
  WHERE cod_aluno = vcod;
  x := 0/0;
  Dbms_Output.Put_Line('Cidade: '||vcidade);
EXCEPTION
  WHEN No_Data_Found THEN
    Raise_Application_Error(-20001,
    'Aluno Inexistente! '||SQLCODE||' '||SQLERRM);
  WHEN too_many_rows THEN
    Raise_Application_Error(-20002,
    'Registro Duplicado! '||SQLCODE||' '||SQLERRM);
  WHEN others THEN
    Raise_Application_Error(-20003,
    'Exceção Desconhecida! '||SQLCODE||' '||SQLERRM);
END;

DECLARE
  vcod taluno.cod_aluno%TYPE :=1;
  vcidade taluno.cidade%TYPE;
  x NUMBER;
BEGIN
  SELECT cidade INTO vcidade
  FROM taluno
  WHERE nome like '%';
  --WHERE cod_aluno = vcod;
  x := 0/0;
  Dbms_Output.Put_Line('Cidade: '||vcidade);
EXCEPTION
  WHEN No_Data_Found THEN
    Raise_Application_Error(-20001,
    'Aluno Inexistente! '||SQLCODE||' '||SQLERRM);
  WHEN too_many_rows THEN
    Raise_Application_Error(-20002,
    'Registro Duplicado! '||SQLCODE||' '||SQLERRM);
  WHEN others THEN
    Raise_Application_Error(-20003,
    'Exceção Desconhecida! '||SQLCODE||' '||SQLERRM);
END;

DECLARE
  vcod taluno.cod_aluno%TYPE :=1;
  vcidade taluno.cidade%TYPE;
  x NUMBER;
BEGIN
  SELECT cidade INTO vcidade
  FROM taluno
  WHERE cod_aluno = vcod;
  --WHERE cod_aluno = vcod;
  x := 0/0;
  Dbms_Output.Put_Line('Cidade: '||vcidade);
EXCEPTION
  WHEN No_Data_Found THEN
    Raise_Application_Error(-20001,
    'Aluno Inexistente! '||SQLCODE||' '||SQLERRM);
  WHEN too_many_rows THEN
    Raise_Application_Error(-20002,
    'Registro Duplicado! '||SQLCODE||' '||SQLERRM);
  WHEN others THEN
    Raise_Application_Error(-20003,
    'Exceção Desconhecida! '||SQLCODE||' '||SQLERRM);
END;

SELECT * FROM taluno;

CREATE TABLE contas
(
  codigo      INTEGER NOT NULL PRIMARY KEY,
  valor       NUMBER(10, 2),
  juros       NUMBER(10, 2),
  vencimento  DATE
);

INSERT INTO contas VALUES(100, 550, 50, SYSDATE-10);

SELECT * FROM contas;

COMMIT;


DECLARE
  vdt_vencimento DATE;
  vconta NUMBER := 100;
  econta_vencida EXCEPTION;
BEGIN
  SELECT vencimento INTO vdt_vencimento
  FROM contas WHERE codigo = vconta;
  IF vdt_vencimento < Trunc(SYSDATE) THEN
    RAISE econta_vencida;
  END IF;
EXCEPTION
  WHEN econta_vencida THEN
  Dbms_Output.Put_Line('Conta vencida');
  UPDATE contas SET valor = valor + juros
  WHERE codigo = vconta;
END;


DECLARE
  efk_inexistente EXCEPTION;
  PRAGMA EXCEPTION_INIT(efk_inexistente, -02291);
BEGIN
 INSERT INTO tbairro VALUES(100, 100, 'ERRO');
EXCEPTION
  WHEN efk_inexistente THEN
    Raise_Application_Error(-20200,
    'Cidade não existe! '||SQLCODE||' '||SQLERRM);
END;

SELECT * FROM taluno;
SELECT * FROM tcidade;
