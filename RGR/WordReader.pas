UNIT WordReader;

INTERFACE

CONST
  MaxWordLenght = 50;

PROCEDURE ReadWordsFromFile(VAR InputFile: TEXT; VAR Word: STRING; VAR Length: INTEGER);
FUNCTION ToLowercase(VAR c: CHAR): CHAR;

IMPLEMENTATION

FUNCTION ToLowercase(VAR c: CHAR): CHAR;
CONST
  UpperCase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁÂÃÄÅ¨ÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞ‗';
  LowerCase = 'abcdefghijklmnopqrstuvwxyzאבגדהו¸זחטיךכלםמןנסעףפץצקרשתûü‎‏ÿ';
VAR
  i: INTEGER;
BEGIN
  i := 1;
  WHILE (i <= 59) AND (UpperCase[i] <> c) 
  DO   
    i := i + 1;
  
  IF i <= 59 
  THEN
    ToLowercase := LowerCase[i]
  ELSE
    ToLowercase := c
END;

PROCEDURE ReadWordsFromFile(VAR InputFile: TEXT; VAR Word: STRING; VAR Length: INTEGER);
VAR
  Ch: CHAR;
  Separator: BOOLEAN;
  EndOfFile: BOOLEAN;
  WordStarted: BOOLEAN;
BEGIN
  Length := 0;
  Word := '';
  Separator := FALSE;
  EndOfFile := FALSE;
  WordStarted := FALSE;

  WHILE (NOT Separator) AND (NOT EndOfFile) 
  DO
    BEGIN
      IF NOT EOF(InputFile) 
      THEN
        BEGIN
          READ(InputFile, Ch);
          IF (Ch IN ['a'..'z', 'A'..'Z', 'א'..'ÿ', 'À'..'‗', '-', '¸', '¨']) AND (Length < MaxWordLenght) 
          THEN
            BEGIN
              IF (Ch = '-') AND (NOT WordStarted) 
              THEN
                BEGIN
                  Separator := TRUE;
                  IF Length > 0 THEN
                    Length := Length - 1
                END
              ELSE
                BEGIN
                  Length := Length + 1;
                  Word := Word + ToLowercase(Ch);
                  WordStarted := TRUE
                END
            END
          ELSE 
            Separator := TRUE
        END
      ELSE
        EndOfFile := TRUE
    END
END

END.

