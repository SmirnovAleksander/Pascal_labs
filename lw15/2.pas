PROGRAM CountChar(INPUT, OUTPUT); 
USES
  Count3;
VAR
  Ch, Ones, Tens, Hundreds, Flag: CHAR;
BEGIN {CountChar}
  Start;
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      Bump 
    END;
  Value(Hundreds, Tens, Ones, Flag);
  IF Flag <> 'T'
  THEN
    WRITELN('Count of char: ', Hundreds, Tens, Ones)
  ELSE
    WRITELN('Overflow')    
END. {CountChar}

