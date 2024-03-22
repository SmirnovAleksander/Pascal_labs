PROGRAM Prime(INPUT, OUTPUT);
CONST 
  Max = 100;
  Min = 2;
TYPE 
  SetOfNumbers = SET OF Min .. Max;
VAR
  Sieve : SetOfNumbers;
  Number, I: INTEGER;
BEGIN
  Sieve := [Min .. Max];
  Number := Min;
  WHILE Number <= Max
  DO
    BEGIN
      I := Number + 1;
      WHILE I <= Max
      DO
        BEGIN
          IF I MOD Number = 0
          THEN
            Sieve := Sieve - [I];
          I := I + 1;
        END  
      Number := Number + 1;  
    END
  I := 1;
  WHILE I <= Max
  DO
    BEGIN
      I := I + 1;
      IF I IN Sieve
      THEN 
        WRITE(I, ' ')
    END;
  WRITELN;
END.
