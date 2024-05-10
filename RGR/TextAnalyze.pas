PROGRAM WordFrequency;

USES
  WordReader;

TYPE 
  TreeNode = ^Node;
  Node = RECORD
            Word: string;
            Frequency: Integer;
            Left, Right: TreeNode;
          END;

VAR
  InputFile, OutputFile: text;
  Root: TreeNode;


function CompareWords(Word1, Word2: string): Integer;
var
  Len1, Len2, MinLen, i: Integer;
begin
  Len1 := Length(Word1);
  Len2 := Length(Word2);
  
  // Находим минимальную длину слова
  if Len1 < Len2 then
    MinLen := Len1
  else
    MinLen := Len2;

  // Сравниваем символы поочередно
  i := 1;
  while (i <= MinLen) and (Word1[i] = Word2[i]) do
    Inc(i);

  // Если нашли различие, возвращаем результат
  if (i <= MinLen) then
  begin
    if Word1[i] < Word2[i] then
      CompareWords := -1
    else
      CompareWords := 1;
  end
  // Если все символы до минимальной длины совпали, возвращаем результат на основе длины слов
  else
  begin
    if Len1 < Len2 then
      CompareWords := -1
    else if Len1 > Len2 then
      CompareWords := 1
    else
      CompareWords := 0;
  end;
end;


PROCEDURE InsertWord(VAR Ptr: TreeNode; NewWord: string);
BEGIN
  IF Ptr = NIL THEN
  BEGIN
    NEW(Ptr);
    Ptr^.Word := NewWord;
    Ptr^.Frequency := 1;
    Ptr^.Left := NIL;
    Ptr^.Right := NIL;
  END
  ELSE
  BEGIN
    IF CompareWords(NewWord, Ptr^.Word) < 0 THEN
      InsertWord(Ptr^.Left, NewWord)
    ELSE IF CompareWords(NewWord, Ptr^.Word) > 0 THEN
      InsertWord(Ptr^.Right, NewWord)
    ELSE
      Inc(Ptr^.Frequency);
  END;
END;

PROCEDURE CountWordsFromFile(var InputFile: text; VAR Root: TreeNode);
VAR
  Word: string;
  Length: integer;
BEGIN
  Reset(InputFile);
  WHILE NOT eof(InputFile) DO
  BEGIN
    ReadWordsFromFile(InputFile, Word, Length);
    IF Length > 0 THEN
      InsertWord(Root, Word);
  END;
  Close(InputFile);
END;

PROCEDURE PrintWordFrequency(Ptr: TreeNode; var OutputFile: text);
BEGIN
  IF Ptr <> NIL THEN
  BEGIN
    PrintWordFrequency(Ptr^.Left, OutputFile);
    WRITELN(OutputFile, Ptr^.Word, ': ', Ptr^.Frequency);
    PrintWordFrequency(Ptr^.Right, OutputFile);
  END;
END;

BEGIN
  Assign(InputFile, 'input3.txt');
  Assign(OutputFile, 'output3.txt');

  { Process word frequency }
  Root := NIL;
  CountWordsFromFile(InputFile, Root);

  Rewrite(OutputFile);
  PrintWordFrequency(Root, OutputFile);
  Close(OutputFile);
END.

