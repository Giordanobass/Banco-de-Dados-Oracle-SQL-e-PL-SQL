
DECLARE
  vNome VARCHAR(30) := 'Carioca';
  vCidade VARCHAR(30);
  VEstado VARCHAR(2);
BEGIN
  IF(vNome = 'Gaucho') THEN
    vCidade :='Porto Alegre';
    vEstado :='RS';
  ELSIF(vNome = 'Carioca') THEN
    vCidade := 'Rio de Janeiro';
    vEstado := 'RJ';
  ELSE
    IF(vEstado = 'SP') THEN
      vCidade :='Paulista';
    ELSE
      vCidade :='Outros';
      vEstado := 'XX';
    END IF;
  END IF;
  Dbms_Output.Put_Line(vCidade || ' - '||vEstado);
END;

--Case when
DECLARE
  vEstado VARCHAR(2) := 'PR';
  vNome VARCHAR(30);
BEGIN
  CASE
    WHEN vEstado = 'RS' THEN vNome := 'Gaucho';
    WHEN vEstado = 'RJ' OR vEstado = 'ES' THEN vNome := 'Carioca';
  ELSE
  vNome := 'Outros';
  END CASE;
  Dbms_Output.Put_Line('Apelido: '|| vNome);
END;

--laço de repetição
DECLARE
  vContador INTEGER := 0;
BEGIN
  LOOP
    vContador := vContador + 1;
    Dbms_Output.Put_Line(vContador);
    EXIT WHEN vContador = 10;
  END LOOP;
  Dbms_Output.Put_Line('Fim do LOOP');
END;

--for loop -> mais indicado para laços em tabelas
DECLARE
  vContador INTEGER;
BEGIN
  FOR vContador IN 1..10
  LOOP
    --vContador := vContador + 1;
    Dbms_Output.Put_Line(vContador);
    --EXIT WHEN vContador = 5;
  END LOOP;
END;

--while loop
DECLARE
  vContador INTEGER := 0;
  vTexto VARCHAR(10);
BEGIN
  WHILE vContador < 10
  LOOP
    vContador := vContador + 1;
    IF(vContador Mod 2) = 0 THEN
      vTexto := 'Par';
    ELSE
      vTexto := 'Impar';
    END IF;
    Dbms_Output.Put_Line(vContador|| ' -> '||vTexto);
    --exit when vContador = 10;
  END LOOP;
END;