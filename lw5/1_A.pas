PROGRAM IFSort3(INPUT, OUTPUT);
{Сортирует 3-строку из INPUT в OUTPUT}
VAR
  Ch1, Ch2, Ch3: CHAR;
BEGIN {IFSort3}
  READ(Ch1, Ch2, Ch3);
  WRITELN('Входные данные ', Ch1, Ch2, Ch3);
  WRITE('Cортированные данные');
  IF Ch1 < Ch2 {сортируем Ch1, Ch2, Ch3 в OUTPUT }
  THEN
    IF Ch2 < Ch3
    THEN {Ch1 < Ch2 < Ch3:сортируем Ch1, Ch2, Ch3 в OUTPUT}
      WRITELN(Ch1, Ch2, Ch3)
END. {IFsort3}
