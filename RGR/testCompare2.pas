PROGRAM TestCompareWords;

FUNCTION CompareWords(Word1, Word2: STRING): INTEGER;
VAR
  Len1, Len2, MinLen, i: INTEGER;
BEGIN
  Len1 := Length(Word1);
  Len2 := Length(Word2);
  
  IF Len1 < Len2 
  THEN
    MinLen := Len1
  ELSE
    MinLen := Len2;

  i := 1;
  WHILE (i <= MinLen) AND (Word1[i] = Word2[i]) 
  DO
    Inc(i);

  IF (i <= MinLen) 
  THEN
    BEGIN
      IF Word1[i] < Word2[i] 
      THEN
        CompareWords := -1
      ELSE
        CompareWords := 1;
    END 
  ELSE
    BEGIN
      IF Len1 < Len2 
      THEN
        CompareWords := -1
      ELSE 
        IF Len1 > Len2 
        THEN
          CompareWords := 1
        ELSE
          CompareWords := 0;
    END;
END;

PROCEDURE Test(Word1, Word2: STRING);
VAR
  ComparisonResult: INTEGER;
BEGIN
  ComparisonResult := CompareWords(Word1, Word2);
  WRITELN(ComparisonResult);
END;

BEGIN
  // Проведем несколько тестов
  Test('apple', 'banana');
END.

