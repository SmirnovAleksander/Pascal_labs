PROGRAM LastChar(INPUT, OUTPUT);
VAR
  Ch: CHAR;
BEGIN
  IF NOT EOLN
  THEN 
    BEGIN
      READ(Ch);
      WHILE NOT EOLN(INPUT)
      DO
        BEGIN
          WRITE(Ch);
          READ(Ch)
        END
    END;
  WRITELN
END.
