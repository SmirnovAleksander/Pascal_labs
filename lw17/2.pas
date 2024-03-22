PROGRAM SumDigit(INPUT, OUTPUT);
VAR
  N: INTEGER; 
  
PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
VAR
  Ch: CHAR;
BEGIN
  READ(F, Ch);
  IF Ch = '0' THEN D := 0 ELSE
  IF Ch = '1' THEN D := 1 ELSE
  IF Ch = '2' THEN D := 2 ELSE
  IF Ch = '3' THEN D := 3 ELSE
  IF Ch = '4' THEN D := 4 ELSE
  IF Ch = '5' THEN D := 5 ELSE
  IF Ch = '6' THEN D := 6 ELSE
  IF Ch = '7' THEN D := 7 ELSE
  IF Ch = '8' THEN D := 8 ELSE
  IF Ch = '9' THEN D := 9 
  ELSE
    D := -1;
END;

PROCEDURE ReadNumber(VAR F: TEXT; VAR N: INTEGER);
VAR
  Digit: INTEGER;
BEGIN
  Digit := 0;
  WHILE ((NOT EOLN) AND (Digit <> -1)) AND (N <= (MaxINT - Digit) DIV 10) 
  DO
    BEGIN 
      N := N * 10 + Digit;
      ReadDigit(F, Digit)
    END;
  IF (N <= (MaxINT - Digit) DIV 10)
  THEN
    BEGIN
      N := N * 10 + Digit;   
    END
  ELSE
    N := -2;
  IF N = 0
  THEN
    N := -1
END; 

BEGIN
  N := 0;
  ReadNumber(INPUT, N);
  WRITELN(N)
END.


