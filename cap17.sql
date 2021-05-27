
--record collections
DECLARE
  TYPE Rec_Aluno IS RECORD
  (
    cod_aluno NUMBER NOT NULL :=0,
    nome taluno.Nome%TYPE,
    cidade taluno.Cidade%TYPE
  );

  Registro rec_aluno;
BEGIN
  registro.cod_aluno := 50;
  registro.nome := 'Master';
  registro.cidade := 'Novo Hamburgo';
  Dbms_Output.Put_Line('Codigo: '|| registro.cod_aluno);
  Dbms_Output.Put_Line('  Nome: '|| registro.nome);
  Dbms_Output.Put_Line('Cidade: '|| registro.cidade);
END;

DECLARE
  reg taluno%ROWTYPE;--record
  vcep VARCHAR(10) := '98300000';
BEGIN
  SELECT cod_aluno, nome, cidade
  INTO reg.cod_aluno, reg.nome, reg.cidade
  FROM taluno
  WHERE cod_aluno = 1;

  vcep := '93500000';
  reg.cep := vCep;
  reg.salario := 1500;

  Dbms_Output.Put_Line('Codigo: '||reg.cod_aluno);
  Dbms_Output.Put_Line('Nome  : '||reg.nome);
  Dbms_Output.Put_Line('Cidade: '||reg.cidade);
  Dbms_Output.Put_Line('Salario   : '||reg.salario);
END;

DECLARE
  TYPE t_aluno IS TABLE OF taluno.nome%TYPE
  INDEX BY BINARY_INTEGER;--Matriz

  registro t_aluno;--record
BEGIN
  registro(1) := 'Marcio';
  registro(2) := 'Jose';
  registro(3) := 'Pedro';
  Dbms_Output.Put_Line('Nome 1: ' || registro(1));
  Dbms_Output.Put_Line('Nome 2: ' || registro(2));
  Dbms_Output.Put_Line('Nome 3: ' || registro(3));
END;

SELECT cod_aluno, nome
FROM taluno WHERE cod_aluno = 1;

DECLARE
  TYPE nome_type IS TABLE OF taluno.nome%TYPE;
  nome_table nome_type := nome_type(); --Criando Instancia
BEGIN
  nome_table.extend;--alucando uma nova linha
  nome_table(1) := 'Pedro';
  nome_table.extend;--alocando uma nova linha
  nome_table(2) := 'Marcio';
  Dbms_Output.Put_Line('Nome 1: '||nome_table(1));
  Dbms_Output.Put_Line('Nome 2: '||nome_table(2));
END;

DECLARE
  TYPE tipo IS TABLE OF VARCHAR2(30) INDEX BY VARCHAR2(2);
  uf_capital tipo;
BEGIN
  uf_capital('RS') := 'Porto Alegre';
  uf_capital('RJ') := 'Rio de Janeiro';
  uf_capital('PR') := 'Curitiba';
  uf_capital('MT') := 'Cuiaba';
  Dbms_Output.Put_Line(uf_capital('RS'));
  Dbms_Output.Put_Line(uf_capital('RJ'));
  Dbms_Output.Put_Line(uf_capital('PR'));
  Dbms_Output.Put_Line(uf_capital('MT'));
END;

DECLARE
  TYPE nome_varray IS VARRAY(5) OF taluno.nome%TYPE;
  nome_vetor nome_varray := nome_varray();
BEGIN
  nome_vetor.extend;
  nome_vetor(1) := 'Marcio';
  Dbms_Output.Put_Line(nome_vetor(1));
END;







