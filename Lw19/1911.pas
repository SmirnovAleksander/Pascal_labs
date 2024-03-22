PROGRAM Prime(INPUT, OUTPUT);
CONST 
  Max = 100;
  Min = 2;
TYPE 
  SetOfNumbers = SET OF Min .. Max;
VAR
  Sieve : SetOfNumbers;
  Number, Digit: INTEGER;
BEGIN
  Sieve := [Min .. Max];
  Number := Min;
  WHILE Number <= Max
  DO
    BEGIN
      Digit := Number + 1;
      WHILE Digit <= Max
      DO
        BEGIN
          IF Digit MOD Number = 0
          THEN
            Sieve := Sieve - [Digit];
          Digit := Digit + 1
        END;  
      Number := Number + 1 
    END;
  Digit := 1;
  WHILE Digit <= Max
  DO
    BEGIN
      Digit := Digit + 1;
      IF Digit IN Sieve
      THEN 
        WRITE(Digit, ' ')
    END;
  WRITELN;
END.
