PROGRAM Stat(INPUT, OUTPUT);

PROCEDURE CharToDigit(VAR Ch: CHAR; VAR Result: INTEGER);
BEGIN
  IF Ch = '0' THEN Result := 0 ELSE
  IF Ch = '1' THEN Result := 1 ELSE
  IF Ch = '2' THEN Result := 2 ELSE
  IF Ch = '3' THEN Result := 3 ELSE
  IF Ch = '4' THEN Result := 4 ELSE
  IF Ch = '5' THEN Result := 5 ELSE
  IF Ch = '6' THEN Result := 6 ELSE
  IF Ch = '7' THEN Result := 7 ELSE
  IF Ch = '8' THEN Result := 8 ELSE
  IF Ch = '9' THEN Result := 9 ELSE
  Result := -1;
END;

PROCEDURE ReadNumber(VAR Result: INTEGER);
VAR
  Ch: CHAR;
  Digit: INTEGER;
  LookingDigit: BOOLEAN;
BEGIN
  Result := 0;
  Digit := 0;
  LookingDigit := FALSE;
  IF NOT EOLN(INPUT)
  THEN
    WHILE (NOT EOLN(INPUT)) AND (Result <> -2) AND (Result <> -1) AND (Digit <> -1) 
    DO
      BEGIN
        READ(INPUT, Ch);
        CharToDigit(Ch, Digit);
        IF Digit <> -1
        THEN
          BEGIN
            IF (MAXINT - Digit) DIV 10 < Result
            THEN
              Result := -2
            ELSE
              BEGIN
                Result := Result * 10 + Digit;
                LookingDigit := TRUE
              END     
          END
        ELSE
          IF NOT LookingDigit
          THEN
            Result := -1    
      END
  ELSE
    Result := -1;      
END;

PROCEDURE Stat();
VAR
  Max, Min, Digit, Count, Sum, AverageDigit, Decimal: INTEGER;
  OverFlow: BOOLEAN;
BEGIN
  Max := -MAXINT;
  Min := MAXINT;
  Digit := 0;
  AverageDigit := 0;
  Sum := 0;
  Count := 0;
  OverFlow := FALSE;
  WRITELN(Min);
  WHILE NOT EOLN(INPUT) AND (Digit <> -1) AND (Digit <> -2)
  DO
    BEGIN
      ReadNumber(Digit);
      IF (Digit <> -1) AND (Digit <> -2)
      THEN
        BEGIN
          Count := Count + 1;
          IF Digit > Max 
          THEN 
            Max := Digit;
          IF Digit < Min
          THEN
            Min := Digit;
          IF MAXINT - Sum < Digit
          THEN
            BEGIN
              OverFlow := TRUE;
            END
          ELSE
            Sum := Sum + Digit    
        END
      ELSE
        OverFlow := TRUE;         
    END;
  WRITELN('Количество чисел: ', Count);
  WRITELN('Минимальное число: ', Min);
  WRITELN('Максимальное число: ', Max);
  IF NOT OverFlow
  THEN
    BEGIN  
      AverageDigit := Sum DIV Count;
      Decimal := (Sum MOD Count) * 100 DIV Count;
      WRITELN('Среднее значение ', AverageDigit, '.', Decimal)
    END
  ELSE
    BEGIN
      WRITELN('Произошло переполнение');
      WRITELN('Невозможно вычилсить среднее')
    END       
END;

BEGIN
  Stat()
END.

