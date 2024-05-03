PROGRAM Encryption(INPUT, OUTPUT);
{��������� ������� �� INPUT � ��� �������� Chiper 
  � �������� ����� ������� � OUTPUT}
CONST
  Len = 20;
TYPE
  RangeOfStringLenght = 1 .. Len;
  RangeOfChars = 'A' .. 'H';
  Str = ARRAY [RangeOfStringLenght] OF RangeOfChars;
  Chiper = ARRAY [RangeOfChars] OF CHAR;
  SetOfSymbols = SET OF CHAR;
VAR
  Msg: Str;
  Code: Chiper;
  I: INTEGER;
  Decrypt: TEXT;
  //ISetOfSymbols: SetOfSymbols;

PROCEDURE Initialize(VAR Code: Chiper; VAR F: TEXT);
{��������� Code ���� ������}
VAR
  X, Y: CHAR;
  I: INTEGER;
BEGIN {Initialize} 
  WHILE NOT EOF(F) AND (I < 3)
  DO
    BEGIN  
      IF NOT EOLN(F)
      THEN
        BEGIN
          READ(F, X);
          IF NOT EOLN(F)
          THEN
            BEGIN
              READ(F, Y);
              Code[X] := Y;
              I := I + 1;
              READLN;
            END;
          READLN;  
        END;
      READLN;  
    END;
END;  {Initialize}

PROCEDURE Encode(VAR S: Str; VAR ILen: INTEGER);
{������� ������� �� Code, ��������������� �������� �� S}
VAR
  Index: 1 .. Len;
BEGIN {Encode}
  FOR Index := 1 TO ILen
  DO
    IF S[Index] IN ['A' .. 'H']
    THEN
      WRITE(Code[S[Index]])
    ELSE
      WRITE(S[Index]);
  WRITELN
END;  {Encode}

BEGIN {Encryption}
  {���������������� Code}
  ASSIGN(Decrypt ,'text.txt');
  RESET(Decrypt);
  Initialize(Code, Decrypt);
  WRITELN('Text');  
  WHILE NOT EOF
  DO
    BEGIN
      {������ ������ � Msg � ����������� ��}
      I := 0;
      WHILE NOT EOLN AND (I < Len)
      DO
        BEGIN
          I := I + 1;
          READ(Msg[I]);
          WRITE(Msg[I])
        END;
      READLN;
      WRITELN;
      {����������� ������������ ���������}
      Encode(Msg, I)
    END
END.  {Encryption}

