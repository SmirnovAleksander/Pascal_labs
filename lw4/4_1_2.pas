PROGRAM PaulRever(INPUT, OUTPUT);
VAR
  Lantens: CHAR;
BEGIN{PauleRevere}
  {Read Lanterns}
  READ(Lantens);
  {Issue Paule Revere's message}
  IF Lantens >= '1'
  THEN
    IF Lantens <= '3'
    THEN
    WRITE('The Brirsh are coming by ');
  IF Lantens = '1'
  THEN
    WRITELN('land')
    ElSE
      IF Lantens = '2'
      THEN
        WRITELN('sea')
      ELSE
        IF Lantens = '3'
        THEN
          WRITELN('air')
        ELSE
          WRITELN('The North Church Shows only ''', Lantens, '''.');
END. {PauleRevere}
