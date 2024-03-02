PROGRAM SarahRevere(INPUT, OUTPUT);
VAR 
  W1, W2, W3, W4: CHAR;
  Looking, Land, Sea: BOOLEAN;
BEGIN
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';
  Looking := NOT(EOLN);
  Land := False;
  Sea := False;
  WHILE Looking AND NOT(Land OR Sea)
  DO
    BEGIN
      W1 := W2;
      W2 := W3;
      W3 := W4;
      READ(W4);
      Looking := NOT EOLN;
      Land := (W1 = 'L') AND (W2 = 'a') AND (W3 = 'n') AND (W4 = 'd');
      Sea := (W2 = 'S') AND (W3 = 'e') AND (W4 = 'a');
    END;
  IF Land
  THEN
    WRITELN('The British are coming by Land')
  ELSE
    IF Sea 
    THEN 
      WRITELN('The British are coming by Sea')
    ELSE
      WRITELN('Sarah didn''t say')      
END.
