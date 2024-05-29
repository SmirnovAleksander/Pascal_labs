UNIT BinaryTree;

INTERFACE

USES
  WordReader;

CONST
  MaxInputWords = 10000;
  MaxWordsCount = 10; 

TYPE
  Tree = ^NodeType;
  NodeType = RECORD
                Word: STRING;
                Count: INTEGER;
                LLink, RLink: Tree
             END;

VAR
  WordsCount: INTEGER;
  Root: Tree;

PROCEDURE CountWordsFromFile(VAR InputFile: TEXT);
PROCEDURE PrintTree(Ptr: Tree; VAR OutputFile: TEXT);

IMPLEMENTATION


FUNCTION FilterChar(c: CHAR): CHAR;
  BEGIN
    IF c = '¸' 
    THEN
      FilterChar := 'å'
    ELSE
      FilterChar := c
  END

FUNCTION CompareWords(Word1, Word2: STRING): INTEGER;
VAR
  Len1, Len2, MinLen, i: Integer;
  Char1, Char2: CHAR;

BEGIN
  Len1 := Length(Word1);
  Len2 := Length(Word2);
  MinLen := Len1;

  IF Len1 > Len2 
  THEN
    MinLen := Len2;

  i := 1;
  WHILE (i <= MinLen) DO
  BEGIN
    Char1 := FilterChar(Word1[i]);
    Char2 := FilterChar(Word2[i]);

    IF Char1 < Char2 
    THEN
      CompareWords := -1;
    ELSE 
      IF Char1 > Char2 
      THEN
        CompareWords := 1;
      ELSE
        IF (Word1[i] = '¸') AND (Word2[i] <> '¸') 
        THEN
          CompareWords := 1;
        ELSE 
          IF (Word1[i] <> '¸') AND (Word2[i] = '¸') 
          THEN
            CompareWords := -1;
          ELSE
            CompareWords := 0; 

    i := i + 1;
  END;

  IF CompareWords = 0 
  THEN
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

PROCEDURE InsertWord(VAR Ptr: Tree; NewWord: STRING);
BEGIN
  IF Ptr = NIL 
  THEN
    BEGIN
      NEW(Ptr);
      Ptr^.Word := NewWord;
      Ptr^.Count := 1;
      Ptr^.LLink := NIL;
      Ptr^.RLink := NIL;
      WordsCount := WordsCount + 1
    END
  ELSE
    BEGIN
      CASE CompareWords(NewWord, Ptr^.Word) OF
        -1: InsertWord(Ptr^.LLink, NewWord);
        1: InsertWord(Ptr^.RLink, NewWord);
        0: IF Ptr^.Count < MaxWordsCount 
           THEN
             Ptr^.Count := Ptr^.Count + 1
      END
    END
END;

PROCEDURE CountWordsFromFile(VAR InputFile: TEXT);
VAR
  Word: STRING;
  Length: INTEGER;
  InputWordsCount: INTEGER;
BEGIN
  RESET(InputFile);
  Root := NIL;
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
        END
    END
END;

PROCEDURE PrintTree(Ptr: Tree; VAR OutputFile: TEXT);
BEGIN
  IF Ptr <> NIL 
  THEN
    BEGIN
      PrintTree(Ptr^.LLink, OutputFile);
      WRITELN(OutputFile, Ptr^.Word, ' ', Ptr^.Count);
      PrintTree(Ptr^.RLink, OutputFile);
    END
END;

END.

