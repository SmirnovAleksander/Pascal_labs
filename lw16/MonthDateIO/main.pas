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
        WRITELN(' �������� ������� ������ ')
      ELSE  
        IF M1 = M2 
        THEN
          BEGIN
            WRITE(' ��� ������ ');
            WriteMonth(OUTPUT, M1);
            WRITELN
          END
        ELSE  
          BEGIN
            WriteMonth(OUTPUT, M1);
            IF M1 < M2
            THEN
              WRITE(' ������������ ')
            ELSE 
              WRITE(' ������� �� ');
            WriteMonth(OUTPUT, M2);
            WRITELN
          END
    END
  ELSE
    WRITE(' �������� ������� ������ ')
END.
