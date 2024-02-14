PROGRAM SarahRevere(INPUT, OUTPUT);
VAR
  W1, W2, W3, W4, Looking: CHAR;
BEGIN {SarahRevere}
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';
  Looking := 'Y';
  WHILE Looking = 'Y'
  DO
    BEGIN
      W1 := W2;
      W2 := W3;
      W3 := W4;
      READ(W4);
      IF W4 = '#'
      THEN
        Looking := 'N';
      IF (W1 = 'l') and (W2 = 'a') and (W3 = 'n')  and (W4 = 'd')
      THEN
        Looking := 'L';
      IF (W2 = 's') and (W3 = 'e') and (W4 = 'a')
      THEN
        Looking := 'S'
    END;
  IF Looking = 'L'
  THEN
    WRITELN('The British are coming by land.')
    ELSE
      IF Looking = 'S'
      THEN
        WRITELN('The British coming by sea.')
      ELSE
        WRITELN('Sarah didn''t say')
END. {SarahRevere}


