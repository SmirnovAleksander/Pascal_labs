PROGRAM TestCompareWords;

PROCEDURE FilterChar(VAR Ch: CHAR);
BEGIN
  IF Ch = '�' THEN
    Ch := '�';
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
  Result := 0; // �� ��������� ������� ����� �������

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
      // ���� ����� �����, ���������, ��� '�' ���� ����� '�'
      IF (Word1[i] = '�') AND (Word2[i] <> '�') THEN
        Result := 1
      ELSE IF (Word1[i] <> '�') AND (Word2[i] = '�') THEN
        Result := -1;
    END;
    i := i + 1;
  END;

  IF Result = 0 THEN
  BEGIN
    // ���� ��� ������� ����� �� ����� ����� ��������� �����
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
  // ����� ��� �������� ��������� ���� � '�' � '�'
  TestCase('����', '����', -1);  // '����' ������ ���� ����� '����'
  TestCase('����', '����', 1);   // '����' ������ ���� ����� '����'
  TestCase('����', '����', 1);   // '����' ������ ���� ����� '����'
  TestCase('����', '����', -1);  // '����' ������ ���� ����� '����'
  TestCase('����', '����', 1);   // '����' ������ ���� ����� '����'
  TestCase('����', '����', -1);  // '����' ������ ���� ����� '����'

  // ������ ����� ��� �������� ����� ����������������
  TestCase('apple', 'banana', -1);   // 'apple' ������ ���� ����� 'banana'
  TestCase('banana', 'apple', 1);    // 'banana' ������ ���� ����� 'apple'
  TestCase('apple', 'apple', 0);     // 'apple' ������ ���� ����� 'apple'
  TestCase('abc', 'abcd', -1);       // 'abc' ������ ���� ����� 'abcd'
  TestCase('abcd', 'abc', 1);        // 'abcd' ������ ���� ����� 'abc'
END.

