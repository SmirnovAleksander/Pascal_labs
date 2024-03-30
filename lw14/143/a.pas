PROGRAM RecursiveSorTProg(INPUT, OUTPUT);
VAR
  F2, F3: TEXT;
  
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
END;{Split}

BEGIN
  Split(INPUT, F2, F3);
  RESET(F2);
  RESET(F3);
  CopyFile(F2, OUTPUT);
  CopyFile(F3, OUTPUT);
  WRITELN
END.


