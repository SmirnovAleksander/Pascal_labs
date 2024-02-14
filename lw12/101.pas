PROGRAM SortProg(INPUT, OUTPUT);
VAR
  Ch1, Ch2, Ch3, Ch4, Ch5, Ch, Enter, Flag: CHAR;
BEGIN
  WHILE NOT EOLN 
  DO
    BEGIN
      Ch1 := Ch2;
      Ch2 := Ch3;
      Ch3 := Ch4;
      Ch4 := Ch5;
      READ(Ch5);
      Enter := 'T';
      IF (Ch1 = 'B') AND (Ch2 = 'E') AND (Ch3 = 'G') AND (Ch4 = 'I') AND (Ch5 = 'N')
      THEN
        BEGIN
          WRITE('BEGIN');
        END       
      ELSE
        IF (Ch3 = 'E') AND (Ch4 = 'N') AND (Ch5 = 'D')
        THEN
          BEGIN
            WRITELN;
            WRITELN('END.');
          END
        ELSE 
          BEGIN
            IF (Ch1 = 'W') AND (Ch2 = 'R') AND (Ch3 = 'I') AND (Ch4 = 'T') AND (Ch5 = 'E')
            THEN
              BEGIN
                IF Enter = 'T'
                THEN 
                  BEGIN
                    WRITELN;
                    WRITE('  WRITE')
                  END
                ELSE 
                  WRITE('WRITE')
              END 
            ELSE 
              IF (Ch4 = 'L') AND (Ch5 = 'N')
              THEN
                WRITE('LN');    
            IF (Ch2 = 'R') AND (Ch3 = 'E') AND (Ch4 = 'A') AND (Ch5 = 'D')
            THEN
              BEGIN
                IF Enter = 'T'
                THEN
                  BEGIN 
                    WRITELN;
                    WRITE('  READ')
                  END
                ELSE 
                  WRITE('READ')
              END 
          END;
      Ch := Ch5;
      IF Ch5 = ';'
      THEN 
        BEGIN
          WRITE(Ch5);
          Enter := 'T'
        END;
      IF (Ch = '(')
      THEN  
        BEGIN
          WRITE(Ch);
          WHILE (Ch <> ')') AND (NOT EOLN)
          DO
            BEGIN
            READ(Ch);
            IF (Ch <> ' ')
            THEN
              BEGIN
                IF Ch = ','
                THEN
                  WRITE(', ')
                ELSE
                  WRITE(Ch)
              END
            END;
        END;
      Enter := 'F';
    END                   
END. 
