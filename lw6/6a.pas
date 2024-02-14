PROGRAM SelectSort(INPUT, OUTPUT);
VAR
  Ch, Min: CHAR;
  F1, F2: TEXT;
BEGIN {SelectSort}
  REWRITE(F1);
  WRITE(OUTPUT, 'INPUT DATA:');
  READ(INPUT, Ch);
  WHILE Ch <> '#'
  DO
    BEGIN
      WRITE(F1, Ch);
      WRITE(OUTPUT, Ch);
      READ(INPUT, Ch)
    END;
  WRITELN(OUTPUT);
  WRITELN(F1, '#');
  WRITE(OUTPUT, 'SORTED DATA:');
  RESET(F1);
  READ(F1, Ch);
  WHILE Ch <> '#'
  DO
    BEGIN  
      WRITE(OUTPUT, Min);
      RESET(F1);
      READ(F1, Ch)
    END;
  WRITELN(OUTPUT);
END. {SelectSort}
