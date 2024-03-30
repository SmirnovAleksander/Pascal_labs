PROGRAM ProgRecursiveSort(INPUT, OUTPUT);
VAR
  InputFile: TEXT;
  
PROCEDURE CopyFile(VAR F1, F2: TEXT);
VAR
  Ch: CHAR;
BEGIN {CopyFileLn}
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      READ(F1, Ch);
      WRITE(F2, Ch)
    END;
  WRITELN(F2)
END; {CopyFileLn}

PROCEDURE Split(VAR F1, F2, F3: TEXT);
{????????? F1 ?? F2, F3}
VAR 
  Ch, Switch: CHAR;
BEGIN {Split}
  RESET(F1);
  REWRITE(F2);
  REWRITE(F3);
  Switch := '2';
  WHILE NOT (EOLN(F1))
  DO
    BEGIN
      READ(F1, Ch);
      IF (Switch = '2')
      THEN
        BEGIN
          WRITE(F2, Ch);
          Switch := '3';
        END
      ELSE
        BEGIN
          WRITE(F3, Ch);
          Switch := '2';
        END
    END;
  WRITELN(F2);
  WRITELN(F3);
END; {Split}

PROCEDURE Merge(VAR F1, F2, F3: TEXT);
VAR 
  Ch2, Ch3: CHAR;
BEGIN {Merge}
  RESET(F2);
  RESET(F3);
  REWRITE(F1);
  IF NOT EOLN(F2)
  THEN
    READ(F2, Ch2);
  IF NOT EOLN(F3)
  THEN
    READ(F3, Ch3);
  WHILE (NOT(EOLN(F2))) AND (NOT(EOLN(F3)))
  DO
    BEGIN
      IF Ch2 < CH3
      THEN 
        BEGIN
          WRITE(F1, Ch2);
          READ(F2, Ch2);
        END
      ELSE
        BEGIN
          WRITE(F1, Ch3);
          READ(F3, Ch3);
        END
    END;
  IF Ch2 < Ch3
  THEN
    WRITE(F1, Ch2, Ch3)
  ELSE
    WRITE(F1, Ch3, Ch2);
  WHILE NOT (EOLN(F2))
  DO
    BEGIN
      WRITE(F1, Ch2);
      READ(F2, Ch2)
    END;
  WHILE NOT (EOLN(F3))
  DO
    BEGIN
      WRITE(F1, Ch3);
      READ(F3, Ch3)
    END;
  WRITELN(F1)
END; {Merge}

PROCEDURE RecursiveSort(VAR F1: TEXT);
VAR 
  F2, F3: TEXT;
  Ch: CHAR;
BEGIN {RecursiveSort}
  RESET(F1);
  IF NOT (EOLN(F1))
  THEN
    BEGIN
      READ(F1, Ch);
      IF NOT (EOLN(F1))
      THEN {???? ????? ??? ??????? 2 ???????}
        BEGIN
          RESET(F1);
          Split(F1, F2, F3);
          RESET(F2);
          RESET(F3);
          RecursiveSort(F2);
          RecursiveSort(F3);
          RESET(F2);
          RESET(F3);
          Merge(F1, F2, F3);
        END
    END
END;

BEGIN
  REWRITE(InputFile);
  CopyFile(INPUT, InputFile);
  RecursiveSort(InputFile);
  RESET(InputFile);
  CopyFile(InputFile, OUTPUT)
END.
