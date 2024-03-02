PROGRAM Test(INPUT, OUTPUT);
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
      WriteMonth(INPUT, M1);
      WriteMonth(INPUT, M2);                    
     END
  ELSE
    WRITE('Неверные входные данные')  
END.
