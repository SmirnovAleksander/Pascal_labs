UNIT BinaryTree;

INTERFACE

USES
  WordReader; 

CONST
  MaxInputWords = 10000;
  MaxWordsCount = 10; //уникальные слова
  
TYPE 
  Tree = ^NodeType;
  NodeType = RECORD
                Word: STRING;
                Count: INTEGER;
                LLink, RLink: Tree;
             END;
               
VAR
  WordsCount: INTEGER;

PROCEDURE CountWordsFromFile(VAR InputFile: TEXT; VAR Root: Tree);
PROCEDURE PrintWordCount(Ptr: Tree; VAR OutputFile: TEXT);

IMPLEMENTATION

FUNCTION CompareWords(Word1, Word2: STRING): INTEGER;
VAR
  Len1, Len2, MinLen, i: Integer;
BEGIN
  Len1 := Length(Word1);
  Len2 := Length(Word2);
  MinLen := Len1;
  IF Len1 > Len2 THEN
    MinLen := Len2;

  i := 1;
  WHILE (i <= MinLen) AND (Word1[i] = Word2[i]) DO
    i := i + 1;

  IF i <= MinLen THEN
  BEGIN
    IF Word1[i] < Word2[i] THEN
      CompareWords := -1
    ELSE
      CompareWords := 1;
  END
  ELSE
  BEGIN
    IF Len1 < Len2 THEN
      CompareWords := -1
    ELSE IF Len1 > Len2 THEN
      CompareWords := 1
    ELSE
      CompareWords := 0;
  END;
END;

PROCEDURE InsertWord(VAR Ptr: Tree; NewWord: STRING);
BEGIN
  IF Ptr = NIL THEN
  BEGIN
    NEW(Ptr);
    Ptr^.Word := NewWord;
    Ptr^.Count := 1;
    Ptr^.LLink := NIL;
    Ptr^.RLink := NIL;
    WordsCount := WordsCount + 1;
  END
  ELSE
  BEGIN
    CASE CompareWords(NewWord, Ptr^.Word) OF
      -1: InsertWord(Ptr^.LLink, NewWord);
      1: InsertWord(Ptr^.RLink, NewWord);
      0: IF Ptr^.Count < MaxWordsCount 
         THEN
           Ptr^.Count := Ptr^.Count + 1;
    END;
  END;
END;

PROCEDURE CountWordsFromFile(VAR InputFile: TEXT; VAR Root: Tree);
VAR
  Word: STRING;
  Length: INTEGER; 
  InputWordsCount: INTEGER;
BEGIN         
  RESET(InputFile);
  WordsCount := 0; 
  InputWordsCount := 0;
  WHILE NOT EOF(InputFile) AND (InputWordsCount < MaxInputWords) 
  DO
    BEGIN
      ReadWordsFromFile(InputFile, Word, Length);
      IF Length > 0 
      THEN
        BEGIN
          InsertWord(Root, Word);
          InputWordsCount := InputWordsCount + 1
        END;
    END;            
END;

PROCEDURE PrintWordCount(Ptr: Tree; VAR OutputFile: TEXT);
BEGIN
  IF Ptr <> NIL 
  THEN
    BEGIN
      PrintWordCount(Ptr^.LLink, OutputFile);
      WRITELN(OutputFile, Ptr^.Word, ' ', Ptr^.Count);
      PrintWordCount(Ptr^.RLink, OutputFile);
    END;
END;

END.

