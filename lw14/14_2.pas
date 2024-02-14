PROGRAM RcopyProg(INPUT, OUTPUT);

PROCEDURE Rcopy(VAR F: TEXT);
VAR
  Ch: CHAR;
BEGIN
  IF NOT EOLN(F)
  THEN
    BEGIN
      READ(F, Ch);
      WRITE(OUTPUT, Ch);
      Rcopy(F)
    END
END;

BEGIN
  Rcopy(INPUT);
  WRITELN    
END.
