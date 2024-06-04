PROGRAM TestCompareWords;

PROCEDURE FilterChar(VAR Ch: CHAR);
BEGIN
  IF Ch = 'ё' THEN
    Ch := 'е';
END;

PROCEDURE CompareWords(Word1, Word2: STRING; VAR Result: INTEGER);
VAR
  Len1, Len2, MinLen, i: Integer;
  Char1, Char2: CHAR;
BEGIN
  Len1 := Length(Word1);
  Len2 := Length(Word2);
  MinLen := Len1;
  IF Len1 > Len2 THEN
    MinLen := Len2;

  i := 1;
  Result := 0; // По умолчанию считаем слова равными

  WHILE (i <= MinLen) AND (Result = 0) DO
  BEGIN
    Char1 := Word1[i];
    Char2 := Word2[i];
    FilterChar(Char1);
    FilterChar(Char2);

    IF Char1 < Char2 THEN
      Result := -1
    ELSE IF Char1 > Char2 THEN
      Result := 1
    ELSE
    BEGIN
      // Если буквы равны, учитываем, что 'ё' идет после 'е'
      IF (Word1[i] = 'ё') AND (Word2[i] <> 'ё') THEN
        Result := 1
      ELSE IF (Word1[i] <> 'ё') AND (Word2[i] = 'ё') THEN
        Result := -1;
    END;
    i := i + 1;
  END;

  IF Result = 0 THEN
  BEGIN
    // Если все символы равны до длины более короткого слова
    IF Len1 < Len2 THEN
      Result := -1
    ELSE IF Len1 > Len2 THEN
      Result := 1;
  END;
END;

PROCEDURE TestCase(Word1, Word2: STRING; ExpectedResult: INTEGER);
VAR
  Result: INTEGER;
BEGIN
  CompareWords(Word1, Word2, Result);
  Write('Comparing "', Word1, '" with "', Word2, '": ');
  IF Result = ExpectedResult THEN
    Writeln('Passed (Result: ', Result, ')')
  ELSE
    Writeln('Failed (Result: ', Result, ', Expected: ', ExpectedResult, ')');
END;

BEGIN
  Writeln('Testing CompareWords procedure:');
  // Тесты для проверки сравнения слов с 'е' и 'ё'
  TestCase('елка', 'ёлка', -1);  // 'елка' должно быть перед 'ёлка'
  TestCase('ёлка', 'елка', 1);   // 'ёлка' должно быть после 'елка'
  TestCase('ёжик', 'ежик', 1);   // 'ёжик' должно быть после 'ежик'
  TestCase('ежик', 'ёжик', -1);  // 'ежик' должно быть перед 'ёжик'
  TestCase('ёжик', 'ёлка', 1);   // 'ёжик' должно быть после 'ёлка'
  TestCase('елка', 'ежик', -1);  // 'елка' должно быть перед 'ежик'

  // Другие тесты для проверки общей функциональности
  TestCase('apple', 'banana', -1);   // 'apple' должно быть перед 'banana'
  TestCase('banana', 'apple', 1);    // 'banana' должно быть после 'apple'
  TestCase('apple', 'apple', 0);     // 'apple' должно быть равно 'apple'
  TestCase('abc', 'abcd', -1);       // 'abc' должно быть перед 'abcd'
  TestCase('abcd', 'abc', 1);        // 'abcd' должно быть после 'abc'
END.

