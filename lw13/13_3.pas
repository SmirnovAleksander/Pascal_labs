PROGRAM Split(INPUT,OUTPUT);
  {???????? INPUT ? OUTPUT,??????? ????????,? ????? ??????
   ????????}
VAR
  Ch,Next: CHAR;
  Odds,Evens: TEXT;
  
PROCEDURE CopyOut(VAR F1: TEXT; VAR Ch: CHAR);
BEGIN
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      READ(F1, Ch);
      WRITE(Ch)
    END;
  READLN(F1);
  WRITELN
END;



BEGIN
  REWRITE(Odds);
  REWRITE(Evens);
  Next := 'O';
  WHILE NOT EOF
    DO
      BEGIN
        WHILE NOT EOLN
        DO
          {????????? Ch, ???????? ? ????, ????????? ?????
           Next,??????????? Next}
        READLN;
        WRITELN(Odds);
        WRITELN(Evens)
      END;
  WRITELN(Odds);
  WRITELN(Evens)
  CopyOut(Odds,Ch);
  CopyOut(Evens,Ch);
  WRITELN
END.

