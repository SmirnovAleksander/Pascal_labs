PROGRAM CalendarOrder(INPUT, OUTPUT);
USES 
  Month;
VAR 
  M1, M2: Months;
BEGIN
  IF NOT EOLN(INPUT)
  THEN
    BEGIN
      ReadMonth(INPUT, M1);
      ReadMonth(INPUT, M2);
      IF (M1 = NoMonth) AND (M2 = NoMonth)
      THEN
        WRITELN(' Неверные входные данные ')
      ELSE  
        IF M1 = M2 
        THEN
          BEGIN
            WRITE(' Оба месяца ');
            WriteMonth(OUTPUT, M1);
            WRITELN
          END
        ELSE  
          BEGIN
            WriteMonth(OUTPUT, M1);
            IF M1 < M2
            THEN
              WRITE(' Предшествует ')
            ELSE 
              WRITE(' Следует за ');
            WriteMonth(OUTPUT, M2);
            WRITELN
          END
    END
  ELSE
    WRITE(' Неверные входные данные ')
END.
