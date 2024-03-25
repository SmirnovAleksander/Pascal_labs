PROGRAM SumDigit(INPUT, OUTPUT);
VAR
  Number, Max, Min, Count, Sum, Avarage, AvaragePoint: INTEGER; 
  Overflow, OverflowSum: CHAR;  
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
  N := 0;
  Digit := 0;
  WHILE ((NOT EOLN) AND (Digit <> -1)) AND (N <= (MaxINT - Digit) DIV 10) 
  DO
    BEGIN 
      N := N * 10 + Digit;
      ReadDigit(F, Digit)
    END;
  IF Digit <> -1
  THEN
    IF (N <= (MaxINT - Digit) DIV 10)
  THEN
    N := N * 10 + Digit   
  ELSE
    N := -2;
  IF N = 0
  THEN
    N := -1
END; 

BEGIN
  Max := -1 - MaxINT;
  Min := MaxINT;
  Sum := 0;
  Count := 0;
  Avarage := 0;
  Overflow := 'F';
  OverflowSum := 'F';
  IF NOT EOLN
  THEN
    BEGIN
      ReadNumber(INPUT, Number);
      IF (Number <> -1) AND (Number <> -2)
      THEN
        BEGIN
          Count := Count + 1; 
          Sum := Sum + Number;        
          IF Number > Max           
          THEN
            Max := Number;
          IF Number < Min    
          THEN
            Min := Number
        END
      ELSE
        Overflow := 'T';
    END;
    
  WHILE (NOT EOLN) AND (Number <> -1) AND (Number <> -2) 
  DO
    BEGIN
      ReadNumber(INPUT, Number);
      IF (Number <> -1) AND (Number <> -2)
      THEN
        BEGIN  
          Count := Count + 1; 
          IF Sum >= MaxINT - Number
          THEN
            OverflowSum := 'T'
          ELSE 
            Sum := Sum + Number;  
          IF Number > Max
          THEN
            Max := Number;  
          IF Number < Min
          THEN
            Min := Number;
        END
      ELSE
        BEGIN
          Overflow := 'T';
          //OverflowSum := 'F';
        END;
        
    END;
  IF Overflow = 'T'
  THEN
    BEGIN
      WRITELN('Ошибка введенных даных(Переполнение или сумма элементов больше чем MaxINT)');
      WRITELN('Среднее арифметическое, Минимальное и Максимальное значение получить невозможно') 
    END;
  IF OverflowSum = 'T'
  THEN
    BEGIN 
      WRITELN('Ошибка введенных даных(сумма элементов больше чем MaxINT)');
      WRITELN('Min: ', Min);
      WRITELN('Max: ', Max);
      WRITELN('Среднее арифметическое чисел вывести невозможно');
    END;
  IF (Overflow = 'F') AND (OverflowSum = 'F')
  THEN
    BEGIN
      WRITELN('Count: ', Count); 
      WRITELN('Min: ', Min);
      WRITELN('Max: ', Max); 
      Avarage := Sum DIV Count;
      AvaragePoint := (Sum MOD Count) * 100 DIV Count;
      WRITELN('Avarage: ', Avarage, '.', AvaragePoint:2);  
    END;    
END.
