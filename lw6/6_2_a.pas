PROGRAM SelectSort(INPUT, OUTPUT);
VAR
  Ch, Next: CHAR;
  Odds, Evens: TEXT;
BEGIN {Split}
  REWRITE(Odds);
  REWRITE(Evens);
  Next:= 'O';
  READ(INPUT, Ch);
  WHILE Ch <> '#'
  DO
    BEGIN
      IF Next = 'O'
      THEN
        BEGIN
          WRITE(Odds, Ch);
          Next:= 'E';
          WRITE('O')
        END
      ELSE
        BEGIN
          WRITE(Evens, Ch);
          Next:= 'O';
          WRITE('E')
        END;
      READ(INPUT, Ch)
    END;
  WRITELN(Odds, '#');
  WRITELN(Evens, '#')
END. {Split}

