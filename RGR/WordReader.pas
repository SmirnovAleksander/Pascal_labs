UNIT WordReader;

INTERFACE

CONST
  MaxWordLenght = 50;

PROCEDURE ReadWordsFromFile(VAR InputFile: TEXT; VAR Word: STRING; VAR Length: INTEGER);
FUNCTION ToLowercase(VAR c: CHAR);

IMPLEMENTATION


FUNCTION ToLowercase(VAR c: CHAR): CHAR;
CONST
  UpperCase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ';
  LowerCase = 'abcdefghijklmnopqrstuvwxyzабвгдeёжзийклмнопрстуфхцчшщъыьэюя';
VAR
  i: INTEGER;
BEGIN
  i := 1;
  WHILE (i <= 59) AND (UpperCase[i] <> c) 
  DO   
    i := i + 1;
  
  IF i <= 59 
  THEN
    ToLowercase := LowerCase[i];
  ELSE
    ToLowercase := c;
END;

PROCEDURE ReadWordsFromFile(VAR InputFile: TEXT; VAR Word: STRING; VAR Length: INTEGER);
VAR
  Ch: CHAR;
  Separator: BOOLEAN;  //это флаг на наличие разделителя между словами
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
      IF (Ch IN ['a'..'z', 'A'..'Z', 'а'..'я', 'А'..'Я', '-', 'ё', 'Ё']) AND (Length < MaxWordLenght) THEN
      BEGIN
        Length := Length + 1;
        //Чтение вотрого слова
        IF Ch = '-' THEN
        BEGIN
          IF NOT EOF(InputFile) THEN
          BEGIN
            READ(InputFile, Ch);
            IF (Ch IN ['a'..'z', 'A'..'Z', 'а'..'я', 'А'..'Я', 'ё', 'Ё']) AND (Length < MaxWordLenght) THEN
            BEGIN
              OneWord := FALSE;
              Word := Word + '-';
              Word := Word + ToLowercase(Ch);
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
        //Чтение второго слова
        ELSE
        BEGIN
          Word := Word + ToLowercase(Ch);
          OneWord := FALSE;
        END;
      END
      ELSE IF Length > 0 THEN
        Separator := TRUE;
    END
    ELSE
      EndOfFile := TRUE;
  END;

  IF Length > 0 
  THEN
    BEGIN
      IF OneWord 
      THEN
        Length := 0;
    END;
END;

END.
