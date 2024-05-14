UNIT BinaryTree;

INTERFACE

USES
  WordReader; 

CONST
  MaxWords = 10000;
  
TYPE 
  Tree = ^NodeType;
  NodeType = RECORD
                Word: STRING;
                Count: INTEGER;
                LLink, RLink: Tree;
             END;
               
PROCEDURE CountWordsFromFile(VAR InputFile: TEXT; VAR Root: Tree);
PROCEDURE PrintWordCount(Ptr: Tree; VAR OutputFile: TEXT);

IMPLEMENTATION

FUNCTION CompareWords(Word1, Word2: STRING): INTEGER;
VAR
  Len1, Len2, MinLen, i: Integer;
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
    i := i + 1;

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
    END
  ELSE
    BEGIN
      CASE CompareWords(NewWord, Ptr^.Word) OF
        -1: InsertWord(Ptr^.LLink, NewWord);
        1: InsertWord(Ptr^.RLink, NewWord);
        0: Ptr^.Count := Ptr^.Count + 1;
      END;
    END;
END;

PROCEDURE CountWordsFromFile(VAR InputFile: TEXT; VAR Root: Tree);
VAR
  Word: STRING;
  Length: INTEGER; 
  WordCount: INTEGER;  
BEGIN         
  RESET(InputFile);
  WordCount := 0;
  WHILE (NOT EOF(InputFile)) AND (WordCount < MaxWords)  
  DO
    BEGIN
      ReadWordsFromFile(InputFile, Word, Length);
      IF Length > 0 
      THEN
        InsertWord(Root, Word);
        WordCount := WordCount + 1;  
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

