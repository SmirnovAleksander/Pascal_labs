PROGRAM CountCh(INPUT, OUTPUT);
USES Count3;
VAR 
  V1, V10, V100, Ch: CHAR;
BEGIN
  Start;
  WHILE NOT EOLN(INPUT)
  DO 
    BEGIN
      READ(INPUT, Ch);
      Bump;
    END;
  Value(V100, V10, V1);
  WRITE(V100, V10, V1)
END.
