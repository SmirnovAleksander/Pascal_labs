PROGRAM Prime(INPUT, OUTPUT);
CONST 
  Min = 2;
  Max = 100;
TYPE
  SetOfNumbers = SET OF Min .. Max;
VAR
  Sieve: SetOfNumbers;
  Number, I: INTEGER;
BEGIN
  Sieve := [Min .. Max];
  Number := 2;
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
        END;
      Number := Number + 1;
    END;
  I := 1;
  IF I <= Max
  THEN 
    BEGIN
      I := I + 1;
      IF I IN Sieve 
      THEN
        WRITE(I, ' ');
    END;
  WRITELN;
END.
