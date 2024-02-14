PROGRAM Prog(INPUT, OUTPUT);
VAR
  Ch, Flag: CHAR;
BEGIN
  WHILE NOT EOLN(INPUT)
    DO
      BEGIN
        READ(Ch);
        IF (Ch <> ' ') AND (NOT EOLN) AND (Flag = 'T')
        THEN
          BEGIN
            READ(Ch);
            WRITE(Ch);
          END;
        IF Ch = ' '
      END;
END.
