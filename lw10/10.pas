PROGRAM Translate(INPUT, OUTPUT);
VAR 
  Ch1, Ch2, Ch3, Ch4, Ch5: CHAR;
  FL1, FL2: CHAR;
BEGIN
  WHILE NOT EOLN
  DO
    BEGIN
      Ch1 := Ch2;
      Ch2 := Ch3;
      Ch3 := Ch4;
      Ch4 := Ch5;
      READ(Ch5);
      IF (Ch1 = 'B') AND (Ch2 = 'E') AND (Ch3 = 'G') AND (Ch4 = 'I') AND (Ch5 = 'N') 
      THEN 
        WRITELN('BEGIN')
      ELSE
        IF (Ch2 = 'E') AND (Ch3 = 'N') AND (Ch4 = 'D') AND (Ch5 = '.') 
        THEN 
          WRITELN('END.')
        ELSE
          BEGIN
            IF Ch2 = ';'
            THEN
              BEGIN 
                WRITELN;
                FL1 = 'T'
              END;  
          END;
    END;
END.
