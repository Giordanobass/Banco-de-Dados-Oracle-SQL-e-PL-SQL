
DECLARE
  vcod_aluno taluno.cod_aluno%TYPE;
  vnome taluno.nome%TYPE;
  CURSOR cl IS
    SELECT cod_aluno, nome
    FROM taluno;
BEGIN
  OPEN cl;
  LOOP
    FETCH cl INTO vcod_aluno, vnome;
    EXIT WHEN cl%ROWCOUNT > 10 OR cl%NOTFOUND;
    Dbms_Output.Put_Line('Codigo: '||
      LPad(vcod_aluno,4,'0')|| ' - ' ||vnome);
  END LOOP;
  CLOSE cl;
END;

DECLARE
  CURSOR cl IS
    SELECT * FROM taluno;
    reg cl%ROWTYPE;
BEGIN
  OPEN cl;
  LOOP
    FETCH cl INTO reg;
    EXIT WHEN cl%ROWCOUNT > 10 OR cl%NOTFOUND;
    Dbms_Output.Put_Line('Codigo: '||
      LPad(reg.cod_aluno,5,'0')|| ' - ' || 'Nome: '|| reg.nome);
  END LOOP;
  CLOSE cl;
END;

DECLARE
  CURSOR cl IS
    SELECT * FROM taluno;
    reg taluno%ROWTYPE;
BEGIN
  FOR reg IN cl
  LOOP
    Dbms_Output.Put_Line('Codigo: '||
      LPad(reg.cod_aluno,5,'0')|| ' - ' || 'Nome: '|| reg.nome);
  END LOOP;
END;

DECLARE
    reg taluno%ROWTYPE;
BEGIN
  FOR reg IN (SELECT * FROM taluno)
  LOOP
    Dbms_Output.Put_Line('Codigo: '||
      LPad(reg.cod_aluno,5,'0')|| ' - ' || 'Nome: '|| reg.nome);
  END LOOP;
END;

DECLARE
  CURSOR cl (pcod_aluno NUMBER) IS
    SELECT * FROM taluno
    WHERE cod_aluno = pcod_aluno
  FOR UPDATE OF nome NOWAIT;
  --blequeia a coluna nome para alteração
  reg cl%ROWTYPE;
BEGIN
  OPEN cl(&codigo);
  FETCH cl INTO reg;
  Dbms_Output.Put_Line('Codigo: '||
      LPad(reg.cod_aluno,5,'0')|| ' - ' || 'Nome: '|| reg.nome);
  CLOSE cl;
END;


DECLARE
  CURSOR cl IS
    SELECT nome FROM taluno
  FOR UPDATE;
  reg_aluno cl%ROWTYPE;
BEGIN
  FOR reg_aluno IN cl
  LOOP
    UPDATE taluno
    SET nome = InitCap(reg_aluno.nome)
    WHERE CURRENT OF cl;
    Dbms_Output.Put_Line('Nome: '|| InitCap(reg_aluno.nome));
  END LOOP;
  COMMIT;
END;

SELECT * FROM taluno;
