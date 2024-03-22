PROGRAM SarahRevere(INPUT, OUTPUT); 
VAR
  W1, W2, W3, W4: CHAR;
  Looking, Land, Sea: BOOLEAN; 
 
BEGIN {SarahRevere}   
  {?????????????}
  Land := FALSE;
  Sea := FALSE;
  WHILE Looking AND NOT (Land OR Sea)   
  DO
    BEGIN
      {???????? ????}
      {???????? ???? ?? land}
      {???????? ???? ?? sea}
    END;
  IF Land
  THEN
    WRITELN('The british are coming by land.');
  IF Sea
  THEN
    WRITELN('The british are coming by sea');
  IF (NOT Land) AND (NOT Sea)
  THEN
    WRITELN('Sarah didn"t say')
END.  {SarahRevere} 
 
 

