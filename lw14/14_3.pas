PROGRAM Prog(INPUT, OUTPUT);

PROCEDURE RecursiveSort(VAR F1: TEXT);
VAR 
  F2, F3: TEXT;
  Ch: CHAR;
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

{PROCEDURE Merge(VAR F1, F2, F3: TEXT)
 ??????? F2 ? F3 ? F1}
BEGIN {RecursiveSort}
  RESET(F1);
  IF NOT (EOLN(F1))
  THEN
    BEGIN
      IF NOT (EOLN(F1))
      THEN {???? ????? ??? ??????? 2 ???????}
        BEGIN
          Split(F1, F2, F3);
          //RecursiveSort(F2);
          //RecursiveSort(F3);
          //Merge(F1, F2, F3);
        END
    END
END;   {RecursiveSort}

BEGIN
  RecursiveSort(INPUT);
  RESET(F2);
  RESET(F3);
  WRITE()
  WRITELN
END.
  
