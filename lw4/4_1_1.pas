PROGRAM PaulRever(INPUT, OUTPUT);
VAR
  Lantens: CHAR;
BEGIN{PauleRevere}
  {Read Lanterns}
  READ(Lantens);
  {Issue Paule Revere's message}
  WRITE('Lantens is ', Lantens);
  IF Lantens = '1'
  THEN
    WRITELN('The British are comeing by land')
  ElSE
    IF Lantens = '2'
    THEN
      WRITELN('The Brirish are coming by sea')
    ELSE
      IF Lantens = '3'
      THEN
        WRITELN('The British are coming by air')
      ELSE
        WRITELN('The North Church Shows only ''', Lantens, '''.');
END. {PauleRevere}
