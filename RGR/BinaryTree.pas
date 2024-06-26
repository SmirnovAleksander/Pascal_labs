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
PROCEDURE PrintTree(VAR OutputFile: TEXT);

IMPLEMENTATION

FUNCTION FilterChar(c: CHAR): CHAR;
  BEGIN
    IF c = '�' 
    THEN
      FilterChar := '�'
    ELSE
      FilterChar := c
  END;

FUNCTION CompareWords(Word1, Word2: STRING): INTEGER;
VAR
  Len1, Len2, MinLen, i: Integer;
  Char1, Char2: CHAR;
  Flag: BOOLEAN;

BEGIN
  Len1 := Length(Word1);
  Len2 := Length(Word2);
  Flag := FALSE;
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
        BEGIN
          CompareWords := -1;
          i := MinLen + 1
        END
      ELSE 
        IF Char1 > Char2 
        THEN
          BEGIN
            CompareWords := 1;
            i := MinLen + 1 
          END
        ELSE
          IF (Word1[i] = '�') AND (Word2[i] <> '�') 
          THEN
            BEGIN
              CompareWords := 1;
              i := MinLen + 1 
            END
          ELSE 
            IF (Word1[i] <> '�') AND (Word2[i] = '�') 
            THEN
              BEGIN
                CompareWords := -1;
                i := MinLen + 1
              END
            ELSE
              BEGIN   
                CompareWords := 0;
                Flag := TRUE
              END;
      i := i + 1;
    END;

  IF Flag 
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

PROCEDURE PrintTreeOut(Ptr: Tree; VAR OutputFile: TEXT);
BEGIN
  IF Ptr <> NIL 
  THEN
    BEGIN
      PrintTreeOut(Ptr^.LLink, OutputFile);
      WRITELN(OutputFile, Ptr^.Word, ' ', Ptr^.Count);
      PrintTreeOut(Ptr^.RLink, OutputFile)
    END
END;

PROCEDURE PrintTree(VAR OutputFile: TEXT);
BEGIN
  Rewrite(OutputFile);
  PrintTreeOut(Root, OutputFile)
END;

BEGIN
END.
