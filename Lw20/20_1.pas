PROGRAM GraphicPrint(INPUT, OUTPUT);
CONST
  Size = 5;
  MaxSize = Size * Size;
  Chars = ['A' .. 'C'];
  A = [3, 7, 9, 12, 13, 14, 16, 20, 21, 25];
  B = [1, 2, 3, 4, 6, 10, 11, 12, 13, 14, 16, 20, 21, 22, 23, 24];
  C = [2, 3, 4, 6, 10, 11, 16, 20, 22, 23, 24]; 
TYPE
  MassOfElements = 1 .. MaxSize;
  LetterElements = SET OF MassOfElements; 
VAR
  Ch: CHAR;
  EndMass: LetterElements;

FUNCTION TranslateSymbol(VAR Symbol: CHAR): LetterElements;
BEGIN
  IF Symbol IN Chars
  THEN
    CASE Symbol OF
      'A': TranslateSymbol := A;
      'B': TranslateSymbol := B;
      'C': TranslateSymbol := C
    END 
  ELSE 
    BEGIN
      WRITELN('Error!');
      TranslateSymbol := []        
    END
END; 

PROCEDURE PrintSymbol(VAR LetterMatrics: LetterElements);
VAR
  Grid: CHAR;
  I: INTEGER;
BEGIN
  Grid := '#';
  FOR I := 1 TO MaxSize
  DO
    BEGIN
      IF I IN LetterMatrics
      THEN
        WRITE(OUTPUT, Grid)
      ELSE  
        WRITE(OUTPUT, ' ');
      IF I MOD Size = 0
      THEN
        WRITELN(OUTPUT)
    END
END;



BEGIN
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      READ(Ch);
      EndMass := TranslateSymbol(Ch);
      PrintSymbol(EndMass);
      WRITELN;
      WRITELN
    END
END.
  
