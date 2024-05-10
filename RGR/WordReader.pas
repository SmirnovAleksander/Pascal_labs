UNIT WordReader;

INTERFACE

CONST
  MaxWordLenght = 50;

PROCEDURE ReadWordsFromFile(VAR InputFile: TEXT; VAR Word: STRING; VAR Length: INTEGER);
PROCEDURE ToLowercase(VAR c: CHAR);

IMPLEMENTATION


PROCEDURE ToLowercase(VAR c: CHAR);
CONST
  UpperCase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁÂÃÄÅ¨ÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞ‗';
  LowerCase = 'abcdefghijklmnopqrstuvwxyzאבגדהו¸זחטיךכלםמןנסעףפץצקרשתûü‎‏ÿ';
VAR
  Index: INTEGER;
BEGIN
  Index := 1;
  WHILE (Index <= 59) AND (UpperCase[Index] <> c) 
  DO   
    Index := Index + 1;
  
  IF Index <= 59 THEN
    c := LowerCase[Index];
END;

PROCEDURE ReadWordsFromFile(VAR InputFile: TEXT; VAR Word: STRING; VAR Length: INTEGER);
VAR
  Ch: CHAR;
  Separator: BOOLEAN;
  EndOfFile: BOOLEAN;
  OneWord: BOOLEAN;
BEGIN
  Length := 0;
  Word := '';
  Separator := FALSE;
  EndOfFile := FALSE;
  OneWord := TRUE;

  WHILE (NOT Separator) AND (NOT EndOfFile) DO
  BEGIN
    IF NOT EOF(InputFile) THEN
    BEGIN
      READ(InputFile, Ch);
      IF (Ch IN ['a'..'z', 'A'..'Z', 'א'..'ÿ', 'À'..'‗', '-', '¸', '¨']) AND (Length < MaxWordLenght) THEN
      BEGIN
        Length := Length + 1;
        IF Ch = '-' THEN
        BEGIN
          IF NOT EOF(InputFile) THEN
          BEGIN
            READ(InputFile, Ch);
            IF (Ch IN ['a'..'z', 'A'..'Z', 'א'..'ÿ', 'À'..'‗', '¸', '¨']) AND (Length < MaxWordLenght) THEN
            BEGIN
              OneWord := FALSE;
              Word := Word + '-';
              Word := Word + Ch;
              Length := Length + 1;
            END
            ELSE
            BEGIN
              Separator := TRUE;
              IF Length > 1 THEN
                Length := Length - 1; 
            END;
          END
          ELSE
            Separator := TRUE;
        END
        ELSE
        BEGIN
          ToLowercase(Ch);
          Word := Word + Ch;
          OneWord := FALSE;
        END;
      END
      ELSE IF Length > 0 THEN
        Separator := TRUE;
    END
    ELSE
      EndOfFile := TRUE;
  END;

  IF Length > 0 THEN
  BEGIN
    IF OneWord THEN
      Length := 0;
  END;
END;


END.
