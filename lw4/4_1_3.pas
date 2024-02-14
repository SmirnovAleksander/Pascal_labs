PROGRAM PaulRever(INPUT, OUTPUT);
VAR
  Lantens: CHAR;
BEGIN{PauleRevere}
  {Read Lanterns}
  READ(Lantens);
  {Issue Paule Revere's message}
  WRITE('Lantens is ', Lantens, ' ');

  IF Lantens = 'D'
  THEN
    BEGIN
      READ(Lantens);
      IF Lantens = 'D'
      THEN
        WRITELN('The British are coming by land')
      ELSE
        WRITELN('The British are coming by sea')
    END
  ELSE
    WRITELN('The North Church Shows only ''', Lantens, '''.');


 // IF Lantens = 'D'
 // THEN
 //   WRITELN('The British are comeing by land')
 // ElSE
 //   IF Lantens = 'DD'
 //   THEN
 //     WRITELN('The Brirish are coming by sea')
 //   ELSE
 //     WRITELN('The North Church Shows only ''', Lantens, '''.');
END. {PauleRevere}
