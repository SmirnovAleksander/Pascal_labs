PROGRAM SarahRevere(INPUT, OUTPUT); 

PROCEDURE Init(VAR W1, W2, W3, W4: CHAR; VAR Looking, Land, Sea: BOOLEAN);
BEGIN
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';
  Looking := TRUE;
  Land := FALSE;
  Sea := FALSE
END;

PROCEDURE MoveWindow(VAR W1, W2, W3, W4: CHAR; VAR Looking: BOOLEAN);
BEGIN
  W1 := W2;
  W2 := W3;
  W3 := W4;
  IF NOT EOLN
  THEN
    READ(W4)
  ELSE
    Looking := FALSE; 
END;

PROCEDURE CheckTheWindow(VAR W1, W2, W3, W4: CHAR; VAR Land, Sea, Looking: BOOLEAN);
BEGIN
  Land := (W1 = 'l') AND (W2 = 'a') AND (W3 = 'n') AND (W4 = 'd'); 
  Sea := (W2 = 's') AND (W3 = 'e') AND (W4 = 'a');
  Looking := NOT(EOLN)
END;

PROCEDURE Massage(VAR Land, Sea: BOOLEAN);
BEGIN
  IF Land
  THEN
    WRITELN('British are coming by land')
  ELSE
    IF Sea
    THEN
      WRITELN('British are coming be sea')
    ELSE
      WRITELN('Sarah didn''t say') 
END;

PROCEDURE SarahRevere();
VAR
  W1, W2, W3, W4: CHAR;
  Looking, Land, Sea: BOOLEAN;
BEGIN
  Init(W1, W2, W3, W4, Looking, Land, Sea);
  WHILE Looking AND NOT (Land OR Sea)   
  DO
    BEGIN
      MoveWindow(W1, W2, W3, W4, Looking);       
      CheckTheWindow(W1, W2, W3, W4, Land, Sea, Looking)
    END;
  Massage(Land, Sea)
END;
   
BEGIN {SarahRevere}   
  SarahRevere()     
END.  {SarahRevere} 



